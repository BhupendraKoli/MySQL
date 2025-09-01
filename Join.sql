/*
Joins:
A JOIN clause is used to combine rows from two or more tables, 
based on a related column between them.
Types:
1- Inner Join
2- Left Join
3- Right Join
4- Full Join
5- Natural Join
6- Cross Join
7- Equi and Non-Equi Join
*/

create database joint;
use joint;
create table  trainers (id int primary key auto_increment, name text,batch_id int ,salary float);

create table  student (s_id int primary key auto_increment, name text,batch_id int ,city varchar(100));

insert into trainers(name,batch_id,salary)
             values('Bill',1,45000),
             ('jeff',2,50000),
             ('gary',3,75500),
             ('adam',4,50400);

insert into student(name,batch_id,city)
             values('Ram',1,'pune'),
             ('koli',2,'jalgoan'),
             ('rahul',3,'nagpur'),
             ('jay',5,'pune');
             
-- inner join 
-- print only the comman data of the both table              
select * from  trainers inner join student
on trainers.batch_id = student.batch_id;            


select student.name as Student ,trainers.name as Trainers from  trainers inner join student
on trainers.batch_id = student.batch_id;   

-- left join
-- print the all data of the left side table 
-- position is matters in left join
select * from  trainers left join student
on trainers.batch_id = student.batch_id;   

select * from  student left join trainers
on trainers.batch_id = student.batch_id;   


-- right join
-- print the all  right side data  
select * from  student right join trainers
on trainers.batch_id = student.batch_id;   

select * from  trainers right join student
on trainers.batch_id = student.batch_id;  

-- full outer join 
(select * from  student right join trainers
on trainers.batch_id = student.batch_id )
union
(select * from  student left join trainers
on trainers.batch_id = student.batch_id);

select * from trainers union select * from student ;


-- self join 
alter table trainers add column team_leader int;
update  trainers set team_leader=1 where id>1; 
 select * from trainers;
 
select t1.name as Trainers , t2.name as Leaders 
from trainers as t1 left join trainers as t2
on t1.team_leader=t2.id;

-- natural join 
/* Same as inner join but automatically joins the table
 with table who have 1 comon column */
select * from trainers natural join student ; 

-- Natural Join
/* Same as inner join but automatically joins the table with table who have 1 col */
create table trn1(id int primary key, t_name text);
create table stdnt1(id int primary key, s_name text);

insert into trn1(id, t_name) 
                values (1, 'A'), (2, 'B'), 
                (3, 'C'), (4, 'D');
insert into stdnt1(id, s_name) 
                values (1, 'S'), (2, 'T'), 
                (3, 'U'), (5, 'V');
select * from trn1 natural join stdnt1;

-- Cross Join
/* It creates cartesian product of no of rows of two or more tables */
create table prod(
    id int primary key auto_increment,
    p_name text
);

create table colors(
    id int primary key auto_increment,
    c_name text
);

insert into prod(p_name) values ("Jeans"), ("Shirt"), ("T-Shirt");
insert into colors(c_name) values ("Red"), ("Green"), ("Blue");

select prod.p_name as Products, colors.c_name as Colors
from colors cross join prod;

-- Equi Join:
/*
An Equi Join is a type of SQL join that uses the equality (=) operator 
to match records from two or more tables based on a common column. 
It returns only those records where the values in the specified columns are equal.
*/
-- Non-Equi Join:
/*
A Non-Equi Join is a type of SQL join that does not use the equality (=) 
operator in the join condition. Instead, 
it uses operators like <, >, <=, >=, !=, or BETWEEN to match records between tables.
*/
use joint;
create table product (product_id int primary key,product_name text,price float );
insert into product (product_id,product_name,price)
values(1,'laptop',50000),(2,'Tablets',30000),(3,'Phone',20000),(4,'Smartwatch',10000);

create table discount(dic_id int primary key ,min_price float, max_price float,dic_prc int);

insert into discount (dic_id  ,min_price , max_price ,dic_prc)
values (1,0,15000,5),(2,15001,30000,10),(3,30001,50000,15);

select * from product;
select * from discount;

-- non equi join 
select product.product_name,price,discount.dic_prc
from product join discount
on product.price>discount.min_price and product.price<discount.max_price;



