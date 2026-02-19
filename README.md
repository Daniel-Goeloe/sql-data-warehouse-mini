# SQL Data Warehouse Mini Project (PostgreSQL + Colima)

A small **portfolio data engineering project** that builds a simple SQL data warehouse using a **Bronze → Silver → Gold** pattern on **PostgreSQL**.

It intentionally follows a **no Docker Desktop** approach by using **Colima** (with the `containerd` runtime) as the local container runtime.

---

## TL;DR (for recruiters)

**What I built:** a mini end-to-end data warehouse pipeline that ingests raw CSVs, cleans/standardizes them, produces an analytics-ready star schema, runs basic data quality checks, and exposes simple revenue analytics (as queries and optional views).

**What this demonstrates:**
- Practical understanding of **layered warehouse design** (Bronze/Silver/Gold)
- SQL transformations that turn raw data into a **star schema** (facts + dimensions)
- Basic **data quality checks** (sanity constraints & validation queries)
- Reproducible local setup with **PostgreSQL in a container** (without Docker Desktop)

---

## What’s inside

### Layers
- **Bronze**: raw ingestion tables loaded from CSV files (minimal transformation)
- **Silver**: cleaned and standardized tables (types, normalization, consistency)
- **Gold**: analytics-ready star schema
  - `gold.dim_customer`
  - `gold.dim_product`
  - `gold.fact_order_items`

### Project structure
- `data/raw/` — sample CSV inputs
- `sql/01_setup/` — schemas + bronze tables
- `sql/02_load/` — load bronze from CSV (`psql`/`\copy`)
- `sql/03_transform/` — build
