{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='product_id'
    )
}}

SELECT 
    product_id,
    product_category_name,
    product_name_length,
    product_description_length,
    product_photos_quantity,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM ecommerce.raw.products