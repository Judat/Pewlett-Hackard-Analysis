-- CHALLENGE 1
-- Creating a Retirement Titles table using employess and titles tables
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT COUNT(emp_no) AS all_employees_retiring FROM retirement_titles;
-- 133776

-- Creating a UNIUE table to get the recent title of employees soon to retire
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r
ORDER BY r.emp_no, to_date DESC;

SELECT COUNT(emp_no) AS all_employees_retiring_filtered FROM unique_titles;
-- 90398 Total number of emplpyees retiring as per birth date

-- Creating table for employees by their most recent job title who are about to retire.

SELECT COUNT(u.emp_no), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.emp_no) DESC;
SELECT * FROM retiring_titles;

-- Creating a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE de.to_date = ('9999-01-01')
    AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
SELECT COUNT(emp_no) FROM mentorship_eligibility;
-- 1549 available for mentotrship

-- Additional queries for Summary
--Employees in retirement_titles still working at the company and about to retire 
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title,
r.to_date
INTO retiring_still_working
FROM retirement_titles as r
where r.to_date = '9999-01-01'
ORDER BY r.emp_no;

SELECT COUNT(emp_no) as active_employees FROM retiring_still_working;
-- 72458 Active Employees who are going to retire


-- Total No of employees in data base based on emp_no
SELECT COUNT(emp_no) total_employees FROM employees;
-- 300024

--Total employees still in work force. ( who have not left the company)
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.birth_date,
	e.first_name,
	e.last_name,
	e.gender,
	e.hire_date,
	d.to_date
INTO employees_currently_working
FROM employees AS e
INNER JOIN dept_emp AS d
ON (e.emp_no = d.emp_no)
WHERE to_date = '9999-01-01'
ORDER BY e.emp_no

SELECT COUNT(emp_no) AS Current_workforce FROM employees_currently_working;
-- total working force 240124