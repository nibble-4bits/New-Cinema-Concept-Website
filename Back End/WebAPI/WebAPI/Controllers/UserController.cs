using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
    public class UserController : ApiController
    {
        // POST: api/User
        [HttpPost]
        [AllowAnonymous]
        public IHttpActionResult RegistrarUsuario([FromBody]Usuario usuario)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();

            try
            {
                conn.Open();

                /* ¿Puede mejorarse esto usando un ciclo for? */
                parameters.Add(new SqlParameter("@Nombre", usuario.Nombre));
                parameters.Add(new SqlParameter("@ApellidoP", usuario.ApellidoP));
                parameters.Add(new SqlParameter("@ApellidoM", usuario.ApellidoM));
                parameters.Add(new SqlParameter("@Email", usuario.Email));
                parameters.Add(new SqlParameter("@Username", usuario.Username));
                parameters.Add(new SqlParameter("@Password", usuario.Password));
                parameters.Add(new SqlParameter("@FechaNacimiento", usuario.FechaNacimiento));

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_RegistrarUsuario", parameters));

                while (reader.Read())
                {
                    usuario.Id = int.Parse(reader["Id"].ToString());
                    usuario.Tipo = byte.Parse(reader["Tipo"].ToString());
                }

                return Ok(usuario);
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

        // PUT: api/User
        [HttpPut]
        public IHttpActionResult ActualizarDatos([FromBody]Usuario usuario)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();

            try
            {
                conn.Open();

                parameters.Add(new SqlParameter("@Id", usuario.Id));
                parameters.Add(new SqlParameter("@Nombre", usuario.Nombre));
                parameters.Add(new SqlParameter("@ApellidoP", usuario.ApellidoP));
                parameters.Add(new SqlParameter("@ApellidoM", usuario.ApellidoM));
                parameters.Add(new SqlParameter("@Email", usuario.Email));
                parameters.Add(new SqlParameter("@Password", usuario.Password));

                conn.ExecuteNonQuerySP(new StoredProcedure("dbo.sp_ActualizarUsuario", parameters));

                return Ok();
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

        // PUT: api/User
        [HttpPut]
        [Route("api/User/upgrade")]
        public IHttpActionResult AscenderTipo([FromBody]Usuario usuario)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();

            try
            {
                conn.Open();

                parameters.Add(new SqlParameter("@IdUsuario", usuario.Id));
                parameters.Add(new SqlParameter("@Tipo", usuario.Tipo));

                conn.ExecuteNonQuerySP(new StoredProcedure("dbo.sp_CambiarTipoUsuario", parameters));

                return Ok();
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
