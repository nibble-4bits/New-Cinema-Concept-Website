USE Cinema
GO

CREATE PROCEDURE dbo.sp_AutenticarUsuario
@Username NVARCHAR(200)
AS
	SELECT *
	FROM Usuario
	WHERE Username LIKE @Username
GO