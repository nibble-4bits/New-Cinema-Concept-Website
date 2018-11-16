using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Producto_Pedido
    {
        public int Id { get; set; }
        public Pedido Pedido { get; set; }
        public int Cantidad { get; set; }
    }
}