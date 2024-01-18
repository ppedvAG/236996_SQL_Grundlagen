/*

	




*/

-- Constraint entfernen
ALTER TABLE Mitarbeiter
DROP CONSTRAINT CHK_Geschlecht

--	CREATE TABLE
--	Erstelle mir eine Tabelle "Mitarbeiter"
--	Spalten: MitarbeiterID, Vorname, Nachname
	--MitarbeiterID = INT, inkrementiert, PRIMARY KEY
	--Vorname & Nachname = varchar(50)


CREATE TABLE Mitarbeiter
(
	MitarbeiterID INT IDENTITY(1,1) PRIMARY KEY,
	Vorname VARCHAR(50),
	Nachname VARCHAR(50)
)

SELECT * FROM Mitarbeiter

--ALTER TABLE
--Danach eine Spalte hinzufügen (Gehalt) Datentyp: int
--(nur Männlich oder Weiblich) => CONSTRAINT

ALTER TABLE Mitarbeiter
ADD Gehalt INT

ALTER TABLE Mitarbeiter
ADD Geschlecht VARCHAR(1)

ALTER TABLE Mitarbeiter
ADD CONSTRAINT CHK_Geschlecht CHECK (Geschlecht = 'm' OR Geschlecht = 'w')

--INSERT INTO:
--4 Datensätze hinzufuegen (Mitarbeiter selber aussuchen)
INSERT INTO Mitarbeiter
VALUES ('Gerald', 'Reiß', 10000, 'm'),
	   ('Georg', 'Hagl', 10000, 'm'),
	   ('Maximilian', 'Obermayr', 10000, 'm'),
	   ('Monica', 'Nowak', 10000, 'w')

-- Geschlecht kommt nicht rein :(
INSERT INTO Mitarbeiter
VALUES ('Philipp', 'Libowicz', 10000, 'd')

--UPDATE:
--Danach bei jedem Mitarbeiter das Gehalt um 1000€ steigern

UPDATE Mitarbeiter
SET Gehalt += 1000

UPDATE Mitarbeiter
SET Gehalt = Gehalt + 1000

SELECT * FROM Mitarbeiter

/*

-- Tabellen: Customers - Orders - Order Details joined
	Customers Tabelle: CompanyName, ContactName, Country
	Orders Tabelle: OrderDate, RequiredDate, ShippedDate
	Order Details: Discount
	--> View speichert
*/

	--Order Details - Product Tabelle joined
	--> TempTable lokal
	--> TempTable global

	SELECT [Spalten] AS NeuerName
	INTO #TempTable -- => ##TempTable (global)
	FROM Products
	JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID



/*
	TempTable Aufgabe:
	Textaufgabe: Hat "Andrew Fuller" (Employee) schonmal Produkte der Kategorie
				 "Seafood" (Categories) verkauft?
	Wenn ja, wieviel Lieferkosten sind dabei insgesamt entstanden (SUM(Freight))?
	Tabellen: Employees, Orders, Order Details, Products, Categories
*/
SELECT LastName, CategoryName, Freight
INTO #TempTable
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Categories cat on cat.CategoryID = p.CategoryID
WHERE e.LastName = 'Fuller' AND cat.CategoryName = 'Seafood'

SELECT * FROM #TempTable

-- Temporäre Tabelle droppen
DROP TABLE #TempTable

SELECT SUM(Freight) as LieferkostenGesamt FROM #TempTable

-----------------------------------------------------------
-- Procedure erstellen, die einen bestimmten Kunden in der Customers Tabelle findet
CREATE PROCEDURE [ProcedureNamen] @Variable [datentyp]
AS
-- Ganz Normale Abfrage um einen bestimmten Kunden in der Cus Tabelle zu finden

-- Für die Schnellen...
/*
	Erstelle eine Prozedur, der man als Parameter eine OrderID übergeben kann.
	Bei der Ausführung soll der Rechnungsbetrag dieser Order asugegeben werden
	(Quantity * UnitPrice + Freight)
*/


-- Frage bezüglich: "Kann ich exec [prozedur benutzen] ohne alle variablen zu befüllen?"
CREATE PROCEDURE spNewCustomerTest2
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(15)
AS
SELECT * FROM Customers
WHERE CustomerID = @CustomerID OR CompanyName = @CompanyName OR Country = @Country

DROP PROCEDURE spNewCustomerTest2

EXEC spNewCustomerTest2 'ALFKI', '', ''



