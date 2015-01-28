function loadFolder() {
    var cid = getUrlParamByName("id");
    if (cid.length < 1)
        cid = 0;

    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "LoadResourceByParent",
            ID: cid
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            var childItem = "", folderList = "";
            var prefix = "", type="", header = "";
            $.each(data, function (i) {
                if (data[i].id == cid || data[i].name == "Root") {
                    $("#parentFolder").attr("href", "Cloud.aspx?id=" + data[i].parent);
                }
                else{
                    childItem = "<div class=\"childItem\">";
                    childItem += "<a href=\" ";

                    switch (data[i].type) {
                        case "video":
                            prefix = "PlayVideo.aspx?id=";
                            type = ".";
                            break;

                        case "music":
                        case "audio":
                            prefix = "PlayMusic.aspx?id=";
                            type = ".";
                            break;

                        case "picture":
                        case "image":
                            prefix = "Picture.aspx?id=";
                            type = ".";
                            break;

                        case "folder":                        
                            prefix = "Cloud.aspx?id=";
                            break;

                        default:
                            prefix = data[i].url + "?id=";
                            break;
                    }
                    childItem += prefix + data[i].id + " \">" + data[i].name + "</a>";
                    childItem += type + "&nbsp;<input class=\"deleteButton\" type=\"button\" value=\"x\" onclick=\"removeResource(" + data[i].id + ")\" />";
                    childItem += "<div class=\"clearBoth\"></div>";
                    childItem += "</div>";
                    folderList += childItem;
                }
            });
            $("#childFolderBox").html(folderList);
        }
    });    
}

function loadVideoItem() {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "LoadVideoById",
            ID: getUrlParamByName("id")
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            var videoBoxHtml = 
                "<object id=\"player\" data=\"" + data.Url + "\">" +
                    "<embed class=\"videoBig\" src=\"Resource/Player/jwPlayer.swf\" " +
                        "flashvars=\"file=" + data.Url + "&image=" + data.Cover + "\"/>" +
                "</object>";

            videoBoxHtml =
                "<video id=\"player\" controls autoplay>" +
                    "<source src=\"" + data.Url + "\" type=\"video/mp4\""+
                "</video>";
            
            $("#videoTitle").text(data.Name);
            $("#videoBox").html(videoBoxHtml);
            loadComments();
        }
    });
}

function loadMusicItem() {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "LoadMusicById",
            ID: getUrlParamByName("id")
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            var musicBoxHtml = "";
            musicBoxHtml =
                "<audio id=\"controlMusic\" class=\"music\" controls=\"controls\">" +// <!-- autoplay=\"autoplay\" loop=\"loop\"--> >" 
                    "<source src=\"" + data.Url + "\" type=\"audio/mpeg\" />" +
                    "<embed height=\"100\" width=\"100\" src=\"" + data.Url + "\" />" +
                "</audio>";

            $("#musicTitle").text(data.Name);
            $("#musicBox").html(musicBoxHtml);
            
            if (data.Composer != "") {
                $("#musicComposer").text("by " + data.Composer);
            }
            if (data.Cover != "") {
                $("#musicAttachment").html("<img alt=\"" + data.Composer + "\" src=\"" + data.Cover + "\" />");
            }
            if (data.Description != "") {
                $("#musicDescription").html(data.Description);
            }
            loadComments();
        }
    });
}

function loadPictureItem() {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "LoadPictureById",
            ID: getUrlParamByName("id")
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            $("#pictureTitle").text(data.Name);
            $("#pictureBox").html("<img alt=\"" + data.Name + "\" src=\"" + data.Url + "\" />");
            loadComments();
        }
    });
}

function loadComments() {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "LoadCommentsByResourceAndPage",
            ID: getUrlParamByName("id")
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            var commentItem = "", commentList = "";
            $.each(data, function (i) {
                if (data[i].id == '0') {
                    $("#commentsCount").html(data[i].count);
                }
                else {
                    var composer = data[i].composer;
                    if (composer = "")
                        composer = "匿名";
                    commentItem = "<div class=\"message\">";
                    commentItem += "<div class=\"msgComposer noSelect\"><a>" + data[i].composer + "</a></div>";
                    commentItem += "<div class=\"msgContent\">" + data[i].content + "</div>";
                    commentItem += "<div class=\"msgReact noSelect\">";
                    commentItem += "<div class=\"msgPostTime\">" + data[i].postTime + "</div>";
                    commentItem += "<div class=\"msgButton\" onclick=\"reactComment(this,'support'," +
                        data[i].id + ")\">支持(<e>" + data[i].support + "</e>)</div>";
                    commentItem += "<div class=\"msgButton\" onclick=\"reactComment(this,'oppose'," +
                        data[i].id + ")\">反对(<e>" + data[i].oppose + "</e>)</div>";
                    commentItem += "<div class=\"msgButton\" onclick=\"showReplyCmtBox(this, " +
                        data[i].id + ")\"\">评论(<e>" + data[i].replyNum + "</e>)</div>";
                    commentItem += "<div class=\"msgButton\" onclick=\"reactComment(this,'report'," +
                        data[i].id + ")\">举报(<e>" + data[i].report + "</e>)</div>";
                    commentItem += "</div>";
                    commentItem += "<div class=\"clearBoth\"></div>";
                    commentItem += "</div>";
                    commentList += commentItem;
                }
            });
            $("#" + "CommentsBox").html(commentList);
        }
    });
}

function showReplyCmtBox(obj, n) {
    var replyBoxHtml =
        "<div id=\"replyBox_bg\" class=\"replyBox_bg\">" +
            "<textarea id='replyBox' title='白板' cols='20' rows='1'></textarea>" +
            "<div class=\"commitBox commitReply\">" +
                "<input class=\"commitButton replyButton noSelect\" type=\"button\" " +
                "onclick=\"commitReplyComment('" + n + "')\" value=\"提交\" />" +
            "</div>" +
        "</div>";
    $("#replyBox_bg").remove();
    $(obj).parent().parent().append(replyBoxHtml);
    $("#replyBox").focus();
    $("#replyBox").val("回复@无名:");
}

function commitReplyComment(n) {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "ReplyComment",
            Content: $("#replyBox").val(),
            ID: n
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            if (data.result == "success") {
                $("#replyBox_bg").remove();
                loadComments(getUrlParamByName("id"));
            }
            else {
                alert("提交失败");
            }
        }
    });
}

function reactComment(obj, act, n) {
    var counter = obj.getElementsByTagName("e");
    //var counter = $(obj).find("e");
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "ReactComment",
            React: act,
            ID: n
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            if (data.result == "success") {
                ///text()在IE8下兼容失败，只得使用下法
                $(counter).html($(counter).html() - 1 + 2);//*1+1等价
            }
            else {
                alert("您已经提交过了");
            }
        }
    });
}

function removeResource(id) {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "RemoveResource",
            ID: id
        },
        error: function () {
            alert("删除失败。其他人在使用该资源");
        },
        success: function (data) {
            if (data.result == "success") {
                loadFolder(getUrlParamByName("id"));
            }
            else if(data.result == "failed"){
                alert(data.alertInfo);
            }
        }
    });
}

function addFolder() {
    if ($("#addFolderName").val() == "") {
        $("#addItem").css("display", "none");
        return;
    }
    $("#addFolderName").attr("disabled", true);
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "AddFolder",
            ID: getUrlParamByName("id"),
            FolderName: $("#addFolderName").val()
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            if (data.result == "success") {
                loadFolder(getUrlParamByName("id"));                
            }
            else {
                alert(data.alertInfo);
            }
            $("#addItem").css("display", "none");
            $("#addFolderName").attr("disabled", false);
        }
    });
}

function addFileDragListener(dropBoxId,module) {
    var dropBox = document.getElementById(dropBoxId);
    if (window.FileReader) {
        dropBox.addEventListener("drop", function (e) {
            e.stopPropagation();
            e.preventDefault();
            if (module == "Cloud") {
                uploadFiles(e, e.dataTransfer.files);
            }
            else if(module == "Message"){
                uploadMessageAttachments(e, e.dataTransfer.files);
            }
            else if (module == "Develop") {
                showText(e, e.dataTransfer.files);
            }
            else {
                alert("无法识别请求");
            }
        }, false);

        dropBox.addEventListener("dragover", function (e) {
            e.stopPropagation();
            e.preventDefault();
        }, false);
    }
    else {
        alert("抱歉，您的浏览器不支持此功能");
    }
}

function uploadFiles(e, files) {
    var progressBatchId = Date.parse(new Date());

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/Handler.ashx");
    var formData = new FormData();
    formData.append("RequestType", "UploadFiles");
    formData.append("ID", getUrlParamByName("id"));

    $("#uploadFileBox").append("<div id=\"" + progressBatchId + "\"></div>");
    var fileTotalSize = 0;

    for (var i = 0; i < files.length; i++) {
        var fileType = files[i].type || "n/a";
        var fileInfo = "<div class=\"uploadFileBlock\">";
        fileInfo += "<div class=\"filledProgress " + progressBatchId + "\"></div>";
        fileInfo += "<div class=\"fileName\">" + files[i].name + "</div>";
        fileInfo += "<div class=\"clearBoth\"></div>";
        fileInfo += "</div>";
        $("#" + progressBatchId).append(fileInfo);
        formData.append("File[]", files[i]);
        fileTotalSize += files[i].size;
    }

    if (fileTotalSize > 3000000000) {
        alert("您上传的文件总大小超过28MB限制");
        $("#" + progressBatchId).remove();
        return;
    }

    if (xhr.upload) {
        xhr.upload.addEventListener('progress', function (e) {
            if (e.lengthComputable) {
                var uploadProgress = e.loaded / e.total * 100;
                uploadProgress = uploadProgress > 100 ? 100 : uploadProgress;
                $("." + progressBatchId).css("width", uploadProgress + "%");
            }
        }, false);
    }

    xhr.onload = function () {
        if (xhr.status === 200) {
            $("#" + progressBatchId).fadeOut(400);
            $("#" + progressBatchId).slideUp(100);
            loadFolder();
            if (JSON.parse(xhr.responseText).result == "failed") {
                alert(JSON.parse(xhr.responseText).alertInfo);
            }
        }
    }
    xhr.send(formData);
}

function uploadMessageAttachments(e, files)
{
    var progressBatchId = Date.parse(new Date());
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/Handler.ashx");
    var formData = new FormData();
    formData.append("RequestType", "UploadMessageAttachments");
    $("#messageAttachmentBox").append("<div id=\"" + progressBatchId + "\"></div>");
    var fileTotalSize = 0;

    for (var i = 0; i < files.length ; i++) {
        var fileType = files[i].type || "n/a";
        var fileInfo = "<div class=\"uploadFileBlock\">";
        fileInfo += "<div class=\"filledProgress " + progressBatchId + "\"></div>";
        fileInfo += "<div class=\"fileName\">" + files[i].name + "</div>";
        fileInfo += "<div class=\"clearBoth\"></div>";
        fileInfo += "</div>";
        $("#" + progressBatchId).append(fileInfo);
        formData.append("File[]", files[i]);
        fileTotalSize+=files[i].size;
    }

    if (fileTotalSize > 30000000) {
        alert("您上传的文件总大小超过28MB限制");
        $("#" + progressBatchId).remove();
        return;
    }

    if (xhr.upload) {
        xhr.upload.addEventListener('progress', function (e) {
            if (e.lengthComputable) {
                var uploadProgress = e.loaded / e.total * 100;
                uploadProgress = uploadProgress > 100 ? 100 : uploadProgress;
                $("." + progressBatchId).css("width", uploadProgress + "%");
            }
        }, false);
    }

    xhr.onload = function () {
        if (xhr.status === 200) {
            $("#" + progressBatchId).fadeOut(400);
            $("#" + progressBatchId).slideUp(100);
            if (JSON.parse(xhr.responseText).result == "success") {
                loadMessage(1);
            }
            else if (JSON.parse(xhr.responseText).result == "failed") {
                alert(JSON.parse(xhr.responseText).alertInfo);
            }
        }
    }
    xhr.send(formData);
}

$(function () {
    $("#commentBox").keypress(function () {
        $("#wordRestrainNum").html((commentRestrain - $("#commentBox").text().length));
    });

    $("#postCommentButton").click(function () {
        if ($("#commentBox").val().length > commentRestrain) {
            alert("您的消息已经超过最大字数限制");
            return;
        }
        else if ($("#commentBox").val().length < 1) {
            alert("发送的内容不能为空");
            $("#commentBox").focus();
            return;
        }
        $(this).attr("disabled", true);
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/Handler.ashx",
            data: {
                RequestType: "PostComment",
                ID: getUrlParamByName("id"),
                Content: $("#commentBox").val()
            },
            error: function () {
                alert("服务器发生错误");
            },
            success: function (data) {
                $("#wordRestrainNum").html(commentRestrain);

                if (data.result == "success") {
                    loadComments(getUrlParamByName("id"));
                }
                else {
                    alert("发表失败");
                }
                $("#commentBox").val("");
                $("#commentBox").focus();
                $("#postCommentButton").attr("disabled", false);
            }
        });
    });

    $("#addFolder").click(function () {
        $("#addFolderName").val("");
        $("#addItem").css("display", "block");
        $("#addFolderName").focus();
    });

    $("#addFolderName").keypress(function (e) {
        if (e.keyCode == 13) {
            addFolder();
        }
    });

    $("#addFolderName").blur(function () {
        addFolder();
    });

    $("#addFile").click(function () {
        $("#fileUploader").click();
    });

    $("#fileUploader").change(function (e) {
        uploadFiles(e, this.files);
    });    
})