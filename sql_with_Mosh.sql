-- SQL review

SELECT * from sql_store.customers;

USE sql_store;

SELECT first_name, 
last_name, 
points, 
points+10, 
((points*10)+100) 
from sql_store.customers;

SELECT  
	first_name,  
    last_name,  
    points,  
    points+10,  
    ((points*10)+100)  
from customers 
where customer_id = 1;



SELECT  
	first_name,  
    last_name,  
    points,  
    points+10,  
    ((points*10)+100)  
    from customers 
    -- where customer_id = 10;
;

select * from orders;

SELECT   
	first_name,   
    last_name,   
    points,   
    points+10,   
    ((points*10)+100) 
as discount_factor 
from customers ;


select 
	state 
from customers;

SELECT DISTINCT state FROM customers;

select * 
from orders;



select * 
from products;



select 
	name, 
    unit_price, 
    unit_price * 1.1  
from products;





-- WHERE CLAUSE... 
-- Comparaison operators <, >, =, <=, >=, not equal (<> same as !=)

SELECT * 
FROM customers 
WHERE points>3000;

SELECT * 
FROM customers 
WHERE state='VA';


SELECT * 
FROM customers 
WHERE city <> 'Atlanta';


select *  
from orders 
where order_date >= '2019-01-01';


select *  
from orders
where order_date >= '2018-01-01';


select * 
from customers 
where birth_date > '1990-01-01';


-- AND/OR OPERATORS.... AND is always evaluated first
-- () override all other operations
-- * and / override other operations


select * 
from customers 
where birth_date > '1990-01-01' or points > 1000;

select * 
from customers 
where birth_date > '1990-01-01' or points > 1000 and state = 'VA';

select * 
from customers 
where birth_date > '1990-01-01' or 
	  (points > 1000 and state = 'VA');

select * 
from customers 
where not (birth_date > '1990-01-01' or points > 1000);


select * 
from customers 
where birth_date <= '1990-01-01' and points > 1000;


SELECT * 
FROM sql_store.orders;

SELECT * 
FROM sql_store.order_items;

select * 
from order_items 
where order_id = 6 and 
	(quantity * unit_price > 30);

select * 
from customers
where state = 'VA' OR state = 'GA' OR state = 'FL';

-- use this instead
-- IN operator

select * 
from customers
where state in ('VA', 'GA','FL');

select * 
from customers
where state not in ('VA', 'GA','FL');

select * 
from products
where quantity_in_stock in (49, 38, 72);


-- between operator
-- birth_date in MySql is written 'year-month-day'

select * 
from customers
where points between 1000 and 3000;

select * 
from customers
where birth_date between '1990-1-1' and '2000-1-1';




-- like operator
-- % operator to signal any number of character
-- _ operator to signal a single character
-- REGEXP: regular expression
select * 
from customers
where last_name like 'b%';

select * 
from customers
where last_name like 'brush%';

select * 
from customers
where last_name like '%b%';

select * 
from customers
where last_name like '%y';

select * 
from customers
where last_name like '_____y';

select * 
from customers
where last_name like 'b____y';

select *
from customers
where address like '%TRAIL%' or address like 'AVENUE';

select *
from customers
where phone like '%9'; 

-- same 👆

select *
from customers
where phone not like '%9'; 


-- REGEXP: regular expression
 
-- 1
select *
from customers
where last_name like '%field%'; 


-- 2
select *
from customers
where last_name REGEXP 'field'; 

-- 1 AND -- 2 are the same

-- STILL REGEXP

-- "^" signifies Begining of a string

-- "$" signifiessignifies End of a string

-- "|" signifies logical "or"

-- [abcs]

-- [a-s]

select *
from customers
where last_name REGEXP '^field'; 

select *
from customers
where last_name REGEXP 'field$'; 

select *
from customers
where last_name REGEXP 'field|mac'; 

select *
from customers
where last_name REGEXP 'field|mac|rose'; 

select *
from customers
where last_name REGEXP '^field|mac|rose'; 

select *
from customers
where last_name REGEXP 'field$|mac|rose'; 

select *
from customers
where last_name REGEXP '[gim]e'; -- ge, ie, me, every character that come before e

select *
from customers
where last_name REGEXP '[gim]e';-- ge, ie, me, every character that come after e

select *
from customers
where last_name REGEXP '[a-h]e';

select *
from customers
where last_name REGEXP 'e[a-h]';



-- Get the customers whose 
-- 		first names are Elka or Ambur
-- 		last names end with EY or ON
-- 		last names start with MY or contains SE 
-- 		last names contain B followed by R or U



-- Solutions

select *
from customers 
where first_name REGEXP 'Elka|Ambur';

select *
from customers 
where last_name REGEXP 'EY$|ON$';

select *
from customers 
where last_name REGEXP '^MY|SE';

select *
from customers 
where last_name REGEXP 'B[R|U]';

-- same 👆
select *
from customers 
where last_name REGEXP 'B[RU]';

-- same 👆
select *
from customers 
where last_name REGEXP 'BR|BU';


-- Null is absense of a values
-- is null

select *
from customers 
where phone is null;

select *
from customers 
where phone is not null;

-- Exercise: 
-- gET ORDERS THAT ARE NOT SHIPPED

Select * 
from orders 
where shipper_id is null or shipped_date is null;

Select * 
from orders 
where shipper_id is null;

Select * 
from orders 
where shipped_date is null;


-- Order_by Clause

-- Primary key 
-- In RDBMS every column should have a Primary key 
-- and the values in that column should uniquely identify the records in that table
select *
from customers
order by first_name;

select *
from customers
order by first_name desc;

select *
from customers
order by state, first_name;

select *
from customers
order by state desc, first_name asc;

select first_name, last_name
from customers
order by birth_date;

select first_name, last_name, 10 as points 
from customers
order by birth_date;

select first_name, last_name, 10 as points 
from customers
order by 1, 2; -- to avoid , always doing it by name

-- Limit Clause:

select *
from customers
limit 3;

-- Limit > total, gives total:
select *
from customers
limit 300;



-- page 1: 1-3
-- page 1: 4-6
-- page 1: 7-9
-- If we want to retrieve informations on page3 7-9, ...
-- we wanna skip the first 2 pages, first 6 records and then pick 3 records

select *
from customers
limit 6, 3;

-- exo
-- Get the top three loyal customers
select *
from customers 
order by points desc
limit 3;

select *
from customers 
where points > 2000
order by points desc
limit 3;


-- select table from multiple tables

select *
from orders
inner join customers;

select *
from orders join customers
on orders.customer_id = customers.customer_id;

select order_id, first_name, last_name
from orders join customers
on orders.customer_id = customers.customer_id;

-- quantify them with the name of their table

-- this below is wrong  
select order_id, customer_id, first_name, last_name
from orders join customers
on orders.customer_id = customers.customer_id;
-- because orders and customers have the same "customer_id"

-- this below is right  
select order_id, orders.customer_id, first_name, last_name
from orders join customers
on orders.customer_id = customers.customer_id;
-- we needed to have customer_id specified with: 
-- orders.customer_id or customers.customer_id


-- alias
select order_id, o.customer_id, first_name, last_name
from orders o
join customers c
on o.customer_id = c.customer_id;


-- exo:
-- join products and order_item table

select * 
from order_items join products;

select * 
from order_items oi join products pr
on oi.product_id = pr.product_id;

select order_id, oi.product_id, quantity, oi.unit_price
from order_items oi join products pr
on oi.product_id = pr.product_id;

-- combining tables from different DBs

select *
from order_items oi
join sql_inventory.products p
on oi.product_id = p.product_id;

 
-- Joining accross DBs
-- same table in both libraries (Not to be done)
-- Join th product table with sql inventory DB

Select *
from sql_store.order_items oi
join products p
	on oi.product_id = p.product_id


-- sql self join

use sql_hr;

select *
from employees e
join employees m
	on e.reports_to = m.employee_id;
    
select e.employee_id,
		e.first_name,
        m.first_name as manager
from employees e
join employees m
	on e.reports_to = m.employee_id;




-- Joining multiple tablesorder_statusesorders

use sql_store;

select *
from orders o
join customers c 
	on  o.customer_id = c.customer_id
join order_statuses os
	on o.status = os.order_status_id;

select 
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name as status
from orders o
join customers c 
	on  o.customer_id = c.customer_id
join order_statuses os
	on o.status = os.order_status_id;
    
use sql_invoicing;

select 
	c.name,
    p.date,
    p.invoice_id,
    p.amount,
	pm.name as payment_names
from clients c
join payments p 
	on c.client_id = p.client_id
join payment_methods pm 
	on p.payment_method = pm.payment_method_id;
    
    
-- Compounds joining conditions

use sql_store;

select *
from order_items oi
join order_item_notes oin
	on oi.order_id = oin.order_id
    and oi.product_id = oin.product_id;
    

-- Implicit join syntax

-- NO Implicit join syntax
-- Explicit join syntax
select * 
from orders o
join customers c 
	on o.customer_id = c.customer_id;


-- this is an Implicit join syntax   (Not recommended to be used, because 
-- we could accidently forget the "where" clause) 
select *
from orders o, customers c
where o.customer_id = c.customer_id;


-- Outer join

select 
	c.customer_id,
	c.first_name,
	o.order_id
from customers c
join orders o
	on c.customer_id = o.customer_id 
order by c.customer_id;


select 
	c.customer_id,
	c.first_name,
	o.order_id
from customers c
left join orders o
	on c.customer_id = o.customer_id 
order by c.customer_id; 


select 
	c.customer_id,
	c.first_name,
	o.order_id
from customers c
right join orders o
	on c.customer_id = o.customer_id 
order by c.customer_id;

-- If we want everything like on left join
select 
	c.customer_id,
	c.first_name,
	o.order_id
from orders o
right join customers c
	on c.customer_id = o.customer_id 
order by c.customer_id;


select 
	c.customer_id,
	c.first_name,
	o.order_id
from orders o
right outer join customers c
	on c.customer_id = o.customer_id 
order by c.customer_id;

-- Exercise:
select 
	p.product_id,
    p.name,
    oi.quantity
from products p
right join order_items oi
	on p.product_id = oi.product_id
order by product_id;

-- Outer join between multiple tables:









































