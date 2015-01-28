/********************************首页消息用********************************/

function loadMessage(pageNum) {
    $("#messageBox").focus();
    var message = "", messages = "";
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "LoadMessagesByPage",
            Page: pageNum
        },
        success: function (data) {
            var header = "",message="",messages="";
            var replyDepth = 0, replyMsgID = "0";
            var floor = 1000;
            var picBox = "";
            $.each(data, function (i) {
                if (data[i].id == "0") {
                    $("#msgCount").html(data[i].count);
                    floor = data[i].count;
                }
                else {
                    if (message != "")
                        message = "<div class=\"subMessage\">" + message + "</div>";
                    message += "<div class=\"msgComposer noSelect\"><a>" + data[i].composer + "</a></div>";

                    if (data[i].bmiddle_pic != null && data[i].bmiddle_pic != "")
                        picBox = "<img onclick='changeAttachImageWidth(this)' src='" + data[i].bmiddle_pic + "' style='width: 32%;'>";
                    else
                        picBox = "";

                    message += "<div class=\"msgContent\"><p>" + data[i].content.replace(/\n/g, "<br>") + "</p>" + picBox + "</div>";
                    message += "<div class=\"msgReact noSelect\">";
                    message += "<div class=\"msgPostTime\">" + data[i].postTime + "</div>";
                    message += "<div class=\"msgButton\" onclick=\"reactMessage(this,'support'," +
                        data[i].id + ")\">支持(<e>" + data[i].support + "</e>)</div>";
                    message += "<div class=\"msgButton\" onclick=\"reactMessage(this,'oppose'," +
                        data[i].id + ")\">反对(<e>" + data[i].oppose + "</e>)</div>";

                    message += "<div class=\"msgButton\" onclick=\"removeMessage(this," +
                        data[i].id + ")\">移除</div>";

                    message += "<div class=\"msgButton showReplyButton\" onclick=\"showReplyMsgBox(this, " +
                        data[i].id + ")\"\">评论(<e>" + data[i].replyNum + "</e>)</div>";
                    message += "<div class=\"msgButton\" onclick=\"reactMessage(this,'report'," +
                        data[i].id + ")\">举报(<e>" + data[i].report + "</e>)</div>";
                    message += "</div>";
                    message += "<div class=\"clearBoth\"></div>";
                    //message += "</div>";
                    if (data[i].replyMsgID == "0") {
                        messages +=
                            "<div class=\"messageBlock\">" +
                                "<div class=\"storyBlock\">" + floor-- + "&nbsp;楼</div>" +
                                "<div class=\"storyContent\">" + message + "</div>" +
                            "</div>";
                        message = "";
                    }
                }
            });
            
            $("#messagesBox").html(messages);
        }
    });
}

function loadMsgTile() {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: { RequestType: "LoadMessageTiles" },
        success: function (data) {
            $("#introBox").html("<p>" + data.intro + "</p>");
            $("#noticeBox").html("<p>" + data.notice + "</p>");
        }
    });
}

function showReplyMsgBox(obj, n) {
    var replyBoxHtml = "<div id=\"replyBox_bg\" class=\"replyBox_bg\">" +
            "<textarea id='replyBox' title='白板' cols='20' rows='1'></textarea>" +
            "<div class=\"commitBox commitReply\">" +
                "<input class=\"commitButton replyButton noSelect\" type=\"button\" " +
                "onclick=\"commitReplyMessage('" + n + "')\" value=\"提交\" />" +
            "</div>" +
        "</div>";
    $("#replyBox_bg").remove();
    $(obj).parent().parent().append(replyBoxHtml);
    $("#replyBox").css("width", $(obj).parent().parent().width() - 19 +"px");
    $("#replyBox").focus();
    $("#replyBox").val("回复@" + $(obj).parent().parent().children(".msgComposer").children("a").html() + ":");
}

function commitReplyMessage(n)
{
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "ReplyMessage",
            Content: $("#replyBox").val(),
            ID: n
        },
        success: function (data) {
            if (data.result == "success") {
                $("#replyBox_bg").remove();
                loadMessage(1);
            }
            else {
                alert("提交失败");
            }
        }
    });
}

function reactMessage(obj, act, n) {
    var counter = obj.getElementsByTagName("e");
    //var counter = $(obj).find("e");
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "ReactMessage",
            React: act,
            ID: n
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

function removeMessage(obj, n) {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "RemoveMessage",
            ID: n
        },
        success: function (data) {
            if (data.result == "success") {
                if ($(obj).closest(".subMessage").length != 0
                    && $(obj).parent().parent().children(".subMessage").length != 0) {
                    //alert($(obj).closest(".subMessage").length);
                    //alert($(obj).parent().parent().children(".subMessage").length);
                    $(obj).parent().parent().children(".msgContent").html("<p>This message has been removed!</p>");
                }
                else {
                    $(obj).closest(".messageBlock").fadeOut("slow");
                }                
            }
            else {
                alert(data.alertInfo);
            }
        }
    });
}

function changeAttachImageWidth(img) {
    if ($(img).width() == $(img).parent().width()) {
        $(img).width("32%");
    } else {
        $(img).width("100%");
    }
}

$(function () {
    $("#messageBox").keydown(function () {
        $("#wordRestrainNum").html(
            (messageRestrain - this.value.length));
    });

    $("#postMessageButton").click(function () {
        if ($("#messageBox").val().length > messageRestrain) {
            alert("您的消息已经超过最大字数限制");
            return;
        }
        else if ($("#messageBox").val().length < 1) {
            alert("发送的内容不能为空");
            $("#messageBox").focus();
            return;
        }
        $("#postMessageButton").attr('disabled', true);
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/Handler.ashx",
            data: {
                RequestType: "PostMessage",
                Content: $("#messageBox").val()
            },
            success: function (data) {
                $("#wordRestrainNum").html(messageRestrain);

                if (data.result == "success") {
                    loadMessage(1);
                }
                $("#messageBox").val("");
                $("#messageBox").focus();
                $("#postMessageButton").attr('disabled', false);
            }
        });
    });

})
