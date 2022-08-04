{{
 config(
 materialized = 'table'
 )
}}

WITH
accident_detail AS (
    SELECT
        *
    FROM
        {{ ref('dim_accident') }}
),
wh_details AS (
    SELECT
        *
    FROM
        {{ ref('dim_warehouse') }}
),
oil_wastage_details AS (
    SELECT
        *
    FROM
        {{ ref('src_oil_wastage_details') }}
)

SELECT  row_number() OVER (ORDER BY accident_detail.REPORT_NUMBER) WASTAGE_ID, 
    wh_details.WAREHOUSE_ID, 
    accident_detail.REPORT_NUMBER, 
    oil_wastage_details.NET_LOSS_BARRELS, 
    oil_wastage_details.LOSS
    from accident_detail join oil_wastage_details on (accident_detail.REPORT_NUMBER=oil_wastage_details.REPORT_NUMBER)
    join wh_details on (accident_detail.WAREHOUSE_ID=wh_details.WAREHOUSE_ID) 
    limit 100000