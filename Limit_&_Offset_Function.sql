--Limit and Offset
--Task 1
select * from customers order by customer_name limit 10;

--Task 2
select product_name,price from products order by price desc limit 5;

--Task 3
select * from customers order by customer_id limit 10 offset 10;

--Task 4
select order_id,order_date,customer_id from orders where extract(year from order_date) = 2023 
	order by order_date limit 5;

--Task 5
select distinct(city) from customers c
	inner join orders o on o.customer_id = c.customer_id 
	inner join order_items oi on oi.order_id = o.order_id 
	order by city limit 10 offset 10;