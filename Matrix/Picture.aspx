<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Picture.aspx.cs" Inherits="Matrix.Picture" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Yun</title>
    <link href="Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Menu.css" rel="stylesheet" type="text/css" />
     <link href="Styles/Cloud.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="Resource/Icons/wave.ico" />
    <script type="text/javascript" src="Scripts/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="Scripts/Common.js"></script>
    <script type="text/javascript" src="Scripts/User.js"></script>
    <script type="text/javascript" src="Scripts/Resource.js"></script>
    <script type="text/javascript" language="javascript">
        $(document).ready(loadPictureItem());
    </script>
</head>
<body>
    <!-- #include file="Header.html" -->
    <div class="main_bg">
        <div class="main">
            <div class="musicMain noSelect">
                <div id="pictureTitle" class="mainTitle"></div>
                <div id="pictureBox" class="pictureBox"></div>                
            </div>
        </div>
    </div>
</body>
</html>
