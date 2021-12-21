-- Creating a Retirement Titles table usiong employess and titles tables
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
WHERE (e.birth_date BETWEEN '1952-01-01' and '1955-12-31' )
ORDER BY e.emp_no;

-- Creating a UNIUE table to get the recent title of employees soon to retire
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, to_date = '9999-01-01';

-- Creating table for employees by their most recent job title who are about to retire.
SELECT COUNT (ut.emp_no), ut.title
into retiring_titles
From unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

SELECT * FROM retiring_titles;