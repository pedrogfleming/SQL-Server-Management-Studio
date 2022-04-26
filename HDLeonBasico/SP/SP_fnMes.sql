SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION fnMes
(
	-- Add the parameters for the function here
	@a INT, @b INT, @c VARCHAR(MAX)
)
RETURNS INT
AS
BEGIN
	RETURN MONTH(GETDATE())
END
GO

