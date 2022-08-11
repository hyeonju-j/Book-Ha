<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = (String)request.getAttribute("title");
	String profile = (String)request.getAttribute("profile");
	String logo = (String)request.getAttribute("logo");
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
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title><%= title %></title>

<meta name="description" content="" />

<style type="text/css">
.demo-inline-spacing {
	margin: auto;
}
</style>

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="../assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

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
						class="menu-header-text">목표를 얼마나 달성하셨나요?</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/my_achievements.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">나의 업적 확인</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">작성글을 확인해 봅시다.</span></li>

					<!-- Tables -->
					<li class="menu-item active" style=""><a href="javascript:void(0)"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-box bx-tada"></i>
							<div data-i18n="User interface">내 글 모아보기</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a href="/re_list.do"
								class="menu-link">
									<div data-i18n="Accordion">독후감 나누기</div>
							</a></li>
							<li class="menu-item"><a href="/al_list.do" class="menu-link">
									<div data-i18n="Badges">찔끔 챌린지</div>
							</a></li>
							<li class="menu-item active"><a href="/sh_list.do"
								class="menu-link">
									<div data-i18n="Buttons">나눔과 공유하기</div>
							</a></li>
						</ul></li>
						<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">나를 소개해주세요.</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/user_account_setting.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">개인 정보 수정</div>
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
							<span class="text-muted fw-light">내 글 모아보기 ></span> 공유 게시판 </h4>

						<!-- Hoverable Table rows -->
						
						<!--/ Hoverable Table rows -->

						<div class="card">
							<h5 class="card-header">
								나눔과 공유하기&nbsp;&nbsp;>&nbsp;&nbsp;<strong>공유 게시판</strong>
							</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-borderless">
									<tbody class="table-border-bottom-0">
									<tbody>
										<tr>
											<td>&nbsp;
												<button type="button"
													class="btn rounded-pill btn-primary"># 전체</button>
												&nbsp;
												<button type="button" class="btn rounded-pill btn-outline-primary">#
													나눔</button> &nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"># 교환</button>
												&nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"># 빌려줌</button>
												&nbsp;
												<button type="button"
													class="btn rounded-pill btn-outline-primary"># 빌려줘</button>
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
										<tr>
											<th>제 목</th>
											<th>태 그</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="./sh_view.do" style="color: gray"> 무궁화꽃이 피었습니다. </a>
												&nbsp;&nbsp;<span
												class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span>

											</td>
											<td>
												<ul
													class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
													<li>
														<button type="button"
															class="btn rounded-pill btn-outline-primary">#
															빌려줘</button>
													</li>
												</ul>
											</td>
											<td>작성자 1</td>
											<td>2022-07-26</td>
											<td>1</td>
										</tr>
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="#" style="color: gray"> 밀레니엄 시리즈 전권 </a>
												&nbsp;&nbsp;<span
												class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span>

											</td>
											<td>
												<ul
													class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
													<li>
														<button type="button"
															class="btn rounded-pill btn-outline-primary">#
															빌려줌</button>
													</li>
												</ul>
											</td>
											<td>작성자 1</td>
											<td>2022-07-26</td>
											<td>15</td>
										</tr>
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="#" style="color: gray"> 박경리 토지 전권 </a> &nbsp;&nbsp;<span
												class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span>

											</td>
											<td>
												<ul
													class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
													<li>
														<button type="button"
															class="btn rounded-pill btn-outline-primary">#
															빌려줌</button>
													</li>
												</ul>
											</td>
											<td>작성자 1</td>
											<td>2022-07-26</td>
											<td>3</td>
										</tr>
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="#" style="color: gray"> 난쏘공 </a> &nbsp;&nbsp;<span
												class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span>

											</td>
											<td>
												<ul
													class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
													<li>
														<button type="button"
															class="btn rounded-pill btn-outline-primary">#
															나눔</button>
													</li>
												</ul>
											</td>
											<td>작성자 1</td>
											<td>2022-07-26</td>
											<td>3</td>
										</tr>
										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-2"></i>
												<a href="#" style="color: gray"> 그리스로마신화 </a> &nbsp;&nbsp;<span
												class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">3</span>

											</td>
											<td>
												<ul
													class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
													<li>
														<button type="button"
															class="btn rounded-pill btn-outline-primary">#
															교환</button>
													</li>
												</ul>
											</td>
											<td>작성자 1</td>
											<td>2022-07-26</td>
											<td>30</td>
										</tr>
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
					<!-- <footer class="content-footer footer bg-footer-theme">
						<div
							class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
							<div class="mb-2 mb-md-0">
								©
								<script>
									document.write(new Date().getFullYear());
								</script>
								, made with ❤️ by <a href="https://themeselection.com"
									target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
							</div>
							<div>
								<a href="https://themeselection.com/license/"
									class="footer-link me-4" target="_blank">License</a> <a
									href="https://themeselection.com/" target="_blank"
									class="footer-link me-4">More Themes</a> <a
									href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
									target="_blank" class="footer-link me-4">Documentation</a> <a
									href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
									target="_blank" class="footer-link me-4">Support</a>
							</div>
						</div>
					</footer> -->
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
		<a href="./share_list.do"
			class="btn btn-outline-primary btn-buy-now">게시판 이동</a>
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
