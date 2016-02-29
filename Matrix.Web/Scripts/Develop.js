function showText(e, files) {
    var progressBatchId = Date.parse(new Date());
    if (files.length) {
        var file = files[0];
        var reader = new FileReader();
        if (/text\/\w+/.test(file.type) || true) {
            reader.onload = function () {
                /*if (typeof (editor) == undefined) {
                    editor.deleteH();
                    editor.setValue(this.result);
                }
                else {
                    //$('#codeBox').text(this.result);

                    var editor = CodeMirror.fromTextArea(codeBox, {
                        lineNumbers: true,
                        mode: "javascript"
                    });
                }*/

                $('#codeBox').text(this.result);
                if (file.type == "text/xml") {
                    validateXml($("#codeBox").html());
                }                
            }
            reader.readAsText(file);
        }
    }
}

function validateXml(txt) {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/Handler.ashx",
        data: {
            RequestType: "ValidateXml",
            Content: txt
        },
        error: function () {
            alert("服务器发生错误");
        },
        success: function (data) {
            if (data.result == "success") {
                alert("无一致性错误");
            }
            else {
                alert(data.alert);
            }
        }
    });
}



function runCode() {
    switch ($("#compileLanguage").val()) {
        case "xml":
            validateXml($("#codeBox").html());
            break;

        case "c++":
            break;

        case "c#":
            break;

        default:
            break;
    }    
}