select * from employees

begin try 
 select 10/0;
 select * from employees
end try

begin catch 
 print 'you can not devide by zero'
end catch

begin try 
update employees set salary ='40000c' where employeeid=1
end try

begin catch 
select
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
end catch
