--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
s.emp_no = e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM TO_DATE(hire_date, 'MM/DD/YYYY')) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
INNER JOIN departments as d ON
dm.dept_no = d.dept_no
INNER JOIN employees as e ON
e.emp_no = dm.emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as d ON
d.dept_no = de.dept_no


--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'


--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
)


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last Name" DESC
