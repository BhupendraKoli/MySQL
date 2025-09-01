-- group by 

use codenera;

select * from employees;

select city, count(id) as 'employees' from employees group by city;