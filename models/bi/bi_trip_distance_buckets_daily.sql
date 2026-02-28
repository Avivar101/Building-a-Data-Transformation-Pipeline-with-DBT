select
  trip_date,
  service_type,
  case
    when trip_distance is null then 'unknown'
    when trip_distance < 1 then '<1'
    when trip_distance < 3 then '1-3'
    when trip_distance < 7 then '3-7'
    when trip_distance < 15 then '7-15'
    else '15+'
  end as distance_bucket,
  count(*) as trips,
  sum(total_amount) as revenue
from {{ ref('fct_taxi_trips') }}
group by 1,2,3