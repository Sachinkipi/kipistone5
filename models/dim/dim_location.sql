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
wh_details AS (
    SELECT
        *
    FROM
        {{ ref('src_warehouse_details') }}
),
petrol_pump_details AS (
    SELECT
        *
    FROM
        {{ ref('src_petrol_pump_details') }}
)

SELECT  md5(ref_details.CITY || ref_details.STATE) LOCATION_ID, ref_details.CITY, ref_details.STATE, ref_details.LATITUDE, ref_details.LONGITUDE FROM ref_details
UNION
SELECT md5(wh_details.CITY || wh_details.STATE) LOCATION_ID, wh_details.CITY, wh_details.STATE, wh_details.LATITUDE, wh_details.LONGITUDE FROM wh_details
UNION
SELECT md5(petrol_pump_details.CITY || petrol_pump_details.STATE) LOCATION_ID, petrol_pump_details.CITY, petrol_pump_details.STATE, petrol_pump_details.LATITUDE, petrol_pump_details.LONGITUDE FROM petrol_pump_details
 limit 100000

