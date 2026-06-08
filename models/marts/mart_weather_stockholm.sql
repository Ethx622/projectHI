with staging as (
    select * from {{ ref('stg_weather_stockholm') }}
),

final as (
    select
        date_trunc('hour', weather_timestamp)  as hour,
        city,
        round(avg(temperature_c), 2)           as avg_temperature_c,
        round(avg(humidity_pct), 2)            as avg_humidity_pct,
        round(sum(precipitation_mm), 2)        as total_precipitation_mm,
        round(avg(wind_speed_kmh), 2)          as avg_wind_speed_kmh,
        max(weather_code)                      as weather_code
    from staging
    group by 1, 2
)

select * from final