;WITH TotalOrders_CTE AS (
SELECT
	Orders.CustomerID,
	Customers.CompanyName,
	SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalOrderAmmount
FROM Customers
JOIN Orders
	ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails
	ON OrderDetails.OrderID = Orders.OrderID
WHERE YEAR(Orders.OrderDate) = 2016
GROUP BY 
	Orders.CustomerID,
	Customers.CompanyName
)
SELECT 
	TotalOrders_CTE.CustomerID,
	TotalOrders_CTE.CompanyName,
	TotalOrders_CTE.TotalOrderAmmount,
	CustomerGroupThresholds.CustomerGroupName
FROM TotalOrders_CTE
JOIN CustomerGroupThresholds
	ON TotalOrders_CTE.TotalOrderAmmount BETWEEN CustomerGroupThresholds.RangeBottom AND CustomerGroupThresholds.RangeTop
ORDER BY TotalOrders_CTE.CustomerID;