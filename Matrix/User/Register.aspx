<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Matrix.User.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Matrix 注册</title>
    <link href="../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Menu.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/User.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/Common.js"></script>
    <script type="text/javascript" src="../Scripts/User.js"></script>
    <script type="text/javascript" lang="ja" language="javascript">
        $(document).ready(function () {
            $("#username").focus();
        });
    </script>
</head>
<body>
    <div id="container">
        <!-- #include file="../Header.html" -->
        <div class="main_bg">		
		    <div class="main">
			    <div class="loginMain">
                    <form id="Register" action="Register.aspx?Action=Register" method="post">
				        <div class="mainTitle noSelect">注册新用户</div>
                        <h4>用户名</h4>
                        <h5>此用户名可用</h5>
                        <h5>此用户名不可用或已被占用</h5>
                        <div><input id="username" type="text" tabindex="1"/></div>
                        <h4>密码</h4>
                        <div><input id="password" type="password" tabindex="2"/></div>
                        <h4>确认密码</h4>
                        <div><input id="password2" type="password" tabindex="3"/></div>
                        <h4>邮箱</h4>
                        <h5>此邮箱已被使用</h5>
                        <div><input id="email" name="Email" type="text" tabindex="4"/></div>
                        <div class="clearBoth"></div>
                        <div class="commitBox">
                            <input id="commitRegisterUser" class="commitButton" tabindex="5" type="button" value="提交" />
                        </div>
                    </form>
                </div>
		    </div>
	    </div>
        <div id="pushFoot"></div>
    </div>
    <!-- #include file="../Foot.html" -->
</body>
</html>
