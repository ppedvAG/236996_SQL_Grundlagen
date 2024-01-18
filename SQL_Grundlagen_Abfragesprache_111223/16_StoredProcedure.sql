/*

-- Stored Procedures / gespeicherte Prozeduren

*/

/*
	- Sind gespeicherte SQL Anweisungen (nicht nur Select, sondern auch alles andere)
	- Arbeiten mit Variablen
	- Praktisch zum modulasieren von Code
	- Proceduren verwenden Ihren QueryPlan jedes mal wieder 
*/

CREATE PROCEDURE spRechnungByOrderID @OrderID int
AS
SELECT * FROM Orders
WHERE OrderID = @OrderID

-- Prodecure ausführen
EXEC spRechnungByOrderID 10250

-- Procedure mit VARCHAR
CREATE PROCEDURE spNewCustomer
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(15), @City varchar(15)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)

EXEC spNewCustomer BLOBI, 'Blobi AG', Germany, Burghausen 

SELECT * FROM Customers WHERE CustomerID = 'EDEKA'

EXEC spNewCustomer @CustomerID = 'EDEKA', @Country = 'Germany',
@City = 'München', @CompanyName = 'Edeka GmbH'

-------------------------------------------
-- Default Wert bei Procedure:
CREATE PROCEDURE spKundenNachLandCity @Country VARCHAR(15) = 'Germany', @City VARCHAR(15) = 'Berlin'
AS
SELECT * FROM Customers WHERE Country = @Country AND City = @City

EXEC spKundenNachLandCity France, Paris

-- Variablen allgemein

DECLARE @OrderID int = 10250

SELECT * FROM Orders
WHERE OrderID = @OrderID

SET @OrderID = 10251

SELECT * FROM Orders
WHERE OrderID = @OrderID