--Order by
--Task 1
select * from customers order by customer_name;

--Task 2
select * from orders o left join order_items oi on o.order_id = oi.order_id order by total_price desc;

--Task 3
select * from products order by price asc , category  desc;

--Task 4
select order_id,customer_id,order_date from orders order by order_date desc;

--Task 5
select delivery_city,count(delivery_city) from orders group by delivery_city order by delivery_city asc;
