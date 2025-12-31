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
    oi.seller_id,
    oi.shipping_limit_date,
    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) AS total_item_value,
    p.product_id,
    p.product_category_name,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_quantity,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM {{ ref('int_order_items') }} oi
LEFT JOIN {{ ref('dim_products') }} p
    ON oi.product_id = p.product_id