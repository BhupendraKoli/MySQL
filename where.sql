-- where clause
-- use to filter the row on certain condition 

use codenera ;
select * from students;
select * from students where student_id=3;
select * from students where student_id=3 and name ='rohini';
select * from students where student_id=3 or name ='rohini';
select * from students where not student_id=3 ;


-- find all the student with ids between 3 to 6 using whare 

select * from students where student_id >= 3 and student_id <=6;

-- between and in 

SELECT * FROM students
WHERE student_id BETWEEN 3 AND 6;        # includes 3 and 6 both

select * from students where name in ("akansha");
select * from students where name in ("akansha","rohini");

select * from employees;

-- fetch the details of emp table with employees have salary greater than 50000

select name, salary from employees where salary >50000;

-- name of employees have age between 25-30

select name from employees where age between 25 and 30;









