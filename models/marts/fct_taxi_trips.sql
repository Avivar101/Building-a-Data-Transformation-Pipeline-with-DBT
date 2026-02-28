{{
  config(
    materialized = 'incremental',
    unique_key = 'trip_sk',
    )
}}

with src as (
    select
        trip_sk,
        service_type,
        vendor_id,
        pickup_datetime,
        dropoff_datetime,
        pickup_location_id,
        dropoff_location_id,
        passenger_count,
        trip_distance,
        fare_amount,
        total_amount,
        trip_date
    from {{ ref('int_taxi_trips') }}

    {% if is_incremental() %}
      where trip_date > (select coalesce(max(trip_date), date('1900-01-01')) from {{ this }})
    {% else %}
      optional_cond
    {% endif %}
),

final as (

    select
      trip_sk,
      service_type,
      vendor_id,
      pickup_datetime,
      dropoff_datetime,
      trip_date,

      passenger_count,
      trip_distance,
      fare_amount,
      total_amount,

      pickup_location_id,
      dropoff_location_id,

      datediff('second', pickup_datetime, dropoff_datetime) as trip_duration_seconds,
      case when total_amount = 0 then true else false end as is_zero_amount,
      case when total_amount > 0 then true else false end as is_paid_trip,
      current_timestamp as loaded_timestamp
    from src
)

select * from final