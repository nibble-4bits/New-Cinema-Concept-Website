USE Cinema
GO

CREATE PROCEDURE [dbo].[sp_CreateTicket]
@idUsuario INT, @tituloVal NVARCHAR(200), 
@motivoVal NVARCHAR(200), @descripcionVal NVARCHAR(300)
AS
	INSERT INTO Ticket(IdUsuario,Titulo,Motivo,Descripcion)
	VALUES (@idUsuario,@tituloVal,@motivoVal,@descripcionVal)
GO

 --SP PARA CONSULTAR LOS TICKETS DE QUEJA
CREATE PROCEDURE [dbo].[sp_GetTicketsPlatinum]
AS
	SELECT T.*, U.Id 'IdUsuario', U.Username, U.Tipo
	FROM Ticket T INNER JOIN Usuario U
	ON T.IdUsuario = U.Id
	WHERE U.Tipo = 3
GO

CREATE PROCEDURE [dbo].[sp_GetTicketsOro]
AS
	SELECT T.*, U.Id 'IdUsuario', U.Username, U.Tipo
	FROM Ticket T INNER JOIN Usuario U
	ON T.IdUsuario = U.Id
	WHERE U.Tipo = 2
GO

CREATE PROCEDURE [dbo].[sp_GetTicketsBasico]
AS
	SELECT T.*, U.Id 'IdUsuario', U.Username, U.Tipo
	FROM Ticket T INNER JOIN Usuario U
	ON T.IdUsuario = U.Id
	WHERE U.Tipo = 1
GO