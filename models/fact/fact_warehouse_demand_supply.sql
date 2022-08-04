{{
 config(
 materialized = 'table'
 )
}}

WITH
warehouse_demand_supply AS (
    SELECT
        *
    FROM
        {{ ref('src_warehous_demand_supply') }}
),
warehouse_details AS (
    SELECT
        *
    FROM
        {{ ref('dim_warehouse') }}
)

SELECT row_number() OVER (ORDER BY warehouse_details.WAREHOUSE_ID) WH_DEMAND_ID,
    warehouse_details.WAREHOUSE_ID, 
    warehouse_demand_supply.YEAR, 
    warehouse_demand_supply.REQ_QUANTITY_MT, 
    warehouse_demand_supply.SUPPLIED_QUANTITY_MT 
    from warehouse_demand_supply JOIN warehouse_details on (warehouse_details.WAREHOUSE_ID=warehouse_demand_supply.WAREHOUSE_ID) 
    limit 100000