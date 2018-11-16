using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAPI.Util
{
    public class StoredProcedure
    {
        public string Name { get; set; }
        public List<SqlParameter> Parameters { get; set; }

        public StoredProcedure(string name, List<SqlParameter> parameters = null)
        {
            this.Name = name;
            this.Parameters = parameters;
        }
    }
}