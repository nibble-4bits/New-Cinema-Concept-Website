using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{
    public class Episodio
    {
        public int Id { get; set; }
        public Proyectable Proyectable { get; set; }
        public Serie Serie { get; set; }
    }
}