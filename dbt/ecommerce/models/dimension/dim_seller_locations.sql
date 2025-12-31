{{
    config(
        materialized='incremental',
        incremental_strategy='merge'
    )
}}

SELECT 
    s.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    g.geolocation_latitude,
    g.geolocation_longitude,
    g.geolocation_city,
    g.geolocation_state
FROM {{ ref('stg_sellers') }} s
LEFT JOIN {{ ref('stg_geolocation') }} g
    ON s.seller_zip_code_prefix = g.geolocation_zip_code_prefix