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
    public class CuponController : ApiController
    {
        // GET: api/Cupon/1
        [HttpGet]
        public IHttpActionResult ObtenerCuponesDisponibles(int idUsuario)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Cupon> cupones = new List<Cupon>();
            List<SqlParameter> parameters = new List<SqlParameter>();

            try
            {
                conn.Open();

                parameters.Add(new SqlParameter("@IdUsuario", idUsuario));

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_ObtenerCuponesNoUtilizados", parameters));

                while (reader.Read())
                {
                    cupones.Add(new Cupon()
                    {
                        Id = int.Parse(reader["Id"].ToString()),
                        Codigo = reader["Codigo"].ToString(),
                        Descripcion = reader["Descripcion"].ToString(),
                        Estatus = bool.Parse(reader["Estatus"].ToString())
                    });
                }

                return Ok(cupones);
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

        // POST: api/Cupon
        public void Post([FromBody]string value)
        {
        }
    }
}
