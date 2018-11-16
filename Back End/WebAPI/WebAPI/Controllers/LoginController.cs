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
    public class LoginController : ApiController
    {
        // POST: api/Login
        [HttpPost]
        public IHttpActionResult AutenticarUsuario([FromBody]Usuario usuario)
        {
            IDatabaseConnection connection = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();

            try
            {
                connection.Open();

                parameters.Add(new SqlParameter("@Username", usuario.Username));

                DataTableReader reader = connection.ExecuteQuerySP(
                    new StoredProcedure("dbo.sp_AutenticarUsuario", parameters));

                while (reader.Read())
                {
                    if (usuario.Username.Equals(reader["Username"].ToString()))
                    {
                        return Ok();
                    }
                }

                return NotFound();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
