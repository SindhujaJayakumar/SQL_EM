
Link to Quickdatabasediagrams https://app.quickdatabasediagrams.com/#/d/0Mb0NQ

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp_no, last_name, first_name, gender 
FROM employees;

SELECT *
FROM salaries;
--join employees and salary tables
SELECT
    e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM
    employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no ;

--2. List employees who were hired in 1986.

SELECT *
FROM employees;


SELECT emp_no, last_name, first_name ,hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'


--3. List the manager of each department with the following information: 
--department number, department name,  >> departments
--the manager's employee number, last name, first name >> employees
--start and end employment dates >> dept_manager

SELECT * FROM departments;

SELECT * FROM employees;

SELECT * FROM dept_manager;
 
SELECT
   departments.dept_no,
   departments.dept_name,
   employees.emp_no,
   employees.last_name,
   employees.first_name,
   dept_manager.from_date,
   dept_manager.to_date

FROM departments 
INNER JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;



--4. List the department of each employee with the following information: 
--employee number, last name, first name  >> employees
--department name >> dept_emp

SELECT * FROM employees;

SELECT * FROM dept_emp;

SELECT * FROM departments;


SELECT
   employees.emp_no,
   employees.last_name,
   employees.first_name,
   departments.dept_name

FROM employees 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;


--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees 
WHERE first_name = 'Hercules'  AND last_name LIKE 'B%'

--6. List all employees in the Sales department, 
--including their employee number, last name, first name  >> employees
--department name >> departments
-- dept_emp

SELECT * FROM employees;

SELECT * FROM dept_emp;

SELECT
   employees.emp_no,
   employees.last_name,
   employees.first_name,
   departments.dept_name

FROM employees 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7. List all employees in the 
-- Sales and Development departments  >> departments (d005 & d007)
-- including their employee number, last name, first name >>  employees
-- department name >> 

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT
   employees.emp_no,
   employees.last_name,
   employees.first_name,
   departments.dept_name

FROM employees 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) as Clast 
FROM employees
GROUP BY last_name
ORDER BY Clast DESC
