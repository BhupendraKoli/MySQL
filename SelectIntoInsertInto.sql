-- Select into ,insert into 
-- select into is used to copy data from one table into another 

use joint ;
select * from employees;

-- 1 copy of the table 
create table old_emp as select * from employees ;
select * from old_emp;

-- 2 copy of a table selected data 
create table old_emp1 as select emp_name,salary from employees where emp_id<103  ;

select * from old_emp1;

-- 3 copy of a table schema
create table old_emp2 as select * from employees where 1=0;
select * from old_emp2;

show tables;

-- geeting the content into one table to another 
insert into old_emp (emp_id,emp_name,salary)
select emp_id,emp_name,salary from employees;

select * from old_emp;
