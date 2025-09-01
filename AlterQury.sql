/*
The ALTER TABLE statement is used to add, delete,
or modify columns in an existing table.

The ALTER TABLE statement is also used to add and drop 
various constraints on an existing table.
*/


-- Add a cloumn
-- syntax 
   -- alter table table_name add column column_name datatype;
use codenera;
create table newtable (id int primary key auto_increment,name text);

alter table newtable add column city varchar(100); 

alter table student add column city text;

select * from student ;

drop table newtable;

  
   
-- add a multiple cloumns
alter table student add column state varchar(1000) default "Maharashtra" ,
 add address varchar(100) ;
 select * from student;


-- Rename A column 
alter table student rename column address to location ;
select * from student;

-- Change datatype of a cloumn 

alter table student modify column name varchar(200);
desc student ;

-- delete a column 
alter table student drop column location;
alter table student drop column city ,drop column state;
select * from student ;








