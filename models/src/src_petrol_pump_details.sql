WITH raw_petrol_pump_details AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Petrol_Pump_Details') }}
)
SELECT
    CITY,	
    EMAIL,	
    STATE,	
    GENDER,	
    PINCODE,	
    LATITUDE,	
    LONGITUDE,	
    OWNER_NAME,	
    PHONE_NUMBER,
    WAREHOUSE_ID	
FROM
    raw_petrol_pump_details