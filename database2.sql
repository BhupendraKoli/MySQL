-- DML
use sigma ;
select * from students ;
insert into students (name ,obile,address,birthdate)
values('tom',4561237890,'Raver rasalpur','16/11/004');
select * from students ;
insert into students (name ,obile,address,birthdate)
values('KOli',5561237890,'Raver' ,'16/11/004'),
('Ram',4562012022,'Jalgoan','16/11/004'),
('Nikhil',8754857586,'amlener ','16/11/004');
select * from students;

update students set name='Bhupendra',obile=8767748382 where id=8;
select * from students;
delete from students where id =1;
select * from students;

-- trunvate vs drop vs delete 
