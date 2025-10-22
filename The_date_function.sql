/*===========================================================
THE DATE FUNCTION
These are used to extract parts of the date,formate the dates
perform calculations on dates and do date validation
==============================================================*/
USE SalesDB;
--  Checkingthe dates in the Orders
SELECT 
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime
FROM Sales.Orders;

/*====================================================
EXTRACTING PART OF THE DATES
===================================================*/
-- Extract the date, month, and year from the date
SELECT
	OrderID,
	CreationTime,
	DAY(CreationTime) AS Day_dt,
	MONTH(CreationTime) AS Month_dt,
	YEAR(CreationTime) AS Year_dt
FROM Sales.Orders;

-- DATEPART()
-- This helps to extract more information like the week number, quarter from the date
------ ***Example***
-- Extract the year from the date using the DATEPART()
SELECT 
	OrderID,
	CreationTime,
	DATEPART(Year, CreationTime) AS year_dp
FROM Sales.Orders;

-- Extracting the the month from the date using the DATEPART()
SELECT
	OrderID,
	CreationTime,
	DATEPART(MONTH, CreationTime) AS month_dp
FROM Sales.Orders;

--- Extracting the day from the date using the DATEPART()
SELECT
	OrderID,
	CreationTime,
	DATEPART(DAY,CreationTime) AS Day_dp
FROM Sales.Orders;

-- Extracting the day, year and month using the DATEPART()
SELECT
	OrderID,
	CreationTime,
	DATEPART(DAY, CreationTime) AS day_dp,
	DATEPART(MONTH,CreationTime) AS month_dp,
	DATEPART(YEAR,CreationTime) AS year_dp
FROM Sales.Orders;

-- Extracting the week number and the quarter from the date
SELECT
	OrderID,
	CreationTime,
	DATEPART(WEEK, CreationTime) AS week_number,
	DATEPART(QUARTER, CreationTime) AS quarter_dp
FROM Sales.Orders;

-- THE DATENAME()
-- Used to extract the name of the month and the day of the week
-- *** Example ***
SELECT 
	OrderID,
	CreationTime,
	DAY(CreationTime) AS day_no,
	MONTH(CreationTime) AS week_no,
	YEAR(CreationTime) AS year,
	DATENAME(Month, CreationTime) AS Month_name,
	DATENAME(WEEKDAY, CreationTime) AS week_name
FROM Sales.Orders;

-- THE DATETRUNC
-- Resets some parts of the day to either zeroes or to 1
-- *** Example ***
SELECT 
	OrderID,
	CreationTime,
-- Extract date from the minute
	DATETRUNC(MINUTE, CreationTime) AS min_trunc,
-- Here we start from the hour
	DATETRUNC(HOUR, CreationTime) AS hour_trunc,
-- Starting from the day
	DATETRUNC(DAY, CreationTime) As Day_trunc,
-- Starting from the month
	DATETRUNC(MONTH, CreationTime) AS month_trunc,
-- Wen we only need the year
	DATETRUNC(YEAR, CreationTime) AS year_trunc
FROM Sales.Orders;

-- The datetrunc()  functions helps us in grouping and aggregating data using the month or year
-- *** Example ***
--	QTN
-- Count the number of orders based on the creation time
SELECT
	CreationTime,
	COUNT(*) AS order_number
FROM Sales.Orders
GROUP BY CreationTime;

-- Grouping at the month level
-- Find the number of orders made in every month
SELECT 
	DATETRUNC(MONTH, CreationTime) AS CreationTime,
	COUNT(*) AS order_count
FROM Sales.Orders
GROUP BY DATETRUNC(MONTH, CreationTime);

-- Lets show the month name
SELECT 
	DATENAME(MONTH, CreationTime) AS Month_name,
	COUNT(*) AS order_count
FROM Sales.Orders
GROUP BY DATENAME(MONTH, CreationTime);

-- How many orders were made per year
SELECT
	DATETRUNC(YEAR, CreationTime),
	COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(YEAR, CreationTime);

-- EOMONTH()
-- This returns the last day in the month
--Syntax
SELECT
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) AS lastmonthday
FROM Sales.Orders;

-- To get the start day in the month we use the DATETRUNC
SELECT
	OrderID,
	CreationTime,
	DATETRUNC(MONTH, CreationTime) As startofmonth
FROM Sales.Orders;

-- Changing the datatype of the output column
SELECT
	OrderID,
	CreationTime,
	DATETRUNC(MONTH, CreationTime) As startofmonth,
	CAST(DATETRUNC(MONTH, CreationTime) AS DATE) As startofmonth
FROM Sales.Orders;

-- **** QUESTIONS ***
-- Grouping and aggregating data
--  How many orders were placed each year
SELECT
	DATETRUNC(YEAR, CreationTime),
	COUNT(*) AS order_count
FROM Sales.Orders
GROUP BY DATETRUNC(YEAR, CreationTime);

-- How many orders were placed each month
SELECT
	DATETRUNC(MONTH, CreationTime) AS order_date,
	COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY DATETRUNC(MONTH, CreationTime);

-- Retutning with the name of the month
SELECT
	DATENAME(MONTH, CreationTime) AS Order_month,
	COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY DATENAME(MONTH, CreationTime);

-- Direct using month
SELECT
	MONTH(CreationTime) AS Order_month,
	COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY MONTH(CreationTime);

-- ****** PART EXTRACTION USE CASE ***********
-- Used to filter data
SELECT 
	*
FROM Sales.Orders
WHERE MONTH(CreationTime) = 2;

SELECT 
	*
FROM Sales.Orders
WHERE DATENAME(MONTH, CreationTime) = 'February';

-- Find the orders made on friday
SELECT 
	*
FROM Sales.Orders
WHERE DATENAME(WEEKDAY, CreationTime) = 'Friday';

-- Find orders made on monday
SELECT 
	*
FROM Sales.Orders
WHERE DATENAME(WEEKDAY, CreationTime) = 'Monday';

-- Find the orders made in the first quarter
SELECT 
	*
FROM Sales.Orders
WHERE DATEPART(QUARTER, CreationTime) = 1;

-- Find the orders made in quarter two
SELECT 
	*
FROM Sales.Orders
WHERE DATEPART(QUARTER, CreationTime) = 2;