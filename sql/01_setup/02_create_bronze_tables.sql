drop table if exists bronze.customers;
create table bronze.customers (
  customer_id int,
  full_name text,
  email text,
  country text,
  created_at date
);

drop table if exists bronze.products;
create table bronze.products (
  product_id int,
  product_name text,
  category text,
  price numeric(10,2)
);

drop table if exists bronze.orders;
create table bronze.orders (
  order_id int,
  customer_id int,
  order_ts timestamp,
  status text
);

drop table if exists bronze.order_items;
create table bronze.order_items (
  order_id int,
  product_id int,
  qty int
);
