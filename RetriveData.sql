select last_name,first_name as nameing , points * 10 +100 as discount_factor, points
 -- order is matter first col will be last_name
-- "as" is the alias first_name as naming we can give the name  by using "as"
--  it will show the naming col 

-- first * work then plus
-- we can also change the order using the ()
from customers


-- DISTINCT

select distinct state
-- distinct for avoiding the duplicate 
from customers


-- WHERE CLAUSE ******************************************************************************

select *
from customers
where points > 300

operators
>
<
>=
<=
!= , <> both are the not operator

-- select *
-- from customers
-- where state = "va" for the string

using not operator
-- where state != "va"
-- where state <> "va"

-- where birth_date > '1990-01-01'   default method for date


-- AND OR OPERATOR  ******************************************************************************

where birth_date > '1990-01-01'  AND points > 1000
where birth_date > '1990-01-01'  or points > 1000 -- atleast one of the condition true

where birth_date > '1990-01-01'  or points > 1000 and state = 'va'


"and" first execute higher precedence
"or" 
"not"

where not (birth_date > '1990-01-01'  or points > 1000 and state = 'va')
-- all things  are opostie as they are i mean 
-- and wil become or when we use not operator

-- IN operator ******************************************************************************

where state in ("va", "ma")
-- same as 
where state ="va" or state = "ga" or state = "ma"

-- its wrong --> where state = "va" or "ga" or "ma"

-- where state not in ("va", "ma") 

-- BETWEEN operator ******************************************************************************

where points  >= 1000 and points <=3000
-- for range 
-- same as above 
where points between 1000 and 3000 -- greater and equal to 1000 or less and equal to  3000


-- LIKE operator ******************************************************************************

where last_name like 'b%' -- last_name start with b
where last_name like '%b%' -- any charactor in start and end
where last_name like '_____y' -- lastname exacctly 6 ch long any start 5 ch but lact ch must be 'y'
where last_name like 'b____y'


-- REGEX operator ******************************************************************************
-- same as like but regex new in mysql 

where last_name like '%field%' -- last me kuch b asakta hy or start me b
-- same as above like %% 
where last_name regexp 'field'


where last_name regexp '^field' --string must start with field
where last_name regexp 'field$' --string must end with field

where last_name regexp 'field|mac'-- strings must have any field or mac
where last_name regexp 'field$|^mac|rose'  -- lastname end with field or start with mac or anywhere rose present

where last_name regexp '[gim]e' -- ge, ie, me
where last_name regexp 'e[gim]' --  eg, ei, em
where last_name regexp '[a-h]e' --  a to h like ae, be, anny or etc, where in the last name

-- ^ start
-- $ end
-- | logical or
-- [abcd]
-- [a-d]


-- NULL operator ******************************************************************************

where phone is null --  customer who not have phone
where phone is not null -- custoemrs whose phone does not null


-- ORDER BY clause ******************************************************************************
-- for sorting 

order by first_name -- sorted by firstname by asc order
order by first_name desc -- sorted by firstname by descending order

order by  first_name, last_name desc -- sorted by firstname by ascending order and lastname by descending order


-- here 
-- select is state by sored by first_name
select state
from customers
order by first_name 
-- we can sorted by any order whether that selected or not 
-- for my sql point view its valid not sure about sql server

select state, points
from customers
order by 1 -- order by state, which is 1 in state line


-- LIMIT BY clause ******************************************************************************

-- how to limit number of return 
select *
from customers
limit 3  -- first 3 customers we get

select *
from customers
limit 6,3
-- here 6 is offset means 6 will avoid then 3 will return
-- means (1,2,3,4,5,6,7,8,9) it will return 7,8,9 first 6 will be avoided
