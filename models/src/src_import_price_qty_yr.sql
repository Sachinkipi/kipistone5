WITH raw_import_price_qty_yr AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Import_Price_Qty_Yr') }}
)
SELECT
    *	
FROM
    raw_import_Price_qty_yr