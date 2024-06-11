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
where not (birth_date > '1990-01-01' or points > 1000);


select * 
from customers 
where birth_date <= '1990-01-01' and points > 1000;


SELECT * 
FROM sql_store.orders;

SELECT * 
FROM sql_store.order_items;




















