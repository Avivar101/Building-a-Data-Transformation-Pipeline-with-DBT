select
  trip_date,
  service_type,
  count(*) as trips,
  sum(case when total_amount > 0 then 1 else 0 end) as paid_trips,
  sum(case when total_amount = 0 then 1 else 0 end) as zero_amount_trips,
  avg(case when total_amount > 0 then 1 else 0 end) as paid_trip_rate,
  avg(case when total_amount = 0 then 1 else 0 end) as zero_amount_rate
from {{ ref('fct_taxi_trips') }}
group by 1,2