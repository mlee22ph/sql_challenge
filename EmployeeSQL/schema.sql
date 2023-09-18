CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(20) NOT NULL
);

CREATE TABLE employees(
	emp_no VARCHAR(10) PRIMARY KEY,
	emp_title_id VARCHAR(20),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(20) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex CHAR NOT NULL,
	hire_date VARCHAR(20) NOT NULL
);

CREATE TABLE salaries(
	emp_no VARCHAR(10) PRIMARY KEY,
	salary INTEGER
);

CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(50)
);

CREATE TABLE dept_emp(
	emp_no VARCHAR(50),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(10),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no VARCHAR(50),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);


