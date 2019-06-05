SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE OrderDate >= (YEAR((SELECT MAX(OrderDate) FROM Orders)-1))
GROUP BY ShipCountry
ORDER BY AverageFreight DESC;
