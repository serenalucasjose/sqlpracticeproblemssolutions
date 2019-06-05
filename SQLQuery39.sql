WITH cteTable (OrderID, Quantity)
AS (
	SELECT 
		OrderID,
		Quantity
	FROM OrderDetails
	WHERE Quantity >= 60
	GROUP BY 
		OrderID,
		Quantity
	HAVING COUNT(*) > 1
)
SELECT 
	OrderID,
	ProductID,
	UnitPrice,
	Quantity,
	Discount
FROM OrderDetails
WHERE 
	OrderID IN (SELECT OrderID FROM cteTable)
ORDER BY
	OrderID,
	Quantity;