-- Uebungen

-- 1. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
--> Tabellen: Products - Categories  (17 rows)
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 2. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht 
-- mehr gefuehrt wird
-- (Discontinued = 1 in Products)
--> Orders - Order Details - Products  (228 rows)
SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE Discontinued = 1

-- 3. Alle ContactNames die als Title "Owner" haben (Tabelle Customers) (18 rows)
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Owner%'

-- 4. Alle Kunden aus Paris, Berlin, Madrid (Tabelle Customers) (6 rows)
SELECT * FROM Customers
WHERE City IN ('Paris', 'Berlin', 'Madrid')

-- 5. Alle Order Details die ProductID 43 bestellt haben (28 rows)
SELECT * FROM [Order Details]
WHERE ProductID = 43
