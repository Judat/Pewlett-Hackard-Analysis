# Pewlett-Hackard-Analysis

The Company is reaching an influx of retiring employees. We will be using the SQL and PGAdmin to find out the details about how many employees are retiring and what can be done to counter the problem.

## Overview of the Pewlett-Hackard-Analysis
We would be doing folloiwng task to do our analysis:

* Migrate tables in CSV into SQL tables using schema and promary keys & foreign keys
* Determine number of employees retiring per title
* Determine how can we counter the silver tsunami by finding mentors in each department

## Resources
Data Source: departents.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
Software: Postgresql , pgAdmin 4 

## Results: 
* Retirement Titles
A retirement_titles table is created to find the total retiring employees by title to find out the employees who are about to retire that i.e. employees who are born between January 1, 1952 and December 31, 1955
* Unique Titles
A unique_titles table is created to find the the unique employees with their most recent title as in the Retirement Titles table some employees have changed departments and thats why thier employee number is repeating. Unique Titles is basically a filtered data from previous table avoiding repetetions. 
* Retiring Titles
Retiring Titles is created to see how many titles will be retiring soon considering thw load on different departments. The attached pic is self explainatory:
![Retiring Titles](https://user-images.githubusercontent.com/93050682/147013836-9ed7ea5f-7b25-40a9-97a4-b5554af0d79f.PNG)

* Mentorship Eligibility
A very inmportant table which shows how many of retiring employees would be avaialble for mentoring the new staff. As we run the query and create a tabke , we realize that its not that much. It seems as if we only have less than 1600 employees eligible for mentorship program.


## Summary: 
* How many roles will need to be filled as the "silver tsunami" begins to make an impact?
We used few queries to check the folloiwng :
Total No. of Employees 300024
Total number of working employees = 2401424
Total Number of employees retiring as per DOB 90398
Total Number of employees retiring who are currently working 72458
![Current Workforce reteiring soon](https://user-images.githubusercontent.com/93050682/147014593-03e105c1-9ff3-43fb-8b39-c1d472c65d19.PNG)

*Total Number of Employees eligible for Mentorship 
1549
![Mentorship Eligible](https://user-images.githubusercontent.com/93050682/147014747-56ea8fba-3f49-4713-9d0f-02d9d389f7db.PNG)

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
