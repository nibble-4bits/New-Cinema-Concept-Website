using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WebAPI.Util;

namespace WebAPI.Database
{
    public class SqlServerConnection : IDatabaseConnection
    {
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;

        private SqlConnection SqlConn;
        private bool IsConnected;

        public SqlServerConnection()
        {
            SqlConn = null;
            IsConnected = false;
        }

        public void Open()
        {
            if (SqlConn == null)
            {
                SqlConn = new SqlConnection(ConnectionString);
                try
                {
                    SqlConn.Open();
                    IsConnected = true;
                }
                catch (SqlException SqlEx)
                {
                    string ErrorMsg = "ERROR: " + SqlEx.Message + ". " + "LINEA: " + SqlEx.LineNumber + ".";
                    throw new Exception(ErrorMsg, SqlEx);
                }
            }
        }

        public void Close()
        {
            try
            {
                SqlConn.Close();
            }
            catch (SqlException SqlEx)
            {
                throw SqlEx;
            }
        }

        public DataTableReader ExecuteQuerySP(StoredProcedure procedure)
        {
            if (IsConnected)
            {
                DataTable dataTable = new DataTable();
                SqlCommand command = new SqlCommand(procedure.Name, SqlConn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };

                if (procedure.Parameters != null || procedure.Parameters.Any())
                {
                    command.Parameters.AddRange(procedure.Parameters.ToArray());
                }

                SqlDataAdapter adapterDataTable = new SqlDataAdapter(command);
                adapterDataTable.Fill(dataTable);

                return dataTable.CreateDataReader();
            }
            else
            {
                throw new Exception("There is no connection to the database. It could be that it was not opened or there is another problem");
            }
        }

        public int ExecuteNonQuerySP(StoredProcedure procedure)
        {
            if (IsConnected)
            {
                SqlCommand command = new SqlCommand(procedure.Name, SqlConn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };

                if (procedure.Parameters != null || procedure.Parameters.Any())
                {
                    command.Parameters.AddRange(procedure.Parameters.ToArray());
                }

                return command.ExecuteNonQuery();
            }
            else
            {
                throw new Exception("There is no connection to the database. It could be that it was not opened or there is another problem");
            }
        }
    }
}