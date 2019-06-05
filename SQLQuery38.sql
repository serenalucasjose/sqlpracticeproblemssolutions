SELECT 
	OrderID,
	Quantity
FROM OrderDetails
WHERE 
	Quantity >= 60
GROUP BY 
	OrderID,
	Quantity
HAVING COUNT(OrderID) = 2
ORDER BY OrderID ASC;