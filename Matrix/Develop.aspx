<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Develop.aspx.cs" Inherits="Matrix.Develop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head">        
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />        
    <title>Matrix Devolopping</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" /> 
    <link href="Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Menu.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Message.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Tile.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Develop.css" rel="stylesheet" type="text/css" />
    <link href="Libraries/codemirror-4.5/lib/codemirror.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="/Resource/Icons/wave.ico" />    
    <script type="text/javascript" src="Libraries/codemirror-4.5/lib/codemirror.js"></script>
    <script type="text/javascript" src="Libraries/codemirror-4.5/mode/javascript/javascript.js"></script>
	<script type="text/javascript" src="Scripts/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="Scripts/Common.js"></script>
    <script type="text/javascript" src="Scripts/User.js"></script>
    <script type="text/javascript" src="Scripts/Resource.js"></script>
    <script type="text/javascript" src="Scripts/Develop.js"></script>
    <script type="text/javascript" lang="ja" language="javascript">
        $(document).ready(function () {
            $("#codeBox").focus();
            addFileDragListener("codeBox", "Develop");
        });
    </script>
</head>
<body>
    <div id="container">
         <!-- #include file="Header.html" -->
    
        <div class="main_bg" >		
		    <div class="main">

			    <div class="developMain">
                    <div class="developTop noSelect">
				        <div class="mainTitle messageTitle">开发</div>
                        <div id="wordRestrain" class="wordRestrain hidden">
                            您还能输入<var style="color:#C00">5000</var>字
                        </div>
                    </div>

                    <div class="codeBox_bg noSelect">
                        <div>
                            <textarea id="codeBox" title="白板" 
                                rows="200" ></textarea>
                        </div>                            
                        <div class="commitBox">
                            <select id="compileLanguage" class="">
                                <option value="xml">Xml校验</option>
                                <option value="c++">C&C++</option>
                                <option value="c#">C#</option>
                            </select>
                            <input id="" class="commitButton noSelect" 
                                onclick="runCode()" type="button" value="Run" />
                        </div>
                    </div>

                    <div id="resultsBox" class="resultsBox">
                        <!--<div class="seperator"></div>-->
                    </div>
                </div>
				

			    <div class="rightMain hidden">
                    <div class="tile">
                        <div id="tipsTitle" class="tileTitle">使用须知</div>
                        <div id="tipsBox" class="tileContent"> 
                            <p>Matrix 开发为方便简单程序编译服务</p>
                        </div>
                    </div>
                    <div class="tile">
                        <div id="noticeTitle" class="tileTitle">公告板</div>
                        <div id="noticeBox" class="tileContent">
                            <p>仅供简易编译使用</p>
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
