/*******************************/

-- CASE - unterscheiden wir definierte Fälle, die die Ausgabe abändern

/*******************************/

-- Wenn ein Fall gefunden wird, dann pasiert xyz, wenn nicht das ist das Ergebnis NULL
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock IN(17, 13) THEN 'Reicht nicht!'
	WHEN UnitsInStock >= 10 THEN 'Passt.'
END as Pruefung
FROM Products

-- Alternativ mit ELSE einen "Notausgang" definieren:
SELECT UnitsInStock,
CASE 
	WHEN UnitsInStock < 10 THEN 'Nachbestellen!'
	ELSE 'Fehler!'
END AS Pruefung
FROM Products

-- Funktioniert auch mit einem UPDATE:
--UPDATE Customers
--SET City =
--CASE 
--	WHEN UnitsInStock < 10 THEN 'Nachbestellen!'
--	ELSE 'Fehler!'
--END AS Pruefung

-- Auch im Group by
SELECT SUM(UnitsInStock),
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen!'
	WHEN UnitsInStock >= 10 THEN 'Passt.'
	ELSE 'Fehler!'
END AS Pruefung
FROM Products
GROUP BY
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen!'
	WHEN UnitsInStock >= 10 THEN 'Passt.'
	ELSE 'Fehler!'
END
