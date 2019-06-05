SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE YEAR(OrderDate) = '2015'
GROUP BY ShipCountry
ORDER BY AverageFreight DESC;