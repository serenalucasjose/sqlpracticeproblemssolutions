SELECT  
	Orders.EmployeeID,
	Orders.OrderID,
	Orders.OrderDate
FROM Orders
WHERE Orders.OrderDate = EOMONTH(Orders.OrderDate)
ORDER BY Orders.EmployeeID, Orders.OrderID;
