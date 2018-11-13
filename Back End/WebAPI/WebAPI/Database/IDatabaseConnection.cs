using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebAPI.Database
{
    interface IDatabaseConnection
    {
        void Open();

        void Close();

        void PrepareStoredProc(string StoredProcName, List<SqlParameter> StoredProcParams);

        DataTableReader ExecuteQuery();

        int ExecuteNonQuery();
    }
}
