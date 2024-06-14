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



