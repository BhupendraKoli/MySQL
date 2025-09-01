-- aggregate function 

-- count(), min(), max(), sum(), avg()

use codenera;
select * from employees;

alter table employees add column city varchar(200) default "pune";

update employees set city ="mumbai" where id = 2 or id =5;
update employees set city ="nagpur" where id>5;

select count(id) from employees;
select min(salary) from employees;
select max(salary) from employees;
select sum(salary) from employees;
select avg(salary) from employees;

-- alias 

select count(id) as total_rows from employees;

select min(salary) as min_salary from employees;

select max(salary) as max_salary from employees;

select sum(salary)as total_salary from employees;

select avg(salary) as avg_salary from employees;

-- or

select count(id) as 'total rows',
min(salary) as 'min salary',
max(salary) as 'max salary',
sum(salary)as 'total salary',
 avg(salary) as 'avg salary' from employees;













