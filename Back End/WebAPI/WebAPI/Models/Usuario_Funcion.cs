using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Usuario_Funcion
    {
        public int Id { get; set; }
        public Usuario Usuario { get; set; }
        public Funcion Funcion { get; set; }
        public DateTime FechaCompra { get; set; }
        public int Cantidad { get; set; }
    }
}