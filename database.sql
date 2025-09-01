-- DDL
create database sigma;
show databases;
# drop database sigma ;
use sigma ;

create table students (id int primary key auto_increment
,name text,obile bigint,address varchar(2000) ,
 birthdate date);

select * from students;
desc students ;

 




