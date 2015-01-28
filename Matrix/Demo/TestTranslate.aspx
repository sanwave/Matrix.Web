<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTranslate.aspx.cs" Inherits="Matrix.TestTranslate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Test Translation from Microsoft</title>

    <link href="/Styles/Translate.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/style.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="/Resources/Image/wave.ico" />
    <script type="text/javascript" src="/Scripts/jqrery-2.0.3.js"></script>
    <script type="text/javascript" src="/Scripts/Translate.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div><h1>Test Translation</h1></div>
        <div><textarea id="fromBox" title ="您输入的内容" cols="100" rows="8" ></textarea></div> 
        <div> <input id="translateEnglish" class="n" onclick="translate('en', 'en', 'fromBox')" type="button" value="英文" /> </div>
        <div> <input id="translateChinese" class="n" onclick="translate('en', 'zh-CHS', 'fromBox')" type="button" value="简体中文" /> </div>
        <div> <input id="translateJapanese" class="n" onclick="translate('en', 'ja', 'fromBox')" type="button" value="日文" /> </div>
        <div><textarea id="toBox" title="翻译内容" cols="100" rows="8"></textarea></div>     
    </div>        
    </form>
</body>
</html>
