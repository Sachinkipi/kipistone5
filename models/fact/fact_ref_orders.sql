{{
 config(
 materialized = 'table'
 )
}}

WITH
dim_order_detail AS (
    SELECT
        *
    FROM
        {{ ref('dim_ref_order_details') }}
),
src_order_details AS (
    SELECT
        *
    FROM
        {{ ref('src_ref_to_warehouse') }}
),
wh_details AS (
    SELECT
        *
    FROM
        {{ ref('dim_warehouse') }}
),
ref_details AS (
    SELECT
        *
    FROM
        {{ ref('dim_refinery') }}
)

SELECT  row_number() OVER (ORDER BY dim_order_detail.ORDERID) UNQ_ORDER_ID, 
    dim_order_detail.ORDERID, 
    ref_details.REF_ID, 
    wh_details.WAREHOUSE_ID, 
    src_order_details.DAYS_FOR_SHIPMENT_ETA, 
    src_order_details.DAYS_FOR_SHIPMENT_ACTUAL, 
    src_order_details.QUANTITY, 
    src_order_details.REQUESTED_QUANTITY,
    src_order_details.DELIVERY_STATUS
    from dim_order_detail join src_order_details on (dim_order_detail.ORDERID=src_order_details.ORDERID)
    join wh_details on (src_order_details.WAREHOUSE_ID=wh_details.WAREHOUSE_ID) 
    join ref_details on (ref_details.REF_ID=src_order_details.REFINARY_ID) 
    limit 100000