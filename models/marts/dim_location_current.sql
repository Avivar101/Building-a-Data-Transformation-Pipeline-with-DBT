{{
  config(
    materialized = 'view',
    )
}}

select
    zone_id as location_id,
    zone,
    borough
from {{ ref('snap_dim_location') }}
where dbt_valid_to is null

union all

select
  57 as location_id,
  'Unknown' as zone,
  'Unknown' as borough

union all

select
   264 as location_id,
   'Unknown' as zone,
   'Unknown' as borough

union all

select
  265 as location_id,
  'Unknown' as zone,
  'Unknown' as borough