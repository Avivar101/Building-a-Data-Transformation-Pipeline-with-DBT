with unioned as (
    select * from {{ source('taxi_trips', 'green_trips_2021') }}
    union all
    select * from {{ source('taxi_trips', 'green_trips_2022') }}
)

select
    cast(vendor_id as int) as vendor_id,
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime,
    cast(store_and_fwd_flag as boolean) as store_and_fwd_flag,
    cast(rate_code as int) as rate_code,
    cast(passenger_count as int) as passenger_count,
    cast(trip_distance as float) as trip_distance,
    cast(fare_amount as float) as fare_amount,
    cast(extra as float) as extra,
    cast(mta_tax as float) as mta_tax,
    cast(tip_amount as float) as tip_amount,
    cast(tolls_amount as float) as tolls_amount,
    cast(ehail_fee as float) as ehail_fee,
    cast(airport_fee as float) as airport_fee,
    cast(total_amount as float) as total_amount,
    cast(trip_type as int) as trip_type,
    cast(imp_surcharge as float) as imp_surcharge,
    cast(pickup_location_id as int) as pickup_location_id,
    cast(dropoff_location_id as int) as dropoff_location_id,
    cast(data_file_year as int) as data_file_year,
    cast(data_file_month as int) as data_file_month,
    'green' as service_type
from unioned