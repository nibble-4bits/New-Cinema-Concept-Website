USE Cinema
GO

CREATE PROCEDURE dbo.sp_ConsumirCupon
@IdUsuario INT, @IdCupon INT
AS
	INSERT INTO Usuario_Cupon(IdUsuario, IdCupon)
				VALUES(@IdUsuario, @IdCupon)
GO

CREATE PROCEDURE dbo.sp_ObtenerCuponesNoUtilizados
@IdUsuario INT
AS
	SELECT *
	FROM Cupon
	WHERE Id NOT IN (SELECT IdCupon FROM Usuario_Cupon WHERE IdUsuario = @IdUsuario)
GO