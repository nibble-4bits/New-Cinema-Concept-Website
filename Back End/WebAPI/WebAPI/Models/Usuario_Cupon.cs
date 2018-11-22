using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Usuario_Cupon
    {
        public int Id { get; set; }
        public Usuario Usuario { get; set; }
        public Cupon Cupon { get; set; }
    }
}