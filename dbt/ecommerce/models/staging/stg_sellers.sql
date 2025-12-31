{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='seller_id'
    )
}}

SELECT 
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM ecommerce.raw.sellers