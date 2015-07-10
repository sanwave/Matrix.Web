<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Matrix.User.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Matrix 登录</title>
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
				    <div class="mainTitle noSelect">登录</div>
                    <h4>用户名</h4>
                    <input id="username" type="text" tabindex="1"/>
                    <h4>密码</h4>
                    <input id="password" type="password" tabindex="2" />
                    <div class="hidden">                        
                        <input type="checkbox" value="true" tabindex="4"/> 
                        <h5>使我保持登录状态</h5>
                    </div>
                    <div class="commitBox" style="text-align:left">
                        <div><input id="commitLoginUser" type="button" value="提交" tabindex="3" /></div>
                        <!--<div><a href="/Handler.ashx?RequestType=LoginByWeibo">从微博登录</a></div>-->
                    </div>             
                </div>
		    </div>
	    </div>
        <div id="pushFoot"></div>
    </div>
    <!-- #include file="../Foot.html" -->
</body>
</html>
