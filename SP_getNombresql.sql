CREATE PROCEDURE GET_NOMBRE(
	DECLARE @parametro_nombre varchar(200)

)
AS
--INSERTE AQUI SU CODIGO
	DECLARE @nombre_cliente  varchar(200)
	SELECT @nombre_cliente = 
	(SELECT nombre FROM clientes3 WHERE nombre = @parametro_nombre)
	PRINT(@nombre_cliente)

GO;