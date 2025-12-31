{{
    config(
        materialized='incremental',
        incremental_strategy='merge'
    )
}}

SELECT 
    oi.order_id,
    oi.customer_id,
    oi.order_status,
    oi.order_purchase_timestamp,
    oi.order_approved_at,
    oi.order_delivered_carrier_date,
    oi.order_delivered_customer_date,
    oi.order_estimated_delivery_date,
    oi.product_id,
    oi.shipping_limit_date,
    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) AS total_item_value,
    s.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    s.geolocation_latitude,
    s.geolocation_longitude,
    s.geolocation_city,
    s.geolocation_state
FROM {{ ref('int_order_items') }} oi
LEFT JOIN {{ ref('dim_seller_locations') }} s
    ON oi.seller_id = s.seller_id
