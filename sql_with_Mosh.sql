--SQL review

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



select * 
from orders;



select * 
from products;



select 
	name, 
    unit_price, 
    unit_price * 1.1  
from products;


select *  
from orders 
where oreder_date >= '2019-01-01';


select *  
from orders
where order_date >= '2018-01-01';


select * 
from customers 
where birth_date > '1990-01-01';



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








-- Not from Mosh

select studentID, FullName, sat_score
from student
where 
  (
    studentID between 1 
    and 5 -- inclusive
    or studentID = 8 
    or FullName like '%Maximo%'
  ) 
  and sat_score NOT in (1000, 1400)
order by FullName DESC;




















