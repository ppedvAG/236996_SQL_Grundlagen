select 100,1
UNION --macht distinct
select 200,1
UNION ALL
select 300,1
union ALL
select 100,1


select  customerid,CompanyName, country,  city from customers --order by country
UNION ALL
select CustomerID, CompanyName, Country, city from Kunden 
order by country


select * from kunden order by country

select 
from 
where
group by
order by

--intersect
select country, customerid from customers
intersect
select country, customerid from kunden

--gibts kunden , die in Customers sind aber nicht in Kunden


select customerid from customers
except
select customerid from kunden



select customerid, country, city from kunden
except
select customerid, country, city from customers

--stimmt das
select * from kunden k left join customers c 
	on k.customerid=c.CustomerID and k.city=c.City and c.Country=k.country
where c.CustomerID is null

--welche städte gibts in Kunden aber nicht in customers

select city from kunden
except
select city from customers



--select * from orders

select employeeid, max(freight) from orders

select top 1 employeeid, freight from orders order by freight desc
UNION  ALL
select top 1 employeeid, freight from orders order by freight asc

--Idee: temp Tabelle

select top 1 employeeid, freight into #t1 from orders order by freight desc

insert into #t1
select top 1 employeeid, freight from orders order by freight asc

select * from #t1

--idee
select * from 
(
select top 1 employeeid, freight from orders order by freight desc
) t1
UNION  ALL
select * from 
(
select top 1 employeeid, freight from orders order by freight asc
) t2






