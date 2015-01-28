using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Matrix.Model
{
    public class Message
    {
        public long m_id;
        public string m_content;
        public string m_composer;
        public string m_postIP;
        public DateTime m_postTime;
        public int m_support;
        public int m_oppose;
        public int m_replyNum;
        public int m_report;
        public int m_replyMsgID;
        public int m_replyDepth;
        public int m_replyedDepth;
    }
}
