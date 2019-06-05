SELECT OrderID, CustomerID, OrderDate, ShipCountry
FROM Orders
WHERE ShipCountry IN('Brazil','Mexico','Argentina','Venezuela');