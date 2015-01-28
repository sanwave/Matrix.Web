$(function () {
    $("#commitRegisterUser").click(function () {
        if ($("#username").val().length==0||
            $("#password").val().length==0||
            $("#email").val().length == 0) {
            alert("所有项不得为空");
            return;
        }

        if ($("#password").val() != $("#password2").val()) {
            alert("两次密码输入不一致");
            $("#password").val("");
            $("#password2").val("");
            return;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/Handler.ashx",
            data: {
                RequestType: "RegisterUser",
                UserName: $("#username").val(),
                Password: $("#password").val(),
                Email:$("#email").val()
            },
            success: function (data) {
                if (data.result == "success") {
                    alert("注册成功");
                    document.location = "Login.aspx";
                }
                else {
                    alert("注册失败");
                }
            }
        });
    });

    $("#commitLoginUser").click(function () {
        if ($("#username").val().length == 0 ||
            $("#password").val().length == 0) {
            alert("用户名和密码不得为空");
            return;
        }
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/Handler.ashx",
            data: {
                RequestType: "LoginUser",
                UserName: $("#username").val(),
                Password: $("#password").val()
            },
            success: function (data) {
                if (data.result == "success") {
                    //alert("登录成功");
                    document.location = "/Default.aspx";
                }
                else {
                    alert("登录失败");
                }
            }
        });
    });

    $("#navUserLogOff").click(function () {
        document.location.href = "/User/LogOff.aspx";
    });

    $("#navUserName").click(function (e) {
        $("#navUserBox").slideToggle(20);
        e.stopPropagation();
    });

    $(document).click(function () {
        $("#navUserBox").slideUp(20);
    });
});