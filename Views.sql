-- Views 
/*
In sql a view is a virtule table based on the result set
of an sql statment 

A view containts rows and column just like a real table 
The fields in a view are fields from one or more real 
tables in the databases 

You can add sql statements and function to view and present 
if the data were coming from one single table 

*/
-- 1 simple view
use joint;
create view employees_view as select * from employees;
select * from employees_view;

update employees set emp_name='Koli' where emp_id=101;


-- 2 complex view 
-- Based on mlutiple tables or includes aggregates function 
-- (JOIN, GROUP BY ,HAVING)
-- NOT updateable

-- 3 Materialized View
-- Stores the actual data, unlike regular views.
-- Improves performance for complex queries.
-- Needs to be refreshed manually or automatically.
-- Not possible in mysql mostly found in postgresql ,oracle, SQL Server.





