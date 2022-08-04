{{
 config(
 materialized = 'table'
 )
}}

WITH
 br_cons AS (
    SELECT
        *
    FROM
        {{ ref('src_br_petrol_pump_cons_statewise') }}
),
warehouse_details AS (
    SELECT
        *
    FROM
        {{ ref('dim_warehouse') }}
)

SELECT b.YEAR_VALUE as YEAR, b.STATE, a.WAREHOUSE_ID, b.CONSUMPTION FROM warehouse_details a JOIN br_cons b 
ON (b.WAREHOUSE_ID=ltrim(a.WAREHOUSE_ID, 'BHWH')) 
limit 100000
