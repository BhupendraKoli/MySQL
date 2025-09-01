-- Sub Queries
/*
subqueries:
   A subquery (or inner query) is a SQL query nested inside another query (outer query). 
   The subquery executes first, and its result is used by the outer query.

Types of Subqueries
Subqueries can be categorized based on their functionality:
 Single-row Subquery : Returns a single value (one row, one column). 
 Multiple-row Subquery : Returns multiple values (multiple rows, one column). 
 Multiple-column Subquery : Returns multiple columns (multiple rows, multiple columns). 
 Correlated Subquery : Uses columns from the outer query and executes once per row in the outer query. 
 Nested Subquery : A subquery inside another subquery. 
 Scalar Subquery : Returns a single value, often used in SELECT. 
*/
use joint;
--  Creating the departments Table

CREATE TABLE dep (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

--  Creating the employees Table

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES dep(department_id)
);

-- Inserting Data into departments

INSERT INTO dep VALUES (1, 'HR'),(2, 'Finance'),(3, 'IT'),(4, 'Sales');

-- Inserting Data into employees

INSERT INTO employees VALUES (101, 'Alice', 60000, 1),(102, 'Bob', 75000, 2),(103, 'Charlie', 90000, 3),(104, 'David', 50000, 1),
(105, 'Eve', 80000, 2),(106, 'Frank', 95000, 3),(107, 'Grace', 70000, 4);

select * from employees;
select * from dep;

-- single row subqurery
-- highest salary 
select emp_name,salary from employees
where salary=(select max(salary) from employees);

-- second highest salaried emp 
SELECT MAX(salary) AS SecondHighestSalary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

SELECT emp_name,(salary) AS SecondHighestSalary
FROM employees
WHERE salary = (SELECT (salary) FROM employees order by salary desc limit 1 offset 1);


-- Multi row 
-- find the emp who have same salary as someone in finace department 

select emp_name,salary from employees
where salary in (select salary from employees where department_id=2);

-- Exits , Any , All
select emp_name from employees
where Exists (select * from dep where employees.department_id=department_id);


-- ANY and ALL are used to compare a value to a set of values returned by a subquery.
select emp_name,salary from employees
where salary > Any (select salary from employees where department_id=1);
select emp_name,salary from employees where salary > 60000 or salary > 50000;

select emp_name,salary from employees
where salary > all (select salary from employees where department_id=1);
select emp_name,salary from employees where salary > 60000 and salary > 50000;

-- Multi column Subquery 
select emp_name,salary from employees
where (department_id,salary)=
(select department_id,salary from employees where emp_name='Alice');

-- correlated SubQueris
-- inner query depands on outer query 
-- find emp whose salary is grtaer than the avg salalry of their deprtment 
select * from employees e1 where salary >
(select avg(salary )from employees e2 where e1.department_id=e2.department_id);

 






