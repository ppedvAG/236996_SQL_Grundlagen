/***************************/

-- UNION(ALL) - verbindet Abfrageergebnise "vertikal" in einer Tabelle

/***************************/

SELECT 100,5
UNION
SELECT 500,10

-- WICHTIG!: Spaltenanzahl muss identisch sein:
SELECT 100
UNION
SELECT 500, 10

-- UNION hat "eingebautes" DISTINCT:
SELECT 100
UNION
SELECT 100

-- ohne Distinct mit Union all:
SELECT 100
UNION ALL
SELECT 100

-- ORDER BY immer am Ende der letzten UNION Abfrage
SELECT 50 AS Test
UNION
SELECT 100
UNION 
SELECT 70
ORDER BY 1 DESC

/*****************/

-- INTERSECT/EXCEPT - vergleicht Abfrageergebnisse von mehr als einer Abfrage

/*****************/

-- INTERSECT = Schnittmenge zweier Abfragen (gleiche Datensätze)
SELECT * FROM Customers --> 91 Rows
INTERSECT -- Ich hole mir die übereinstimmungen beider Abfragen raus und gebe die zurueck
SELECT * FROM Customers -- > 11 Rows
WHERE Country = 'Germany'

-- EXCEPT = "Zeige mir alle Datensätze aus Abfrage 1, die NICHT ebenfalls in Abfrage 2 auftauchen"
SELECT * FROM Customers
EXCEPT
SELECT * FROM Customers
WHERE Country = 'Germany'