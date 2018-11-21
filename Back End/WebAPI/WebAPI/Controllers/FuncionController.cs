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
    public class FuncionController : ApiController
    {
        // GET: api/Funcion/5
        [HttpGet]
        public IHttpActionResult ObtenerAsientosDisponibles(Usuario_Funcion usuarioFuncion)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();
            int asientosDisponibles = 0;

            try
            {
                conn.Open();

                parameters.Add(new SqlParameter("@IdFuncion", usuarioFuncion.Funcion.Id));

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_ObtenerAsientosDisponibles", parameters));
                
                while (reader.Read())
                {
                    asientosDisponibles = int.Parse(reader["AsientosDisponibles"].ToString());
                }
                
                return Ok(asientosDisponibles);
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

        // POST: api/Funcion
        [HttpPost]
        public IHttpActionResult ComprarBoletos([FromBody]Usuario_Funcion usuarioFuncion)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();

            try
            {
                conn.Open();

                parameters.Add(new SqlParameter("@IdUsuario", usuarioFuncion.Usuario.Id));
                parameters.Add(new SqlParameter("@IdFuncion", usuarioFuncion.Funcion.Id));
                parameters.Add(new SqlParameter("@Cantidad", usuarioFuncion.Cantidad));

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_ComprarBoletos", parameters));
                /*
                while (reader.Read())
                {
                    
                }
                */
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
