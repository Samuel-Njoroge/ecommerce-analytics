{{
    config(
        materialized='incremental',
        incremental_strategy='merge'
    )
}}

SELECT 
    op.order_id,
    op.customer_id,
    op.order_status,
    op.product_id,
    op.seller_id,
    op.shipping_limit_date,
    op.price,
    op.freight_value,
    op.payment_sequential,
    op.payment_type,
    op.payment_installments,
    op.payment_value,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    c.geolocation_latitude,
    c.geolocation_longitude,
    c.geolocation_city,
    c.geolocation_state
FROM {{ ref('int_order_items_payments') }} op
LEFT JOIN {{ ref('dim_customer_locations') }} c
    ON op.customer_id = c.customer_id