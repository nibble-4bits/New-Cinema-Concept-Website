using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Proyectable
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public DateTime Duracion { get; set; }
        public string Sinopsis { get; set; }
        public string RutaImagen { get; set; }
        public byte Estatus { get; set; }
    }
}