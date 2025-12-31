{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='order_item_id'
    )
}}

SELECT 
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
FROM ecommerce.raw.order_items