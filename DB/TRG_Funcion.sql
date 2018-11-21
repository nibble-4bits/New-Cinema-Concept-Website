USE Cinema
GO

-- Actualiza el numero de asientos disponibles para una función
CREATE TRIGGER dbo.trg_ActualizarAsientosDisponibles
ON Usuario_Funcion
AFTER INSERT
AS BEGIN
	UPDATE Funcion
	SET AsientosDisponibles = AsientosDisponibles - (SELECT Cantidad FROM inserted)
	WHERE Id = (SELECT IdFuncion FROM inserted)
END
GO