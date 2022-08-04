{{
 config(
 materialized = 'table'
 )
}}

WITH
ref_capacity_utilisation AS (
    SELECT
        *
    FROM
        {{ ref('src_ref_capacity_utlisation') }}
),
ref_details AS (
    SELECT
        *
    FROM
        {{ ref('dim_refinery') }}
)

SELECT  row_number() OVER (ORDER BY ref_details.REF_ID) REF_CAP_ID, 
    ref_details.REF_ID, 
    ref_capacity_utilisation.YEAR, 
    ref_capacity_utilisation.PHYSICAL_CRUDE_THROUGHPUT, 
    ref_capacity_utilisation.CRUDE_OIL_STORAGE_CAPACITY_MMT, 
    ref_capacity_utilisation.CAPACITY_UTILISATION  
    from ref_capacity_utilisation join ref_details on (ref_capacity_utilisation.REF_ID=ref_details.REF_ID) 
    limit 100000