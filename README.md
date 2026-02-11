# SQL Data Warehouse Mini Project (PostgreSQL + Colima)

A small portfolio project that builds a simple data warehouse using a **Bronze → Silver → Gold** pattern on PostgreSQL.

This setup follows a **no Docker Desktop** approach by using **Colima** as the local container runtime.

## What’s inside

### Layers
- **Bronze**: raw ingestion tables loaded from CSV files
- **Silver**: cleaned and standardized tables
- **Gold**: analytics-ready star schema
  - `gold.dim_customer`
  - `gold.dim_product`
  - `gold.fact_order_items`

### Project structure
- `data/raw/` — sample CSV inputs
- `sql/01_setup/` — schemas + bronze tables
- `sql/02_load/` — load bronze from CSV
- `sql/03_transform/` — build silver + gold
- `sql/04_analytics/` — example analytics queries
- `sql/05_quality/` — data quality checks

## Prerequisites
- macOS
- Colima installed
- Colima running with the `containerd` runtime

## Start Colima (containerd runtime)
```bash
colima start --runtime containerd
colima status

  EOF

