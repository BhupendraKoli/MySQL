-- Functions


/*
A function in SQL is a user-defined object that returns a 
single value based on input parameters. 
It is used for calculations, transformations, and aggregations. 
Functions are commonly used in SELECT statements.
*/

/*
Deterministic	   : Returns the same output for the same input every time.
Non-Deterministic  : May return different results even for the same input.
*/

select square(7) as squre;
DELIMITER //

CREATE FUNCTION numbers(n INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(20);
    
    IF n > 0 THEN
        SET result = 'Positive';
    ELSEIF n = 0 THEN
        SET result = 'Zero';
    ELSE
        SET result = 'Negative';
    END IF;
    
    RETURN result;
END //

DELIMITER ;
SELECT numbers(10);   -- Output: Positive
SELECT numbers(0);    -- Output: Zero
SELECT numbers(-5);   -- Output: Negative

DELIMITER //

CREATE FUNCTION get_emp_grade(salary INT)
RETURNS CHAR(1)
DETERMINISTIC
BEGIN
    DECLARE grade CHAR(1);

    IF salary > 100000 THEN
        SET grade = 'A';
    ELSEIF salary > 75000 THEN
        SET grade = 'B';
    ELSEIF salary > 50000 THEN
        SET grade = 'C';
    ELSEIF salary > 40000 THEN
        SET grade = 'D';
    ELSEIF salary > 25000 THEN
        SET grade = 'E';
    ELSE
        SET grade = 'F';
    END IF;

    RETURN grade;
END //

DELIMITER ;
SELECT get_emp_grade(120);  -- F
SELECT get_emp_grade(80000);   -- B
SELECT get_emp_grade(55000);   -- C
SELECT get_emp_grade(42000);   -- D
SELECT get_emp_grade(30000);   -- E
SELECT get_emp_grade(200000);   -- A

delimiter //
create function current_time_check()
returns Datetime
not deterministic
reads sql data
begin
return now();
end//
delimiter ;

 select current_time_check();
 
 delimiter //
 create function int_numbers()
 returns varchar(200)
deterministic 

begin
declare res varchar (200) default "";
declare i int default 0; -- init 
while i < 10 do  -- condition
         set res =concat(res , i,' ' );
         set i = i + 1; -- incremnennt
  end while ;
return res;  
  
end //
delimiter ;
select int_numbers();


DELIMITER //
-- paramterized func that print numbers string in given range
CREATE FUNCTION print_numbers(start_num INT, end_num INT)
RETURNS VARCHAR(1000)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(1000) DEFAULT '';
    DECLARE i INT;

    SET i = start_num;
    WHILE i <= end_num DO
        SET result = CONCAT(result, i, ' ');
        SET i = i + 1;
    END WHILE;

    RETURN TRIM(result);
END //

DELIMITER ;

SELECT print_numbers(1, 10);
SELECT print_numbers(80,100);


DELIMITER //
-- write a func that returns sum of first 10 nums using while loop in mysql
CREATE FUNCTION sum_first_10()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10 DO
        SET total = total + i;
        SET i = i + 1;
    END WHILE;

    RETURN total;
END //

DELIMITER ;
SELECT sum_first_10();

