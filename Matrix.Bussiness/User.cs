using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Matrix.DataEntity;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Data;
using MySql.Data.MySqlClient;

namespace Matrix.Bussiness
{
    public class UserEntity:Model.User
    {
        public int Register()
        {
            if (m_username.Length >= Matrix.DataEntity.Variable.MinLength.UserName &&
                m_password.Length >= Matrix.DataEntity.Variable.MinLength.Password &&
                new Regex(Matrix.DataEntity.Variable.Regix.Email).IsMatch(m_email.ToLower()))
            {
                string salt = Guid.NewGuid().ToString();
                object uid = MariaDBHelper.ExecuteScalar(
                    "RegisterUser",
                    CommandType.StoredProcedure,
                    new MySqlParameter("UserName", m_username),
                    new MySqlParameter("Salt", salt),
                    new MySqlParameter("UserNameHash", MariaDBHelper.GetHashCode(m_username + salt)),
                    new MySqlParameter("PasswordHash", MariaDBHelper.GetHashCode(m_password + salt)),
                    new MySqlParameter("UserRole", Variable.UserRole.user),
                    new MySqlParameter("Status", Variable.State.User.inActived),
                    new MySqlParameter("Email", m_email),
                    new MySqlParameter("RegisterTime", DateTime.Now)
                    );
                return Convert.ToInt32(uid);
            }
            else
            {
                return -1;
            }
        }

        public void GetUserInfo()
        {
            MariaDBHelper.ExecuteReader(
                "call GetUserByUsername",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    if (dataReader.Read())
                    {
                        m_id = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "Id"));
                        m_salt = Convert.ToString(MariaDBHelper.GetData(dataReader, "Salt"));
                        m_status = Convert.ToString(MariaDBHelper.GetData(dataReader, "Status"));
                        m_gender = Convert.ToString(MariaDBHelper.GetData(dataReader, "Gender"));
                        m_realName = Convert.ToString(MariaDBHelper.GetData(dataReader, "RealName"));
                        m_phoneNumber = Convert.ToString(MariaDBHelper.GetData(dataReader, "PhoneNumber"));
                        m_role = Convert.ToString(MariaDBHelper.GetData(dataReader, "UserRole"));
                        m_registerTime = Convert.ToString(MariaDBHelper.GetData(dataReader, "RegisterTime"));
                        m_email = Convert.ToString(MariaDBHelper.GetData(dataReader, "Email"));
                    }
                },
                new MySqlParameter("@UserName", m_username)
            );
        }

        public int Login()
        {
            string salt = string.Empty, passwordHash = string.Empty;
            MariaDBHelper.ExecuteReader(
                "call GetUserByUsername",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    if (dataReader.Read())
                    {
                        salt = MariaDBHelper.GetData(dataReader, "Salt");
                        passwordHash = MariaDBHelper.GetData(dataReader, "PasswordHash");
                    }
                },
                new MySqlParameter("UserName", m_username)
            );
            if (m_username.Length <= Matrix.DataEntity.Variable.MinLength.UserName &&
                m_password.Length <= Matrix.DataEntity.Variable.MinLength.Password)
            {
                return -1;
            }
            else if (MariaDBHelper.GetHashCode(m_password + salt) == passwordHash)
            {
                object loginId = MariaDBHelper.ExecuteScalar(
                    "call LoginUser",
                    CommandType.StoredProcedure,
                    new MySqlParameter("Ticket", m_ticket),
                    new MySqlParameter("UserName", m_username),
                    new MySqlParameter("LoginIP", m_loginIp),
                    new MySqlParameter("LoginTime", DateTime.Now),
                    new MySqlParameter("Status", Variable.State.Login.valid)
                    );
                return Convert.ToInt32(loginId);
            }
            else
            {
                return 0;
            }
        }
        public int LoginByWeibo(string code)
        {
            int loginStatus = 0;
            int uid = 0;// new Weibo(code).Login();
            MariaDBHelper.ExecuteReader(
                "call GetUserByWeibo",
                CommandType.StoredProcedure,
                (MySqlDataReader dataReader) =>
                {
                    if (dataReader.Read())
                    {
                        m_username = MariaDBHelper.GetData(dataReader, "Username");
                        m_role = MariaDBHelper.GetData(dataReader, "UserRole");
                        loginStatus = 1;
                    }
                },
                new MySqlParameter("@WeiboUserId", uid)
            );
            return loginStatus;
        }
    }
}
