with source as (
    select
        item_id,
        raw_data,
        extracted_at
    from {{ source('ebay', 'raw_ebay_listings') }}
),

renamed as (
    select
        item_id,
        raw_data:title::varchar                as title,
        raw_data:price:value::float            as price,
        raw_data:price:currency::varchar       as currency,
        raw_data:condition::varchar            as condition,
        raw_data:itemLocation:country::varchar as country,
        raw_data:seller:username::varchar      as seller_username,
        raw_data:seller:feedbackScore::int     as seller_feedback_score,
        extracted_at
    from source
)

select * from renamed