//using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Proyecto1.AppCode
{
    /// <summary>
    /// Comunicación con la base de datos
    /// </summary>
    public class Database
    {
        private readonly string _connString;
        private SqlConnection _sqlConn;

        public Database()
        {
            _connString = ConfigurationManager.ConnectionStrings["MiProyecto"].ToString();
        }

        /// <summary>
        /// Ejecuta un procedimiento almacenado en la base de datos
        /// </summary>
        /// <param name="strSp">
        /// Nombre del procedimiento almacenado
        /// </param>
        /// <param name="paramList">
        /// Lista de parámetros
        /// </param>
        /// <param name="strRes">
        /// Resultado de la ejecución del procedimiento almacenado
        /// </param>
        /// <returns>
        /// DataSet
        /// </returns>
        /// 

        public bool BulkInsertDataTable(string tableName, DataTable dataTable)
        {
            bool isSuccuss;
            try
            {
                SqlConnection SqlConnectionObj = new SqlConnection(_connString);
                SqlConnectionObj.Open();
                SqlBulkCopy bulkCopy = new SqlBulkCopy(SqlConnectionObj, SqlBulkCopyOptions.TableLock | SqlBulkCopyOptions.FireTriggers | SqlBulkCopyOptions.UseInternalTransaction, null);
                bulkCopy.DestinationTableName = tableName;
                AutoMapColumns(ref bulkCopy, dataTable);
                bulkCopy.WriteToServer(dataTable);
                isSuccuss = true;
                SqlConnectionObj.Close();
            }
            catch (Exception ex)
            {
                isSuccuss = false;
            }
            return isSuccuss;
        }
        public static void AutoMapColumns(ref SqlBulkCopy sbc, DataTable dt)
        {
            foreach (DataColumn column in dt.Columns)
            {
                sbc.ColumnMappings.Add(column.ColumnName, column.ColumnName);
            }
        }

        public DataSet ExecuteSp(string strSp, Dictionary<string, object> paramList, ref string strRes)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            try
            {
                this._sqlConn = new SqlConnection(this._connString);
                using (this._sqlConn)
                {
                    SqlCommand cmd = new SqlCommand(strSp)
                    {
                        Connection = this._sqlConn,
                        CommandType = CommandType.StoredProcedure
                    };
                    da.SelectCommand = cmd;
                    if (paramList != null)
                    {
                        foreach (var item in paramList)
                        {
                            cmd.Parameters.AddWithValue("@" + item.Key, item.Value);
                        }
                    }

                    da.Fill(ds);
                    this._sqlConn.Close();
                }

                int tableNumber;
                if (ds.Tables.Count == 0)
                {
                    tableNumber = 0;
                }
                else
                {
                    tableNumber = ds.Tables.Count - 1;
                }

                int x;
                if ((ds.Tables[tableNumber].Rows.Count > 0 && (int.TryParse(ds.Tables[tableNumber].Rows[0][0].ToString(), out x) || ds.Tables[tableNumber].Rows[0][0].ToString().ToUpper() != "ERROR"))
                    || (ds.Tables[tableNumber].Rows.Count == 0))
                {
                    strRes = "OK";
                    return ds;
                }
                else if (ds.Tables[tableNumber].Rows[0][0].ToString().ToUpper() == "ERROR")
                {
                    strRes = "ERROR";
                    return ds;
                }

                ds = new DataSet();
                ds.Tables.Add(new DataTable());
                strRes = "ERROR";
            }
            catch (Exception ex)
            {
                strRes = ex.Message;
                throw ex;
            }

            return ds;
        }

        /// <summary>
        /// Ejecuta una consulta en la base de datos
        /// </summary>
        /// <param name="strQuery">
        /// Consulta a ejecutar
        /// </param>
        /// <param name="strResult">
        /// Resultado de la ejecución de la consulta
        /// </param>
        /// <returns>
        /// DataSet
        /// </returns>
        public DataSet ExecuteQuery(string strQuery, ref string strResult)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            try
            {
                this._sqlConn = new SqlConnection(this._connString);
                using (this._sqlConn)
                {
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Connection = this._sqlConn;
                    cmd.CommandType = CommandType.Text;
                    da.SelectCommand = cmd;

                    da.Fill(ds);

                    strResult = "OK";

                    da.Dispose();
                    cmd.Dispose();
                    this._sqlConn.Close();
                    this._sqlConn.Dispose();
                }
            }
            catch (Exception ex)
            {
                strResult = ex.Message;
            }

            return ds;
        }

        public DataTable ExecQuery(string query, Dictionary<string, object> parameters = null)
        {
            try
            {
                using (var connection = new SqlConnection(_connString))
                {
                    connection.Open();

                    var dataTable = ExecCommand(connection, query, CommandType.Text, parameters);

                    connection.Close();
                    return dataTable;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable ExecSp(string spName, Dictionary<string, object> parameters = null)
        {
            try
            {
                using (var connection = new SqlConnection(_connString))
                {
                    connection.Open();

                    var dataTable = ExecCommand(connection, spName, CommandType.StoredProcedure, parameters);

                    connection.Close();
                    return dataTable;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<DataTable> ExecQueryAsync(string query, Dictionary<string, object> parameters = null)
        {
            try
            {
                using (var connection = new SqlConnection(_connString))
                {
                    await connection.OpenAsync();

                    var dataTable = await ExecCommandAsync(connection, query, CommandType.Text, parameters);

                    connection.Close();
                    return dataTable;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<DataTable> ExecSpAsync(string spName, Dictionary<string, object> parameters = null)
        {
            try
            {
                using (var connection = new SqlConnection(_connString))
                {
                    await connection.OpenAsync();

                    var dataTable = await ExecCommandAsync(connection, spName, CommandType.StoredProcedure, parameters);

                    connection.Close();
                    return dataTable;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private DataTable ExecCommand(
            SqlConnection connection,
            string command,
            CommandType commandType,
            Dictionary<string, object> parameters = null)
        {
            string tableName = commandType == CommandType.StoredProcedure ? $"{command}_Result" : $"Query_Result";
            DataTable dataTable = new DataTable(tableName);

            using (var cmd = new SqlCommand(command)
            {
                Connection = connection,
                CommandType = commandType
            })
            {
                AddCommandParameters(cmd, parameters);

                using (var adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(dataTable);
                    return dataTable;
                }
            }
        }

        private async Task<DataTable> ExecCommandAsync(
            SqlConnection connection,
            string command,
            CommandType commandType,
            Dictionary<string, object> parameters = null)
        {
            string tableName = commandType == CommandType.StoredProcedure ? $"{command}_Result" : $"Query_Result";
            DataTable dataTable = new DataTable(tableName);

            using (var cmd = new SqlCommand(command) {
                Connection = connection,
                CommandType = commandType
            })
            {
                AddCommandParameters(cmd, parameters);

                var reader = await cmd.ExecuteReaderAsync();

                for (int i = 0; i < reader.FieldCount; ++i)
                {
                    dataTable.Columns.Add(reader.GetName(i), reader.GetFieldType(i));
                }

                while (await reader.ReadAsync())
                {
                    var row = dataTable.NewRow();

                    for (int i = 0; i < reader.FieldCount; ++i)
                        row.SetField(i, await reader.GetFieldValueAsync<object>(i));

                    dataTable.Rows.Add(row);
                }

                reader.Close();

                return dataTable;
            }
        }

        private void AddCommandParameters(SqlCommand command, Dictionary<string, object> parameters)
        {
            if (parameters != null)
            {
                foreach (var parameter in parameters)
                {
                    command.Parameters.AddWithValue("@" + parameter.Key, parameter.Value);
                }
            }
        }


    }
}