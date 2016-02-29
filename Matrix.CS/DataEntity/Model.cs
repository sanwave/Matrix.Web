using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Matrix.CS
{
    public class Message
    {
        public Message() { }

        public Message(long id, string composer, string content, DateTime post_time, int support,
            int oppose, int reply_num, int report, long reply_msgid)
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

    public class Comment : Message
    {
        public int m_resourceId;
    }

    public class User
    {
        public int m_id;
        public string m_username;
        public string m_password;
        public string m_salt;
        public string m_passwordHash;
        public string m_ticket;
        public string m_role;
        public string m_email;
        public string m_status;
        public string m_registerTime;
        public string m_registerIp;
        public string m_loginIp;
        public string m_realName;
        public string m_gender;
        public string m_phoneNumber;
    }

    public class Resource
    {
        public int m_id;
        public string m_name;
        public string m_uri;
        public string m_type;
        public string m_format;
        public int m_parentFolder;
        public string m_cover;
        public string m_uploader;
        public string m_composer;
        public string m_description;
    }

    public class WeiboAccessToken
    {
        public string AccessToken;
    }

    public class ZentaoDiary
    {
        public string Department;
        public string WorkType;
        public string Project;
        public DateTime StartDate;
        public int WorkHours;
        public string Content;
    }

    public class ZentaoDiaryTask : ZentaoDiary
    {
        public ZentaoDiaryTask() { }

        public ZentaoDiaryTask(string userName, string password, string department, string workType,
            string project, DateTime startDate, int workHours, string content, string frequency, DateTime updateTime)
        {
            UserName = userName;
            Password = password;
            Department = department;
            WorkType = workType;
            Project = project;
            StartDate = startDate;
            WorkHours = workHours;
            Content = content;
            Frequency = frequency;
            UpdateTime = updateTime;
        }

        public string UserName;
        public string Password;
        public string Frequency;
        public DateTime UpdateTime;
    }
}
