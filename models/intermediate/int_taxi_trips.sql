with unioned as (
    select
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
        trip_type 
    from {{ ref('stg_green_trips') }}
    union all
    select
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
        null as trip_type
    from {{ ref('stg_yellow_trips') }}
),
final as (
    select
        {{ generate_surrogate_key([
            'service_type',
            'vendor_id',
            'pickup_datetime',
            'dropoff_datetime',
            'pickup_location_id',
            'dropoff_location_id'
        ]) }} as trip_sk,
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

        date(pickup_datetime) as trip_date,
        current_timestamp as created_at
    from unioned
    where pickup_datetime < dropoff_datetime
      and total_amount > 0
)

select * from final