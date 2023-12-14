  --cool um komplexe Statements in einzelne nachvolluiehbarere Schritte umzubrechen
  --
 -- temp. Tabellen existieren nicht auf Dauer
 -- temporäre Tabellen  gibt es in #-Form und ## Form
 
 -- #t- lokale temp Tabelle existiert nur  in der Session, in der sie erstellt wurde
 --ist die Session weg ist #t auch weg oder man löscht mit drop table #t

 --##t globale temp Tabelle existiert auch in anderen Session
 ---existieren bis zur Löschung oder Verbindung des Ersteller gestrennt wird
 --allerdings werden keine laufenden Statements unterbrochen


 select *  into #t from customers
  select *  into ##t from customers

 select * from #t
