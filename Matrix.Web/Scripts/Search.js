function searchKey(keywords) {
    var uri = "https://www.google.com.hk/search?q=" + keywords;
    //$("#iframeResult").attr("src", uri);
    window.location.href = uri;
    //window.open(uri);
}

$(function () {
    $("#searchIcon").click(function () {
        searchKey($("#inputSearch").val());
    });

    $("#inputSearch").keypress(function (e) {
        //if (e.keyCode == 13) {
            //searchKey($("#inputSearch").val());
        //}        
    });
})