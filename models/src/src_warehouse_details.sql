WITH raw_warehouse_details AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Warehouse_Details') }}
)
SELECT
   CITY,
   STATE,	
   REF_ID,	
   LATITUDE,	
   LONGITUDE,	
   WAREHOUSE_ID,
   CURRENT_STORAGE_MT,	
   STORAGE_CAPACITY_MT,
   DISTRIBUTION_CHANNEL,
   DISTANCE_FROM_REFINERY_KM
FROM
    raw_warehouse_details