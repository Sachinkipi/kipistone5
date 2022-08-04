WITH raw_ref_to_warehouse AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Ref_To_Warehouse') }}
)
SELECT
    *	
FROM
    raw_ref_to_warehouse