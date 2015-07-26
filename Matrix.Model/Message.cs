using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Matrix.Model
{
    public class Message
    {
        public Message() { }

        public Message(long id, string composer, string content, DateTime post_time, int support, int oppose, int reply_num, int report, long reply_msgid) 
        {
            m_id = id;
            m_composer = composer;
            m_content = content;
            m_postTime = post_time;
            m_support = support;
            m_oppose = oppose;
            m_replyNum = reply_num;
            m_report = report;
            m_replyMsgID = reply_msgid;
        }

        public Message(Message copy)
        {
            m_id = copy.m_id;
            m_composer = copy.m_composer;
            m_content = copy.m_content;
            m_postTime = copy.m_postTime;
            m_support = copy.m_support;
            m_oppose = copy.m_oppose;
            m_replyNum = copy.m_replyNum;
            m_report = copy.m_report;
            m_replyMsgID = copy.m_replyMsgID;
        }

        public long m_id;
        public string m_content;
        public string m_composer;
        public string m_postIP;
        public DateTime m_postTime;
        public int m_support;
        public int m_oppose;
        public int m_replyNum;
        public int m_report;
        public long m_replyMsgID;
    }
}
