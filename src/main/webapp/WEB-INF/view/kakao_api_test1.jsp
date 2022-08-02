<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

<input type="text" id="query">
<button id="search">검색</button>

<div></div>

<script src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
$(document).ready(function () {
	var pageNum = 1;
	
	$("#search").on("click", () => {
		$("div").html("");
		
		$.ajax({
		    method: "GET",
		    url: "https://dapi.kakao.com/v3/search/book?target=title",
		    data: { query: $("#query").val(), page: pageNum},
		    headers: {Authorization: "KakaoAK 4169af87ec57642db130af59093e6bbc"} // ########부분에 본인의 REST API 키를 넣어주세요.
		
		})
		.done(function (msg) {
		    console.log(msg);
		    for (var i = 0; i < 1; i++){
		        $("div").append("<h2><a href='"+ msg.documents[i].url +"'>" + msg.documents[i].title + "</a></h2>");
		        $("div").append("<strong>저자:</strong> " + msg.documents[i].authors + "<br>");
		        $("div").append("<strong>출판사:</strong> " + msg.documents[i].publisher + "<br>");
		        $("div").append("<strong>요약:</strong> " + msg.documents[i].contents + "...<br>");
		        $("div").append("<img src='" + msg.documents[i].thumbnail + "'/><br>");
		    }
		});
	});

    $(window).scroll(function(){  

        if ( Math.ceil($(window).scrollTop()) + $(window).height() >= $(document).height() ){
            pageNum++;


            $.ajax({
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book?target=title",
                data: { query: $("#query").val(),  page: pageNum},
                headers: {Authorization: "KakaoAK 4169af87ec57642db130af59093e6bbc"} // ########부분에 본인의 REST API 키를 넣어주세요.

            })
            .done(function (msg) {
                console.log(msg);
                for (var i = 0; i < 1; i++){
                    $("div").append("<h2><a href='"+ msg.documents[i].url +"'>" + msg.documents[i].title + "</a></h2>");
                    $("div").append("<strong>저자:</strong> " + msg.documents[i].authors + "<br>");
                    $("div").append("<strong>출판사:</strong> " + msg.documents[i].publisher + "<br>");
                    $("div").append("<strong>요약:</strong> " + msg.documents[i].contents + "...<br>");
                    $("div").append("<img src='" + msg.documents[i].thumbnail + "'/><br>");
                }
            });

        }
        
    });
});

      
</script>

</body>
</html>