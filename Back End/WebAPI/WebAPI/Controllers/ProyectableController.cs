using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAPI.Database;
using WebAPI.Models;
using WebAPI.Util;

namespace WebAPI.Controllers
{
    [Authorize]
    public class ProyectableController : ApiController
    {
        // GET: api/peliculas
        [HttpGet]
        [Route("api/peliculas")]
        public IHttpActionResult ObtenerPeliculas()
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Pelicula> peliculas = new List<Pelicula>();

            try
            {
                conn.Open();

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_ObtenerPeliculas"));

                while (reader.Read())
                {
                    Proyectable proyectable = new Proyectable()
                    {
                        Id = int.Parse(reader["IdProyectable"].ToString()),
                        Titulo = reader["Titulo"].ToString(),
                        Sinopsis = reader["Sinopsis"].ToString(),
                        Duracion = DateTime.Parse(reader["Duracion"].ToString()),
                        RutaImagen = reader["RutaImagen"].ToString(),
                        Estatus = byte.Parse(reader["Estatus"].ToString())
                    };

                    peliculas.Add(new Pelicula()
                    {
                        Id = int.Parse(reader["IdPelicula"].ToString()),
                        Clasificacion = reader["Clasificacion"].ToString(),
                        Genero = reader["Genero"].ToString(),
                        Reparto = reader["Reparto"].ToString(),
                        Proyectable = proyectable
                    });
                }

                return Ok(peliculas);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        // GET: api/episodios
        [HttpGet]
        [Route("api/episodios")]
        public IHttpActionResult ObtenerEpisodios()
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Episodio> episodios = new List<Episodio>();

            try
            {
                conn.Open();

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_ObtenerEpisodios"));

                while (reader.Read())
                {
                    Proyectable proyectable = new Proyectable()
                    {
                        Id = int.Parse(reader["IdProyectable"].ToString()),
                        Titulo = reader["Titulo"].ToString(),
                        Sinopsis = reader["Sinopsis"].ToString(),
                        Duracion = DateTime.Parse(reader["Duracion"].ToString()),
                        RutaImagen = reader["RutaImagen"].ToString(),
                        Estatus = byte.Parse(reader["Estatus"].ToString())
                    };

                    Serie serie = new Serie()
                    {
                        Id = int.Parse(reader["IdSerie"].ToString()),
                        Nombre = reader["NombreSerie"].ToString(),
                        Clasificacion = reader["Clasificacion"].ToString(),
                        Genero = reader["Genero"].ToString(),
                        Reparto = reader["Reparto"].ToString(),
                    };

                    episodios.Add(new Episodio()
                    {
                        Id = int.Parse(reader["IdEpisodio"].ToString()),
                        Serie = serie,
                        Proyectable = proyectable
                    });
                }

                return Ok(episodios);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
