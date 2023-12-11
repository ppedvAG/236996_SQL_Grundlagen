/****************/

-- WHERE - Filtert die Ergebnis nach einem oder mehreren Kriterien

/****************/

SELECT * FROM Customers
WHERE Country = 'Germany' -- Wichtig weil Country ein Charakterdatentyp ist, Werte in Hochkomma!

-- Mit = Operator nur EXAKTE Treffer
SELECT * FROM Customers
WHERE City = 'Paris'

-- WHERE Bedingungen funktionieren mit allen "boolschen" Vergleichsoperatoren
-- >, >=, <, <=, =, !=, <>
SELECT * FROM Orders
WHERE Freight > 100

SELECT * FROM Orders
WHERE Freight < 100

SELECT * FROM Customers
WHERE Country != 'Germany' -- "ungleich" Germany 

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Brazil'

SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

-- BETWEEN gibt eine Reichweite an, Grenzwerte mit inbegriffen
SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- kürzer:
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

-- IN Operator fasst mehrere OR Bedingungen zusammen
SELECT * FROM Customers
WHERE Country = 'France' OR Country = 'Brazil' OR Country = 'Austria' OR Country = 'Germany'

-- => kürzer
SELECT * FROM Customers
WHERE Country IN('France', 'Brazil', 'Austria', 'Germany')

-- Aufgaben:
-- 1. Alle Bestellungen (Orders) die nach Deutschland gingen (122 rows)
SELECT * FROM Orders
WHERE ShipCountry = 'Germany'

-- 2. Alle Kunden aus Deutschland oder Frankreich, die aus Berlin oder Paris sind (3 Rows)
SELECT * FROM Customers
WHERE (Country = 'Germany' OR Country = 'France') AND (City = 'Berlin' OR City = 'Paris')

-- beides Richtig!
SELECT * FROM Customers 
WHERE Country IN('Germany', 'France') AND City IN('Berlin', 'Paris')

-- 3. Alle Kunden die eine Fax Nummer hinterlegt haben (Customers) (69 Rows)
SELECT * FROM Customers
WHERE Fax IS NOT NULL

SELECT * FROM Customers
WHERE Fax != 'NULL'

-- 4. Alle Ansprechpartner (ContactNames) die im ContactTitle "Manager" haben (33 Rows)
-- Tabelle: Customers
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'