<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="Matrix.Demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Matrix Demo</title>
    <link href="Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Menu.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Demo.css" rel="stylesheet" type="text/css" />    
    <link rel="shortcut icon" href="Resource/Icons/wave.ico" />
    <script type="text/javascript" src="/Scripts/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="Scripts/Common.js"></script>
    <script type="text/javascript" src="Scripts/User.js"></script>
    <script type="text/javascript" lang="ja" language="javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/IdentifyCode.ashx",
                data: {
                    Load: "IdentifyCode"
                },
                success: function (data) {
                    $("#IdentifyCode").text(data.code);
                }
            });
        });
    </script>
</head>
<body>
    <!-- #include file="Header.html" -->
    <div class="mainTitle">Matrix Demo主页</div>
    <div> 翻译demo：<a href="Demo/TestTranslate.aspx">/TestTranslate.aspx</a></div>
    <div> 地图demo：<a href="Demo/TestGoogleMaps.html">/TestGoogleMaps.html</a></div>
    <div> 地址解析demo：<a href="Demo/TestGooglePlace.html">/TestGooglePlace.html</a></div>
    <div> 验证码：<img src="IdentifyCode.ashx" onclick="this.src='IdentifyCode.ashx?param='+new Date()" /><div id="IdentifyCode"></div></div>
        
</body>
</html>
