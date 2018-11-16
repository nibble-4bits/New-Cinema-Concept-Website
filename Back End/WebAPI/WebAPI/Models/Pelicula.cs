using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Pelicula
    {
        public int Id { get; set; }
        public Proyectable Proyectable { get; set; }
        public string Clasificacion { get; set; }
        public string Genero { get; set; }
        public string Reparto { get; set; }
    }
}