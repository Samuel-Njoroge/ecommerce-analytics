{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='review_id'
    )
}}

SELECT 
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
FROM ecommerce.raw.order_reviews