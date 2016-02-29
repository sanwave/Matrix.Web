using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Matrix.User
{
    public partial class LogOff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Cookies["usernameForMatrix"].Value = "";
            Response.Redirect("/User/Login.aspx", false);
        }
    }
}