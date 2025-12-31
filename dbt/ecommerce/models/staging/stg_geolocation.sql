{{
    config(
        materialized='table'
    )
}}

SELECT 
    geolocation_zip_code_prefix,
    geolocation_latitude,
    geolocation_longitude,
    geolocation_city,
    geolocation_state
FROM ecommerce.raw.geolocation