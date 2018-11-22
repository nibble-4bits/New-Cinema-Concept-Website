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
    public class AdminController : ApiController
    {
        // GET: api/Admin
        [HttpGet]
        [Route("api/admin/cantUsuarios")]
        public IHttpActionResult ObtenerCantidadUsuarios()
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

        // GET: api/Admin
        [HttpGet]
        [Route("api/admin/ganancias")]
        public IHttpActionResult ObtenerGanancias(int mes)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();
            List<decimal> gananciasParciales = new List<decimal>();

            try
            {
                conn.Open();

                parameters.Add(new SqlParameter("@MesD", mes));
                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("[dbo].[sp_ConsultaGanancias]", parameters));

                while (reader.Read())
                {
                    string totalAlimentos = reader["TotalAlimentos"].ToString();
                    string totalBoletos = reader["TotalBoletos"].ToString();
                    if (!String.IsNullOrEmpty(totalAlimentos))
                    {
                        gananciasParciales.Add(decimal.Parse(totalAlimentos));
                    }
                    else
                    {
                        gananciasParciales.Add(0);
                    }

                    if (!String.IsNullOrEmpty(totalBoletos))
                    {
                        gananciasParciales.Add(decimal.Parse(totalBoletos));
                    }
                    else
                    {
                        gananciasParciales.Add(0);
                    }
                }

                return Ok(gananciasParciales);
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

        [HttpGet]
        [Route("api/admin/quejaP")]
        public IHttpActionResult ObtenerQuejasPlatinum()
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Ticket> tickets = new List<Ticket>();

            try
            {
                conn.Open();

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("[dbo].[sp_GetTicketsPlatinum]"));

                while (reader.Read())
                {
                    tickets.Add(new Ticket()
                    {
                        Descripcion = reader["Descripcion"].ToString()
                    });
                }

                return Ok(tickets);
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

        [HttpGet]
        [Route("api/admin/quejaG")]
        public IHttpActionResult ObtenerQuejasGold()
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Ticket> tickets = new List<Ticket>();

            try
            {
                conn.Open();

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("[dbo].[sp_GetTicketsOro]"));

                while (reader.Read())
                {
                    tickets.Add(new Ticket()
                    {
                        Descripcion = reader["Descripcion"].ToString()
                    });
                }

                return Ok(tickets);
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

        [HttpGet]
        [Route("api/admin/quejaB")]
        public IHttpActionResult ObtenerQuejasBasico()
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Ticket> tickets = new List<Ticket>();

            try
            {
                conn.Open();

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("[dbo].[sp_GetTicketsBasico]"));

                while (reader.Read())
                {
                    tickets.Add(new Ticket()
                    {
                        Descripcion = reader["Descripcion"].ToString()
                    });
                }

                return Ok(tickets);
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
