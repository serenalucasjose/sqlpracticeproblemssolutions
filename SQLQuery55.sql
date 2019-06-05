;WITH Orders_CTE AS (
SELECT
	ShipCountry,
	CustomerID,
	OrderID,
	CONVERT(varchar, OrderDate, 23) AS OrderDate,
	ROW_NUMBER() OVER(PARTITION BY ShipCountry ORDER BY OrderDate, OrderID ASC) AS RowNumberPerCountry
FROM Orders)
SELECT 
	ShipCountry,
	CustomerID,
	OrderID,
	OrderDate
FROM Orders_CTE
WHERE RowNumberPerCountry = 1;

