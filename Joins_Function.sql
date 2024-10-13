--Joins
--Task 1
select customers.customer_name, customers.city, orders.order_date
from customers
inner join orders 
on customers.customer_id = orders.customer_id 
	where extract(year from order_date) = 2023;


--Task 2
select product_name,category,total_price from customers c 
	inner join orders o on c.customer_id = o.customer_id 
	inner join order_items oi on o.order_id = oi.order_id 
	inner join products p on p.product_id = oi.product_id 
	order by c.city = 'Mumbai';

--Task 3
select customer_name,order_date,total_price from customers c
	inner join orders o on c.customer_id = o.customer_id 
	inner join order_items oi on o.order_id = oi.order_id
	where payment_mode = 'Credit Card';

--Task 4
select product_name,category,total_price,order_date from orders o 
	inner join order_items oi on o.order_id = oi.order_id 
	inner join products p on p.product_id = oi.product_id
	where o.order_date >= '2023-01-01' 
    AND o.order_date < '2023-07-01';

--Task 5
select c.customer_name,Sum(oi.quantity) as total_products_ordered
from customers c
inner join orders o ON c.customer_id = o.customer_id
inner join order_items oi ON o.order_id = oi.order_id
group by c.customer_name;