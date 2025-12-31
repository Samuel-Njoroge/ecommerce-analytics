SELECT *
FROM {{ ref('mrt_customer_order_items') }}
WHERE price < 0
   OR freight_value < 0
   OR total_item_value < 0