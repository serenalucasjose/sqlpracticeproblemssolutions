SELECT OrderID, CONVERT(varchar, OrderDate, 23) as Date, CompanyName
FROM Orders
JOIN Shippers
	ON ShipVia = ShipperID
WHERE OrderID < 10300
ORDER BY OrderID ASC;
