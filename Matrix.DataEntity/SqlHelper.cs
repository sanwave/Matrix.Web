using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace Matrix.DataEntity
{
    public class SqlHelper
    {
        static String strDataBaseCon = Variable.Default.DbConString;

        public static string GetString(object data)
        {
            if (data == null)
                return string.Empty;
            else
                return data.ToString().Trim();
        }

        public static int GetInteger(object data)
        {
            if (new Regex(@"^[0-9]\d*$").IsMatch(GetString(data)))
                return Convert.ToInt32(data);
            else
                return -1;
        }

        public static String GetHashCode(String data)
        {
            Byte[] source = Encoding.UTF8.GetBytes(data);
            Byte[] hash = new SHA256Managed().ComputeHash(source);
            return Convert.ToBase64String(hash);
        }

        /// <summary>
        /// 获取指定SqlDataReader指定索引的值
        /// </summary>
        /// <param name="reader">指定SqlDataReader</param>
        /// <param name="index">指定索引</param>
        /// <returns></returns>
        public static string GetData(SqlDataReader reader, string index)
        {
            if (reader==null || reader[index] == DBNull.Value)
                return string.Empty;
            else
                return reader[index].ToString().Trim();
        }
        
        /// <summary>
        /// 读取数据委托
        /// </summary>
        /// <param name="reader">指定SqlDataReader引用</param>
        /// <returns></returns>
        public delegate void readData(SqlDataReader reader);

        /// <summary>
        /// 查询语句。
        /// </summary>
        /// <param name="cmdText">指定SQL查询语句</param>
        /// <returns>返回整型。-1表示语句有问题，0表示查询成功</returns>
        public static void ExecuteReader(String cmdText, CommandType cmdType, readData callback, params SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(strDataBaseCon))
            {                
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    cmd.CommandType = cmdType;
                    cmd.Parameters.AddRange(parameters);
                    conn.Open();
                    SqlDataReader sqlReader = cmd.ExecuteReader();
                    callback(sqlReader);
                }
            }
        }
        
        /// <summary>
        /// 执行语句。返回受影响行数
        /// </summary>
        /// <param name="cmdText">要执行的语句</param>
        /// <returns>返回受影响行数</returns>
        public static int ExecuteNonQuery(String cmdText, CommandType cmdType, params SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(strDataBaseCon))
            {                
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    cmd.CommandType = cmdType;
                    cmd.Parameters.AddRange(parameters);
                    conn.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }
        
        /// <summary>
        /// 执行查询，并返回查询所返回的结果集中第一行的第一列。 忽略其他列或行
        /// </summary>
        /// <param name="cmdText">执行查询语句</param>
        /// <returns>结果集中第一行的第一列；如果结果集为空，则为空引用</returns>
        public static object ExecuteScalar(String cmdText, CommandType cmdType, params SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(strDataBaseCon))
            {
                using (SqlCommand cmd = new SqlCommand(cmdText, conn))
                {
                    cmd.CommandType = cmdType;
                    cmd.Parameters.AddRange(parameters);
                    conn.Open();
                    return cmd.ExecuteScalar();
                }
            }
        }
        
    }
}
