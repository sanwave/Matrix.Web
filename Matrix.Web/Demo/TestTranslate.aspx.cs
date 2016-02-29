using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Matrix
{
    public partial class TestTranslate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AdmAuthentication admAuth = new AdmAuthentication("MatrixTranslate", "9T9KHYnB1jO1//zJ/oL0S0tfszY/JJakbSJJEoY//So=");
            AdmAccessToken token = admAuth.GetAccessToken();            

            Response.Write(string.Format(@"
                <script type=""text/javascript"">
                    window.accessToken = ""{0}"";
                </script>", token.access_token));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string result;
            //TranslateService.LanguageServiceClient client = new TranslateService.LanguageServiceClient();
            //result = client.Translate("9T9KHYnB1jO1//zJ/oL0S0tfszY/JJakbSJJEoY//So=", TextBox1.Text, "en", "zh-CHS", "text/html", "general");
            //TextBox2.Text = result;
        }
    }
}