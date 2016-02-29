function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search)
        if (offset != -1) {
            offset += search.length
            end = document.cookie.indexOf(";", offset)
            if (end == -1) end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
        else return ""
    }
}

function getUrlParamByName(name) {
    var result = location.search.match(
        new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    if (result == null || result.length < 1) {
        return "";
    }
    return result[1];
}

function EncodeText(msg) {
    //msg = msg.replace(/[\n]+/g, "<br>");
    //msg = msg.replace(/ /g, "&nbsp;");
    //msg = msg.replace(/[']/g, "''");
    //return msg;   
        
    if (msg.length == 0) return "";
    msg = msg.replace(/&/g, "&gt;");
    msg = msg.replace(/</g, "&lt;");
    msg = msg.replace(/>/g, "&gt;");
    msg = msg.replace(/ /g, "&nbsp;");
    msg = msg.replace(/\'/g, "'");
    msg = msg.replace(/\"/g, "&quot;");
    msg = msg.replace(/\n/g, "<br>");
    return msg;
}

function DecodeText(msg) {
    //text = text.replace(/<br>/g, "\n");
    //text = text.replace(/&nbsp;/g, " ");
    //text = text.replace(/['']/g, "'");
    //return text;

    if (msg.length == 0) return "";
    msg = msg.replace(/&gt;/g, "&");
    msg = msg.replace(/&lt;/g, "<");
    msg = msg.replace(/&gt;/g, ">");
    msg = msg.replace(/&nbsp;/g, " ");
    msg = msg.replace(/'/g, "\'");
    msg = msg.replace(/&quot;/g, "\"");
    msg = msg.replace(/<br>/g, "\n");
    return msg;
    
}