
--Variablen
--@ lok Variable.. gilt nur in der Erstellersession
--  und existieren nur während des Batches

--vereinfachen einen Code..


declare @var as int  --Deklaration
set @var = 100  --zuweisen eines Wertes
select @var  --Abrufen des Variableninhalts
set @var = @var +10
select @var
 GO   --ab hier wird die variable ungültig
select @var

declare @var1 int = 200
declare @var2 as int = 200

select * from orders where freight < @var1


--Variablen können werte aus einer Abfrage zugewiesen werden..
declare @var3 as int

select @var3=count(*) from customers where country = 'USA'
select @var3

--gleichzetiges Zuweisen und Abfragen ist nicht möglich
select @var3=count(*), country from customers where country = 'USA'		 --verboten
															   

--BSP:
--orders freight--> Schnitt der Lieferkosten--> 
--welche orders liegen unter dem Schnitt

--1. Stelle den Durchschnittswert fest
--2. suche alle Bestellungen die unter diesem Schnitt liegen
select avg(freight) from orders


select * from orders 
	where freight <   (select avg(freight) from orders)

 declare @schnitt as money--bei int decimal(10,4), float, 

 select  @schnitt = avg(freight)*1.19 from orders

 select * from orders where freight < @schnitt


---Prozeduren
--wie Windows Batchdateien
--enthalten meist eine Businesslogik oder immer wiederkehrenden Verarbeitungsprozeß
--bei Übergabe von Parametern wird der Inhalt der Prozedur abgearbeitet..
--der Aufruf findet per exec Prozedurenname statt


exec procname 10,5

 exec procname 10,5


 create proc procname @par1 int, @par2 int,....
 as
 INS
 UP
 DEL
 SEL

 create or alter proc procdemo 
 AS
 select 100
 select 100*2

 exec procdemo

 create or alter proc procdemo   @par1 int
 AS
 select 100	* @par1
 select 100*2

  exec procdemo	   30


  --Kunden löschen
  delete from customers where customerid = 'ALFKI'

  --Prozedur, die sollte auflisten:
  --1 alle Bestell positionen
  --2 alle Bestellungen
  --3 den Kunden


  create or alter proc gpKundeDetails @CustId nchar(5)
  as
   select * from  [Order Details]
  where 
	orderid in (select orderid from orders where customerid = @CustId)
  select	* from orders		where customerid = @Custid
  select	* from customers	where customerid = @CustId
  GO

  exec gpKundedetails 'BLAUS'

  select * from  [Order Details]
  where 
	orderid in (select orderid from orders where customerid = 'ALFKI')


create or alter proc gpdemo20
as
select getdate()
GO

exec gpdemo20

select 100
GO 10










