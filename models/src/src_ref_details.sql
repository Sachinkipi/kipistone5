WITH raw_ref_details AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Ref_Details') }}
)
SELECT
   CITY,	
   STATE,	
   REF_ID,	
   LATITUDE,	
   LONGITUDE
FROM
    raw_ref_details