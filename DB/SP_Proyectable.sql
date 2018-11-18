USE Cinema
GO

CREATE PROCEDURE dbo.sp_ObtenerPeliculas
AS
	SELECT *
	FROM Pelicula Pe INNER JOIN Proyectable Pr
	ON Pe.IdProyectable = Pr.Id
GO

CREATE PROCEDURE dbo.sp_ObtenerEpisodios
AS
	SELECT *
	FROM Episodio Ep INNER JOIN Proyectable Pr
	ON Ep.IdProyectable = Pr.Id INNER JOIN Serie Se
	ON Se.Id = Ep.IdSerie
GO