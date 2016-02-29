
using System.Configuration;

namespace Matrix.CS
{
    public class Variable
    {
        public static class DbConnection
        {
            public static readonly string Matrix =
                ConfigurationManager.ConnectionStrings["MatrixMySqlConString"].ConnectionString;
        }

        public static class AppConnection
        {
            public static class Weibo
            {
                public static string AppKey =
                    ConfigurationManager.AppSettings["WeiboAppKey"].ToString();
                public static string AppSecret =
                    ConfigurationManager.AppSettings["WeiboAppSecret"].ToString();
                public static string ReturnUri =
                    ConfigurationManager.AppSettings["WeiboReturnUri"].ToString();
            }
        }

        public static class MinLength
        {
            public static readonly int UserName = 3;

            public static readonly int Password = 6;
        }

        public static class MaxLength
        {
            public static readonly int UserName = 10;

            public static readonly int Password = 20;
        }

        public static class Regix
        {
            public static readonly string Email =
                @"[a-z0-9]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?";

        }

        public static class State
        {
            public static class User
            {
                public static readonly string inActived = "inActived";
                public static readonly string actived = "Actived";
            }

            public static class Login
            {
                public static readonly string inValid = "inValid";
                public static readonly string valid = "valid";
            }

            public static class WebSite
            {
                public static bool canRegister = false;
                public static bool canLogin = true;
                public static bool canUploadFile = true;
                public static bool canManageResource = true;
            }
        }

        public static class UserRole
        {
            public static readonly string user = "user";
            public static readonly string manager = "manager";
        }

        public static class Default
        {
            public static readonly string anonymousUserName = "无名";

            public static readonly string cloudPath = "/Files";

            public static readonly string messageAttachmentPath = "/Attachments";

            public static readonly string DbConString = DbConnection.Matrix;

        }
    }
}
