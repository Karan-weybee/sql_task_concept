create table students (
  id int primary key,
  name varchar(255),
  marks int,
  age int
)

select * from students

insert into students values(5,'ram',85,18)

SELECT AVG(MARKS) AS AvgMarks FROM Students; 

SELECT MAX(MARKS) AS MaxMarks FROM Students;
SELECT MIN(MARKS) AS MinMarks FROM Students;

SELECT SUM(MARKS) AS TotalMarks FROM Students group by id;
SELECT SUM(MARKS) AS TotalMarks FROM Students where id=1;
SELECT SUM(MARKS) AS TotalMarks FROM Students;

SELECT Upper(NAME) FROM Students;
SELECT lower(NAME) FROM Students;
SELECT CONCAT(name, age,'.com') from students;
SELECT LEN(name) FROM Students;
SELECT ROUND(MARKS,0) FROM students;  

SELECT ascii('a');
SELECT ascii(NAME) FROM STUDENTS;
SELECT len('Hello!');
SELECT concat(name,age) FROM students;
select LTRIM(name) from students;
select RTRIM(name) from students;
select REPLACE(name, 'harsh','1') from students
SELECT LEFT(name, 1) from students;
SELECT RIGHT(name, 5) from students; 
SELECT SUBSTRING(name, 3, 2) from students;

SELECT DATEPART(y, '2017/08/25') AS DatePartInt;
SELECT DATEPART(year, CURRENT_TIMESTAMP) AS DatePartInt;

SELECT name,GETDATE() from students;
SELECT name,CURRENT_TIMESTAMP from students;
SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;
SELECT DATEDIFF(year,'2019/08/25', '2018/08/25') AS DATEDIFF;

SELECT YEAR('2017/08/25') AS Year;
SELECT month('2017/08/25') AS Year;
SELECT day('2017/08/25') AS Year;
SELECT EOMONTH('2017/08/25') AS Year;
SELECT FORMAT(123456789, '##-##-#####');
SELECT FORMAT(age, '##/#/') from students;

SELECT CONVERT(varchar(23), marks) from students;
SELECT CAST(25.65 AS int);
SELECT CAST(age AS int) from students;
SELECT PARSE('05/12/2019' AS DATETIME) AS [Output] ;
SELECT CEILING(25.75) AS CeilValue;
SELECT CONVERT(nvarchar(30), GETDATE(), 100);
SELECT CAST( GETDATE() AS nvarchar(30));
SELECT floor(25.75) AS CeilValue;
SELECT POWER(age, 2) from students;
SELECT sqrt(marks) from students;
SELECT EXP(1);
SELECT LOG(2.71828182845905); --NATURAL LOG
SELECT SIN(1);
SELECT COS(1);
SELECT TAN(1);

SELECT age,
CASE
    WHEN AGE > 19 THEN 'is greater than 19'
    WHEN AGE = 19 THEN 'is 19'
    ELSE 'is under 19'
END AS QuantityText
FROM STUDENTS;

SELECT TOP 3 * FROM STUDENTS WHERE ID IN (
SELECT
ID
FROM
STUDENTS
GROUP BY ID
)
ORDER BY NAME

SELECT
ROW_NUMBER() OVER (
ORDER BY NAME
) ROW_NUM,ID,
name
FROM
STUDENTS;

SELECT
RANK() OVER (
ORDER BY NAME
) RANK,ID,
name
FROM
STUDENTS;
-- IF DATA IS UNIQUE THEN ROW_NUMBER AND RANK IS SAME


SELECT
DENSE_RANK() OVER (
ORDER BY NAME
) D_RANK,ID,
name
FROM
STUDENTS;

--RANK SKIP THE NUMBER BUT DENSRANK NOT
--LIKE 1,2,2,4 IN RANK
--1,2,2,3 IN DENSE RANK 


SELECT
NTILE(2) OVER (
ORDER BY NAME
) N_TILE,ID,
name
FROM
STUDENTS;
--START REPETATION FROM STARTING

SELECT
SUM(AGE) OVER (
ORDER BY ID
) N_TILE,ID,
name,AGE
FROM
STUDENTS;

SELECT
AVG(AGE) OVER (
ORDER BY NAME
) N_TILE,ID,
name
FROM
STUDENTS;

SELECT
LEAD(AGE,1,0) OVER (
ORDER BY NAME
)LEAD_AGE,ID,AGE,
name
FROM
STUDENTS;

SELECT
LAG(AGE,1,0) OVER (
ORDER BY NAME
)LEAD_AGE,ID,AGE,
name
FROM
STUDENTS;

DROP PROCEDURE new_function

CREATE PROCEDURE new_function 
AS
BEGIN
SELECT 
  NAME
FROM 
students
END;

EXEC new_function

