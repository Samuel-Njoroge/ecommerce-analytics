{{
    config(
        materialized='table'
    )
}}

SELECT 
    category_name,
    category_name_english
FROM ecommerce.raw.product_category