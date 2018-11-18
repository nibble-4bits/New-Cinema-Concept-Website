USE Cinema
GO

CREATE PROCEDURE dbo.sp_InsertarPedido
@IdUsuario INT
AS
	-- Se retorna todo el pedido, con su detalle de pedido y los productos del detalle
	SELECT Pe.Id 'IdPedido', Pr.Id 'IdProducto', PrPe.Id 'IdProducto_Pedido', Pe.IdUsuario 'IdUsuario',
		   FechaCompra, Nombre, Cantidad, PrecioUnitario, PrecioTotal
	FROM Pedido Pe INNER JOIN Producto_Pedido PrPe
	ON Pe.Id = PrPe.IdPedido INNER JOIN Producto Pr
	ON Pr.Id = PrPe.IdProducto
	WHERE Pe.IdUsuario = @IdUsuario
GO

CREATE PROCEDURE dbo.sp_InsertarPedido
@IdUsuario INT,
@ProductoPedido Producto_Pedido_Tipo READONLY
AS
	-- Inserto una venta con la fecha actual y precio total 0
	INSERT INTO Pedido(IdUsuario, FechaCompra, PrecioTotal) VALUES(@IdUsuario, GETDATE(), 0)

	-- Obtengo el Id de dicha venta
	DECLARE @PedidoId INT = (SELECT MAX(Id) FROM Pedido)

	-- Inserto el detalle de venta
	INSERT INTO Producto_Pedido(IdPedido, IdProducto, Cantidad)
	SELECT @PedidoId, IdProducto, Cantidad
	FROM @ProductoPedido

	-- Se retorna todo el pedido, con su detalle de pedido y los productos del detalle
	SELECT Pe.Id 'IdPedido', Pr.Id 'IdProducto', PrPe.Id 'IdProducto_Pedido', Pe.IdUsuario 'IdUsuario',
		   FechaCompra, Nombre, Cantidad, PrecioUnitario, PrecioTotal
	FROM Pedido Pe INNER JOIN Producto_Pedido PrPe
	ON Pe.Id = PrPe.IdPedido INNER JOIN Producto Pr
	ON Pr.Id = PrPe.IdProducto
	WHERE Pe.Id = @PedidoId
GO

--PRUEBAS
DECLARE @DetallePedido AS Producto_Pedido_Tipo
INSERT INTO @DetallePedido(IdProducto, Cantidad) 
			VALUES(1, 1),
				  (2, 2),
				  (4, 1)

EXEC dbo.sp_InsertarPedido 1, @DetallePedido
GO

SELECT * FROM Pedido
SELECT * FROM Producto_Pedido
GO