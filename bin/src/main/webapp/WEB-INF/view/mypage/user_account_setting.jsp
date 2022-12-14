<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String title = (String) request.getAttribute("title");
String profile = (String) request.getAttribute("profile");
String logo = (String) request.getAttribute("logo");
%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="css/assets/"
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
					<%=logo%>
					<!-- /LOGO -->
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">????????? ????????? ???????????????????</span></li>

					<!-- Tables -->
					<li class="menu-item"><a href="/my_achievements.do"
						class="menu-link"> <i class='menu-icon bx bx-book-open'
							style='color: #646363'></i> <!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">?????? ?????? ??????</div>
					</a></li>

					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">???????????? ????????? ?????????.</span></li>

					<!-- Tables -->
					<li class="menu-item" style=""><a href="javascript:void(0)"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-box"></i>
							<div data-i18n="User interface">??? ??? ????????????</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a href="/re_list.do"
								class="menu-link">
									<div data-i18n="Accordion">????????? ?????????</div>
							</a></li>
							<li class="menu-item"><a href="/al_list.do"
								class="menu-link">
									<div data-i18n="Badges">?????? ?????????</div>
							</a></li>
							<li class="menu-item"><a href="/sh_list.do"
								class="menu-link">
									<div data-i18n="Buttons">????????? ????????????</div>
							</a></li>
						</ul></li>
					<!-- Forms & Tables -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">?????? ??????????????????.</span></li>

					<!-- Tables -->
					<li class="menu-item active"><a href="/user_account_setting.do"
						class="menu-link"> <i
							class='menu-icon bx bx-book-open bx-tada' style='color: #646363'></i>
							<!-- <i class='menu-icon bx bx-book-open' style='color:#646363'  ></i> -->
							<div data-i18n="Tables">?????? ?????? ??????</div>
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



						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- Place this tag where you want the button to render. -->

							<!-- User -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown">
								<a class="nav-link dropdown-toggle hide-arrow"
								href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">
										<img src="../assets/img/avatars/1.png" alt
											class="w-px-40 h-auto rounded-circle" />
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="#">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">
														<img src="../assets/img/avatars/1.png" alt
															class="w-px-40 h-auto rounded-circle" />
													</div>
												</div>
												<div class="flex-grow-1">
													<span class="fw-semibold d-block">John Doe</span> <small
														class="text-muted">Admin</small>
												</div>
											</div>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="/user_account_setting">
											<i class="bx bx-user me-2"></i> <span class="align-middle">???????????????</span>
									</a></li>

									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="/logout"> <i
											class="bx bx-power-off me-2"></i> <span class="align-middle">????????????</span>
									</a></li>
								</ul>
							</li>
							<!--/ User -->
						</ul>
					</div>
				</nav>

				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->

					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">?????? ?????? ??????</h4>

						<div class="row">
							<div class="col-md-12">
								<!--                  <ul class="nav nav-pills flex-column flex-md-row mb-3">-->
								<!--                    <li class="nav-item">-->
								<!--                      <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i>??????</a>-->
								<!--                    </li>-->
								<!--                  </ul>-->
								<div class="card mb-4">
									<h5 class="card-header">?????? ??????</h5>
									<!-- Account -->
									<div class="card-body">
										<div
											class="d-flex align-items-start align-items-sm-center gap-4">
											<img src="../assets/img/avatars/1.png" alt="user-avatar"
												class="d-block rounded" height="100" width="100"
												id="uploadedAvatar" />
											<div class="button-wrapper">
												<label for="upload" class="btn btn-primary me-2 mb-4"
													tabindex="0"> <span class="d-none d-sm-block">???
														??? ??? ???</span> <i class="bx bx-upload d-block d-sm-none"></i> <input
													type="file" id="upload" class="account-file-input" hidden
													accept="image/png, image/jpeg" />
												</label>
												<button type="button"
													class="btn btn-outline-secondary account-image-reset mb-4">
													<i class="bx bx-reset d-block d-sm-none"></i> <span
														class="d-none d-sm-block">?????????</span>
												</button>

												<p class="text-muted mb-0">JPG, GIF, PNG. ???????????? ?????? 800KB</p>
											</div>
										</div>
									</div>
									<hr class="my-0" />
									<div class="card-body">
										<form id="formAccountSettings" method="POST"
											onsubmit="return false">
											<div class="row">
												<div class="mb-3 col-md-6">
													<label for="firstName" class="form-label">ID</label> <input
														class="form-control" type="text" id="firstName"
														name="firstName" value="ID" autofocus />
												</div>
												<div class="mb-3 col-md-6">
													<label for="lastName" class="form-label">??? ???</label> <input
														class="form-control" type="text" name="lastName"
														id="lastName" value="??? ???" />
												</div>
												<div class="mb-3 col-md-6">
													<label for="email" class="form-label">?????????</label> <input
														class="form-control" type="text" id="email" name="email"
														value="??? ??? ???" placeholder="john.doe@example.com" />
												</div>
												<div class="mb-3 col-md-6">
													<label for="organization" class="form-label">??? ??? ???</label>
													<input type="text" class="form-control" id="organization"
														name="organization" value="??? ??? ???" />
												</div>
												<div class="mb-3 col-md-6">
													<label class="form-label" for="phoneNumber">??? ??? ??? ???</label>
													<div class="input-group input-group-merge">
														<input type="text" id="phoneNumber" name="phoneNumber"
															class="form-control" value="????????????" />
													</div>
												</div>
												<div class="mt-2">
													<button type="submit" class="btn btn-primary me-2">???
														??? ??? ??? ??? ???</button>
													<button type="reset" class="btn btn-outline-secondary">???
														???</button>
												</div>
										</form>
									</div>
									<!-- /Account -->
								</div>
								<div class="card">
									<h5 class="card-header">?????? ??????</h5>
									<div class="card-body">
										<div class="mb-3 col-12 mb-0">
											<div class="alert alert-warning">
												<h6 class="alert-heading fw-bold mb-1">????????? ??????????????? ????????????????</h6>
												<p class="mb-0">?????? ????????? ???????????????, ????????? ??????????????????. ????????????????????????.</p>
											</div>
										</div>
										<form id="formAccountDeactivation" onsubmit="return false">
											<div class="form-check mb-3">
												<input class="form-check-input" type="checkbox"
													name="accountActivation" id="accountActivation" />
												<label class="form-check-label" for="accountActivation">??????
													????????? ???????????????.</label>
											</div>
											<button type="submit"
												class="btn btn-danger deactivate-account">??? ??? ??? ???</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<br />
					</div>
					<!-- / Content -->

					<!-- Footer -->
<!-- 					<footer class="content-footer footer bg-footer-theme"> </footer> -->
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
	<script src="../assets/js/pages-account-settings-account.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
