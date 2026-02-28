# Data Tranformation with DBT

## Project Overveiew

This project demonstrates the end-to-end design of a production-grade Analytics Engineering pipeline using dbt and DuckDB, from raw ingestion to BI-ready data models.

## Implementation

1.  **Structured Transformation Pipeline**
    *   Designed a layered architecture (Staging -> Intermediate -> marts) following modern Analytics Engineering best practices.
    *   Standardized and cleaned raw datasets into canonical, contract-driven models.
    *   Clearly defined model grain and responsibility at each layer
2.  **Cost-Efficient Incremental Processing**
    *   Implemented an incemental fact model using dbt's `incremental` materialization.
    *   Reduced unnecessary recomputation by loading only new data based on time-based logic
    *   Ensured idempotency through deterministic surrogate keys
3.  **Historical Tracking with SCD Type 2**
    *   Implemented Slowly Changing Dimensions using dbt snapshots
    *   Preserved historical attribute changes with valid-from / valid-to logic
    *   Exposed a current-state dimension view for clean analytics joins
4.  **Data Quality Enforecement**
    *   Applied generic and custom dbt tests (uniquesness, non-null, relationships, temporal integrity).
    *   Enforced logical constraints (e.g. pickup \< dropoff)
    *   Maintained model contraints through automated validation
5.  **Canonical Data Modeling for BI Consumption**
    *   Built fact and dimension tables aligned to a star schema
    *   Introduced deterministic surrogate keys for stable joins
    *   Created BI-ready serving models optimized for dashboard querin
6.  **Comprehensive Documentation and Lineage**
    *   Documented models, columns and tests within dbt.
    *   Establihed clear model ownership and data contracts.
    *   Generated lineage graph