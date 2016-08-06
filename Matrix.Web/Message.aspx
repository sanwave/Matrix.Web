<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="Matrix.Message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head">        
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />        
    <title>Matrix WhiteBoard</title>
    <meta name="keywords" content="Matrix,WhiteBoard" />
    <meta name="description" content="" /> 
    <link href="Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Cloud.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Menu.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Message.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Tile.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="Resource/Icons/wave.ico" />
	<script type="text/javascript" src="Scripts/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="Scripts/Config.js"></script>
    <script type="text/javascript" src="Scripts/Common.js"></script>
    <script type="text/javascript" src="Scripts/User.js"></script>
    <script type="text/javascript" src="Scripts/Message.js"></script>
    <script type="text/javascript" src="Scripts/Resource.js"></script>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

    <script type="text/javascript" lang="ja" language="javascript">
        $(document).ready(function () {            
            loadMessage(1);
            $("#datePicker").datepicker();
            $("#wordRestrainNum").html(messageRestrain);
            //addFileDragListener("messageBox", "Message");
            updateTime();
        });
    </script>
</head>
<body>
    <div id="container">
         <!-- #include file="Header.html" -->
    
        <div class="main_bg" >		
		    <div class="main">

			    <div class="messageMain">
                    <div class="messageTop noSelect">
				        <div class="mainTitle messageTitle">Script</div>
                        <div id="wordRestrain" class="wordRestrain">
                            您还能输入<var id="wordRestrainNum"></var>字
                        </div>
                    </div>

                    <div class="messageBox_bg noSelect">
                        <div>
                            <textarea id="messageBox" title="白板" 
                                cols="20" rows="2" ></textarea>
                        </div>                            
                        <div class="commitBox">
                            <input id="postMessageButton" class="commitButton noSelect" 
                                type="button" value="发布" />
                        </div>

                        <div id="messageAttachmentBox"></div>
                    </div>

                    <!--<div class="msgCountBox noSelect">微言消息已有<e id="msgCount"></e>条</div>-->

                    <div id="messagesBox" class="messagesBox">
                    </div>
                </div>

			    <div class="rightMain">
                    <div class="tile">
                        <div id="timeStringBox" class="noSelect"></div>
                        <div>
                            <div class="noSelect" style="float:left;margin:auto 58px auto 10px;line-height:19px">Unix时间戳：</div>
                            <div id="unixTimeBox"></div>
                        </div>
                    </div>
                    <div class="tile noSelect">
                        <div id="datePicker"></div>
                    </div>

                    <div class="tile hidden">
                        <div id="introTitle" class="tileTitle">本站简介</div>
                        <div id="introBox" class="tileContent"> 
                        
                        </div>
                    </div>
                    <div class="tile hidden">
                        <div id="noticeTitle" class="tileTitle">公告板</div>
                        <div id="noticeBox" class="tileContent">                        
                        </div>
                    </div>

                    <div class="blank" style="background:#FFF;"></div>
                </div>
		    </div>
	    </div>
        <div id="pushFoot"></div>
    </div>
    <!-- #include file="Foot.html" -->
</body>
</html>
