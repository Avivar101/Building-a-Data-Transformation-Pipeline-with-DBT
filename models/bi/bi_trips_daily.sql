select
  trip_date,
  service_type,
  count(*) as trips,
  avg(trip_duration_seconds) as avg_trip_duration_seconds,
  avg(trip_distance) as avg_trip_distance,
  sum(total_amount) as total_revenue,
  avg(case when total_amount > 0 then 1 else 0 end) as paid_trip_rate,
  avg(case when total_amount = 0 then 1 else 0 end) as zero_amount_rate
from {{ ref('fct_taxi_trips') }}
group by 1,2