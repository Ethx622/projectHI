with source as (
    select * from {{ source('weather', 'raw_weather') }}
),

renamed as (
    select
        timestamp::timestamp_ntz     as weather_timestamp,
        temperature_2m               as temperature_c,
        relative_humidity_2m         as humidity_pct,
        precipitation                as precipitation_mm,
        wind_speed_10m               as wind_speed_kmh,
        wind_direction_10m           as wind_direction_deg,
        weathercode                  as weather_code,
        city,
        extracted_at
    from source
)

select * from renamed