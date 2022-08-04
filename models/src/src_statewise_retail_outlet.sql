WITH raw_Statewise_retail_outlet AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Statewise_Retail_Outlet') }}
)
SELECT
    DATE,	
    STATE,	
    NUMBER_OF_OUTLET	
FROM
    raw_Statewise_retail_outlet