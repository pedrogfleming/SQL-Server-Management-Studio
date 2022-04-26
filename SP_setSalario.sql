CREATE PROCEDURE SET_SALARIO(
	DECLARE @parametro_salario float

)
AS
--INSERTE AQUI SU CODIGO
	DECLARE @pais varchar(200)
	SELECT @pais = (SELECT pais FROM empleados WHERE salario > @parametro_salario)

GO;