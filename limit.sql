-- limit 

use sigma;
select * from students limit 5;
select * from students limit 2;
select * from students limit 3;

use codenera;
select * from employees;

insert into employees (id,nameee,mobile)values
(3,"raji",567890),
(4,'arun', 9876543),
(5,'meena', 9123450),
(6,'kiran', 9988655),
(7,'divya', 9099090),
(8,'suresh', 9112341),
(9,'anitha', 9801234),
(10,'vijay', 9015678),
(11,'rekha', 9237890),
(12,'rahul', 9348901),
(13,'priya', 9789012);

-- add column salary into employees and insert some salaries and print the highest salaried employee

alter table employees add column salary float;
update employees set salary =250000 where id>5;
update employees set salary =670000 where id=5;
update employees set salary =210000 where id<5;

select * from employees;

select * from employees order by salary desc limit 1;

-- offset
-- second highest salary

select distinct salary,nameee from employees order by salary desc limit 1 offset 1 ;









