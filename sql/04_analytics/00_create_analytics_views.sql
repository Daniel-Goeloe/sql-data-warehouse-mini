create schema if not exists analytics;

create or replace view analytics.revenue_by_month as
select
  date_trunc('month', order_ts)::date as month,
  sum(line_amount) as revenue
from gold.fact_order_items
where status = 'paid'
group by 1
order by 1;

create or replace view analytics.revenue_by_customer as
select
  c.customer_id,
  c.full_name,
  sum(f.line_amount) as total_revenue
from gold.fact_order_items f
join gold.dim_customer c on c.customer_id = f.customer_id
where f.status = 'paid'
group by 1,2
order by total_revenue desc;
