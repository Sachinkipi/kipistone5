{{
 config(
 materialized = 'table'
 )
}}

WITH
ref_details AS (
    SELECT
        *
    FROM
        {{ ref('src_ref_details') }}
),
location AS (
    SELECT
        *
    FROM
        {{ ref('dim_location') }}
)

SELECT ref_details.REF_ID, 
    location.LOCATION_ID 
    FROM ref_details join location ON (ref_details.LATITUDE=location.LATITUDE AND ref_details.LONGITUDE=location.LONGITUDE) 
    limit 100000
