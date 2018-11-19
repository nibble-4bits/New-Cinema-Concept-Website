using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebAPI.Util;

namespace WebAPI.Database
{
    public interface IDatabaseConnection
    {
        void Open();

        void Close();

        DataTableReader ExecuteQuerySP(StoredProcedure procedure);

        int ExecuteNonQuerySP(StoredProcedure procedure);
    }
}
