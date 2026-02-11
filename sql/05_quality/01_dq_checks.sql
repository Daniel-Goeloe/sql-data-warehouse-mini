-- 1) Ordini senza customer valido (dovrebbe essere 0)
select o.*
from silver.orders o
left join silver.customers c on c.customer_id = o.customer_id
where c.customer_id is null;

-- 2) Fact con amount <= 0 (dovrebbe essere 0)
select *
from gold.fact_order_items
where line_amount <= 0;

-- 3) Email duplicate (dovrebbe essere 0)
select email, count(*) as cnt
from silver.customers
group by 1
having count(*) > 1;
