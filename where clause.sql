-- where clause
-- use to filter the row on certain condition 

use codenera ;
select * from student where student_id=3;
select * from student where student_id=3 and name ='Rohini';
select * from student where student_id=3 or name ='Rohini';
select * from student where not student_id=3 ;


-- find all the student with ids between 3 to 6 using whare 

select * from student where student_id >= 4 and student_id <=6;

-- between and in 
SELECT * FROM student
WHERE student_id BETWEEN 3 AND 6;

select * from student where name in  ("Nikhil");
