
CREATE TABLE employees (
    emp_no int NOT NULL,
    birth_date date ,
    first_name varchar(20)  ,
    last_name varchar(20)  ,
    gender varchar(10)  ,
    hire_date date ,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE departments (
    dept_no varchar NOT NULL,
    dept_name varchar(20)  ,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE salaries (
    emp_no int  ,
    salary money   ,
    from_date date  ,
    to_date date,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_manager (
    dept_no varchar   ,
    emp_no int  ,
    from_date date  ,
    to_date date  ,
	PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE dept_emp (
    emp_no int   ,
	dept_no varchar  ,
    from_date date  ,
    to_date date ,
	PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE titles (
    emp_no int NOT NULL,
    title varchar  ,
    from_date date   ,
    to_date date ,  
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM salaries ;

SELECT * FROM titles;

SELECT * FROM dept_manager;

SELECT * FROM dept_emp ;

--DROP TABLE employees;

--DROP TABLE departments;

--DROP TABLE  salaries ;

--DROP TABLE titles;

--DROP TABLE  dept_manager;

--DROP TABLE  dept_emp ;

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");