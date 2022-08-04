WITH raw_br_petrol_pump_cons_statewise AS (
    SELECT
        *
    FROM
       {{ source('DEV_DB', 'Br_Petrol_Pump_Cons_Statewise') }}
)
SELECT
    STATE,	
    YEAR_VALUE,	
    CONSUMPTION,	
    WAREHOUSE_ID	
FROM
    raw_br_petrol_pump_cons_statewise