/*

	-- CREATE / ALTER / DROP -- DDL (Data Definition Language)
	
*/

-- Immer wenn wir Datenbnakobjekte "bearbeiten" gelten diese Befehle:

CREATE TABLE PurchasingOrders 
(
	ID int identity(1, 1) PRIMARY KEY,
	OrderDate date NOT NULL,
	ProductID int NOT NULL
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrders und Products anlegen �ber ProductID:
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzuf�gen zu bestehenden Tabelle
ALTER TABLE PurchasingOrders
ADD NeueSpalte VARCHAR(50)

ALTER TABLE PurchasingOrders
ADD Quantity int

ALTER TABLE PurchasingOrders
ADD Vorname VARCHAR(10)

SELECT * FROM PurchasingOrders

-- Spalte aus bestehendem Table l�schen:
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

-- Tabelle l�schen
DROP TABLE PurchasingOrders

/*

-- INSERT - Hinzuf�gen von Datens�tzen in bestehenden Tabelle

*/

SELECT * FROM PurchasingOrders

-- Alle Spalten bef�llen
INSERT INTO PurchasingOrders
VALUES ('20240118', 5)

-- Explizit einzelne Spalten bef�llen:
INSERT INTO PurchasingOrders (OrderDate, ProductID)
VALUES ('20240118', 3)

-- Ergebnis einer Select-Abfrage in einer Tabelle:
INSERT INTO PurchasingOrders
SELECT GETDATE(), 3

INSERT INTO PurchasingOrders
SELECT (GETDATE()-1), 4

INSERT INTO PurchasingOrders
VALUES (GETDATE(), 2),
	   (GETDATE(), 1)

/*

-- DELETE - L�schen von Datens�tzen in einem bestehendem Tabelle:

*/

SELECT * FROM PurchasingOrders

-- Aufpassen! Ohne WHERE Filter werden alle Datens�tze gel�scht!
DELETE FROM PurchasingOrders
WHERE ID = 4

-- Prim�r-/Fremdschl�sselbeziehungen verhindern das l�schen von Datens�tzen
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

/*
	Msg 547, Level 16, State 0, Line 74
	Die DELETE-Anweisung steht in Konflikt mit der REFERENCE-Einschr�nkung 
	"FK_Orders_Customers". Der Konflikt trat in der Northwind-Datenbank, Tabelle 
	"dbo.Orders", column 'CustomerID' auf.
*/

/*

-- UPDATE - �ndern von Spaltenwerten in einem vorhandenen Datensatz

*/

SELECT * FROM PurchasingOrders

-- WHERE Bedingung nutzen!
UPDATE PurchasingOrders
SET OrderDate = '20231218', ProductID = 10
WHERE ID = 1

/*
-- Constraints in Tabellen
*/

SELECT * FROM PurchasingOrders

-- Wenn IDENTITY = FALSE
INSERT INTO PurchasingOrders (OrderDate, ProductID, Quantity)
VALUES (GETDATE(), 2, 40)

DELETE FROM PurchasingOrders
WHERE ID = 13

-- Quantity nur positive Werte akzeptieren soll!
ALTER TABLE PurchasingOrders
ADD CONSTRAINT CHK_Quantity CHECK (Quantity > 0)

-- Funktioniert auch mit VARCHAR
ALTER TABLE PurchasingOrders
ADD CONSTRAINT CHK_Vorname CHECK (Vorname != 'Scheisse')

INSERT INTO PurchasingOrders (OrderDate, ProductID, Quantity, Vorname)
VALUES (GETDATE(), 30, 110, 'Scheisse')



