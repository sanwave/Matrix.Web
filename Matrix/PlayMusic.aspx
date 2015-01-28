<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlayMusic.aspx.cs" Inherits="Matrix.PlayMusic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Play Music</title>
    <link href="Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Menu.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Message.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Music.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="Resource/Icons/wave.ico" />
    <script type="text/javascript" src="Scripts/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="Scripts/Config.js"></script>
    <script type="text/javascript" src="Scripts/Common.js"></script>
    <script type="text/javascript" src="Scripts/User.js"></script>
    <script type="text/javascript" src="Scripts/Resource.js"></script>
    <script type="text/javascript" lang="ja" language="javascript">
        $(document).ready(loadMusicItem());
    </script>
</head>
<body>
    <!-- #include file="Header.html" -->
    <div class="main_bg">
        <div class="main">
            <div class="musicMain noSelect">
                <div class="musicTitle">
                    <div id="musicTitle" class="mainTitle"></div>
                    <div id="musicComposer" class="infoComposer"></div>
                </div>

                <div id="musicAttachment" class="lyricBox"></div>

                <div id="musicBox" class="musicBox"></div>

                <div class="commentBox">
	                <span class="commentBoxTitle">发表评论</span>
                    <div id="wordRestrain" class="wordRestrain commentRestrain">
                        您还能输入<var id="wordRestrainNum">350</var>字
                    </div>
                    <div class="clearBoth"></div>
                    
                    <div>
                        <textarea title="发表评论" id="commentBox" rows="2" cols="20"></textarea>
                    </div>

                    <div class="commitBox">
                        <input id="postCommentButton" class="commitButton commentBoxButton" type="button" value="提交" />
                    </div>
                </div>

                <div class="msgCountBox noSelect hidden">评论共计<e id="commentsCount"></e>条</div>

                <div id="CommentsBox"></div>

            </div>
            <div id="musicDescription" class="musicTile"></div>
        </div>
    </div>
    
</body>
</html>
