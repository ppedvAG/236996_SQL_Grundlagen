/*
	Datentypen in SQL: 3 großen Gruppen

	Charakter/String Datentypen:
	char(10) = Hallo --> "Hallo     " => 10 Byte Speicherplatz => 1 Character = 1 Byte
	nchar() = 1 Charakter = 16 Bit => 2 Byte

	varchar(10) = Hallo --> "Hallo" => 5 Byte Speicherplatz => 1 Character = 1 Byte
	nvarchar() = 1 Charakter = 16 Bit => 2 Byte

	text --> VARCHAR(MAX) = bis zu 2GB groß
	varchar(8000) maximum
	nvarchar(4000)


	Numerischen:
	tinyint = 8 Bit = bis 255
	smallint = 16 Bit = 32k
	int = 32 Bit = 2,14 Mrd
	bigint = 64 Bit ...

	bit = 1 oder 0

	decimal(x,y) = x Ziffern sind gesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern sind es insgesamt, davon sind 2 Nachkommastellen
	float
	money


	Datum/Zeit:
	time = 00h 00m 00s
	date = YYYY/MM/DD
	datetime = date + time bis in MS (Millisekunden) YYYY/MM/DD 00h:00m:00s.000ms
	datetime2 = bis in Nanosekunden Bereich
	smalldatetime = präzise bis Sekunden bereich => YYYY/MM/DD 00h:00m:00s


	Andere:
	XML 
	JSON
	geometry
	geography
*/

