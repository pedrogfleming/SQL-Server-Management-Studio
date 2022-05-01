

create function sqlFactorial (@int int)
returns int
begin
 declare @factorial bigint = 1
 select @factorial = @factorial * i from dbo.NumbersTable(1,@int,1)
 return @factorial
end
go

select
 dbo.sqlFactorial(0) [0 factorial],
 dbo.sqlFactorial(1) [1 factorial],
 dbo.sqlFactorial(5) [5 factorial],
 dbo.sqlFactorial(6) [6 factorial]