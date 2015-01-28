using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Matrix.DataEntity;
using Matrix.Model;
using System.Data;
//using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace Matrix.Bussiness
{
    public class MessageEntity:Model.Message
    {
        public MessageEntity() { }

        public MessageEntity(long id)
        {
            MariaDBHelper.ExecuteReader(
                "GetMessageById",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    if (dataReader.Read())
                    {
                        m_id = Convert.ToInt64(MariaDBHelper.GetData(dataReader, "Id"));
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

        public static List<int> GetListByPage(){
            List<int> list = new List<int>();
            MariaDBHelper.ExecuteReader(
                "GetMessageIDsByPage",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    while (dataReader.Read())
                    {
                        list.Add(Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Id")));
                    }
                }
            );
            return list;
        }

        public static int GetCount()
        {
            object count = MariaDBHelper.ExecuteScalar(
                "GetMessagesCount",
                CommandType.StoredProcedure);
            return Convert.ToInt32(count);
        }

        public int Post() {
            object id = MariaDBHelper.ExecuteScalar(
                "PostMessage",
                CommandType.StoredProcedure,
                new MySqlParameter("Content", m_content),
                new MySqlParameter("Composer", m_composer),
                new MySqlParameter("PostIP", m_postIP),
                new MySqlParameter("PostTime", m_postTime)
                );

            //new Weibo().Post(m_content);

            return Convert.ToInt32(id);
        }

        public int Reply(MessageEntity msg)
        {
            return MariaDBHelper.ExecuteNonQuery(
                "ReplyMessageById",
                CommandType.StoredProcedure,
                new MySqlParameter("Content", m_content),
                new MySqlParameter("Now", m_postTime),
                new MySqlParameter("Composer", m_composer),
                new MySqlParameter("PostIP", m_postIP),
                new MySqlParameter("SourceID", msg.m_id)
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
                        string.Format("UPDATE t_message SET {0} = {0} + 1, F_ReactLastIP = @Ip WHERE F_ID = @Id", "F_"+react),
                        CommandType.Text,
                        new MySqlParameter("Id", m_id),
                        new MySqlParameter("Ip", m_postIP)
                        );

                default:
                    return -1;
            }
        }

        public int Remove()
        {
            return MariaDBHelper.ExecuteNonQuery(
                "RemoveMessage",
                CommandType.StoredProcedure,
                new MySqlParameter("Id", m_id)
            );
        }
    }
}
