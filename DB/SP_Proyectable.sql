USE Cinema
GO

CREATE PROCEDURE dbo.sp_ObtenerPeliculas
AS
	SELECT Pe.Id 'IdPelicula', Pr.Id 'IdProyectable', Clasificacion, Genero, Reparto,
		   Titulo, Duracion, Sinopsis, RutaImagen, Estatus
	FROM Pelicula Pe INNER JOIN Proyectable Pr
	ON Pe.IdProyectable = Pr.Id
GO

CREATE PROCEDURE dbo.sp_ObtenerEpisodios
AS
	SELECT Ep.Id 'IdEpisodio', Se.Id 'IdSerie', Pr.Id 'IdProyectable', Se.Nombre 'NombreSerie', 
		   Clasificacion, Genero, Reparto, Titulo, Duracion, Sinopsis, RutaImagen, Estatus
	FROM Episodio Ep INNER JOIN Proyectable Pr
	ON Ep.IdProyectable = Pr.Id INNER JOIN Serie Se
	ON Se.Id = Ep.IdSerie
GO