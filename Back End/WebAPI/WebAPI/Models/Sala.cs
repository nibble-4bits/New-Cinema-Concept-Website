using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Sala
    {
        public int Id { get; set; }
        public decimal Precio { get; set; }
        public byte NumAsientos { get; set; }
    }
}