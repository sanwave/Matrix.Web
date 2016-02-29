<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Matrix.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head">        
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />        
    <title>Matrix Search</title>
    <meta name="keywords" content="Matrix, Search, Find, 查找, 搜索" />
    <meta name="description" content="" /> 
    <link href="Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Menu.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Search.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="/Resource/Icons/wave.ico" />
	<script type="text/javascript" src="/Scripts/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="Scripts/Common.js"></script>
    <script type="text/javascript" src="Scripts/Search.js"></script>
    <script type="text/javascript" src="Scripts/User.js"></script>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            $("#inputSearch").focus();
        });
    </script>
</head>
<body>
    <div id="container">
        <!-- #include file="Header.html" -->
        <div class="main_bg">
            <div class="main">
                <div class="searchMain">
                    <div id="searchBox">                
                        <div class="mainTitle searchTitle noSelect">搜索</div>
                        <div class="searchBar">
                            <form id="searchForm" action="javascript:searchKey($('#inputSearch').val());">
                                <input id="inputSearch" name="keyWords" type="text" autocomplete="off" tabindex="1"/>            
                                <a>
                                    <img id="searchIcon" alt="" src="Resource/Icons/search.png"/>
                                </a>
                            </form>
                        </div>
                    </div>
                    <div id="searchResults" class="searchResults_bg">
                        <!--<iframe id="iframeResult"></iframe>-->
                        <div id="searchSeperator" class="seperator" style="display:none;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div id="pushFoot"></div>
    </div>
    <!-- #include file="Foot.html" -->
</body>
</html>
