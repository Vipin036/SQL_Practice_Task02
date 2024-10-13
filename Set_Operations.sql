--Set Operations
--Task 1
select customer_name from customers where customer_id in (select customer_id from customers)
intersect
select customer_name from customers where customer_id in (select customer_id from orders
where extract(year from order_date) in (2022,2023));

--Task 2 ?
select p.product_name,o.order_date from products p
inner join order_items oi on p.product_id = oi.product_id
inner join orders o on oi.order_id = o.order_id

except

select p.product_name,o.order_date from products p
inner join order_items oi on p.product_id = oi.product_id
inner join orders o on oi.order_id = o.order_id
where extract(year from order_date) in (2021,2023);

--Or
select product_name from products where product_id in (select product_id from order_items oi 
	join orders o on o.order_id=oi.order_id where extract(year from order_date)=2022)
except
select product_name from products where product_id in (select product_id from order_items oi 
	join orders o on o.order_id=oi.order_id where extract(year from order_date)=2023);


--Task 3
select supplier_city from products
except
select city from customers;

--Task 4
select supplier_city from products
union
select city from customers;

--Task 5 ?
select product_name from products p
inner join order_items oi on p.product_id = oi.product_id

intersect

select product_name from products p
inner join order_items oi on p.product_id = oi.product_id
inner join orders o on oi.order_id = o.order_id
where extract(year from order_date) = 2023;
