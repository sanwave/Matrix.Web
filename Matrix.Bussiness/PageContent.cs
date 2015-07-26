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
            //List<int> messageIDs = MessageEntity.GetMsgIdsByPage();

            element = new Dictionary<string, string>();
            element.Add("id", "-1");
            element.Add("count", MessageEntity.GetCount().ToString());
            elements.Add("-1", element);

            List<Model.Message> msgs;
            MessageEntity.GetMsgListByPage(-1, out msgs);

            foreach (Model.Message msg in msgs)
            {
                element = new Dictionary<string, string>();
                element.Add("id", msg.m_id.ToString());
                string composer = msg.m_composer.Length == 0 ? Variable.Default.anonymousUserName : msg.m_composer;
                element.Add("composer", composer);
                element.Add("content", msg.m_content);
                element.Add("postTime", msg.m_postTime.ToString());
                element.Add("support", msg.m_support.ToString());
                element.Add("oppose", msg.m_oppose.ToString());
                element.Add("replyNum", msg.m_replyNum.ToString());
                element.Add("report", msg.m_report.ToString());
                element.Add("replyMsgID", msg.m_replyMsgID.ToString());
                elements.Add(msg.m_id.ToString(), element);
            }

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
                element.Add("Cover", Variable.Default.cloudPath + resource.m_cover);
                element.Add("Description", resource.m_description);
                return jss.Serialize(element);
            }            
        }
    }
}
