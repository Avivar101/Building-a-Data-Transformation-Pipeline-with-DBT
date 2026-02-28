select
  f.trip_date,
  f.service_type,
  d.borough,
  count(*) as trips,
  avg(f.trip_duration_seconds) as avg_trip_duration_seconds,
  avg(f.trip_distance) as avg_trip_distance,
  sum(f.total_amount) as total_revenue
from {{ ref('fct_taxi_trips') }} f
left join {{ ref('dim_location_current') }} d
  on f.pickup_location_id = d.location_id
group by 1,2,3