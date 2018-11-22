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
    public class TicketController : ApiController
    {
        // GET: api/Ticket
        [HttpGet]
        public IHttpActionResult ObtenerTickets()
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<Ticket> tickets = new List<Ticket>();

            try
            {
                conn.Open();

                DataTableReader reader = conn.ExecuteQuerySP(new StoredProcedure("[dbo].[sp_GetTickets]"));

                while (reader.Read())
                {
                    Usuario usuario = new Usuario
                    {
                        Id = int.Parse(reader["IdUsuario"].ToString()),
                        Username = reader["Username"].ToString()
                    };

                    tickets.Add(new Ticket {
                        Id = int.Parse(reader["Id"].ToString()),
                        Titulo = reader["Titulo"].ToString(),
                        Motivo = reader["Motivo"].ToString(),
                        Descripcion = reader["Descripcion"].ToString(),
                        Usuario = usuario
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

        // POST: api/Ticket
        [HttpPost]
        public IHttpActionResult AgregarTicket([FromBody]Ticket ticket)
        {
            IDatabaseConnection conn = new SqlServerConnection();
            List<SqlParameter> parameters = new List<SqlParameter>();

            try
            {
                conn.Open();

                parameters.Add(new SqlParameter("@idUsuario", ticket.Usuario.Id));
                parameters.Add(new SqlParameter("@tituloVal", ticket.Titulo));
                parameters.Add(new SqlParameter("@motivoVal", ticket.Motivo));
                parameters.Add(new SqlParameter("@descripcionVal", ticket.Descripcion));

                conn.ExecuteNonQuerySP(new StoredProcedure("[dbo].[sp_CreateTicket]", parameters));

                return Ok();
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
