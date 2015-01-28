using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Matrix.DataEntity;
using Matrix.Model;
using System.Data;
using MySql.Data.MySqlClient;

namespace Matrix.Bussiness
{
    public class CommentEntity:Model.Comment
    {
        public CommentEntity() { }

        public CommentEntity(int id)
        {
            MariaDBHelper.ExecuteReader(
                "call GetCommentByID",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    if (dataReader.Read())
                    {
                        m_id =id;
                        m_resourceId = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ResourceId"));
                        m_composer = MariaDBHelper.GetData(dataReader, "Composer");
                        m_content = MariaDBHelper.GetData(dataReader, "Content");
                        m_postTime = Convert.ToDateTime(MariaDBHelper.GetData(dataReader, "PostTime"));
                        m_support = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Support"));
                        m_oppose = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Oppose"));
                        m_replyNum = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ReplyNum"));
                        m_report = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Report"));
                        m_replyMsgID = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ReplyMsgID"));
                        m_replyDepth = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ReplyDepth"));
                        m_replyedDepth = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ReplyedDepth"));
                    }
                },
                new MySqlParameter("@Id", id)
                );
        }

        public static List<int> GetListByResourceAndPage(int id, int page)
        {
            List<int> list = new List<int>();

            MariaDBHelper.ExecuteReader(
                "call GetCommentsByResourceID",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    while (dataReader.Read())
                    {
                        list.Add(Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ID")));
                    }
                },
                new MySqlParameter("ResourceID", id)
            );
            return list;
        }

        public static int GetCount()
        {
            object count = MariaDBHelper.ExecuteScalar(
                "call GetCommentsCount",
                CommandType.StoredProcedure);
            return Convert.ToInt32(count);
        }

        public int Post()
        {
            object id = MariaDBHelper.ExecuteScalar(
                "call PostComment",
                CommandType.StoredProcedure,
                new MySqlParameter("ResourceID", m_resourceId),
                new MySqlParameter("Content", m_content),
                new MySqlParameter("Composer", m_composer),
                new MySqlParameter("PostIP", m_postIP),
                new MySqlParameter("PostTime", m_postTime)
                );
            return Convert.ToInt32(id);
        }

        public int Reply(CommentEntity cmt)
        {
            return MariaDBHelper.ExecuteNonQuery(
                "call ReplyCommentById",
                CommandType.StoredProcedure,
                new MySqlParameter("SourceId", cmt.m_id),
                new MySqlParameter("Content", m_content),
                new MySqlParameter("Now", m_postTime),
                new MySqlParameter("Composer", m_composer),
                new MySqlParameter("PostIP", m_postIP)
            );
        }

        public int React(string react)
        {
            switch (react.ToLower())
            {
                case "support":
                case "oppose":
                case "report":
                    return MariaDBHelper.ExecuteNonQuery(
                        string.Format("UPDATE T_Comment SET {0} = {0} + 1, F_ReactLastIP = @Ip WHERE F_Id = @Id", "F_" + react),
                        CommandType.Text,
                        new MySqlParameter("Id", m_id),
                        new MySqlParameter("Ip", m_postIP)
                        );

                default:
                    return -1;
            }
        }
    }
}
