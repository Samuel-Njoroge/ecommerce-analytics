SELECT * 
FROM {{ ref('stg_orders') }}
WHERE order_status NOT IN ( 
    'approved',
    'canceled',
    'created',
    'delivered',
    'invoiced',
    'processing',
    'shipped',
    'unavailable'
)