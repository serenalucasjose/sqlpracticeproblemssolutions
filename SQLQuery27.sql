SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE OrderDate BETWEEN '1/1/2015' AND '01/01/2016'
GROUP BY ShipCountry
ORDER BY AverageFreight DESC;
