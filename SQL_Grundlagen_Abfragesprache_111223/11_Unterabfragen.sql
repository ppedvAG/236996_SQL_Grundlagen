/*
	-- Subqueries / Unterabfragen / nested queries

	-- Muessen eigenst�ndig fehlerfrei ausf�hrbar sein!
	-- �berall in einer Abfrage eingebaut werden (falls es denn Sinn macht)
	-- Abfragen werden sogesagt von "innen nach au�en" der Reihe nach ausgef�hrt
*/

SELECT * FROM Orders
WHERE Freight > AVG(Freight)

-- Unterabfrage
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders) -- 20

-- Mehrere Werte aus einer Subquery im WHERE moeglich machen
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

SELECT * FROM Orders

-- 1. Schreiben Sie eine Abfrage, um eine Produktliste
-- (ID, Name, St�ckpreis) mit einem �berdurchschnittlichen Preis zu erhalten
-- Unitpreis > �berdurchschnittlicher UnitPrice 
-- Tabelle: Products
SELECT ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice


-- 2. Erstellen Sie einen Bericht, der die Gesamtzahl der Bestellungen nach Kunde seit
-- dem 31. Dezember 1996 anzeigt
-- Der Bericht sollte nur Zeilen zur�ckgeben f�r die die Gesamtzahl der Auftr�ge gr��er
-- als 15 ist
-- Tables: Orders (5 Zeilen)
SELECT CustomerID, COUNT(OrderID) FROM Orders
WHERE OrderDate > '19961231'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
ORDER BY 2


-- 3. Ist der Spediteur "Speedy Express" �ber die Jahre
-- durchschnittlich teurer geworden? (Freight pro Jahr)
-- Tabelle: Orders - Shippers
SELECT CompanyName, DATEPART(YEAR, OrderDate) as Geschaeftsjahr, AVG(Freight) AS AvgFreight FROM
Orders JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE CompanyName = 'Speedy Express'
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)

-- 4. Haben wir Produkteinheiten im Lager (UnitsInStock), die aber nicht mehr verkauft werden
-- (Discontinued)? Wenn ja, wieviel "Geld" liegt dort noch im Lager? (4 Zeilen)
SELECT ProductName, UnitsInStock * UnitPrice as Wert FROM Products
WHERE Discontinued = 1 AND UnitsInStock != 0