WITH raw_oil_wastage_Details AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Oil_Wastage_Details') }}
)
SELECT
    LOSS,	
    LIQUID_TYPE,	
    ACCIDENT_YEAR,	
    REPORT_NUMBER,	
    CAUSE_CATEGORY,	
    LIQUID_SUBTYPE,	
    NET_LOSS_BARRELS,	
    CAUSE_SUBCATEGORY,	
    ACCIDENT_DATE_TIME,
    WAREHOUSE_ID	
FROM
    raw_oil_wastage_Details

















