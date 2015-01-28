<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlayVideo.aspx.cs" Inherits="Matrix.PlayVideo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Matrix Video Play</title>
    <link href="/Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Menu.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Video.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="Resource/Icons/wave.ico" />
    <script type="text/javascript" src="Scripts/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="Scripts/Common.js"></script>
    <script type="text/javascript" src="Scripts/User.js"></script>
    <script type="text/javascript" src="Scripts/Resource.js"></script>

    <script type="text/javascript">
        $(document).ready(loadVideoItem());
    </script>

</head>
<body>
    <!-- #include file="Header.html" -->
    <div class="videoMain">
        <div class="leftBox">
            <div id="videoTitle" class="videoTitle noSelect"></div>
        </div>

        <div id="videoBox" class="videoBox">
        </div>
    </div>
</body>
</html>
