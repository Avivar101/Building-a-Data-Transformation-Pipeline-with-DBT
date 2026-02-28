{% snapshot snap_dim_location %}

{{
   config(
       target_schema='snapshots',
       unique_key='zone_id',

       strategy='check',
       check_cols=['zone', 'borough']
   )
}}

select
    zone_id,
    zone,
    borough
from {{ ref('dim_location') }}

{% endsnapshot %}