-- Determine Retirement Eligibility
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Create another query that will search for only 1952 birth dates.

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' and '1952-12-31';

-- Narrow the Search for Retirement Eligibility
--  Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Count the Queries -- using SELECT COUNT 
-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create New Tables -- USING SELECT INTO ( the new table will be insterted in the database)
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Export Data -- just like we imported table data 
