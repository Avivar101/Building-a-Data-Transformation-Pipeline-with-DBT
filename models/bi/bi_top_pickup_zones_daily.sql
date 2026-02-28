select
  f.trip_date,
  f.service_type,
  d.zone as pickup_zone,
  d.borough as pickup_borough,
  count(*) as trips,
  sum(f.total_amount) as revenue
from {{ ref('fct_taxi_trips') }} f
left join {{ ref('dim_location_current') }} d
  on f.pickup_location_id = d.location_id
group by 1,2,3,4