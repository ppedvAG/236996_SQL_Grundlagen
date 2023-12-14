/************************/

-- Datums- & Zeitfunktionen

/************************/

SELECT OrderDate FROM Orders

-- Aktuelle Systemzeit:
SELECT GETDATE()

SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) AS Tag, OrderDate FROM Orders

-- Holt sich aus dem OrderDate ein gewuenschtes Intervall aus dem Datum
SELECT 
DATEPART(YEAR, OrderDate) AS Jahr,
DATEPART(QUARTER, OrderDate) AS Quartal,
DATEPART(WEEK, OrderDate) AS KW,
DATEPART(WEEKDAY, OrderDate) AS Wochentag,
DATEPART(HOUR, OrderDate) AS Stunde
FROM Orders

-- Intervall Namen rausziehen aus einem Datum
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate),
OrderDate FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz in Intervall xy zwischen 2 Datums
SELECT DATEDIFF(YEAR, '20050213', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()), OrderDate FROM Orders

/**********************/

-- StringFunctions

/**********************/

-- CONCAT: Fuegt Strings in einer Spalte zusammen
SELECT CONCAT(FirstName, ' ', LastName, ' ', 100) as GanzerName FROM Employees

SELECT FirstName + ' ' + LastName + ' 100' as GanzerName FROM Employees

/*******************************/

-- OtherFunctions

/*******************************/

-- CAST oder CONVERT, wandeln Datentypen in der ausgabe um

-- konvertierung von datetime => date
SELECT CAST(OrderDate as date) FROM Orders

SELECT OrderDate FROM Orders

SELECT CONVERT(date, OrderDate) FROM Orders

-- ISNULL prueft auf Null Werte und ersetzt die wenn es gewuenscht ist
SELECT * FROM Customers
SELECT ISNULL(Fax, 'Nicht vorhanden') as KeineFax, Fax FROM Customers

-- Aufgaben:
-- 1. Was war das meistverkaufte Produkt im Jahr 1998 (ProductName)? Wieviel Stück (Quantity)?
-- Tabellen: Products - Order Details - Orders
SELECT TOP 1 ProductName, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details]. ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998
GROUP BY ProductName
ORDER BY Verkaufsmenge DESC

-- 2. Gab es Bestellungen (OrderID) an Wochenendtagen gab (OrderDate)? (Kein Ergebnis)
-- DATEPART() Tabelle: Orders
SELECT OrderID, DATEPART(WEEKDAY, OrderDate) as Wochentag FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) IN(6, 7)
ORDER BY Wochentag DESC

SELECT OrderID, DATEPART(WEEKDAY, OrderDate) as Wochentag FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) IN(6, 7)

SELECT OrderID, DATEPART(WEEKDAY, OrderDate) as Wochentag FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) > 5


-- 3. Alle Bestellungen (Orders) aus den USA (Customers Country) die im Jahr 1997 aufgegeben
-- wurden (OrderDate in Orders) 'YYYYMMDD' oder DATEPART() (Ergebniszeilen 60)
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND OrderDate BETWEEN '19970101' AND '19971231'

SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1997
-- 4. Welches Produkt (ProductName) hatte die groeßte Bestellmenge (Quantity in Order Details)
-- im Februar 1998
-- Tabellen: Products - Order Details - Orders
/*
	Lösung: Rhönbräu Klosterbier
*/
SELECT TOP 1 ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(MONTH, OrderDate) = 2
ORDER BY Quantity DESC

SELECT TOP 1 ProductName, SUM(Quantity) FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(MONTH, OrderDate) = 2
GROUP BY ProductName
ORDER BY 2 DESC

-- 5. Wieviele Bestellungen kamen aus Spain (Customers) in Quartal 2 1997? 
-- Sind es mehr oder weniger als aus Frankreich? (2. Abfragen) (Ergebniszeilen 2 und 8)
-- Tabellen: Orders - Customers

-- Espaniola
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Spain' AND DATEPART(QUARTER, OrderDate) = 2 AND
DATEPART(YEAR, OrderDate) = 1997
UNION ALL
-- France
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'France' AND DATEPART(QUARTER, OrderDate) = 2 AND
DATEPART(YEAR, OrderDate) = 1997