  Lösungen Übungsaufgaben:

1.
Was war das meistverkaufte Produkt im Jahr 1998 (Productname)? Wieviel Stück (Quantity)?

```
SELECT TOP 1 ProductName, SUM(Quantity) as VerkaufteMenge 
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON o.OrderID = od.OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998
GROUP BY ProductName
ORDER BY VerkaufteMenge DESC
```

2.
In welcher Stadt (City) waren „Wimmers gute Semmelknödel“ am beliebtesten (Quantity)?

```
SELECT TOP 1 City, SUM(Quantity) as VerkaufteMenge 
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON o.OrderID = od.OrderID
JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE ProductName = 'Wimmers gute Semmelknödel'
GROUP BY City
ORDER BY VerkaufteMenge DESC
```

3.
Welcher Spediteur (Shippers) war durchschnittlich am günstigsten? (Freight)

```
SELECT TOP 1 CompanyName, AVG(Freight) as AvgFreight
FROM Orders o 
JOIN Shippers s ON o.ShipVia = s.ShipperID
GROUP BY CompanyName
ORDER BY AvgFreight
```

4. 
Ist der Spediteur „Speedy Express“ über die Jahre durchschnittlich teurer geworden? (Freight pro Jahr)
```
SELECT CompanyName, DATEPART(YEAR, OrderDate) as Geschäftsjahr, AVG(Freight) as AvgFreight
FROM Orders o 
JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE CompanyName = 'Speedy Express'
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)
ORDER BY 2
```
	Ist jedes Jahr teurer geworden

5.
Bei welchem Produkt (Productname) würden wir den größten Umsatz machen, wenn wir sofort alle verfügbaren Einheiten (UnitsInStock) verkaufen würden?
```
SELECT TOP 1 ProductName, UnitsInStock * UnitPrice as Umsatz
FROM Products
ORDER BY Umsatz DESC
	Côte de Blaye
```
6.
Gab es Bestellungen (OrderID) an Wochenendtagen (OrderDate)?
```
SELECT * FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) IN (6,7)
	Nein
```
7.
Haben wir Produkteinheiten im Lager (UnitsInStock), die aber nicht mehr verkauft werden (Discontinued)? Wenn ja, wieviel „Geld“ liegt dort noch im Lager?
```
SELECT ProductName, UnitsInStock * UnitPrice as Wert
FROM Products
WHERE Discontinued = 1 AND UnitsInStock != 0
```
8.
Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie „Seafood“ (Categories) verkauft?
Wenn ja, wieviel Lieferkosten sind dabei insgesamt entstanden (Freight)?
```
SELECT DISTINCT SUM(Freight) as Lieferkosten
INTO #t1
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Categories cat ON cat.CategoryID = p.CategoryID
WHERE e.LastName = 'Fuller' AND cat.CategoryName = 'Seafood'

SELECT SUM(Lieferkosten) as LieferkostenGesamt FROM #t1
	3076,65
```
9.
„Zensiere“ alle Telefonnummern der Kunden (Phone): Es sollen immer nur noch die letzten 4 Ziffern/Symbole angezeigt werden. Alles davor soll mit einem X pro Symbol ersetzt werden.
Beispiel: Phone „08677 9889 0“; danach „XXXXXXXX89 0“
```
SELECT STUFF(Phone, 1, LEN(Phone) - 4, REPLICATE('X', LEN(Phone) - 4)) FROM Customers
```
10.
Hatten wir Bestellungen, bei denen wir zu spät geliefert haben (Unterschied zwischen RequiredDate und ShippedDate)? Wenn ja, wieviele Tage waren wir zu spät bei jeder dieser Bestellungen?
```
SELECT OrderID,
DATEDIFF(DD, ISNULL(ShippedDate, GETDATE()), RequiredDate) as LieferverzögerungInTagen,
RequiredDate, ShippedDate
FROM Orders	
WHERE DATEDIFF(DD, ISNULL(ShippedDate, GETDATE()), RequiredDate) < 0
ORDER BY LieferverzögerungInTagen
```
11.
Erstelle eine Procedure, der man als Parameter eine OrderID übergeben kann.
Bei Ausführung soll der Rechnungsbetrag dieser Order ausgegeben werden (Quantity * UnitPrice + Freight).
```
CREATE PROCEDURE sp_RechnungsSumme @OrderID int
AS
SELECT 
o.OrderID, SUM(Quantity * UnitPrice) + Freight as RechnungsSumme
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE o.OrderID = @OrderID
GROUP BY o.OrderID, Freight

EXEC sp_RechnungsSumme 10250
```
