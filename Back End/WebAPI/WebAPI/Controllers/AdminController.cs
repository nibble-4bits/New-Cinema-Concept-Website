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
    public class AdminController : ApiController
    {
        // GET: api/Admin
        [HttpGet]
        [Route("api/admin/cantUsuarios")]
        public IHttpActionResult Get()
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<int> cantidadTiposUsuario = new List<int>();

            try
            {
                conn.Open();

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("[dbo].[sp_TipoUsuarios]"));

                while (reader.Read())
                {
                    cantidadTiposUsuario.Add(int.Parse(reader["Cantidad"].ToString()));
                }

                return Ok(cantidadTiposUsuario);
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

        // GET: api/Admin/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Admin
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Admin/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Admin/5
        public void Delete(int id)
        {
        }
    }
}
