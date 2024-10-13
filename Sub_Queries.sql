--Sub-Queries
--Task 1
select customer_name,oi.total_price from customers c 
	inner join orders o on c.customer_id = o.customer_id 
	inner join order_items oi on o.order_id = oi.order_id
	group by customer_name,oi.total_price having sum(total_price) >(select avg(total_price) from order_items);
--Here sum(total_price) is used because customer have repited orders

--Or
select customer_name from customers where customer_id in 
	(select o.customer_id from orders o 
	join order_items oi on o.order_id = oi.order_id
	group by o.customer_id having sum(oi.total_price) > (select avg(total_price)from order_items));

--Task 2
select product_name from products where product_id in (select product_id from order_items 
	group by product_id having count(order_id) > 1);


--Task 3
select product_name from products
where product_id in (select product_id from order_items oi 
	inner join orders o on oi.order_id = o.order_id 
	inner join customers c on c.customer_id = o.customer_Id where city = 'Pune');

--Task 4 ?
select o.order_id,total_order_price from
    (select oi.order_id,sum(oi.quantity * p.price) as total_order_price from order_items oi
     inner join products p on oi.product_id = p.product_id
     group by oi.order_id
     order by total_order_price desc limit 3) as top_orders
inner join orders o on top_orders.order_id = o.order_id;

--or
select o.order_id total_price,total_order_price from 
	(select oi.order_id,sum(total_price) as total_order_price from order_items oi
	group by oi.order_id order by total_order_price desc limit 3) as top_orders
	inner join orders o on top_orders.order_id = o.order_id;
	
--Task 5 ?
select c.customer_name from customers c
inner join orders o on c.customer_id = o.customer_id
where o.order_id in (select oi.order_id from order_items oi 
	inner join products p 
	on oi.product_id = p.product_id 
	where p.price > 30000);

--or
select customer_name from customers where customer_id in (select customer_id from orders o 
	inner join order_items oi on o.order_id = oi.order_id
	inner join products p on p.product_id = oi.product_id where price > 30000);