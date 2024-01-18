/*

-- Temporäre Tabellen / Temp Tables / #Tables

	- mit SELECT INTO #TempTable werden Ergebnisse in eine Temp Table geschrieben
	- existiert nur innerhalb der Session (Skriptfenster)
	- mit einem # = "lokal"
	- mit zwei ## = "global"
	- werden in SystemDB tempdb angelegt

*/

SELECT CompanyName, SUM(SummeBestPosi) AS Umsatz
INTO #TempTable
FROM vRechnungsDaten
WHERE Country = 'Germany'
GROUP BY CompanyName

SELECT SUM(Umsatz) FROM #TempTable

DROP TABLE #TempTable

-- globale Temp Table:
SELECT CompanyName, SUM(SummeBestPosi) AS Umsatz
INTO ##TempTable
FROM vRechnungsDaten
WHERE Country = 'Germany'
GROUP BY CompanyName