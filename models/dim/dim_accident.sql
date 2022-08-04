{{
 config(
 materialized = 'table'
 )
}}

WITH
 oil_wastage_details AS (
    SELECT
        *
    FROM
        {{ ref('src_oil_wastage_details') }}
)


SELECT oil_wastage_details.REPORT_NUMBER,
    oil_wastage_details.WAREHOUSE_ID,
    oil_wastage_details.ACCIDENT_DATE_TIME,
    oil_wastage_details.ACCIDENT_YEAR,  
    oil_wastage_details.LIQUID_TYPE, 
    oil_wastage_details.LIQUID_SUBTYPE, 
    oil_wastage_details.CAUSE_CATEGORY, 
    oil_wastage_details.CAUSE_SUBCATEGORY 
    FROM oil_wastage_details