-- having 
/*
The HAVING clause was added to SQL because 
the WHERE keyword cannot be used with 
aggregate functions.
*/

select nameee, count(salary) as 'salaries' from employees group by nameee having nameee ="raji";

select nameee, count(id)  from employees group by nameee having count(id)<3;

select * from employees having id>4;



