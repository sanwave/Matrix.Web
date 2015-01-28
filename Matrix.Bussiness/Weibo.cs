using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Matrix.Model;
using Matrix.DataEntity;

//using NetDimension.Weibo;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;

/*
namespace Matrix.Bussiness
{
    public class Weibo:WeiboAccessToken
    {
        public static string AppKey=Variable.AppConnection.Weibo.AppKey;
        public static string AppSecret=Variable.AppConnection.Weibo.AppSecret;
        public static string CallBackUri=Variable.AppConnection.Weibo.ReturnUri;

        public static string accessTokenCode;

        OAuth oAuth;
        static Client Sina;
        string sinaUId;

        public Weibo()
        {
            oAuth = new OAuth(AppKey, AppSecret, CallBackUri);
            MariaDBHelper.ExecuteReader(
                "GetUserByUsername",
                CommandType.StoredProcedure,
                (dataReader) => 
                {
                    if (dataReader.Read())
                    {
                        sinaUId = MariaDBHelper.GetData(dataReader, "WeiboUserId");
                    }
                },
                new MySqlParameter("UserName", "sanwave")
            );
            MariaDBHelper.ExecuteReader(
                "GetWeiboUser",
                CommandType.StoredProcedure,
                (dataReader) =>
                {
                    if (dataReader.Read())
                    {
                        accessTokenCode = MariaDBHelper.GetData(dataReader, "AccessTokenCode");
                    }
                },
                new MySqlParameter("@WeiboUserId", sinaUId)
            );
        }

        public Weibo(string code)
        {
            oAuth = new OAuth(AppKey, AppSecret, CallBackUri);
            accessTokenCode = code;
        }

        public static DateTime TransDate(string strDate)
        {
            System.Globalization.CultureInfo cultureInfo =
                System.Globalization.CultureInfo.CreateSpecificCulture("en-US");
            string format = "ddd MMM dd HH:mm:ss zz00 yyyy";
            DateTime dateTime = DateTime.ParseExact(strDate, format, cultureInfo); // 将字符串转换成日期
            return dateTime;
        }

        public dynamic GetFriendsTimeLine(int num)
        {
            return Sina.API.Dynamic.Statuses.FriendsTimeline(count: 100);
        }

        public string GetLoginUrl()
        {            
            return oAuth.GetAuthorizeURL() ;
        }

        public int Login()
        {
            AccessToken accessToken = oAuth.GetAccessTokenByAuthorizationCode(accessTokenCode); //请注意这里返回的是AccessToken对象，不是string
            Sina = new Client(oAuth);
            sinaUId = Sina.API.Entity.Account.GetUID();
            var user = Sina.API.Dynamic.Users.Show(sinaUId);
            MariaDBHelper.ExecuteNonQuery(
                "UpdateWeiboUser",
                CommandType.StoredProcedure,
                new MySqlParameter("WeiboUserId",user.id),
                new MySqlParameter("Name",user.name),
                new MySqlParameter("AccessTokenCode", accessTokenCode),
                new MySqlParameter("CreatedAt", TransDate(user.created_at))
                );
            return Convert.ToInt32(sinaUId);
        }

        public int LoadTimeLine()
        {
            var json = Sina.API.Dynamic.Statuses.FriendsTimeline(count: 10);
            return 0;
        }
        /*
        public int TestMessage(string msg)
        {
            var weiboUser = Sina.API.Entity.Users.Show(sinaUId);
            var statusInfo = Sina.API.Entity.Statuses.Update(
                string.Format(
                "我是{0}，我来自{1}，我在{2}测试新浪微博应用:{3}", 
                weiboUser.ScreenName, 
                weiboUser.Location,
                DateTime.Now.ToShortTimeString(),
                msg));
            //加个当前时间防止重复提交报错。
            return 0;
        }* /

        public int Post(string msg)
        {
            //获取微薄用户信息用
            //var weiboUser = Sina.API.Entity.Users.Show(sinaUId);
            var statusInfo = Sina.API.Entity.Statuses.Update(msg);
            return 0;
        }

    }
}
*/