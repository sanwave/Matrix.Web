using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
//using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace Matrix.CS
{
    public class MessageEntity:Message
    {
        public MessageEntity() { }

        public static void GetMsgListByPage(int page, out List<Message> msgs)
        {
            List<Message> buff = new List<Message>();            
            MariaDBHelper.ExecuteReader(
                "GetMessageByPage",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    while (dataReader.Read())
                    {
                        long id = Convert.ToInt64(MariaDBHelper.GetData(dataReader, "Id"));
                        string composer = MariaDBHelper.GetData(dataReader, "Composer");
                        string content = MariaDBHelper.GetData(dataReader, "Content");
                        DateTime post_time = Convert.ToDateTime(MariaDBHelper.GetData(dataReader, "PostTime"));
                        int support = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Support"));
                        int oppose = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Oppose"));
                        int reply_num = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ReplyNum"));
                        int report = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Report"));
                        long reply_msgid = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "ReplyMsgID"));

                        buff.Add(new Message(id, composer, content, post_time, support, oppose, reply_num, report, reply_msgid));
                    }
                },
                new MySqlParameter("@Page", page)
            );

            msgs = new List<Message>(buff.ToArray());
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
