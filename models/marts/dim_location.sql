{{
  config(
    materialized = 'view',
    )
}}

select distinct
    zone_id,
    zone,
    borough
from {{ ref('stg_taxi_zone_geom') }}