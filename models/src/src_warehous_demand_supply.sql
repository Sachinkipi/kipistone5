WITH raw_Warehous_demand_supply AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Warehouse_Demand_Supply') }}
)
SELECT
   YEAR,	
   WAREHOUSE_ID,	
   REQ_QUANTITY_MT,	
   SUPPLIED_QUANTITY_MT	
FROM
    raw_Warehous_demand_supply