{{
    config(
        materialized='incremental',
        incremental_strategy='merge'
    )
}}

SELECT 
    c.customer_id,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    g.geolocation_latitude,
    g.geolocation_longitude,
    g.geolocation_city,
    g.geolocation_state
FROM {{ ref('stg_customers') }} c
LEFT JOIN {{ ref('stg_geolocation') }} g
    ON c.customer_zip_code_prefix = g.geolocation_zip_code_prefix