\set ON_ERROR_STOP on

truncate table bronze.customers;
\copy bronze.customers from '/workspace/data/raw/customers.csv' with (format csv, header true);

truncate table bronze.products;
\copy bronze.products from '/workspace/data/raw/products.csv' with (format csv, header true);

truncate table bronze.orders;
\copy bronze.orders from '/workspace/data/raw/orders.csv' with (format csv, header true);

truncate table bronze.order_items;
\copy bronze.order_items from '/workspace/data/raw/order_items.csv' with (format csv, header true);
