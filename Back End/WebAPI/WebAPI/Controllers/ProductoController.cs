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
    public class ProductoController : ApiController
    {
        // GET: api/Producto
        [HttpGet]
        public IHttpActionResult Get()
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Producto> productos = new List<Producto>();

            try
            {
                conn.Open();

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_ObtenerProductos"));

                while (reader.Read())
                {
                    productos.Add(new Producto()
                    {
                         Id = int.Parse(reader["Id"].ToString()),
                         Nombre = reader["Nombre"].ToString(),
                         PrecioUnitario = decimal.Parse(reader["PrecioUnitario"].ToString())
                    });
                }

                return Ok(productos);
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
