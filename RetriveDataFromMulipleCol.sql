-- INNER JOIN ******************************************************************************


select *
from orders
join customers -- default inner join
on orders.customer_id = customers.customer_id

-- return by both of customer_id is equal
-- on returning first few col from order and then few col from customers

select order_id, first_name, last_name, 
from orders
join customers
on orders.customer_id = customers.customer_id

select order_id, first_name, last_name, customer_id
from orders
join customers
on orders.customer_id = customers.customer_id
-- now it will show the ambigour error becouise customer_id in both table

-- solution
select order_id, first_name, last_name, orders.customer_id
from orders
join customers
on orders.customer_id = customers.customer_id

-- with alias 
select order_id, first_name, last_name, o.customer_id
from orders as o
join customers as c
on o.customer_id = c.customer_id



-- joining across databases ******************************************************************************

select *
 from order_items oi -- currenty selected data base
 join sql_inventory.products p -- sql_inventory is another database
 on oi.product_id = p.product_id


-- self JOIN ******************************************************************************

select e.employee_id,
		e.first_name,
        m.first_name
from employees e
join employees m
	on e.reports_to = m.employee_id

    -- all employee report to the employee which report to no one

-- JOIN more table ******************************************************************************

select c.customer_id, first_name, os.name as status
from customers c
join orders o
	on o.customer_id = c.customer_id
join order_statuses os
		on o.status = os.order_status_id 

-- exercise 
select p.date, p.invoice_id, p.amount, pm.name as status, c.name
from payments p
join clients c
	on c.client_id = p.client_id
join payment_methods pm
	on pm.payment_method_id = p.payment_method        



-- compund join condition ******************************************************************************
select *
from order_items oi
join order_item_notes oin
	on oi.order_id = oin_order_id and oin._product_id = oi.product_id


--  compound join
-- where we uniquely idenify by two column product_id and order_id

-- implicit join condition ******************************************************************************

select *
from orders o
join customers c
	on o.customer_id = c.customer_id; -- recomanded this becouse this force us to type on condition

-- both are the same

-- implicit syntext 
select *
from orders o, customers c
where o.customer_id = c.customer_id;


-- OUTER JOIN ******************************************************************************

left outer join == left join
right outer join == right join



select c.customer_id, c.first_name, o.order_id
from orders o
join customers c
	on o.customer_id = c.customer_id
order by c.customer_id    
    --  it will return only customer those have orderd

-- BUT WE WANT CUSTOMERS AS WELL WHO ORDERD OR NOT

select c.customer_id, c.first_name, o.order_id
from  customers c
left join orders o -- left means customers, if here is right then it will be orders 
	on o.customer_id = c.customer_id
order by c.customer_id    
-- it gives us from customers whether "on" condition true or not



-- by this below commands
-- it will  give us the from order as condition true or not 

-- select c.customer_id, c.first_name, o.order_id
-- from customers c
-- right join orders o
-- 	on o.customer_id = c.customer_id
-- order by c.customer_id   

-- exercise getting product wether they have been ordered or nor
select p.product_id, p.name, o.quantity
from products p
left join order_items o
	on o.product_id = p.product_id
   

-- OUTER JOIN  between mulitple table******************************************************************************


select *
from orders o
right join customers c
	on o.customer_id = c.customer_id
join shippers sh
	on sh.shipper_id  = o.shipper_id

    --return all order that have shipped
    -- we want order wether they shipped or not

select *
from orders o
right join customers c
	on o.customer_id = c.customer_id
left join shippers sh
	on sh.shipper_id  = o.shipper_id     
    -- it returns order wether they shipped or not 


-- OUTER JOIN  between mulitple table******************************************************************************
select em.employee_id,
	em.first_name,
    m.first_name as manager
from employees em
right join employees m
	on em.reports_to = m.employee_id



-- USING clause *****************************************************************************
from	on o.customer_id = c.customer_id
-- same as 
using (customer_id)

-- natural join *****************************************************************************
select o.order_id, c.first_name
from orders o
natural join customers c
-- it will join the tables by common ccolumn but it it not recomanded
-- becouse sometimes it producd the unexpected results


-- cross join *****************************************************************************

select *
from customers c
cross join products 
-- every table from customer table join with every record frrom the products table
-- thats we dont have here "on" condition

-- same as 

-- implicit method
select *
from customers c, products p


-- Unions *****************************************************************************
-- join for joining columns  

-- here we join the rows

select order_id, order_date,
'active' as status
from orders
where order_date < '2019-01-01' -- it gives the active

union

select order_id, order_date,
'archived' as status
from orders
where order_date > '2019-01-01' -- it gives the archived


-- select first_name
-- from customers
-- union
-- select name
-- from shippers
    -- " its gives the only one column as firstname in which include the customers name and shippers name "
    --  " column will be first_name becouse first query seletted the first_name "

