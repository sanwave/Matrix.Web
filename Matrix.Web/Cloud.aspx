<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cloud.aspx.cs" Inherits="Matrix.Cloud" %>

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
    <!--<script type="text/javascript" src="Scripts/jquery-ui-1.10.4.custom.min.js"></script>    -->
    <script type="text/javascript" lang="ja" language="javascript">
        $(document).ready(function () {
            loadFolder();
            addFileDragListener("container", "Cloud");
        });
    </script>
</head>
<body>
    <div id="container">
         <!-- #include file="Header.html" -->
    
        <div class="main_bg" >
		    <div class="main">
                <div class="mainTitle">Yun</div>
                <div class="commitBox">
                    <form>
                        <input id="addFolder" class="commitButton" type="button" value="添加文件夹" />
                        <input id="addFile" class="commitButton"  type="button" value="上传文件" />
                        <input name="File[]" id="fileUploader" type="file" multiple="multiple"/>
                    </form>
                </div>
                <div id="resourceList">
                    <div id="uploadFileBox">

                    </div>
                    <div class="parentItem">
                        <a id="parentFolder">上层目录</a>
                        <div class="clearBoth"></div>
                    </div>
                    <div id="addItem" class="childItem">
                        <input id="addFolderName" type="text" />
                        <div class="clearBoth"></div>
                    </div>

                    <div id="childFolderBox">

                    </div>

                </div>
            </div>
        </div>
        <div id="pushFoot"></div>
    </div>
    <!-- #include file="Foot.html" -->
</body>
</html>
