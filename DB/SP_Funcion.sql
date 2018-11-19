USE Cinema
GO

CREATE PROCEDURE dbo.sp_ComprarBoletos
@IdUsuario INT, @IdFuncion INT,
@Cantidad INT
AS
	INSERT INTO Usuario_Funcion(IdUsuario, IdFuncion, Cantidad, FechaCompra)
	VALUES(@IdUsuario, @IdFuncion, @Cantidad, GETDATE())
GO

CREATE PROCEDURE dbo.sp_ObtenerAsientosDisponibles
@IdFuncion INT
AS
	SELECT AsientosDisponibles
	FROM Funcion
	WHERE Id = @IdFuncion
GO