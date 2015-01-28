using Matrix.Bussiness;
using Matrix.DataEntity;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace Matrix
{
    /// <summary>
    /// IdentifyCode 的摘要说明
    /// </summary>
    public class IdentifyCode : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string load = SqlHelper.GetString(context.Request["Load"]);

            if (load == "IdentifyCode")
            {
                context.Response.ContentType = "text/plain";
                Dictionary<string, string> code = new Dictionary<string, string>();
                code.Add("code", HttpContext.Current.Session["Code"].ToString());
                context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(code));
                return;
            }

            context.Response.ContentType = "image/JPEG";
            using (Bitmap bitmap = new Bitmap(70,30))
            {
                using (Graphics g = Graphics.FromImage(bitmap))
                {
                    Random random = new Random(DateTime.Now.Millisecond);
                    string strCode=string.Empty;
                    int code;
                    char ccode;
                    Font font;
                    Brush brush;
                    string fontFamily;
                    int mark = -random.Next(17, 19);
                    g.DrawLine(
                        new Pen(Brushes.DarkBlue, 30),
                        new PointF(0, 15),
                        new PointF(70, 15)
                        );

                    List<string> fontFamilys= new List<string>();
                    //fonts.Add("Arial");
                    //fontFamilys.Add("Calibri");
                    //fontFamilys.Add("Cambria");
                    //fontFamilys.Add("Comic Sans MS");
                    fontFamilys.Add("Courier");//ok
                    fontFamilys.Add("Courier New");//ok
                    //fonts.Add("Georgia");
                    //fontFamilys.Add("MV Boli");
                    fontFamilys.Add("Segoe Marker");//ok
                    //fontFamilys.Add("Segoe Print");//偏下
                    fontFamilys.Add("Segoe Script");//ok

                    List<Brush> brushes = new List<Brush>();
                    brushes.Add(Brushes.PaleVioletRed);
                    brushes.Add(Brushes.OrangeRed);
                    brushes.Add(Brushes.LightGreen);
                    brushes.Add(Brushes.DarkOrange);
                    brushes.Add(Brushes.LightBlue);
                    brushes.Add(Brushes.LightCoral);

                    /*for (int i = 0; i < random.Next(5, 10); ++i)
                    {
                        g.DrawLine(
                            new Pen(brushes[random.Next(0, brushes.Count)], random.Next(1, 2)),
                            new PointF(random.Next(0, 70), random.Next(0, 30)),
                            new PointF(random.Next(0, 70), random.Next(0, 30)));
                    }*/

                    for (int i = 0; i < 4; ++i)
                    {
                        code = random.Next(0, 61);
                        if (code < 10)
                            ccode = Convert.ToChar(code + 0x30);
                        else if (code < 36)
                            ccode = Convert.ToChar(code - 10 + 0x41);
                        else
                            ccode = Convert.ToChar(code - 36 + 0x61);
                        if (ccode == 'v')
                            ccode = 'w';
                        strCode += ccode;
                    }

                    for (int i = 0; i < 4; ++i)
                    {
                        brush=brushes[random.Next(0,brushes.Count)];
                        brushes.Remove(brush);
                        fontFamily = fontFamilys[random.Next(0, fontFamilys.Count)]; 
                        fontFamilys.Remove(fontFamily);
                        font = new Font(
                            fontFamily,
                            random.Next(18, 21),
                            (FontStyle)(random.Next(0, 4)));
                        mark += random.Next(15, 17);
                        g.DrawString(strCode[i].ToString(), font, brush, new PointF(mark, random.Next(-3, -1)));
                        
                        /*g.DrawLine(
                            new Pen(brushes[random.Next(0, brushes.Count)], random.Next(1, 3)),
                            new PointF(random.Next(0, 70), random.Next(0, 30)),
                            new PointF(random.Next(0, 70), random.Next(0, 30))
                            );*/
                    }

                    HttpContext.Current.Session["Code"] = strCode;

                    bitmap.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }



            context.Response.Write("Hello World");
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