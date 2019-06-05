SELECT TOP 1 OrderDate AS FirstOrder
FROM Orders
ORDER BY OrderDate ASC;

SELECT MIN(OrderDate) AS FirstOrder
FROM Orders;