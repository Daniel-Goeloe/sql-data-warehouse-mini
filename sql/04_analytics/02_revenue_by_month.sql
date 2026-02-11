select
  date_trunc('month', order_ts)::date as month,
  sum(line_amount) as revenue
from gold.fact_order_items
where status = 'paid'
group by 1
order by 1;
