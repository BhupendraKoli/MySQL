create database sigma;
show databases;
# drop database sigma ;
use sigma ;

create table students (id int primary key auto_increment
,name text,mobile bigint,address varchar(2000) ,
 birthdate date);

select * from students;
desc students ;
use sigma;
create table trainers (id int primary key auto_increment,name text ,
mobile bigint , salary int ,address varchar(2000) , subject varchar(100), 
city varchar(100) ,qulifichtion varchar (200));


select * from trainers;
desc trainers;
show tables;
create table tra (id int primary key auto_increment
,name text,mobile bigint,address varchar(2000) ,
 birthdate date);
 show tables;
 
 create table sales (id int primary key auto_increment
,name text,address varchar(2000) ,
 email text ,target int );
 show tables;

create table manager  (id int primary key auto_increment
,name text,role text ,address varchar(2000) 
 ); 
select * from manager; 
 
 show databases;
 


