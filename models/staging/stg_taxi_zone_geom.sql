select
    cast(zone_id as int) as zone_id,
    trim(cast(zone_name as varchar)) as zone,
    trim(cast(borough as varchar)) as borough
from {{ ref('taxi_zone_geom') }}