Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

$(document).ready(function () {
    $("#currentDate").val(new Date().Format("yyyy-MM-dd"));
    $("#workhours").val("8");
    //alert("height:" + $("html").height() + ", width:" + $("html").width());
    if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
        $(".container").width("85%");
        var font_size = $(".container").width() / 22;
        $("body").css("font-size", font_size);
        //alert(navigator.userAgent);
        //苹果端
    } else if (/(Android)/i.test(navigator.userAgent)) {
        $(".container").width("85%");
        var font_size = $(".container").width() / 22;
        $("body").css("font-size", font_size);
        //alert(navigator.userAgent); 
        //安卓端
    } else {
        $(".container").width("370");
        $("body").css("font-size", "16px");
        //alert("PC: " + navigator.userAgent);
        //pc端
    };
});

function sumbitDiary()
{
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Zentao.ashx",
        data: {
            requestType: "submitDiary",
            account: $("#username").val(),
            password: $("#password").val(),
            frequency: $("#submitFrequency").val(),
            lang: "zh-cn",
            department: $("#selectDepartment").val(),
            worktype: $("#selectWorkType").val(),
            project: $("#selectProject").val(),
            date: $("#currentDate").val(),
            workhours: $("#workhours").val(),
            content: $("#workContent").val()
        },        
        success: function (data) {
            if (data.result == "login_error") {
                alert("认证失败！请检查用户名密码是否正确");
            }
            else if (data.result == "submit_error") {
                alert("提交失败！请联系我");
            }
            else if(data.result == "submit_succeed") {
                alert("提交成功！");
            }
            else if (data.result == "addtask_succeed") {
                alert("添加任务成功！");
            }
            else if (data.result == "addtask_failed") {
                alert("添加任务失败！");
            }
            else {
                alert("未知错误！");
            }
        },
        error: function () {
            alert("服务异常");
        }
    });
}

$(function () {
    $("#submitButton").click(function () {
        sumbitDiary();
    });
});