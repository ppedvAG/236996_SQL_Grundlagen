--eine Sicht ist eine "gemerkte Abfrage"

select * from (select * from orders) t;
GO

--eine Sicht funktioniert immer	  , da sie permanent gespeichert wird
--werden wie Tabellen behandelt
--komplexe Statement werden vermieden
--tu nie eine Sicht zweckentfremden... 
--zb Abfrage die nur eine Tabelle braucht nicht die Sicht verwenden dier 10 Joins macht
--man Kann auf Sichten : INS, UP, DEL, SEL, Rechte

create view viewDemo
as
select * from orders;
GO


create or alter view vKundeUmsatz
as
select 
		c.CustomerID, c.CompanyName, c.Country,c.City		--Kunden
		,o.orderid , o.freight, o.orderdate					--BestellKopf
		,e.lastname, e.firstname, e.EmployeeID				--AngDaten
		,od.UnitPrice, od.Quantity, od.ProductID			--Positionen
		,(od.UnitPrice* od.Quantity) as PoSumme     		--Errechnet PosSumme
		,p.ProductName										--Produktdaten
from customers c inner join orders o			on c.CustomerID	=o.CustomerID
			     inner join employees e 		on e.EmployeeID	=o.EmployeeID
				 inner join [Order Details] od	on o.OrderID	=od.OrderID
				 inner join products p			on p.ProductID	=od.ProductID ;
GO

select * from viewdemo;


select sum(posumme) from vKundeUmsatz where country = 'AUSTRIA'

--Wieviele Kunden gibt es pro Land?

select country, count(customerid) from vKundeUmsatz
group by country  ;

select country, count(customerid) from customers
group by country   ;

--Aus Rechteperspektive
create view EmplUSA
as
select HomePhone, LastName, FirstName, EmployeeID from employees where country = 'USA' ;

--Nur ZUgriff auf das Ergebnis der Sicht
select * from emplusa






