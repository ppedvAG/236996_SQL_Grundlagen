/*************************/

-- JOINS - "verbinden" Datensätze von Tabellen miteinander ins selbe Ergebnisfenster

/*************************/

SELECT * FROM Orders
SELECT * FROM Customers

-- JOIN Syntax

-- SELECT Spalten FROM TabelleA JOIN TabelleB ON TabelleA.Spalte = TabelleB.Spalte

SELECT * FROM Orders INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID


SELECT Orders.CustomerID, Customers.CustomerID FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Orders AS o JOIN Customers AS cus ON o.CustomerID = cus.CustomerID

-- Tabellen: Customers | Employees | Orders
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
WHERE Customers.Country = 'Germany'

-- Übungen:
-- 1. Alle Bestellungen (Orders) die der Mitarbeiter "King" (LastName in Employees)
-- bearbeitet hat
SELECT OrderID, LastName FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'King'

-- 2. Alle Bestellungen (Orders) aus Frankreich (Customers), deren Lieferkosten
-- (Freight) über 300 sind
SELECT * FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'France' AND Freight > 300

-- 3. Welche verschiedenen Produkte (ProductNames in Products) wurden in Austria
-- verkauft?
-- Tabellen: Customers --> Orders --> Order Details --> Products
SELECT DISTINCT ProductName FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Country = 'Austria'

/***************************/

-- LEFT/RIGHT Join = Zeigt Tabelle A und B vollständig an (inkl. Schnittmenge)

/***************************/
SELECT * FROM Customers
LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID

-- "Self Join" 
-- Wer reportet an wen? (Name Mitarbeiter & Name vom Vorgesetzten)
SELECT Mitarbeiter.EmployeeID, Mitarbeiter.LastName,
Vorgesetzte.EmployeeID, Vorgesetzte.LastName FROM Employees AS Mitarbeiter
LEFT JOIN Employees AS Vorgesetzte ON Mitarbeiter.EmployeeID = Vorgesetzte.ReportsTo

-- alte Schreibweise
SELECT * FROM Customers,Orders WHERE Customers.CustomerID = Orders.CustomerID


