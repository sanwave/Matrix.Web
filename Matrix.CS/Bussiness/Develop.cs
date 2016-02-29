using System.Collections.Generic;
using System.Linq;

namespace Matrix.CS
{
    public class Develop
    {

        //自定义Xml节点数据类型
        struct xmlNode
        {
            public int Index;
            public string Name;

            public xmlNode(int i, string name)
            {
                Index = i;
                Name = name;
            }
        }

        public class Position
        {
            public int Line;
            public int Row;
            public Position()
            {
                Line = Row = 1;
            }
        }

        public class XmlValidateError
        {
            public Position ErrorHead, ErrorFoot;
            public string NodeName1, NodeName2;
            public int ErrorNum;
            public XmlValidateError()
            {
                ErrorHead = new Position();
                ErrorFoot = new Position();
                ErrorNum = 0;
                NodeName1 = NodeName2 = "";
            }
        }

        /// <summary>
        /// 校验指定Xml文本一致性，语法错误直接返回
        /// </summary>
        /// <param name="content">指定Xml文本</param>
        /// <returns>表示一致性错误数目，-1表示有语法错误</returns>
        static public int ValidateXml(string content,out XmlValidateError error)
        {
            Stack<xmlNode> nodes = new Stack<xmlNode>();
            string text = content;

            //index为追踪错误节点开始标识在全文中的位置，index2为错误节点结束标识在全文中的位置
            int index = 0, index2 = 0;

            error = new XmlValidateError();

            //xml文件头开始的标志
            int iHeadPrefix = text.IndexOf("<?");

            //下一个节点开始标识'<'在文中出现的位置
            int iPrefix = text.IndexOf("<");

            //下一个节点结束标识"</"在文中出现的位置
            int iPrefix2 = text.IndexOf("</");

            //节点名字尾部的标识
            int iSuffix = text.IndexOf('>');

            while (iPrefix >= 0)
            {                
                if (iSuffix - iPrefix - 2 < 0)
                {
                    error.ErrorNum = -1;
                    return error.ErrorNum;
                }
                else if (iPrefix == iHeadPrefix)
                {
                    iHeadPrefix = -1;//校验xml文件头
                }
                else if (text.ElementAt(iSuffix - 1) == '/')
                {
                    ;//<****/>节点直接结束，不予处理
                }
                //若为节点开始标识，将节点名压栈
                else if (iPrefix != iPrefix2)
                {
                    string nodeName = GetNodeName(text.Substring(iPrefix + 1, iSuffix - iPrefix - 1));
                    nodes.Push(new xmlNode(index + iPrefix + 1, nodeName));
                }
                //若为节点结束标识，将其与出栈的节点名对比
                else
                {
                    xmlNode node;
                    if (nodes.Count > 0)
                    {
                        node = nodes.Pop();
                    }
                    else
                    {
                        //此处为语法错误
                        error.ErrorNum = -1;
                        return error.ErrorNum;
                    }
                    string nodeName2 = text.Substring(iPrefix + 2, iSuffix - iPrefix - 2);
                    if (node.Name != nodeName2)
                    {
                        //追踪出错节点结束标识的位置
                        index2 += iPrefix + 2;
                        //只记录第一处错误的位置
                        error.ErrorNum += 1;
                        if (1 == error.ErrorNum)
                        {
                            GetPosition(content, node.Index, out error.ErrorHead);
                            GetPosition(content, index2, out error.ErrorFoot);
                            error.NodeName1 = node.Name;
                            error.NodeName2 = nodeName2;
                        }
                    }
                }
                text = text.Substring(iSuffix);

                //追踪出错节点结束标识的位置
                index += iSuffix;
                index2 = index;

                iPrefix = text.IndexOf("<");
                iPrefix2 = text.IndexOf("</");
                iSuffix = text.Substring(1).IndexOf('>') + 1;
            }
            return error.ErrorNum;
        }

        /// <summary>
        /// 获取Xml指定节点名
        /// </summary>
        /// <param name="node">包含属性的Xml节点名</param>
        /// <returns>节点名</returns>
        private static string GetNodeName(string node)
        {
            int i = node.IndexOf(' ');
            if (i > 0)
            {
                return node.Substring(0, i);
            }
            else
            {
                return node;
            }
        }

        /// <summary>
        /// 获得指定索引在全文中对应的行号和列号
        /// </summary>
        /// <param name="content">全文字符串</param>
        /// <param name="index">索引</param>
        /// <param name="line">行号</param>
        /// <param name="row">列号</param>
        private static void GetPosition(string content, int index, out Position position)
        {
            position = new Position();
            string text = content.Substring(0, index);
            int i = text.IndexOf('\n');
            while (i >= 0)
            {
                ++position.Line;
                text = text.Substring(i + 1);
                i = text.IndexOf("\n");
            }

            position.Row += text.Length;
        }

    }
}
