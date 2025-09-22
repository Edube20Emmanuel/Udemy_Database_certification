USE MyDatabase;

-- The select clause is used to ask a question to the database, meaning to tell the database to give us data.
-- The from clause is used to tell the database from which table are we getting the data from
-- Retrieve all the customers in the data
SELECT *
FROM customers;

-- Retrieve All order Data
SELECT *
FROM orders;

-- Retrieve each customers name, country and score
SELECT first_name, country, score
FROM customers;

-- The where clause is used to filter data from the table based on a given condition
-- Those that don't meet the condition are removed from the table
-- Retrieve customers with a score not equal to 0
SELECT *
FROM customers
WHERE score != 0;

-- Retrieve customers from Germany
SELECT *
FROM customers
WHERE  country = 'Germany';

/* Retrieve all customers and 
sort the results by the highest score firs. */

SELECT * 
FROM customers
ORDER BY score DESC;

-- Retrieve the results with the lowest score first

SELECT *
FROM customers
ORDER BY score ASC;

-- Sorting or ordering by multiple columns
SELECT *
FROM customers
ORDER BY country ASC, score DESC;

-- How to aggregate and group the data
SELECT country,
SUM(score) AS total_score
FROM customers GROUP BY country;