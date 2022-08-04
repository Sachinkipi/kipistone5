{{
 config(
 materialized = 'table'
 )
}}

WITH
petrol_pump_details AS (
    SELECT
        *
    FROM
        {{ ref('src_petrol_pump_details') }}
),
location AS (
    SELECT
        *
    FROM
        {{ ref('dim_location') }}
),
wh_details AS (
    SELECT
        *
    FROM
        {{ ref('dim_warehouse') }}
)

SELECT row_number() OVER (ORDER BY petrol_pump_details.OWNER_NAME) petrol_pump_ID, 
    location.LOCATION_ID, 
    wh_details.WAREHOUSE_ID, 
    petrol_pump_details.OWNER_NAME, 
    petrol_pump_details.EMAIL, 
    petrol_pump_details.PHONE_NUMBER, 
    petrol_pump_details.PINCODE, 
    petrol_pump_details.GENDER 
    FROM petrol_pump_details join location ON (petrol_pump_details.LATITUDE=location.LATITUDE 
    AND petrol_pump_details.LONGITUDE=location.LONGITUDE) 
    JOIN wh_details ON (wh_details.WAREHOUSE_ID = petrol_pump_details.WAREHOUSE_ID)
    limit 100000