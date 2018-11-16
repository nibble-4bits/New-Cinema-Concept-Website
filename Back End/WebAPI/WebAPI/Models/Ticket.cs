using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Ticket
    {
        public int Id { get; set; }
        public Usuario Usuario { get; set; }
        public string Titulo { get; set; }
        public string Motivo { get; set; }
        public string Descripcion { get; set; }
    }
}