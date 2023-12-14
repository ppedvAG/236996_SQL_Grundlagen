--IF ELSE BEGIN END

If 1=1 	select 100
	
ELSE
	select 200
select 300

IF 1=0
	BEGIN
		select 100
		select 400
	END
ELSE 
	BEGIN
		select 200
		select 500
	END

if (select avg(freight) from orders) > 80
	begin
		print ' weniger als 80'
	end
ELSE
	begin
		select avg(freight) from orders 
	end

WHILE Bedingung
	begin

	end

declare @i as int = 1

while @i<=10
	begin
			select @i
			set @i+=1
			--nie set @i=+1
	end

declare @i as int = 1

while @i<=10 -- (Select sum(..) from tab) < 10
	begin
			
			set @i+=1
			select @i
			--if @i = 5 BREAK
			--nie set @i=+1
			if @i = 5 continue
			select 'X'
	end

while (select count(*) from customers ) < 10
	begin
		select 100
	end

select * into orders2 from orders

select * from orders2

update table set sp = wert
update table set sp = sp+wert
update table set sp = wert where orderid = 10

update orders2 set freight = freight *1.1 --um 10% bei allen Datensätzen

update orders2 set freight = freight *1.1 where orderid = 10248

--Wir erhöhen die Frachtkosten der Orders2
--um 10% bis entweder die Summe aller Frachtkosten 100000 erreicht aber nicht überschreitet
--oder ein einz. Wert die 1500 erreicht
select sum(freight), max(freight) from orders2

IF 1=0
	BEGIN
		select 100
		select 400
	END
ELSE 
	BEGIN
		select 200
		select 500
	END
	
while (select count(*) from customers ) < 10
	begin
		select 100 --break .. continue
	end

update orders2 set freight = freight *1.1 where orderid = 10248

drop table orders2
select * into orders2 from orders



--begin tran
while		((select SUM(freight) from orders2))  < 100000 /1.1
		and ((select max(freight) from orders2)) < 1500/1.1
begin 
	Update orders2 set Freight = Freight * 1.1
end
select sum(freight), max(freight) from  orders2
rollback

select 100000/1.1

