using Matrix.DataEntity;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Caching;
using System.Web.Security;
using System.Web.SessionState;

namespace Matrix
{
    public class Global : System.Web.HttpApplication
    {
        public void AddTask(int seconds, Action todo)
        {
            HttpRuntime.Cache.Insert(
                Guid.NewGuid().ToString(),
                0,
                null,
                DateTime.Now.AddSeconds(seconds),
                Cache.NoSlidingExpiration,
                CacheItemPriority.NotRemovable,
                (key, value, reason) =>
                {
                    todo.Invoke();
                    AddTask(seconds, todo);
                });
        }

        public void SubmitDiary()
        {
            Matrix.Model.ZentaoDiaryTask DiaryTask=new Model.ZentaoDiaryTask();
            MariaDBHelper.ExecuteReader(
                "select username, password, department, worktype, project, startdate, workhours, content, frequency, updatetime from t_zentaodiary;"+
                "update t_zentaodiary set updatetime='"+DateTime.Now.ToString()+"';",
                CommandType.Text,
                (MySqlDataReader dataReader) =>
                {
                    while (dataReader.Read())
                    {
                        DiaryTask = new Model.ZentaoDiaryTask
                        {
                            UserName = MariaDBHelper.GetData(dataReader, "username"),
                            Password = MariaDBHelper.GetData(dataReader, "password"),
                            Department = MariaDBHelper.GetData(dataReader, "department"),
                            WorkType = MariaDBHelper.GetData(dataReader, "worktype"),
                            Project = MariaDBHelper.GetData(dataReader, "project"),
                            StartDate = Convert.ToDateTime(MariaDBHelper.GetData(dataReader, "startdate")),
                            WorkHours = Convert.ToInt32(MariaDBHelper.GetData(dataReader, "workhours")),
                            Content = MariaDBHelper.GetData(dataReader, "content"),
                            Frequency = MariaDBHelper.GetData(dataReader, "frequency"),
                            UpdateTime= Convert.ToDateTime(MariaDBHelper.GetData(dataReader, "updatetime"))
                        };
                    }

                    if (DiaryTask.UpdateTime.Date < DateTime.Now.Date && !string.IsNullOrEmpty(DiaryTask.UserName))
                    {
                        Zentao.SubmitDiary(DiaryTask, "zh-cn");
                    }
                }
                );


            
            return;
        }

        public static void SendDiaryToZentaoServer()
        {

        }

        protected void Application_Start(object sender, EventArgs e)
        {
            AddTask(43200, SubmitDiary);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            if (HttpContext.Current.User != null)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                        FormsAuthenticationTicket ticket = id.Ticket;

                        // Get the stored user-data, in this case, our roles
                        string userData = ticket.UserData;
                        string[] roles = userData.Split(',');
                        HttpContext.Current.User = new GenericPrincipal(id, roles);

                        Response.Cookies["usernameForMatrix"].Value = User.Identity.Name;
                    }
                }
            }
        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}