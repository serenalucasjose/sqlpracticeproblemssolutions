;WITH 
Customers_CTA AS (SELECT DISTINCT Country AS CustomersCountry FROM Customers),
Suppliers_CTA AS (SELECT DISTINCT Country AS SuppliersCountry FROM Suppliers)
SELECT * FROM Customers_CTA
FULL OUTER JOIN Suppliers_CTA
	ON Customers_CTA.CustomersCountry = Suppliers_CTA.SuppliersCountry;