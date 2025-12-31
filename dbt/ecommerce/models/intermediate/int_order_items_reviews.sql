{{
    config(
        materialized='incremental',
        incremental_strategy='merge'
    )
}}

SELECT 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    oi.product_id,
    oi.seller_id,
    oi.shipping_limit_date,
    oi.price,
    oi.freight_value,
    orr.review_id,
    orr.review_score,
    orr.review_comment_title,
    orr.review_comment_message,
    orr.review_creation_date,
    orr.review_answer_timestamp
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_order_items') }} oi
    ON o.order_id = oi.order_id
LEFT JOIN {{ ref('stg_order_reviews') }} orr
    ON o.order_id = orr.order_id