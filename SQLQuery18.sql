SELECT ProductID, ProductName, CompanyName AS Supplier
FROM Products JOIN Suppliers
	ON Products.SupplierID = Suppliers.SupplierID
ORDER BY ProductID ASC;