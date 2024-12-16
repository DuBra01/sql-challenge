CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(50),
    birth_date DATE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    sex CHAR(1),
    hire_date DATE
);

CREATE TABLE titles (
    title_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(200)
);

CREATE TABLE departments (
    dept_no VARCHAR(50) PRIMARY KEY,
    dept_name VARCHAR(200)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(50),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(50),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

ALTER TABLE dept_manager DISABLE TRIGGER ALL;
ALTER TABLE dept_emp DISABLE TRIGGER ALL;
ALTER TABLE salaries DISABLE TRIGGER ALL;

ALTER TABLE dept_manager ENABLE TRIGGER ALL;
ALTER TABLE dept_emp ENABLE TRIGGER ALL;
ALTER TABLE salaries ENABLE TRIGGER ALL;
