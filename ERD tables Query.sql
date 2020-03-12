-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/s4tqmy
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


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

