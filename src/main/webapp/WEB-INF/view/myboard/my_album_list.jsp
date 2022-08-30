<%@page import="com.bookha.main.dto.DTOAlbumTotal"%>
<%@page import="com.bookha.main.dto.DTOAlbumBoard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bookha.main.dao.DAOAlbumBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
	
	DTOAlbumBoard dto = (DTOAlbumBoard)request.getAttribute("dto");
	DTOAlbumTotal totalLists = (DTOAlbumTotal)request.getAttribute("totalLists");
	String albumlist = (String)request.getAttribute("albumlist");
	
	int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
	
	String nav = (String)request.getAttribute("nav");
	String navBar = (String)request.getAttribute("navBar");
	String menuBar =(String)request.getAttribute("menuBar");
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

<title><%=title%></title>

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
<style type="text/css">

</style>
<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../assets/js/config.js"></script>

<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>
 
<script>

//modify
let al_seq = 0;
const modifyData = function(seq, subject){
	al_seq = seq;
	$("#modifySubject").val(subject);
	$("#formFile2").val("");
}

$(document).ready(function(){
	$( "#modify" ).on("click", function(){
		//제목 미입력 시
		if($("#modifySubject").val() == ""){
			toastr.error('제목을 입력해주세요.', '실패!');
			return false;
		}

		//이미지 미등록 시 
		if($("#formFile2").val() == ""|| $("#formFile2").val() == null){
			toastr.error("이미지를 등록해주요.", "실패!");
			return false;
		} else {
			let extension = $("#formFile2").val().split( "." ).pop().toLowerCase();
			if( extension != "png" && extension != "jpg" && extension != "gif" && extension != "jpeg" ){
				toastr.error("이미지 파일(jpg, jpeg, gif, png)을 등록해주세요.", "실패!");
				return false;
			}
		}
		//가상의 form생성(js내부에서 돌아가는 form 객체)
		const formData = new FormData(); 
    	formData.append('image', $('#formFile2')[0].files[0]);
    	
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
       			
       			let DTO_Album_board = {
       					"al_user_num" : <%=session_user_num%>,
       					"al_seq" : al_seq,
       					"al_subject" : $("#modifySubject").val(),
       					"al_imgName" : data.filename
       			}
       			
       			$.ajax({
       				type: "POST",
       				url: "album_modify.do",
       				data: JSON.stringify(DTO_Album_board),
       				contentType: "application/json; charset=utf-8",
       				dataType: "text",
       				success: function(data){
       					$("#modalCenter1").modal("hide");
       					reload();
       					toastr.success('게시글이 수정되었습니다.', '성공!');
       				}
       			});
       		}
       	});
	});
});

//delete 
let data = 0;
const deleteData = function(al_seq){
	data = al_seq;
}
$(document).ready(function(){
	$('#delete').on("click", function(){
		
		let DTO_Album_board = {
				"al_seq" : data
		}
		
		$.ajax({
			type: "POST",
			url: "album_delete.do",
			data: JSON.stringify(DTO_Album_board),
			contentType: "application/json; charset=utf-8",
			dataType: "text",
			success: function(data){
				$("#modalCenter2").modal("hide");
				reload();
				toastr.success('게시글이 삭제되었습니다.', '성공!');
			}
		});
	});
});

const reload = function(){
	$.ajax({
		type: 'POST',
		url: "myalbum_reload.do",
		datatype: "text",
		success: function(data){
			$("#albumContents").html(data);
		}
	});
}
	
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
					<%= logo %>
				</div>

				<div class="menu-inner-shadow"></div>
				<!-- menuBar Model -->
				<%=menuBar %>
				<!-- / menuBar Model -->
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page" id="albumlayout">
				<!-- Navbar -->
				<%=navBar %>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">찔끔 챌린지 ></span> 내가 작성한 글 목록
						</h4>

						<div class="card">
							
						</div>
						
						<!-- Hoverable Table rows -->
						<div>

							<div class="row row-cols-4 row-cols-md-4 g-4 mb-4" id="albumContents">
								<%= albumlist %>	
							</div>
							
							<!-- 페이징 -->
							<div class="demo-inline-spacing" style="display:flex; justify-content: center;">
								<%= nav %>
							</div>
							<!-- /페이징 -->
							
						</div>
					</div>
					<!--/ Hoverable Table rows -->

				</div>
				<!-- / Content -->
				
				<!-- Modal -->
				<!--  Write Modal  -->
				
				<!--  Write Modal  -->

				<!--  Modify Modal  -->
				<div class="modal fade" id="modalCenter1" tabindex="-1"
					style="display: none;" aria-hidden="true" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modalCenterTitle">글 수정하기</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col mb-3">
										<label for="modifySubject" class="form-label">제목</label> 
										<input
											type="text" id="modifySubject" class="form-control"
											placeholder="Title">
									</div>
								</div>
								<!-- 사진업로드  -->
								<div class="row g-2">
									<div>
										<label for="formFile2" class="form-label">사진</label> 
										<input class="form-control" type="file" name="upload" id="formFile2" accept=".gif, .jpg, .png, .jpeg">
									</div>
								</div>
								<!-- /사진업로드 -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" id="modify">수정</button>
							</div>
						</div>
					</div>
				</div>
				<!--  /Modify Modal  -->
				
				<!--  Delete Modal  -->
				<div class="modal fade" id="modalCenter2" tabindex="-1"
					style="display: none;" aria-hidden="true" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<p>정말 삭제하시겠습니까?</p>
								<br />
								<br />
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="delete">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  /Delete Modal  -->
				<!-- /Modal -->

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
		<a href="/album_list.do"
			class="btn btn-outline-primary btn-buy-now">챌린지게시판</a>
	</div>

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
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
