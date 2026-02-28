select
  trip_date,
  service_type,
  extract(hour from pickup_datetime) as pickup_hour,
  count(*) as trips,
  sum(total_amount) as revenue,
  avg(trip_duration_seconds) as avg_trip_duration_seconds,
  avg(trip_distance) as avg_trip_distance
from {{ ref('fct_taxi_trips') }}
group by 1,2,3