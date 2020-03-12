DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--Create tables
CREATE TABLE Departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (dept_no)
);

CREATE TABLE Dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE Dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INTEGER NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE Employees (
    emp_no INTEGER NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (emp_no)
);

CREATE TABLE Salaries (
    emp_no INTEGER NOT NULL,
    Salary INTEGER NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE Titles (
    emp_no INTEGER NOT NULL,
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--2. List employees who were hired in 1986.
SELECT e.last_name, e.first_name, e.hire_date from employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT d.dept_name, e.last_name, e.first_name, de.emp_no
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no;

--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name FROM employees
WHERE first_name ILIKE 'Hercules' AND last_name ILIKE 'B%';

--6.List all employees in the Sales department, including their: employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE d.dept_name ILIKE 'Sales';

--7.List all employees in the Sales and Development departments, including their: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE d.dept_name ILIKE 'Sales' OR d.dept_name ILIKE 'Development';

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT  last_name, count(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;