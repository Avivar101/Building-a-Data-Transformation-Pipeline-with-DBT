select
    *
from {{ ref('int_taxi_trips') }}
where pickup_datetime >= dropoff_datetime