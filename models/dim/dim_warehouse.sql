{{
 config(
 materialized = 'table'
 )
}}

WITH
wh_details AS (
    SELECT
        *
    FROM
        {{ ref('src_warehouse_details') }}
),
location AS (
    SELECT
        *
    FROM
        {{ ref('dim_location') }}
),
ref_details AS (
    SELECT
        *
    FROM
        {{ ref('dim_refinery') }}
)

SELECT ref_details.REF_ID,
    wh_details.WAREHOUSE_ID,
    location.LOCATION_ID,
    wh_details.CURRENT_STORAGE_MT, 
    wh_details.STORAGE_CAPACITY_MT, 
    wh_details.DISTRIBUTION_CHANNEL,
    wh_details.DISTANCE_FROM_REFINERY_KM
    FROM wh_details join location ON (wh_details.LATITUDE=location.LATITUDE AND wh_details.LONGITUDE=location.LONGITUDE) 
    join ref_details ON (ref_details.REF_ID=wh_details.REF_ID) 
    limit 100000
