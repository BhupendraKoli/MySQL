create database codenera;
use codenera;
create table student (student_id int primary key auto_increment
,name text,age int,department varchar(2000));

create table courses (course_id int primary key auto_increment,coures_name varchar (100)
,credites int );
show databases;

select * from student;
select * from courses;

insert into student (name,age,department)
values('Bhupendra',20,'DataScience'),('Rohini ',22,'dataAnlist'),
('Nikhil',20,'AI'),('Pretesh ','20','Data Science'),('Mansi',22,'DataScience');
select * from student;

insert into courses (coures_name,credites)
values('Data science',100),('DevOps',100),('AI',200),('WEbDevepment',100),('FullStactk',100);
select * from courses;

update student set department='DevOps' where student_id=3;
delete from student where student_id =1;
select * from student;

update courses set coures_name='DevOps' where course_id=1;
delete from courses where course_id =2;
select * from courses;