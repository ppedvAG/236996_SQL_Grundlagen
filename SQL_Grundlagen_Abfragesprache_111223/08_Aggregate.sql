/*********************/

-- Aggregatfunktionen

/*********************/

-- grundsaetzlich 5 verschieden Funktionen

SELECT
SUM(Freight) AS Summe,
MIN(Freight) AS Minumum,
MAX(Freight) AS Maximum,
AVG(Freight) AS Durchschnitt,
COUNT(ShippedDate) as ZaehleSpalte, COUNT(*) as ZaehleAlles
FROM Orders

SELECT * FROM Orders

-- AVG Selber ausrechnen
SELECT SUM(Freight) / COUNT(*) FROM Orders

-- GROUP BY erforderlich!
SELECT CustomerID, SUM(Freight) as GruppierteFracht FROM Orders
GROUP BY CustomerID

SELECT ShipCountry, SUM(Freight), AVG(Freight) FROM Orders
GROUP BY ShipCountry

-- JOINs kombinieren mit Group By
SELECT ProductName, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName
ORDER BY ProductName DESC

SELECT ProductName, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1, 2, 3, 4)
GROUP BY ProductName
ORDER BY ProductName DESC

-- Verkaufte Stueckzahlen pro Produkt, aber nur ueber 1000
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE SUM(Quantity) > 1000
GROUP BY ProductName
ORDER BY SummeStueckzahl DESC

-- HAVING funktioniert 1zu1 wie WHERE, bloß das es gruppierte/aggregierte Werte nachträglich filtern kann
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName
HAVING SUM(Quantity) < 1000
ORDER BY SummeStueckzahl DESC

/*
	1. Verkauften Stueckzahlen (Quantity) pro ProduktKategorie (CategoryName) (8 Ergebniszeilen)
	Tabelle: Order Details -> Products -> Categories

	2. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
	Tabelle: Employees - Orders

	3. In welcher Stadt (City) waren "Wimmers gute Semmelknödel" am beliebtesten (Quantity)?
	Tabellen: Products - Order Details - Orders - Customers (1 Ergebniszeile)
	Wichtig: 1 Zeile 
 */

 -- 1.
 SELECT CategoryName, SUM(Quantity) FROM [Order Details]
 JOIN Products ON Products.ProductID = [Order Details].ProductID
 JOIN Categories ON Categories.CategoryID = Products.CategoryID
 GROUP BY CategoryName

 -- 2. 
SELECT LastName, COUNT(OrderID) as Bestellungen FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName
ORDER BY 2 DESC

-- 3.
SELECT TOP 1 City, SUM(Quantity) AS Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE ProductName = 'Wimmers gute Semmelknödel'
GROUP BY City
ORDER BY Verkaufsmenge DESC

--4. Welcher Spediteur (Shippers) war durchschnittlich am günstigsten? (Freight)
--Tabellen: Shippers - Orders (Verknüpfung zwischen Orders.ShipVia = Shippers.ShipperID)
--(1 Ergebniszeile)
SELECT TOP 1 CompanyName, ShipperID, AVG(Freight) as AvgFreight FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName, ShipperID
ORDER BY AvgFreight

/*
	Ergebnis:
	---------------------------
	CompanyName    | AvgFreight
	Speedy Express | 65,0013
*/
