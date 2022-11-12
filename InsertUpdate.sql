-- VARCHAR(50); 
-- char(50) waist of space 

-- if hadi is in the char then 44 space will be waist 
-- bu in the if hadi is in varchar then it will get space for the only foour char other 44 will be free 

-- inserting  a row  *****************************************************************************

insert into customers 
values (default, 'hadi', 'raza', '2020--01-01',  null, 'karachi', 'pakistan','sindh', default)

-- another method
insert into customers (first_name, last_name,birht_date, address, city,state) -- we can list it any order
values ('hadi', 'raza', '2020--01-01',  'karachi', 'pakistan','sindh')

-- inserting multiple row  *****************************************************************************

insert into shippers (name) values ('shiperd one'), ('shiperd two' ), ('shiper three ')


-- inserting Hierarchical row *****************************************************************************
-- iserting data into mulitple column 

insert into  orders (customer_id, order_date, status)
values (1, '2021-01-01', 1);

insert into order_items 
values 
	(last_insert_id(), 1, 1,2.95), -- last_insert_id() is a function of getting a id of lattest inserted data
	(last_insert_id(), 2, 1,3.5)


-- creating a copy of table *****************************************************************************
-- copy data from one table to another

create table orders_arc  as 
select * from orders -- its a sub query
 
-- here creating a orders_arc table in which same column as in orders
-- but order_id is a primary key in orders but in orders_arch its not an primary and nor Auto Inc
-- its specially in mysql


-- in this below we dont need order_arc() with paranthesis
insert into orders_arc
select * from orders 
where order_date > '2010-01-01'

-- exercise
create table invoice_arc as
select i.invoice_id,
		i.number,
        c.name as client,
		i.invoice_total,
        i.payment_total,
        i.invoice_date,
        payment_date,
        due_date
from invoices i
join clients c
using (client_id)
where payment_date is not null


-- update a single row *****************************************************************************

update invoices 
set payment_total =10, payment_date = '2021-01-01'
where invoice_id = 1
-- it will update from invoice where invoice_id is one 

update invoices 
set payment_total = default, payment_date = null
where invoice_id = 1
-- it will update from invoice where invoice_id is one 

update invoices 
set payment_total = invoice_total * 0.2, payment_date = null
where invoice_id = 1
-- it will update from invoice where invoice_id is one 


-- update a multiple row *****************************************************************************

update invoices 
set payment_total = default, payment_date = null
where client_id = 3

-- IT WILL UPDATE THE ALL ROWS WITH CLIENT_ID 3 IN SQL SERVER BUT
-- IT WILL UPDATE ONLY ONE OR MAY GET ERROR IN MYSQL

update invoices 
set payment_total = default, payment_date = null
where client_id in (3,4)

-- we can also not type where clause it will update the all rows


-- sub queries in updates  *****************************************************************************
update invoices 
set payment_total = default, payment_date = null
where client_id = (select client_id
from clients where name = 'myworks')

--  first invoke the sub query and gives the client_id then invoke the uper query

-- IF SUBQUERY GIVE MORE CLIENT_ID THEN 

update invoices 
set payment_total = default, payment_date = null
where client_id in (select client_id
from clients where name in ('ca','ny'))

-- 
update invoices 
set payment_total = default, payment_date = due_date
where payment_date is null


-- exercise
-- udpate comments where customer points > 3000
update orders
set comments = 'gold'
where customer_id in (select customer_id
from customers
where points > 3000)


-- deleting a row *****************************************************************************


delete from invoices
where invoice_id = (
    select *
    from clients 
    where name = 'myworks'
)
-- also using subqueries
