SELECT DISTINCT
	OrderDetails.OrderID,
	OrderDetails.ProductID,
	OrderDetails.UnitPrice,
	OrderDetails.Quantity,
	OrderDetails.Discount
FROM OrderDetails
JOIN (
	SELECT OrderID
	FROM OrderDetails
	WHERE Quantity >= 60
	GROUP BY 
		OrderID, 
		Quantity
	HAVING COUNT(*) > 1
) PotentialProblemOrders
ON PotentialProblemOrders.OrderID = OrderDetails.OrderID
ORDER BY OrderID, ProductID;