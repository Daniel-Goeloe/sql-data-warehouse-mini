\set ON_ERROR_STOP on

drop table if exists silver.customers;
create table silver.customers as
select
  customer_id,
  trim(full_name) as full_name,
  lower(trim(email)) as email,
  upper(trim(country)) as country,
  created_at
from bronze.customers
where customer_id is not null;

drop table if exists silver.products;
create table silver.products as
select
  product_id,
  trim(product_name) as product_name,
  lower(trim(category)) as category,
  price
from bronze.products
where product_id is not null;

drop table if exists silver.orders;
create table silver.orders as
select
  order_id,
  customer_id,
  order_ts,
  lower(trim(status)) as status
from bronze.orders
where order_id is not null;

drop table if exists silver.order_items;
create table silver.order_items as
select
  order_id,
  product_id,
  qty
from bronze.order_items
where order_id is not null
  and product_id is not null
  and qty is not null
  and qty > 0;
