using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Funcion
    {
        public int Id { get; set; }
        public Proyectable Proyectable { get; set; }
        public Sala Sala { get; set; }
        public DateTime DiaHora { get; set; }
        public byte AsientosDisponibles { get; set; }
    }
}