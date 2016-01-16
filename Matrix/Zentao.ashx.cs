using Matrix.DataEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace Matrix
{
    /// <summary>
    /// Zentao 的摘要说明
    /// </summary>
    public class Zentao : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Dictionary<string, string> result = new Dictionary<string, string>();
            JavaScriptSerializer jss = new JavaScriptSerializer();

            string currentUsername = context.User.Identity.Name;

            string requestType = SqlHelper.GetString(context.Request["RequestType"]);
            string UserName = SqlHelper.GetString(context.Request["account"]);
            string Password = SqlHelper.GetString(context.Request["password"]);
            string Frequency= SqlHelper.GetString(context.Request["frequency"]);
            string Lang=SqlHelper.GetString(context.Request["lang"]);
            string Department = SqlHelper.GetString(context.Request["department"]);
            string WorkType = SqlHelper.GetString(context.Request["worktype"]);
            string Project = SqlHelper.GetString(context.Request["project"]);
            string StartDate = SqlHelper.GetString(context.Request["date"]);
            string WorkHours = SqlHelper.GetString(context.Request["workhours"]);
            string Content = SqlHelper.GetString(context.Request["content"]);
            Content = System.Web.HttpUtility.UrlEncode(Content);
            string ip;
            if (context.Request.ServerVariables["HTTP_VIA"] != null) // using proxy
                ip = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            else
                ip = context.Request.ServerVariables["REMOTE_ADDR"].ToString();

            Matrix.Model.ZentaoDiaryTask DiaryTask;
            DiaryTask = new Model.ZentaoDiaryTask(UserName, Password, Department, WorkType, Project, Convert.ToDateTime(StartDate), Convert.ToInt32(WorkHours), Content, Frequency, DateTime.Now);

            string response = "";
            if (DiaryTask.Frequency.Equals("once",StringComparison.CurrentCultureIgnoreCase))
            {
                response = SubmitDiary(DiaryTask, Lang);
            }
            else if (DiaryTask.Frequency.Equals("workdayAndSchoolday", StringComparison.CurrentCultureIgnoreCase))
            {
                int ret = AddSubmitDiaryTask(DiaryTask);
                if (1 == ret)
                {
                    response = "addtask_succeed";
                }
                else
                {
                    response = "addtask_failed";
                }
            }
            else
            {
                response = "unknown_frequency";
            }
            
            result.Add("result", response);
            context.Response.ContentType = "text/plain";
            context.Response.Write(jss.Serialize(result));
        }

        public static int AddSubmitDiaryTask(Matrix.Model.ZentaoDiaryTask diaryTask)
        {
            string sqlcmd = string.Format(
                    "insert into t_zentaodiary(username, password, department, worktype, project, startdate, workhours, content, frequency, updatetime) values ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}');",
                    diaryTask.UserName, diaryTask.Password, diaryTask.Department, diaryTask.WorkType, diaryTask.Project, diaryTask.StartDate, diaryTask.WorkHours, diaryTask.Content, diaryTask.Frequency, DateTime.Now);
            int id = MariaDBHelper.ExecuteNonQuery(
                sqlcmd,
                CommandType.Text);
            return id;
        }

        public static string SubmitDiary(Matrix.Model.ZentaoDiaryTask diaryTask, string lang)
        {
            string requestBody = "";
            requestBody += "account=" + diaryTask.UserName + "&";
            requestBody += "password=" + diaryTask.Password + "&";
            requestBody += "lang=" + lang + "&";
            requestBody += "keepLogin[]=on";
            HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create("http://zentao.coship.com:88/zentao/user-login.html");
            httpRequest.Method = "POST";
            httpRequest.ContentType = "application/x-www-form-urlencoded";
            httpRequest.ContentLength = requestBody.Length;
            Stream httpStream = httpRequest.GetRequestStream();
            httpStream.Write(new ASCIIEncoding().GetBytes(requestBody), 0, requestBody.Length);
            httpStream.Close();
            HttpWebResponse response = (HttpWebResponse)httpRequest.GetResponse();
            string cookieSid = "";
            foreach (string cookie in response.Headers.GetValues("Set-Cookie"))
            {
                if (cookie.Contains("sid="))
                {
                    int start = cookie.IndexOf("sid=") + 4;
                    int length = cookie.Substring(start).IndexOf(";");
                    cookieSid = cookie.Substring(start, length);
                    break;
                }
            }
            if (string.IsNullOrEmpty(cookieSid))
            {
                return "login_error";
            }

            requestBody = "department[]=" + diaryTask.Department + "&currentDate=" + diaryTask.StartDate.ToString("yyyy-MM-dd") +
                "&worktype[]=" + diaryTask.WorkType + "&product[]=" + diaryTask.Project + "&time[]=" + diaryTask.WorkHours +
                "&description[]=" + diaryTask.Content + "&bugs=&tasks=&mailto=";
            httpRequest = (HttpWebRequest)WebRequest.Create("http://zentao.coship.com:88/zentao/diary-create.html");
            httpRequest.Method = "POST";
            httpRequest.ContentType = "application/x-www-form-urlencoded";
            httpRequest.ContentLength = requestBody.Length;
            Cookie SessionId = new Cookie("sid", cookieSid);
            httpRequest.CookieContainer = new CookieContainer(1);
            httpRequest.CookieContainer.Add(new Uri("http://zentao.coship.com:88"), SessionId);
            httpStream = httpRequest.GetRequestStream();
            httpStream.Write(new ASCIIEncoding().GetBytes(requestBody), 0, requestBody.Length);
            httpStream.Close();
            response = (HttpWebResponse)httpRequest.GetResponse();
            if (response.StatusCode == HttpStatusCode.OK)
            {
                return "submit_succeed";
            }
            else
            {
                return "submit_error";
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}