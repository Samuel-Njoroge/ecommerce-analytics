SELECT *
FROM {{ ref('dim_customer_locations') }}
WHERE customer_id IS NULL