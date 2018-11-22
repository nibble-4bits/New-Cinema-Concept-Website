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
    public class PedidoController : ApiController
    {
        // GET: api/Pedido/1
        [HttpGet]
        public IHttpActionResult ObtenerPedidosPorUsuario(int idUsuario)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Pedido> pedidos = new List<Pedido>();
            List<SqlParameter> parameters = new List<SqlParameter>();

            try
            {
                conn.Open();

                parameters.Add(new SqlParameter("@IdUsuario", idUsuario));

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_ObtenerPedidosIdUsuario", parameters));

                List<Producto_Pedido> producto_pedidos = new List<Producto_Pedido>();
                while (reader.Read())
                {
                    producto_pedidos.Add(new Producto_Pedido
                    {
                        Id = int.Parse(reader["IdProducto_Pedido"].ToString()),
                        Cantidad = int.Parse(reader["Cantidad"].ToString()),
                        Producto = new Producto
                        {
                            Id = int.Parse(reader["IdProducto"].ToString()),
                            Nombre = reader["Nombre"].ToString(),
                            PrecioUnitario = decimal.Parse(reader["PrecioUnitario"].ToString())
                        }
                    });

                    Pedido pedidoInsertado = new Pedido
                    {
                        Id = int.Parse(reader["IdPedido"].ToString()),
                        FechaCompra = DateTime.Parse(reader["FechaCompra"].ToString()),
                        PrecioTotal = decimal.Parse(reader["PrecioTotal"].ToString()),
                        Producto_Pedido = producto_pedidos
                    };

                    pedidos.Add(pedidoInsertado);
                }

                return Ok(pedidos);
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

        // POST: api/Pedido
        [HttpPost]
        public IHttpActionResult Post([FromBody]Pedido pedido)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();
            DataTable dataTable = new DataTable();
            DataTableReader dtr;

            try
            {
                conn.Open();

                // Se crea la tabla que se pasa por parámetro al stored procedure
                dataTable.Columns.Add("IdProducto", typeof(int));
                dataTable.Columns.Add("Cantidad", typeof(int));
                foreach (var item in pedido.Producto_Pedido)
                {
                    dataTable.Rows.Add(item.Producto.Id, item.Cantidad);
                }

                parameters.Add(new SqlParameter("@IdUsuario", pedido.Usuario.Id));
                parameters.Add(new SqlParameter("@ProductoPedido", dataTable));

                dtr = conn.ExecuteQuerySP(new StoredProcedure("dbo.sp_InsertarPedido", parameters));

                List<Producto_Pedido> producto_pedidos = new List<Producto_Pedido>();
                while (dtr.Read())
                {
                    producto_pedidos.Add(new Producto_Pedido
                    {
                        Id = int.Parse(dtr["IdProducto_Pedido"].ToString()),
                        Cantidad = int.Parse(dtr["Cantidad"].ToString()),
                        Producto = new Producto
                        {
                            Id = int.Parse(dtr["IdProducto"].ToString()),
                            Nombre = dtr["IdProducto_Pedido"].ToString(),
                            PrecioUnitario = decimal.Parse(dtr["PrecioUnitario"].ToString())
                        }
                    });
                }

                Pedido pedidoInsertado = new Pedido
                {
                    Id = int.Parse(dtr["IdPedido"].ToString()),
                    FechaCompra = DateTime.Parse(dtr["FechaCompra"].ToString()),
                    PrecioTotal = decimal.Parse(dtr["PrecioTotal"].ToString()),
                    Producto_Pedido = producto_pedidos,
                    Usuario = pedido.Usuario
                };

                return Ok(pedidoInsertado); // devuelve la venta insertada
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
