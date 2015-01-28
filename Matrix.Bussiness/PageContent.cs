using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Matrix.DataEntity;

namespace Matrix.Bussiness
{
    public class PageContent
    {
        JavaScriptSerializer jss = new JavaScriptSerializer();
        
        public string BuildMessages()
        {
            Dictionary<string, string> element = new Dictionary<string, string>();
            Dictionary<string, Dictionary<string, string>> elements = new Dictionary<string, Dictionary<string, string>>();
            List<int> messageIDs = MessageEntity.GetListByPage();
            
            element = new Dictionary<string, string>();
            element.Add("id", "0");
            element.Add("count", MessageEntity.GetCount().ToString());
            elements.Add("message", element);
            
            foreach (int messageID in messageIDs)
            {
                int mid = messageID;
                while (mid > 0)
                {
                    MessageEntity msg = new MessageEntity(mid);
                    element = new Dictionary<string, string>();
                    element.Add("id", msg.m_id.ToString());
                    element.Add("composer", msg.m_composer);
                    element.Add("content", msg.m_content);
                    element.Add("postTime", msg.m_postTime.ToString());
                    element.Add("support", msg.m_support.ToString());
                    element.Add("oppose", msg.m_oppose.ToString());
                    element.Add("replyNum", msg.m_replyNum.ToString());
                    element.Add("report", msg.m_report.ToString());
                    element.Add("replyMsgID", msg.m_replyMsgID.ToString());
                    element.Add("replyDepth", msg.m_replyDepth.ToString());
                    element.Add("replyedDepth", msg.m_replyedDepth.ToString());
                    elements.Add(Guid.NewGuid().ToString(), element);
                    mid = msg.m_replyMsgID;
                }
            }

            /*var json = new Weibo().GetFriendsTimeLine(100);
            if (json.IsDefined("statuses"))
            {
                foreach (var status in json.statuses)
                {
                    //不知道干什么用
                    if (!status.IsDefined("user"))
                        continue;

                    element = new Dictionary<string, string>();
                    element.Add("id", status.id.ToString());
                    element.Add("composer", status.user.screen_name);
                    element.Add("content", status.text);
                    element.Add("postTime", Weibo.TransDate(status.created_at).ToString("yyyy-MM-dd HH:mm:ss"));
                    element.Add("support", "0");
                    element.Add("oppose", "0");
                    element.Add("replyNum", status.comments_count);
                    element.Add("report", "0");
                    element.Add("thumbnail_pic", status.IsDefined("thumbnail_pic") ? status.thumbnail_pic : "");
                    element.Add("bmiddle_pic", status.IsDefined("bmiddle_pic") ? status.bmiddle_pic : "");
                    element.Add("original_pic", status.IsDefined("original_pic") ? status.original_pic : "");
                    element.Add("replyMsgID", "0");
                    element.Add("replyDepth", "0");
                    element.Add("replyedDepth", "0");
                    elements.Add(Guid.NewGuid().ToString(), element);

                }
            }*/        
            return jss.Serialize(elements);
        }

        public string LoadMessageTiles()
        {
            Dictionary<string, string> element = new Dictionary<string, string>();
            element.Add("intro", "记录用");
            element.Add("notice", "网络社区，文明用语");
            return jss.Serialize(element);
        }

        public string BuildComments(int resourceID)
        {
            Dictionary<string, string> element = new Dictionary<string, string>();
            Dictionary<string, Dictionary<string, string>> elements = new Dictionary<string, Dictionary<string, string>>();

            List<int> list = CommentEntity.GetListByResourceAndPage(resourceID, 0);
            foreach (int item in list)
            {
                CommentEntity comment = new CommentEntity(item);
                element = new Dictionary<string, string>();
                element.Add("id", comment.m_id.ToString());
                string composer = comment.m_composer;
                composer = composer.Length == 0 ? Variable.Default.anonymousUserName : composer;
                element.Add("composer", composer);
                element.Add("content", comment.m_content);
                element.Add("postTime", comment.m_postTime.ToString());
                element.Add("support", comment.m_support.ToString());
                element.Add("oppose", comment.m_oppose.ToString());
                element.Add("replyNum", comment.m_replyNum.ToString());
                element.Add("report", comment.m_report.ToString());
                elements.Add(item.ToString(), element);
            }

            element = new Dictionary<string, string>();
            element.Add("id", "0");
            element.Add("count", CommentEntity.GetCount().ToString());
            elements.Add("comment", element);
            return jss.Serialize(elements);
        }       

        public string BuildResource(int id)
        {
            ResourceEntity resource = new ResourceEntity(id);
            Dictionary<string, string> element = new Dictionary<string, string>();
            Dictionary<string, Dictionary<string, string>> elements = new Dictionary<string, Dictionary<string, string>>();
            if (resource.m_type.ToLower() == "folder")
            {
                List<int> children = resource.GetChildren();
                element.Add("id", id.ToString());
                element.Add("name", resource.m_name);
                element.Add("url", resource.m_uri);
                element.Add("count", children.Count.ToString());
                element.Add("type", resource.m_type);
                element.Add("parent", resource.m_parentFolder.ToString());
                elements.Add("parent", element);

                foreach (int child in children)
                {
                    element = new Dictionary<string, string>();
                    resource = new ResourceEntity(child);
                    element.Add("id", resource.m_id.ToString());
                    element.Add("name", resource.m_name);
                    element.Add("url", Variable.Default.cloudPath + resource.m_uri);
                    element.Add("type", resource.m_type);
                    element.Add("format", resource.m_format);
                    elements.Add(resource.m_id.ToString(), element);
                }
                return jss.Serialize(elements);
            }
            else
            {
                element.Add("id", id.ToString());
                element.Add("Name", resource.m_name);
                element.Add("Url", Variable.Default.cloudPath + resource.m_uri);
                element.Add("Format", resource.m_format);
                element.Add("Composer", resource.m_composer);
                element.Add("Cover", resource.m_cover);
                element.Add("Description", resource.m_description);
                return jss.Serialize(element);
            }            
        }
    }
}
