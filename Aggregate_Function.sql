--Aggregate Functions
--Task 1
select count(order_id) from orders;

--Task 2
select payment_mode,sum(total_price) as total_revenue from order_items oi
	inner join orders o on oi.order_id = o.order_id
	where payment_mode = 'UPI'
	group by payment_mode;

--Task 3
select category,Avg(price) from products group by category;

--Task 4
select max(price),min(price) from products where extract(year from supply_date) = 2023;

--Task 5
select product_id,sum(quantity) from order_items group by product_id;