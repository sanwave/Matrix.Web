/********************************首页消息用********************************/

function loadMessage(pageNum) {
    $("#messageBox").focus();
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "LoadMessagesByPage",
            Page: pageNum
        },
        success: function (data) {
            var messages = "";
            var floor = data["-1"].count;
            var id_list = new Array(floor + 1);
            var j = 0;
            $.each(data, function (i) {
                id_list[j++] = data[i].id;
            });            
            id_list.sort(down);
            for (var i = 0; i < id_list.length ; ++i) {
                if (id_list[i] > 0) {
                    messages +=
                        "<div class=\"messageBlock\">" +
                            "<div class=\"storyBlock\">" + floor-- + "&nbsp;楼</div>" +
                            get_msgstory_by_id(data, id_list[i]) +
                        "</div>";
                }
            }
            $("#msgCount").html(floor);
            $("#messagesBox").html(messages);
        }
    });
}

function down(a, b) {
    return (a - b < 0) ? 1 : -1;
}

function make_msgblock_html(item) {
    var buff = "", picBox = "";

    buff = "<div class=\"msgComposer noSelect\"><a>" + item.composer + "</a></div>";

    if (item.bmiddle_pic != null && item.bmiddle_pic != "")
        picBox = "<img onclick='changeAttachImageWidth(this)' src='" + item.bmiddle_pic + "' style='width: 32%;'>";
    else
        picBox = "";

    buff += "<div class=\"msgContent\"><p>" + item.content.replace(/\n/g, "<br>") + "</p>" + picBox + "</div>";
    buff += "<div class=\"msgReact noSelect\">";
    buff += "<div class=\"msgPostTime\">" + item.postTime + "</div>";
    buff += "<div class=\"msgButton\" onclick=\"reactMessage(this,'support'," +
        item.id + ")\">喜欢(<e>" + item.support + "</e>)</div>";
    buff += "<div class=\"msgButton\" onclick=\"reactMessage(this,'oppose'," +
        item.id + ")\">反感(<e>" + item.oppose + "</e>)</div>";
    buff += "<div class=\"msgButton showReplyButton\" onclick=\"showReplyMsgBox(this, " +
        item.id + ")\"\">回复"/*"(<e>" + item.replyNum + "</e>)"*/+"</div>";
    buff += "<div class=\"msgButton\" onclick=\"removeMessage(this," +
        item.id + ")\">&nbsp;</div>";
    //buff += "<div class=\"msgButton\" onclick=\"reactMessage(this,'report'," +
    //    item.id + ")\">举报(<e>" + item.report + "</e>)</div>";
    buff += "</div>";
    buff += "<div class=\"clearBoth\"></div>";
    return buff;
}

function get_msgstory_by_id(json, id)
{
    var header = "", message = "";
    var msg_id = id;
    var item;
    while (msg_id != 0) {
        item = json[msg_id];
        if (msg_id == id) {
            header = "<div class=\"storyContent\">";
        }
        else {
            header += "<div class=\"subMessage\">";
        }
        message = make_msgblock_html(item) + "</div>" + message;
        msg_id = item.replyMsgID;
    }
    return header + message;
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

function updateTime() {
    var now = new Date()
    var h = now.getHours()
    var m = now.getMinutes()
    var s = now.getSeconds()
    var unitTime = now.getTime() / 1000;
    // add a zero in front of numbers<10
    h = checkTime(h);
    m = checkTime(m)
    s = checkTime(s)
    $("#timeStringBox").html(h + ":" + m + ":" + s);
    if ($("#unixTimeBox").html() == "")
        $("#unixTimeBox").html(parseInt(unitTime));
    t = setTimeout('updateTime()', 500)
}

function checkTime(i) {
    if (i < 10)
    { i = "0" + i }
    return i
}
