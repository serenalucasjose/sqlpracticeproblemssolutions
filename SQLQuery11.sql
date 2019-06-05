SELECT FirstName, LastName, Title, CONVERT(varchar, BirthDate, 23)
FROM Employees
ORDER BY BirthDate ASC;
