-- einzeilliger Kommentar
/*
	Eröffnet Kommentarblock
	über mehrere Zeilen
*/

-- Datenbank ansprechen (per Dropdown Menü oben rechts)
USE Northwind

-- Datenbank loeschen
--DROP DATABASE Northwind

-- ALLE Spalten der Tabelle Customers
SELECT * FROM Customers

SELECT * FROM Orders

-- Einzelne Spalten namentlich aufrufen (trennen mit ",")
SELECT Country, City FROM Customers

-- SQL ist nicht case sensitive
sElEct cOuNtRy, cItY fRoM Customers

-- "Custom" Ausgabe in SQL
SELECT 100

-- Strings/Charakterdatentypen müssen in einzelnen Hochkommas geschrieben werden ''
SELECT 100, 5, 'Hallo'

SELECT Freight, Freight + 10 FROM Orders

-- Namen neu vergeben über ALIAS (as):
SELECT Freight, Freight + 10 AS LieferkostenPlus10 FROM Orders

SELECT * FROM Customers AS cus

/*
	Shortcut für Kommentieren [STRG + K] + [STRG + C]
	Auskommentieren:		  [STRG + K] + [STRG + U]
*/

/*
	1. Alle Spalten von der Tabelle "Shippers"

	2. Nur die Spalte "Description" von der Tabelle "Categories"

	3. Nur die Spalte "OrderDate" von der Tabelle "Orders"
*/

SELECT * FROM Shippers

SELECT Description FROM Categories

SELECT OrderDate FROM Orders

/*****************/

-- ORDER BY - Sortiert Ergebnismenge - steht syntaktisch immer am Ende der Abfrage

/*****************/

SELECT Country FROM Customers
ORDER BY Country DESC -- DESC = descending = absteigend

SELECT Country FROM Customers
ORDER BY Country

/*****************/

-- TOP X - werden nur die "obersten" X Zeilen ausgegeben

/*****************/

SELECT * FROM Customers

SELECT TOP 5 * FROM Customers

-- Die 20 Bestellungen mit den kleinsten Frachtkosten:
SELECT TOP 20 * FROM Orders
ORDER BY Freight

-- Die 20 Bestellungen mit den größten Frachtkosten:
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

-- SELECT BOT X gibt es nicht, wir drehen die Sortierung einfach mit ORDER BY um

SELECT * FROM Customers

SELECT TOP 20 PERCENT * FROM Customers

/*****************/

-- DISTINCT - "filtert" Duplikate Ergebniszeilen 

/*****************/

SELECT Country FROM Customers
SELECT * FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers


