--	Practise the joinss
-- *** NO JOIN *** ----
USE SalesDB;

SELECT name FROM sys.tables;

SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Orders;

-- *** The inner join *** --- defualt sql join
-- Retrieve all customers with orders
SELECT 
	A.CustomerID,
	A.FirstName,
	A.LastName,
	A.Country,
	A.Score,
	B.ProductID,
	B.OrderID,
	B.OrderStatus,
	B.ShipAddress
FROM Sales.Customers AS A
INNER JOIN
	Sales.Orders AS B ON A.CustomerID = B.CustomerID;

-- *** Left join *** --- All data in left table and matching in the right
-- Retrieve all customers with their orders even those without orders
SELECT * FROM Sales.Customers AS L
LEFT JOIN
	Sales.Orders AS R ON L.CustomerID = R.CustomerID;

-- *** Right join *** --- Retrieve all orders without customers even orders without customers
SELECT *  FROM Sales.Customers AS L
RIGHT JOIN
	Sales.Orders AS R ON L.CustomerID = R.CustomerID;


-- *** The full join *** ---
SELECT * FROM Sales.Orders AS A
FULL JOIN 
	Sales.OrdersArchive AS B ON A.CustomerID = B.CustomerID;

-- Retrieve all employees who handled orders
SELECT 
	A.EmployeeID,
	A.FirstName,
	A.LastName,A.Gender,
	A.Salary,
	B.OrderDate,
	B.OrderStatus,
	B.ProductID,
	B.Quantity,
	B.Sales,
	C.CustomerID,
	C.FirstName,
	C.LastName,
	C.Score
FROM Sales.Employees AS A
INNER JOIN
	Sales.Orders AS B ON A.EmployeeID = B.SalesPersonID
INNER JOIN
	Sales.Customers AS C ON B.CustomerID = C.CustomerID;



-- *** THE ANTI JOINS *** --
-- The FULL JOIN
-- Find customers without orders and orders without orders
SELECT * FROM Sales.Customers AS A
FULL JOIN
	Sales.Orders AS B ON A.CustomerID = B.CustomerID
WHERE A.CustomerID IS NULL OR B.CustomerID IS NULL;

-- Retrieve all customers with no order
SELECT * FROM Sales. Customers AS A
LEFT JOIN
	Sales.Orders AS B ON A.CustomerID = B.CustomerID
WHERE B.CustomerID IS NULL;

-- Retrieve all orders without customers
SELECT * FROM Sales. Customers AS A
RIGHT JOIN
	Sales.Orders AS B ON A.CustomerID = B.CustomerID
WHERE B.CustomerID IS NULL;


-- USE MY DB
SELECT name FROM sys.databases;
USE MyDatabase;

--- The left join, and anti join
SELECT name FROM sys.tables;

SELECT * FROM customers;
SELECT * FROM orders;

-- The left join
SELECT * FROM customers AS A
INNER JOIN 
	orders AS B ON A.id = B.customer_id;

SELECT * FROM customers AS A
FULL JOIN
	orders AS B ON A.id = B.customer_id;

-- left joins
SELECT * FROM customers AS A
LEFT JOIN
	orders AS B ON A.id = B.customer_id;

-- right join
SELECT * FROM customers AS A
RIGHT JOIN
	orders AS B ON A.id = B.customer_id;

-- The anti join
-- Full anti join
-- Retrieve all customers with no orders and orders without customers
SELECT * FROM customers AS A
FULL JOIN
	orders AS B ON A.id = B.customer_id
WHERE A.id IS NULL OR B.customer_id IS NULL;

-- Find all customers without orders
SELECT * FROM customers AS A
LEFT JOIN
	 orders AS B ON  A.id = B.customer_id
WHERE B.customer_id IS NULL;

-- Retrieve orders without customers
SELECT * FROM customers AS A
RIGHT JOIN
	orders AS B ON A.id = B.customer_id
WHERE A.id IS NULL;

-- The set operator 














SELECT * FROM Sales.Employees;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.Customers;
SELECT * FROM Sales.OrdersArchive;