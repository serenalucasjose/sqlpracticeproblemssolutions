SELECT UnitPrice, Quantity, OrderID, ProductID, (UnitPrice * Quantity) AS TotalPrice
FROM OrderDetails;