using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.IO;
using Matrix.CS;

namespace Matrix
{
    /// <summary>
    /// Handler 的摘要说明
    /// </summary>
    public class Handler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        PageContent pageCon = new PageContent();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            Dictionary<string, string> result = new Dictionary<string, string>();
            JavaScriptSerializer jss = new JavaScriptSerializer();

            string currentUsername = context.User.Identity.Name;
            string requestType = SqlHelper.GetString(context.Request["RequestType"]);
            string content = SqlHelper.GetString(context.Request["Content"]);
            int id = SqlHelper.GetInteger(context.Request["ID"]);
            int page = SqlHelper.GetInteger(context.Request["Page"]);
            string ip;
            if (context.Request.ServerVariables["HTTP_VIA"] != null) // using proxy
                ip = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
            else
                ip = context.Request.ServerVariables["REMOTE_ADDR"].ToString();

            switch (requestType)
            {
                /*
                 * 白板消息用。上传文件的处理代码放在了私有云处
                 */
                case "LoadMessagesByPage":
                    context.Response.Write(pageCon.BuildMessages());
                    return;

                case "LoadMessageTiles":
                    context.Response.Write(pageCon.LoadMessageTiles());
                    return;

                case "PostMessage":
                    new MessageEntity
                    {
                        m_content = content,
                        m_postIP = ip,
                        m_composer = currentUsername,
                        m_postTime = DateTime.Now,
                    }.Post();
                    result.Add("result", "success");
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "ReplyMessage":
                    new MessageEntity
                    {
                        m_content = content,
                        m_composer = currentUsername,
                        m_postIP = ip,
                        m_postTime = DateTime.Now,
                    }.Reply(new MessageEntity
                    {
                        m_id = id,
                    });
                    result.Add("result", "success");
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "ReactMessage":
                    new MessageEntity
                    {
                        m_id = id,
                        m_postIP = ip,
                    }.React(SqlHelper.GetString(context.Request["React"]));
                    result.Add("result", "success");
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "RemoveMessage":
                    if (string.IsNullOrEmpty(currentUsername))
                    {
                        result.Add("result", "failed");
                        result.Add("alertInfo", "您尚未登录");
                    }
                    else
                    {
                        UserEntity currentUser=
                        new UserEntity
                        {
                            m_username = currentUsername,
                        };
                        currentUser.GetUserInfo();
                        if (currentUser.m_role == Variable.UserRole.manager)
                        {
                            new MessageEntity
                            {
                                m_id = id
                            }.Remove();
                            result.Add("result", "success");
                        }
                        else
                        {
                            result.Add("result", "failed");
                            result.Add("alertInfo", "您没有权限移除");
                        }                        
                    }
                    context.Response.Write(jss.Serialize(result));
                    return;


                /*
                 * 评论用。
                 */
                case "LoadCommentsByResourceAndPage":
                    context.Response.Write(pageCon.BuildComments(id));
                    return;

                case "PostComment":
                    new CommentEntity
                    {
                        m_content = content,
                        m_postIP = ip,
                        m_composer = currentUsername,
                        m_resourceId = id,
                        m_postTime = DateTime.Now,
                    }.Post();
                    result.Add("result", "success");
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "ReplyComment":
                    new CommentEntity
                    {
                        m_content = content,
                        m_composer = currentUsername,
                        m_postIP = ip,
                        m_postTime = DateTime.Now,
                    }.Reply(new CommentEntity
                    {
                        m_id = id,
                    });
                    result.Add("result", "success");
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "ReactComment":
                    new CommentEntity
                    {
                        m_id = id,
                        m_postIP = ip,
                    }.React(SqlHelper.GetString(context.Request["React"]));
                    result.Add("result", "success");
                    context.Response.Write(jss.Serialize(result));
                    return;



                /*
                 * 私有云处理代码
                 */
                case "LoadResourceByParent":
                case "LoadVideoById":
                case "LoadMusicById":
                case "LoadPictureById":
                    context.Response.Write(pageCon.BuildResource(id));
                    return;

                case "AddFolder":
                    if (!Variable.State.WebSite.canManageResource || string.IsNullOrEmpty(currentUsername))
                    {
                        result.Add("result", "failed");
                        result.Add("alertInfo", "登录后才能上传或者管理员收回了管理权限");
                    }
                    else if (
                        new ResourceEntity
                        {
                            m_parentFolder = id,
                            m_name = SqlHelper.GetString(context.Request["FolderName"]),
                            m_type = "folder",
                            m_format = "none",
                            m_composer = currentUsername,
                            m_description = ""
                        }.Add() > 0)
                    {
                        result.Add("result", "success");
                    }
                    else
                    {
                        result.Add("result", "failed");
                        result.Add("alertInfo", "文件夹名字不可与当前目录下其他文件夹相同");
                    }
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "UploadFiles":
                    if (!Variable.State.WebSite.canUploadFile ||
                        string.IsNullOrEmpty(currentUsername))
                    {
                        result.Add("result", "failed");
                        result.Add("alertInfo", "登录后才能上传或者管理员关闭了上传接口");
                    }
                    else if (context.Request.Files.Count > 0)
                    {
                        HttpFileCollection files = context.Request.Files;
                        int count = files.Count;
                        for (int i = 0; i < count; i++)
                        {
                            HttpPostedFile file = files[i];
                            String filePath = HttpContext.Current.Server.MapPath("~" + Variable.Default.cloudPath) + new ResourceEntity(id).m_uri;
                            string fileName = Path.GetFileName(file.FileName);
                            string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(file.FileName);
                            String fileExtension = Path.GetExtension(file.FileName).ToLower().Substring(1);
                            string fileType = MimeMapping.GetMimeMapping(fileName).Split('/')[0];
                            int mark = new ResourceEntity
                            {
                                m_parentFolder = id,
                                m_name = fileNameWithoutExtension,
                                m_composer = currentUsername,
                                m_type = fileType,
                                m_format = fileExtension,
                                m_description = "",
                            }.Add();

                            if (mark > 0)
                            {
                                if (!Directory.Exists(filePath))
                                {
                                    Directory.CreateDirectory(filePath);
                                }
                                file.SaveAs(filePath + "/" + fileName);
                            }
                        }
                        result.Add("result", "success");
                    }
                    else
                    {
                        result.Add("result", "failed");
                    }
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "RemoveResource"://移除时若主机在使用该资源，则可能删除失败
                    ResourceEntity resource = new ResourceEntity(id);
                    if (!Variable.State.WebSite.canManageResource || string.IsNullOrEmpty(currentUsername))
                    {
                        result.Add("result", "failed");
                        result.Add("alertInfo", "登录后才能上传或者管理员收回了管理权限");
                    }
                    else
                    {
                        string removeUri = HttpContext.Current.Server.MapPath("~" + Variable.Default.cloudPath) + resource.m_uri;
                        resource.Remove(removeUri);
                        result.Add("result", "success");
                    }
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "UploadMessageAttachments":
                    /*if (!Variable.State.WebSite.canUploadFile ||
                        string.IsNullOrEmpty(currentUsername))
                    {
                        result.Add("result", "failed");
                        result.Add("alertInfo", "登录后才能上传或者管理员关闭了上传接口");
                    }
                    else */if (context.Request.Files.Count > 0)
                    {
                        HttpFileCollection files = context.Request.Files;
                        int count = files.Count;
                        string fileMessage = "<p>我分享了文件</p>";
                        for (int i = 0; i < count; i++)
                        {
                            HttpPostedFile file = files[i];

                            string fileDatePath = "/" + DateTime.Now.ToString("yyyyMMdd");
                            String filePath = HttpContext.Current.Server.MapPath("~" + Variable.Default.messageAttachmentPath) + fileDatePath;
                            string fileName = Path.GetFileName(file.FileName);
                            string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(file.FileName);
                            String fileExtension = Path.GetExtension(file.FileName).ToLower().Substring(1);
                            string filePhysicsName = fileNameWithoutExtension + "." + Guid.NewGuid().ToString().Substring(0, 7) + "." + fileExtension;

                            if (!Directory.Exists(filePath))
                            {
                                Directory.CreateDirectory(filePath);
                            }
                            file.SaveAs(filePath + "/" + filePhysicsName);
                            string fileUrl = Variable.Default.messageAttachmentPath + fileDatePath + "/" + filePhysicsName;
                            fileMessage += "<p><a href=\"" + fileUrl + "\">" + fileName + "</a></p>";
                            if (fileExtension == "mp3")
                            {
                                fileMessage += "<audio controls=\"controls\">";
                                fileMessage += "<source src=\"" + fileUrl + "\">";
                                fileMessage += "</audio>";
                            }
                            else if (MimeMapping.GetMimeMapping(fileName).Contains("image"))
                            {
                                fileMessage += "<img onclick=\"changeAttachImageWidth(this)\" src=\"" + fileUrl + "\"/>";
                            }
                        }
                        new MessageEntity
                        {
                            m_content = fileMessage,
                            m_postIP = ip,
                            m_composer = currentUsername,
                            m_postTime = DateTime.Now,
                        }.Post();
                        result.Add("result", "success");
                    }
                    else
                    {
                        result.Add("result", "failed");
                    }
                    context.Response.Write(jss.Serialize(result));
                    return;



                /*
                 * 本站用户注册登录代码
                 */
                case "RegisterUser":
                    if (Variable.State.WebSite.canRegister)
                    {
                        new UserEntity
                        {
                            m_username = SqlHelper.GetString(context.Request["UserName"]),
                            m_password = SqlHelper.GetString(context.Request["Password"]),
                            m_email = SqlHelper.GetString(context.Request["Email"]),
                        }.Register();
                        result.Add("result", "success");
                    }
                    else
                    {
                        result.Add("result", "failed");
                        result.Add("alert", "管理员关闭了注册接口");
                    }
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "LoginUser":
                    string loginUsername = SqlHelper.GetString(context.Request["UserName"]);
                    string loginTicket = Guid.NewGuid().ToString();
                    int loginStatus = new UserEntity
                    {
                        m_username = loginUsername,
                        m_password = SqlHelper.GetString(context.Request["Password"]),
                        m_ticket = loginTicket,
                        m_loginIp = ip,
                    }.Login();
                    if (Variable.State.WebSite.canLogin &&
                        loginStatus > 0)
                    {
                        result.Add("result", "success");
                        HttpCookie userCookie = UserIdentityRegister(loginUsername, "");
                        context.Response.Cookies.Add(userCookie);
                        context.Request.Cookies[FormsAuthentication.FormsCookieName].Expires = DateTime.Now.AddMonths(3);
                    }
                    else
                    {
                        result.Add("result", "failed");
                    }
                    context.Response.Write(jss.Serialize(result));
                    return;

                case "LoginByWeibo":
                    string loginUrl = "";//new Weibo().GetLoginUrl();
                    context.Response.Redirect(loginUrl, true);
                    break;

                case "GetWeiboAccessToken":
                    string weiboAccessToken = SqlHelper.GetString(context.Request["code"]);
                    UserEntity user = new UserEntity();
                    if (user.LoginByWeibo(weiboAccessToken) == 1)
                    {
                        context.Response.Cookies.Add(UserIdentityRegister(user.m_username, ""));
                        context.Request.Cookies[FormsAuthentication.FormsCookieName].Expires = DateTime.Now.AddMonths(1);
                        context.Response.Redirect("/", true);
                    }
                    else
                    {
                        context.Response.Redirect("/User/Login.aspx", true);
                    }
                    break;




                    /*
                     * 开发用 
                     */
                case "ValidateXml":
                    //int z= Bussiness.Develop.ValidateXml(content);
                    //System.Xml.XmlReaderSettings settings = new System.Xml.XmlReaderSettings();
                    //settings.ConformanceLevel = System.Xml.ConformanceLevel.Fragment;
                    //settings.IgnoreWhitespace = true;
                    //settings.IgnoreComments = true;
                    //System.Xml.XmlReader reader = System.Xml.XmlReader.Create(new StringReader(content), settings);
                    CS.Develop.XmlValidateError error;
                    content=HttpUtility.HtmlDecode(content);
                    CS.Develop.ValidateXml(content, out error);
                    string errorInfo = string.Format("第{0}行{1}列{2}与第{3}行{4}列{5}不匹配",
                        error.ErrorHead.Line,error.ErrorHead.Row,error.NodeName1,
                        error.ErrorFoot.Line,error.ErrorFoot.Row,error.NodeName2);
                    if (error.ErrorNum==-1)
                    {
                        result.Add("result", "failed");
                        result.Add("alert", "Xml语法错误");
                    }
                    else if (error.ErrorNum > 0)
                    {
                        result.Add("result", "failed");

                        result.Add("alert", errorInfo);
                    }
                    else
                    {
                        result.Add("result", "success");
                    }
                    context.Response.Write(jss.Serialize(result));
                    break;


                default:
                    break;
            }
            
        }

        public HttpCookie UserIdentityRegister(string username,string role)
        {
            Boolean isPersist = true;
            FormsAuthenticationTicket ticket =
                new FormsAuthenticationTicket(3, username, DateTime.Now, DateTime.Now.AddMonths(2), isPersist, role);
            string HashTicket = System.Web.Security.FormsAuthentication.Encrypt(ticket);
            HttpCookie UserCookie = new HttpCookie(FormsAuthentication.FormsCookieName, HashTicket);
            return UserCookie;            
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