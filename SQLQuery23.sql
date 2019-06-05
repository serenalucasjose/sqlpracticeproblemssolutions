SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE (UnitsInStock + UnitsOnOrder) <= ReorderLevel
	  AND Discontinued = 0;