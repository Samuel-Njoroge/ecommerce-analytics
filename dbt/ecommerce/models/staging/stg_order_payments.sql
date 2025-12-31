{{
    config(
        materialized='incremental',
        incremental_strategy='merge'
    )
}}

SELECT 
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
FROM ecommerce.raw.order_payments