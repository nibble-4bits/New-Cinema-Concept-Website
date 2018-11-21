USE Cinema
GO

CREATE TRIGGER dbo.trg_ActualizarTotalPedido
ON Producto_Pedido
AFTER INSERT
AS BEGIN
	-- Prevenimos la recursividad
	IF TRIGGER_NESTLEVEL() > 1
	BEGIN
		RETURN
	END

	UPDATE Pedido
	SET PrecioTotal = (SELECT SUM(P.PrecioUnitario * ins.Cantidad) 
					  FROM inserted ins INNER JOIN Producto P 
					  ON ins.IdProducto = P.Id)
	WHERE Id = (SELECT MAX(IdPedido) FROM inserted)
END
GO