{{
    config(
        materialized='incremental',
        incremental_strategy='merge'
    )
}}

SELECT
    i.order_id,
    i.customer_id,
    c.customer_unique_id,

    i.product_id,
    i.seller_id,

    i.order_status,
    i.order_purchase_timestamp,
    i.order_delivered_customer_date,

    i.price,
    i.freight_value,

    i.review_id,
    i.review_score,
    i.review_comment_title,
    i.review_comment_message,
    i.review_creation_date,
    
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    c.geolocation_latitude,
    c.geolocation_longitude
FROM {{ ref('int_order_items_reviews') }} i
LEFT JOIN {{ ref('dim_customer_locations') }} c
    ON i.customer_id = c.customer_id
