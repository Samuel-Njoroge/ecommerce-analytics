{{
    config(
        materialized='incremental',
        incremental_strategy='merge'
    )
}}

SELECT 
    i.order_id,
    i.order_status,
    i.order_delivered_customer_date,
    i.product_id,
    i.seller_id,
    i.shipping_limit_date,
    i.price,
    i.freight_value,
    (i.freight_value + i.price) AS total_item_value,
    c.customer_id,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    c.geolocation_latitude,
    c.geolocation_longitude,
    c.geolocation_city,
    c.geolocation_state,
    p.product_category_name,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_quantity,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM {{ ref('int_order_items') }} i
LEFT JOIN {{ ref('dim_customer_locations') }} c
    ON i.customer_id = c.customer_id
LEFT JOIN {{ ref('dim_products') }} p
    ON i.product_id = p.product_id