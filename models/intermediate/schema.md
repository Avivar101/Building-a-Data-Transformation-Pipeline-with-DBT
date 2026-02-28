## Canonical Schema for int_taxi_trips
final Schema
| Column                  | Type      | Nullable | Notes                         |
| ----------------------- | --------- | -------- | ----------------------------- |
| **trip_sk**             | string    | ❌        | Surrogate key (deterministic) |
| **service_type**        | string    | ❌        | `green` / `yellow`            |
| **vendor_id**           | integer   | ✅        | Vendor code                   |
| **pickup_datetime**     | timestamp | ❌        | Trip start                    |
| **dropoff_datetime**    | timestamp | ❌        | Trip end                      |
| **pickup_location_id**  | integer   | ❌        | Pickup zone                   |
| **dropoff_location_id** | integer   | ❌        | Dropoff zone                  |
| **passenger_count**     | integer   | ✅        | May be zero                   |
| **trip_distance**       | double    | ✅        | Distance in miles             |
| **fare_amount**         | double    | ✅        | Base fare                     |
| **total_amount**        | double    | ✅        | Total charged                 |
| **payment_type**        | integer   | ✅        | Payment method code           |
| **trip_date**           | date      | ❌        | Derived from pickup_datetime  |
| **created_at**          | timestamp | ❌        | Record creation timestamp     |
