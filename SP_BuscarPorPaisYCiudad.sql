SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Pedro
-- Create date: 27-03-2022
-- Description: Buscar clientes segun pais y ciudad y los devuelve ordenados de manera descendente
-- =============================================
CREATE PROCEDURE  [dbo].[Buscar_Clientes__Por_Pais_Y_Ciudad]
	@pais nvarchar(15),
	@ciudad nvarchar(15)
AS
BEGIN
	SELECT CustomerID,ContactName,Country,City,Address  FROM Customers
	where Country = @pais AND City = @ciudad
	ORDER BY Country DESC
END
GO
