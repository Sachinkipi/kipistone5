WITH raw_ref_capacity_Utilisation AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Ref_Capacity_Utlisation') }}
)
SELECT
    YEAR,
    REF_ID,
    CAPACITY_UTILISATION,
    PHYSICAL_CRUDE_THROUGHPUT,
    CRUDE_OIL_STORAGE_CAPACITY_MMT	
FROM
    raw_ref_capacity_Utilisation