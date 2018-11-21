using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Serie
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Clasificacion { get; set; }
        public string Genero { get; set; }
        public string Reparto { get; set; }
    }
}