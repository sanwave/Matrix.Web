using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Matrix.DataEntity
{
    public class Modeld
    {
        public class Message
        {
            
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
    }
}
