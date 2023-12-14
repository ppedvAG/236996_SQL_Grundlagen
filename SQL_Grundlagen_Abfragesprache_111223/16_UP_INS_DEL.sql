--UP IN DEL

Insert

--Wert manuell in eine Zelle einfügen--> Update
--Wert aus einer zelle löschen--> update

--eine ganze Zeile einfügen
-- mit manuell vorgegeben Werte
-- Werte aus einer anderen Tabelle verwenden
-- Zieltabelle schon vorhanden oder eben nicht 

select * into test from orders
--neue Tabelle mit Werten aus Orders

select freight , orderid, customerid into test5 from orders

select * from test5

select convert(int,freight) as Fracht , orderid, customerid, datepart(yy, orderdate) as Jahr
into test6 
from orders
select ..into generiert eine Tabelle und übernimmt die DAtentypen
, die Werte, die Spaltenname und

--Werte aus einer Tabelle oder Abfrage in eine bestehende 
--
insert into test6
select convert(int,freight) as test3 ,  customerid, datepart(yy, orderdate) as Jahr
from orders

insert into test6 (Fracht, customerid)
select			   100, 'ALFKI'


select * from test6ert into test6 (Customerid, Fracht)
select			   'BLAU',		200




select customerid, companyname, country, city
into kunden
from customers 
where
country in('Italy', 'Germany', 'Austria', 'France')

select* from kunden

--alle aus UK dazunehmen
--alle Kunden aus UK
insert into kunden
select customerid, companyname, country, city
from customers 
where
		country in('UK')

insert into kunden
select customerid, companyname, country, NULL
from customers 
where
		country in('SPain')


--oder
insert into kunden (customerid, country, companyname)
select				customerid, country, companyname
from customers 
where
		country in('Switzerland')

insert into kunden (customerid, country, companyname)
select               'FABIA', 'DEUSTCHLAND', 'Audi'

select * from kunden

insert into Kunden (customerid, companyname,country,city)
select				'AUDIX', 'Audi Ag', 'Finnland', 'Helsinki'


update tabelle set sp = Wert

select * from kunden

update kunden set city = 'München' where customerid = 'ALFKI'

update kunden set city = 'OSLO'		 where customerid ='AUDIX'
update kunden set country = 'Sweden' where customerid ='AUDIX'

--oder auch
update kunden set	city = 'OSLO'
					,country = 'Sweden'
where 
	 customerid ='AUDIX'

select * from orders2
--erhöhe alle Frachtkosten um 10%, wenn der Kunde aus Austria kommt

--1 alle Orders2 ausgeben, bei denen der Kunde aus Austria stammt
--upDATE DARÜBER SCHREIBEN
--From eig Zeile, Select auskommentieren
--ausführen

update orders2 set freight = freight *1.1
--select o.*, c.country
from orders2 o inner join customers c on c.CustomerID=o.CustomerID
where country = 'AUSTRIA'





select * from orders2 where customerid in (select customerid from customers where country = 'AUSTRIA')






update kunden set city = NULL where customerid = 'ALFKI'


delete kunden where customerid = 'ALFKI'

delete customers where customerid = 'PARIS'


delete
--select * 
from  customers where customerid = 'ALFKI'

--lösche alle Bestllungen aus orders2 die von einem Kunden aus Italy stammen

--1. Abfrage ..betroffende DS finden...
--2. delete mit Tabellenangabe über Select
--3. from in nächste Zeile und Select  auskommentieren

delete orders2
--select * 
from orders2 o inner join customers c on c.CustomerID=o.CustomerID
where 
	country = 'Italy'


delete orders2 
--select * 
from orders2 o
	INNER JOIN customers c ON o.CustomerID = c.CustomerID
WHERE country = 'italy'


select * from kunden --BLAUS
--lösche die Stadt bei dem BLAUS

update kunden set city = NULL where customerid = 'BLAUS'



























select * from test6
