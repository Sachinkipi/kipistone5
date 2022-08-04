WITH raw_crude_oil_price AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Crude_Oil_Price') }}
)
SELECT
    *	
FROM
    raw_crude_oil_price