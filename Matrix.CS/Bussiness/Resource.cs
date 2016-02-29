using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using MySql.Data.MySqlClient;

namespace Matrix.CS
{
    public class ResourceEntity:Resource
    {
        public ResourceEntity() { }

        public ResourceEntity(int id)
        {
            MariaDBHelper.ExecuteReader(
                "GetResourceById",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    if (dataReader.Read())
                    {
                        m_id = id;
                        m_parentFolder = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ParentFolder"));
                        m_name = MariaDBHelper.GetData(dataReader, "Name");
                        m_uri = MariaDBHelper.GetData(dataReader, "Uri");
                        m_cover = MariaDBHelper.GetData(dataReader, "Cover");
                        m_type = MariaDBHelper.GetData(dataReader, "Type");
                        m_format = MariaDBHelper.GetData(dataReader, "Format");
                        m_composer = MariaDBHelper.GetData(dataReader, "Composer");
                        m_description = MariaDBHelper.GetData(dataReader, "Description");
                    }
                },
                new MySqlParameter("@Id", id)
            );
        }

        public List<int> GetChildren()
        {
            List<int> children = new List<int>();
            MariaDBHelper.ExecuteReader(
                "GetResourceChildren",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    while (dataReader.Read())
                    {
                        children.Add(Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Id")));
                    }
                },
                new MySqlParameter("@Id", m_id)
                );
            return children;
        }

        public int Add()
        {
            return MariaDBHelper.ExecuteNonQuery(
                "AddResource",
                CommandType.StoredProcedure,
                new MySqlParameter("Parent", m_parentFolder),
                new MySqlParameter("Name", m_name),
                new MySqlParameter("Type", m_type),
                new MySqlParameter("Format", m_format),
                new MySqlParameter("Composer", m_composer),
                new MySqlParameter("Description", m_description)
            );
        }

        public int Remove(string path)
        {
            if (m_type.ToLower() == "folder" && Directory.Exists(path))
            {
                Directory.Delete(path, true);
            }
            else if (File.Exists(path))
            {
                File.Delete(path);
            }
            return MariaDBHelper.ExecuteNonQuery(
                "RemoveResource",
                CommandType.StoredProcedure,
                new MySqlParameter("@ResourceId", m_id)
                );
        }
    }
}
