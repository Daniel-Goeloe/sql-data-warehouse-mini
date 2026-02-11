\set ON_ERROR_STOP on

drop table if exists gold.dim_customer;
create table gold.dim_customer as
select
  customer_id,
  full_name,
  email,
  country,
  created_at as customer_created_at
from silver.customers;

drop table if exists gold.dim_product;
create table gold.dim_product as
select
  product_id,
  product_name,
  category,
  price
from silver.products;

drop table if exists gold.fact_order_items;
create table gold.fact_order_items as
select
  o.order_id,
  o.order_ts,
  date_trunc('day', o.order_ts)::date as order_date,
  o.customer_id,
  oi.product_id,
  oi.qty,
  p.price,
  (oi.qty * p.price)::numeric(12,2) as line_amount,
  o.status
from silver.orders o
join silver.order_items oi on oi.order_id = o.order_id
join silver.products p on p.product_id = oi.product_id;
