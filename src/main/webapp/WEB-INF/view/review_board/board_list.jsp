<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bookha.main.dto.DTO_Review_Total" %>
<%@ page import="com.bookha.main.dto.DTO_Review_Board" %>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
	
	String reviewTable = (String)request.getAttribute("reviewTable");
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

<style type="text/css">
.demo-inline-spacing {
	margin: auto;
}
</style>

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

				<ul class="menu-inner py-1">

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">당신의 순위는 어디일까요?</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/ranking.do" class="menu-link">
							<i class='menu-icon bx bx-crown' style='color: #646363'></i> <!-- <i class='menu-icon bx bx-crown bx-tada' style='color:#646363' ></i> -->
							<div data-i18n="Tables">업적과 순위</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">책을 읽고 느낀점을 나눠봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item active"><a href="/review_list.do"
						class="menu-link"> <i
							class='menu-icon bx bx-book-open bx-tada' style='color: #646363'></i>
							<!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">독후감 나누기</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">하루하루 책을 읽어봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/album_list.do"
						class="menu-link"> <i class='menu-icon bx bx-photo-album'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-photo-album bx-tada' style='color:#646363' ></i> -->
							<div data-i18n="Tables">찔끔 챌린지</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">다른 사람들과 책을 나눠봐요!</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/share_list.do"
						class="menu-link"> <i class='menu-icon bx bx-gift'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-bx-gift bx-tada' style='color:#646363' ></i> -->
							<div data-i18n="Tables">나눔과 공유하기</div>
					</a></li>


				</ul>
			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<nav
					class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
					id="layout-navbar">
					<div
						class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4"
							href="javascript:void(0)"> <i class="bx bx-menu bx-sm"></i>
						</a>
					</div>

					<div class="navbar-nav-right d-flex align-items-center"
						id="navbar-collapse">
						<!-- Search -->
						<div class="navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
									class="form-control border-0 shadow-none"
									placeholder="Search..." aria-label="Search..." />
							</div>
						</div>
						<!-- /Search -->

						<ul class="navbar-nav flex-row align-items-center ms-auto">

							<!-- User -->
							<%= profile %>
							<!--/ User -->
						</ul>
					</div>
				</nav>

				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">독후감 나누기 ></span> 게시판 목록
						</h4>

						<!-- Hoverable Table rows -->
						<div class="card">
							<h5 class="card-header">
								<strong>공지 사항</strong>
							</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일자</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="#" style="color: gray"> <strong>[필독]&nbsp;&nbsp;</strong>게시판
													사용시 주의사항 및 규칙 2 (반드시 확인 바랍니다)
											</a></td>
											<td>운영자</td>
											<td>2022-07-27</td>
										</tr>
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="#" style="color: gray"> <strong>[필독]&nbsp;&nbsp;</strong>게시판
													사용시 주의사항 및 규칙 1 (반드시 확인 바랍니다)
											</a></td>
											<td>운영자</td>
											<td>2022-07-26</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--/ Hoverable Table rows -->

						<br />

						<div class="card">
							<h5 class="card-header">
								독후감 나누기&nbsp;&nbsp;>&nbsp;&nbsp;<strong>독후감 게시판</strong>
							</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-borderless">
									<tbody class="table-border-bottom-0">
									<tbody>
										<tr>
											<td>
												&nbsp;
												<input type="radio" class="btn-check" name="btnradio" id="btnradio0" checked autocomplete="off">
												<label class="btn rounded-pill btn-outline-primary" for="btnradio0"># 전체</label>
												&nbsp;
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
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr align="center">
											<th>제목</th>
											<th>책 정보</th>
											<th>태그</th>
											<th>조회수</th>
											<th>작성자</th>
											<th>작성일자</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
<!-- 										<tr> -->
<!-- 											<td><i class="fab fa-angular fa-lg text-danger me-2"></i> -->
<!-- 												<a href="./review_view.do" style="color: gray"> <strong>[책 -->
<!-- 														리뷰]&nbsp;&nbsp;</strong>다자이 오사무의 인간 실격 -->
<!-- 											</a> &nbsp;&nbsp;<span -->
<!-- 												class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span> -->

<!-- 											</td> -->
<!-- 											<td> -->
<!-- 												<ul -->
<!-- 													class="list-unstyled users-list m-0 d-flex align-items-center"> -->
<!-- 													<div data-bs-toggle="tooltip" data-bs-placement="top" -->
<!-- 														data-bs-html="true" -->
<%-- 														title='<img src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F540869%3Ftimestamp%3D20220726171644" />'> --%>
<!-- 														인간 실격</div> -->
<!-- 												</ul> -->
<!-- 											</td> -->
<!-- 											<td> -->
<!-- 												<ul -->
<!-- 													class="list-unstyled users-list m-0 avatar-group d-flex align-items-center"> -->
<!-- 													<li> -->
<!-- 														<button type="button" -->
<!-- 															class="btn rounded-pill btn-outline-primary"># -->
<!-- 															소설</button> -->
<!-- 													</li> -->
<!-- 												</ul> -->
<!-- 											</td> -->
<!-- 											<td>작성자 1</td> -->
<!-- 											<td>2022-07-26</td> -->
<!-- 										</tr> -->
										<%= reviewTable %>
									</tbody>
								</table>
							</div>
							<div class="demo-inline-spacing">
								<!-- Basic Pagination -->
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<li class="page-item first"><a class="page-link"
											href="javascript:void(0);"><i
												class="tf-icon bx bx-chevrons-left"></i></a></li>
										<li class="page-item prev"><a class="page-link"
											href="javascript:void(0);"><i
												class="tf-icon bx bx-chevron-left"></i></a></li>
										<li class="page-item"><a class="page-link"
											href="javascript:void(0);">1</a></li>
										<li class="page-item"><a class="page-link"
											href="javascript:void(0);">2</a></li>
										<li class="page-item active"><a class="page-link"
											href="javascript:void(0);">3</a></li>
										<li class="page-item"><a class="page-link"
											href="javascript:void(0);">4</a></li>
										<li class="page-item"><a class="page-link"
											href="javascript:void(0);">5</a></li>
										<li class="page-item next"><a class="page-link"
											href="javascript:void(0);"><i
												class="tf-icon bx bx-chevron-right"></i></a></li>
										<li class="page-item last"><a class="page-link"
											href="javascript:void(0);"><i
												class="tf-icon bx bx-chevrons-right"></i></a></li>
									</ul>
								</nav>
								<!--/ Basic Pagination -->
							</div>
						</div>
						<!--/ Hoverable Table rows -->

					</div>
					<!-- / Content -->

					<!-- Footer -->
<!-- 					<footer class="content-footer footer bg-footer-theme"> -->
<!-- 						<div -->
<!-- 							class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column"> -->
<!-- 							<div class="mb-2 mb-md-0"> -->
<!-- 								© -->
<!-- 								<script> -->
<!--  						document.write(new Date().getFullYear()); -->
<!-- 								</script> -->
<!-- 								, made with ❤️ by <a href="https://themeselection.com" -->
<!-- 									target="_blank" class="footer-link fw-bolder">ThemeSelection</a> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<a href="https://themeselection.com/license/" -->
<!-- 									class="footer-link me-4" target="_blank">License</a> <a -->
<!-- 									href="https://themeselection.com/" target="_blank" -->
<!-- 									class="footer-link me-4">More Themes</a> <a -->
<!-- 									href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" -->
<!-- 									target="_blank" class="footer-link me-4">Documentation</a> <a -->
<!-- 									href="https://github.com/themeselection/sneat-html-admin-template-free/issues" -->
<!-- 									target="_blank" class="footer-link me-4">Support</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</footer> -->
					<!-- / Footer -->

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
		<a href="./review_write.do"
			class="btn btn-outline-primary btn-buy-now">글 작성하기</a>
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
