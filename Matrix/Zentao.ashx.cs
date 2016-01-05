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
            string account = SqlHelper.GetString(context.Request["account"]);
            string password = SqlHelper.GetString(context.Request["password"]);
            string frequency= SqlHelper.GetString(context.Request["frequency"]);
            string lang=SqlHelper.GetString(context.Request["lang"]);
            string department = SqlHelper.GetString(context.Request["department"]);
            string worktype = SqlHelper.GetString(context.Request["worktype"]);
            string project = SqlHelper.GetString(context.Request["project"]);
            string startdate = SqlHelper.GetString(context.Request["date"]);
            string workhours = SqlHelper.GetString(context.Request["workhours"]);
            string content = SqlHelper.GetString(context.Request["content"]);
            content = System.Web.HttpUtility.UrlEncode(content);
            string ip;
            if (context.Request.ServerVariables["HTTP_VIA"] != null) // using proxy
                ip = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            else
                ip = context.Request.ServerVariables["REMOTE_ADDR"].ToString();

            string response = "";
            if (frequency.Equals("once",StringComparison.CurrentCultureIgnoreCase))
            {
                response = SubmitDiary(account, password, lang, department, worktype, project, startdate, workhours, content);
            }
            else if (frequency.Equals("workdayAndSchoolday", StringComparison.CurrentCultureIgnoreCase))
            {
                int ret = AddSubmitDiaryTask(account, password, lang, department, worktype, project, startdate, workhours, content, frequency);
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

        public static int AddSubmitDiaryTask(string account, string password, string lang, string department,
            string worktype, string project, string startdate, string workhours, string content, string frequency)
        {
            string sqlcmd = string.Format(
                    "insert into t_zentaodiary(username, password, department, worktype, startdate, workhours, content, frequency) values ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7});",
                    account, password, department, worktype, startdate, workhours, content, frequency);
            int id = MariaDBHelper.ExecuteNonQuery(
                sqlcmd,
                CommandType.Text);
            return id;
        }

        public static string SubmitDiary(string account, string password, string lang, string department,
            string worktype, string project, string date, string workhours, string content)
        {
            string requestBody = "";
            requestBody += "account=" + account + "&";
            requestBody += "password=" + password + "&";
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

            requestBody = "department[]=" + department + "&currentDate=" + date +
                "&worktype[]=" + worktype + "&product[]=" + project + "&time[]=" + workhours +
                "&description[]=" + content + "&bugs=&tasks=&mailto=";
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