{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='customer_id'
    )
}}

SELECT 
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM ecommerce.raw.customers