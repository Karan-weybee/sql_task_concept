select * from employees

--temparary local table
select * into #temp_table from employees
insert into #temp_table values(6,'jay','backend','80000')
delete from #temp_table where employeeid =2
select * from #temp_table

--temprary global table
select * into ##temp_global_table from employees
insert into ##temp_global_table values(6,'jay','backend','80000')
delete from ##temp_global_table where employeeid =2
select * from ##temp_global_table

DECLARE @table_variable TABLE ( id INT, name VARCHAR(50) );
INSERT INTO @table_variable (id, name) VALUES (1, 'John'), (2, 'Jane'), (3, 'Mark');
SELECT * FROM @table_variable;