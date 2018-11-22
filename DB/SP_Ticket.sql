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
 CREATE PROCEDURE [dbo].[sp_GetTickets]
 AS
	SELECT T.*, U.Id 'IdUsuario', U.Username
	FROM Ticket T INNER JOIN Usuario U
	ON T.IdUsuario = U.Id
 GO