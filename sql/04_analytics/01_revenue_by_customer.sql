select
  c.customer_id,
  c.full_name,
  sum(f.line_amount) as total_revenue
from gold.fact_order_items f
join gold.dim_customer c on c.customer_id = f.customer_id
where f.status = 'paid'
group by 1,2
order by total_revenue desc;
