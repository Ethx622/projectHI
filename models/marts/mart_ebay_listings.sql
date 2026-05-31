with staging as (
    select * from {{ ref('stg_ebay_listings') }}
),

final as (
    select
        country,
        condition,
        count(*)                    as total_listings,
        round(avg(price), 2)        as avg_price,
        round(min(price), 2)        as min_price,
        round(max(price), 2)        as max_price
    from staging
    where price is not null
    group by country, condition
)

select * from final