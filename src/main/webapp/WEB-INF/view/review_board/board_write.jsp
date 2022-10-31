<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
	String navBar = (String)request.getAttribute("navBar");
	String menuBar = (String)request.getAttribute("menuBar");
	
	int session_user_num = (int)request.getAttribute("session_user_num");
%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title><%= title %></title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="../assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="../assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="../assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="../assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>

<!-- 디자인 수정용 CSS 추가 -->
<style>
#editor {
	/* border : 1px solid; */
	width: 95%;
	margin: 5px auto;
}
/* editor content 받을 div태그 스타일 추가. */
#contents {
	width: 50%;
	height: 100px;
	margin: 30px auto;
	border: 1px solid;
}

#accordion {
	width: 95%;
	margin: 10px auto;
}

.input-group {
	width: 95%;
	margin: 10px auto;
}

.list-group {
	width: 95%;
	margin: 10px auto;
}

#defaultFormControlInput {
	width: 95%;
	margin: 5px auto;
	font-size: 35pt;
	font: bold;
	color: #696CFF;
}

.buy-now .btn-buy-now:hover {
  color: blue;
}
</style>

<!-- jQuery UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<!-- codemirror CDN URL -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- TOAST UI Editor CDN URL(CSS) -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<!-- TOAST UI Editor CDN URL(JS) -->
<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	
<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>

<script>
	$(document).ready(function() {
		var pageNum = 1;
		let tag_radio = '';
		let book_search_is_end = false;
		
		$("#search").on("click", () => {
			$("#kakao_bookSearch_result").html("");
			
			if($("#query").val()=='') {
				return false;	
			}
			
			$.ajax({
			    method: "GET",
			    url: "https://dapi.kakao.com/v3/search/book?target=title",
			    data: { query: $("#query").val(), page: pageNum},
			    headers: {Authorization: "KakaoAK 4169af87ec57642db130af59093e6bbc"}
			
			})
			.done((msg) => {
			 	
			book_search_is_end = msg.meta.is_end;
			
			let search_count = 5;
			
			if(msg.meta.total_count < 5) {
				search_count = msg.meta.total_count;
			}
			 	
			    for (var i = 0; i < search_count; i++){
			        let html = "";
			        html += "<label class='list-group-item list-group-item-action'>";
			        html += "<table>";
			        html += "<tr><td>";
			        html += "<input class='form-check-input me-1' type='radio' value='' name='bookRadio'/>";
			        html += "</td>";
			        html += "<td>";
			        html += "<div class='d-grid d-sm-flex p-3'>";
			        html += "<img src='" + msg.documents[i].thumbnail + "' style='width: 120px' class='me-4 mb-sm-0 mb-2'/>";
			        html += "<span>";
			        html += "<h6><a href='"+ msg.documents[i].url +"'>" + msg.documents[i].title + "</a></h6>";
			        html += "<strong>저자:</strong> <span class='span_author'>" + msg.documents[i].authors + "</span><br>";
			        html += "<strong>출판사:</strong> <span class='span_publisher'>" + msg.documents[i].publisher + "</span><br>";
			        html += "<strong>요약:</strong> <span class='span_summary'>" + msg.documents[i].contents + "...</span><br>";
			        html += "</span>";
			        html += "</div>";
			        html += "</td></tr>";
			        html += "</table>";
			        html += "</label>";
			        $("#kakao_bookSearch_result").append(html);
			        
			        $("#query").html("");
			        //console.log($("#kakao_bookSearch_result").html());
			    }
			});
		});
		$(window).scroll(function(){
			if($("#query").val()=='') {
				return false;	
			}
			
			if(book_search_is_end) {
				return false;
			}
			
	        if (Math.ceil($(window).scrollTop()) + $(window).height() >= $(document).height()) {
	            pageNum++;

	            $.ajax({
	                method: "GET",
	                url: "https://dapi.kakao.com/v3/search/book?target=title",
	                data: { query: $("#query").val(),  page: pageNum},
	                headers: {Authorization: "KakaoAK 4169af87ec57642db130af59093e6bbc"} // ########부분에 본인의 REST API 키를 넣어주세요.

	            })
	            .done(function (msg) {
	            	
	                book_total_search_count = msg.meta.is_end;
	                
				let search_count = 5;
 				
 				if(msg.meta.total_count < 5) {
 					search_count = msg.meta.total_count;
 				}
	                
	                for (var i = 0; i < search_count; i++){
	                	let html = "";
	    		        html += "<label class='list-group-item list-group-item-action'>";
	    		        html += "<table>";
	    		        html += "<tr><td>";
	    		        html += "<input class='form-check-input me-1' type='radio' value='' name='bookRadio'/>";
	    		        html += "</td>";
	    		        html += "<td>";
	    		        html += "<div class='d-grid d-sm-flex p-3'>";
	    		        html += "<img src='" + msg.documents[i].thumbnail + "' style='width: 120px' class='me-4 mb-sm-0 mb-2'/>";
	    		        html += "<span>";
	    		        html += "<h6><a href='"+ msg.documents[i].url +"'>" + msg.documents[i].title + "</a></h6>";
	    		        html += "<strong>저자:</strong> <span class='span_author'>" + msg.documents[i].authors + "</span><br>";
	    		        html += "<strong>출판사:</strong> <span class='span_publisher'>" + msg.documents[i].publisher + "</span><br>";
	    		        html += "<strong>요약:</strong> <span class='span_summary'>" + msg.documents[i].contents + "...</span><br>";
	    		        html += "</span>";
	    		        html += "</div>";
	    		        html += "</td></tr>";
	    		        html += "</table>";
	    		        html += "</label>";
	    		        $("#kakao_bookSearch_result").append(html);
	                }
	            });
	        }
	    });
		
		$('.btn-check').on('click', function(e) {
			tag_radio = $(this).next().text();
		});
		
		
		$('#board_submit').on("click", function(e) {
			if($('#defaultFormControlInput').val() == '') {
				toastr.error('제목을 입력해주세요.', '실패!');
				return false;
			}
			
			if(editor.getHTML() == '<p><br></p>') {
				toastr.error('본문을 입력해주세요.', '실패!');
				return false;
			}
			
			for(let i=1; i<=6; i++) {
				if(editor.getHTML().indexOf('<h' + i + '><br></h' + i + '>') != -1) {
					toastr.error('소제목을 확인해주세요', '실패!');
					return false;
				}
			}
			
			if(tag_radio == '') {
				toastr.error('해시태그를 선택해주세요.', '실패!');
				return false;	
			}
			
			if($("#query").val() == '') {
				toastr.error('책을 검색해주세요.', '실패!');
				return false;	
			}
			
			if($("input[name='bookRadio']").length == $("input[name='bookRadio']:not(:checked)").length) {
				toastr.error('책을 선택해주세요.', '실패!');
				return false;
			}
			
			let img_url = $("input[name='bookRadio']:checked").parent().parent().html();
			let startImgUrl = img_url.indexOf("src=\"");
			let lastImgUrl = img_url.indexOf("\"", startImgUrl+5);
			let subImgUrl = img_url.substring(startImgUrl+5, lastImgUrl).replaceAll("amp;", "");
			
			let info_url = $("input[name='bookRadio']:checked").parent().parent().find('h6').html();
			let startInfoUrl = info_url.indexOf("\"");
			let lastInfoUrl = info_url.lastIndexOf("\"");
			let subInfoUrl = info_url.substring(startInfoUrl+1, lastInfoUrl).replaceAll("amp;", "");
				
			let f = document.createElement('form');
			
			let obj1;
			obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden');
			obj1.setAttribute('name', 'subject');
			obj1.setAttribute('value', $('#defaultFormControlInput').val());
			
			let obj2;
			obj2 = document.createElement('input');
			obj2.setAttribute('type', 'hidden');
			obj2.setAttribute('name', 'user_num');
			obj2.setAttribute('value', <%= session_user_num %>);
			
			let obj3;
			obj3 = document.createElement('input');
			obj3.setAttribute('type', 'hidden');
			obj3.setAttribute('name', 'content');
			obj3.setAttribute('value', editor.getHTML());
			
			let obj4;
			obj4 = document.createElement('input');
			obj4.setAttribute('type', 'hidden');
			obj4.setAttribute('name', 'hash_tag');
			obj4.setAttribute('value', tag_radio);
			
			let obj5;
			obj5 = document.createElement('input');
			obj5.setAttribute('type', 'hidden');
			obj5.setAttribute('name', 'book_img_url');
			obj5.setAttribute('value', subImgUrl);
			
			let obj6;
			obj6 = document.createElement('input');
			obj6.setAttribute('type', 'hidden');
			obj6.setAttribute('name', 'book_info_url');
			obj6.setAttribute('value', subInfoUrl);
			
			let obj7;
			obj7 = document.createElement('input');
			obj7.setAttribute('type', 'hidden');
			obj7.setAttribute('name', 'book_title');
			obj7.setAttribute('value', $("input[name='bookRadio']:checked").parent().parent().find('a').html());
			
			let obj8;
			obj8 = document.createElement('input');
			obj8.setAttribute('type', 'hidden');
			obj8.setAttribute('name', 'book_author');
			obj8.setAttribute('value', $("input[name='bookRadio']:checked").parent().parent().find('.span_author').html());
			
			let obj9;
			obj9 = document.createElement('input');
			obj9.setAttribute('type', 'hidden');
			obj9.setAttribute('name', 'book_publisher');
			obj9.setAttribute('value', $("input[name='bookRadio']:checked").parent().parent().find('.span_publisher').html());
			
			let obj10;
			obj10 = document.createElement('input');
			obj10.setAttribute('type', 'hidden');
			obj10.setAttribute('name', 'book_summary');
			obj10.setAttribute('value', $("input[name='bookRadio']:checked").parent().parent().find('.span_summary').html());
			
			f.appendChild(obj1);
			f.appendChild(obj2);
			f.appendChild(obj3);
			f.appendChild(obj4);
			f.appendChild(obj5);
			f.appendChild(obj6);
			f.appendChild(obj7);
			f.appendChild(obj8);
			f.appendChild(obj9);
			f.appendChild(obj10);
			
			f.setAttribute('method', 'post');
			f.setAttribute('action', '/review_write_ok.do');
			document.body.appendChild(f);
			f.submit();
		});
		
		<!-- TOAST UI Editor 생성 JavaScript 코드 -->
		const editor = new toastui.Editor({
		    el: document.querySelector('#editor'),
		    previewStyle: 'vertical',
		    previewHighlight: false,
		    height: '700px',
		    // 사전입력 항목
		    //placeholder: 'Please enter text.',
		    // 이미지가 Base64 형식으로 입력되는 것 가로채주는 옵션
		    hooks: {
		    	addImageBlobHook: (blob, callback) => {
		    		// blob : Java Script 파일 객체
		    		//console.log(blob);
		    		
		    		const formData = new FormData();
		        	formData.append('image', blob);
		        	
		        	let url = '/images/';
		   			$.ajax({
		           		type: 'POST',
		           		enctype: 'multipart/form-data',
		           		url: '/img_change.do',
		           		data: formData,
		           		dataType: 'json',
		           		processData: false,
		           		contentType: false,
		           		cache: false,
		           		timeout: 600000,
		           		success: function(data) {

		           			url += data.filename;
		           			
		           			// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
		        			// 형식 : ![대체 텍스트](주소)
		           			callback(url, '사진 대체 텍스트 입력');
		           		},
		           		error: function(e) {
		           			toastr.error('이미지 업로드에 실패하였습니다.', '실패!');
		           			callback('image_load_fail', '사진 대체 텍스트 입력');
		           		}
		           	});
		    	}
		    }
		});
	});
</script>
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			

			<aside id="layout-menu"
				class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo">
					<!-- LOGO -->
					<%= logo %>
					<!-- /LOGO -->
				</div>
				<div class="menu-inner-shadow"></div>
				<!-- menuBar Model -->
				<%=menuBar %>
				<!-- / menuBar Model -->
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<%=navBar %>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">독후감 나누기 > 게시판 목록 ></span> 게시글 작성
						</h4>

						<div class="card">
							<h5 class="card-header">
								독후감 나누기&nbsp;&nbsp;>&nbsp;&nbsp;<strong>독후감 게시판</strong>
							</h5>
							
							<div>
								<input type="text" class="form-control"
									id="defaultFormControlInput" placeholder="제목을 입력하세요"
									aria-describedby="defaultFormControlHelp" />
							</div>
							<br />
							<div class="table-responsive text-nowrap">
								<table class="table table-borderless">
									<tbody class="table-border-bottom-0">
									<tbody>
										<tr>
											<td>
												&nbsp;&nbsp;
												<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio1"># 소설</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio2"># 수필</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio3"># 시</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio4"># 인문/사회</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio5"># 과학</label>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio6"># 기타</label>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<br />

							<!-- Hoverable Table rows -->

							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<div id="editor"></div>
							
						</div>
						<!--/ Hoverable Table rows -->

						<br />

						<div class="card">
							<h5 class="card-header">
								<strong>책 선택하기</strong>
							</h5>

							<!-- Search -->
							<div class="input-group">
								<button id="search" class="input-group-text">
									<i class="tf-icons bx bx-search"></i>
								</button>
								<input type="text" id="query" class="form-control"
									placeholder="도서명을 입력하시고 검색 버튼을 눌러주세요!" />
							</div>
							<!-- /Search -->

							<div class="list-group" id="kakao_bookSearch_result"></div>
						</div>
					</div>
					<!-- / Content -->

					<div class="content-backdrop fade"></div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->

	<div class="buy-now">
		<a
			href="javascript:void(0);"
			class="btn btn-outline-primary btn-buy-now"
			style="background-color: #f5f5f9"
			id="board_submit">작성 완료</a>
	</div>

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script
		src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="../assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->

	<!-- Main JS -->
	<script src="../assets/js/main.js"></script>

	<!-- Page JS -->

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
