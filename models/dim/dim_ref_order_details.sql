{{
 config(
 materialized = 'table'
 )
}}

WITH
 order_details AS (
    SELECT
        *
    FROM
        {{ ref('src_ref_to_warehouse') }}
)

SELECT order_details.ORDERID,
    order_details.DISTRIBUTION_CHANNEL 
    FROM order_details