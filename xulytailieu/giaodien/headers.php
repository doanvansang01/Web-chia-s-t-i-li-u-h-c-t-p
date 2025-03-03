<?php
require_once('../code/function.php');
?>
<html>

<head>
	<title>Tai lieu</title>
	<meta charset="utf-8">
	<link href="css/header.css" rel="stylesheet" type="text/css" />
	<link href="css/stylecss.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/update.css">
	<link rel="shortcut icon" href="https://t004.gokisoft.com/uploads/2021/07/1-s-1637-ico-web.jpg">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="CSS/HienThiVanBan.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />


</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="header-menutop">
				<div id="div-logo">

					<a href="trangchu.php">
						<img id="logo" src="hinhanh/logo.png" />
					</a>

				</div>

				<form action="find.php" method="post">
					<div id="div-input-tim">
						<input class="input_find" type="text" name="txt_find" placeholder="Tìm kiếm" style="border-radius: 7px">
					</div>
					<div id="div-button-tim">
						<button class="btn_find" name="btn_find" style="border-radius: 7px">Tìm Kiếm</button>
					</div>
				</form>


				<?php
				if (!isset($_SESSION['login'])) {
				?>
					<div id="div-button-upload">
						<button class="btn_upload" style="border-radius: 7px" ;>
							<!--9-->Upload</a>
						</button>
					</div>

					<div id="div-button-login">
						<button class="btn_login" style="border-radius: 7px" ;><a class="auth-form__text" href="../../xulytaikhoan/dangnhap.php">Đăng nhập</a></button>
					</div>

					<div id="div-button-register">
						<button class="btn_register" style="border-radius: 7px" ;><a href="../../xulytaikhoan/dangky.php">Đăng ký</a></button>
					</div>

				<?php
				} else if ($_SESSION['role'] == '1') {
					$id = $_SESSION['id'];
				?>
					<div id="div-button-upload">
						<button class="btn_upload" style="border-radius: 7px">
							<!--8-->Upload</a>
						</button>
					</div>

					<div id="wamper-menu-User">
						<div id="div-menu-nguoi-dung">
							<ul>
								<li class="dropdown1">

									<a class=" dropbtn1">
										<?php
										echo "Hi! " . $_SESSION['login'];
										?>
									</a>
									<div class="dropdown-content1">
										<a href="thongtinuser.php?id=<?= $id ?>">Thông tin</a>
										<a href="#">Tài liệu</a>
										<a href="#">Trợ giúp</a>
										<a href="thoat.php">Đăng xuất</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				<?php } else if ($_SESSION['role'] == '0') {
					$id = $_SESSION['id']; ?>

					<div id="div-button-upload">
						<button class="btn_upload" style="color:black; border-radius: 7px">
							<!--10-->Upload</a>
						</button>
					</div>

					<div id="wamper-menu-User">
						<div id="div-menu-nguoi-dung">
							<ul>
								<li class="dropdown1">

									<a class=" dropbtn1">
										<?php
										echo "Hi! " . $_SESSION['login'];
										?>
									</a>


									<div class="dropdown-content1">
										<a href="thongtinuser.php?id=<?= $id ?>">Thông tin</a>
										<a href="#">Tài liệu</a>
										<a href="#">Trợ giúp</a>
										<a href="thoat.php">Đăng xuất</a>
									</div>
								</li>
							</ul>

						</div>

					</div>
					<div style="margin-top:7px;">
						<span>|</span>
						<a class="" href="../admin/index.php">
							Trang Admin
						</a>
					</div>

				<?php
				}
				?>

			</div>
			<!-- Hiển thị list danh mục-->
			<div>
				<?php
				$connect = mysqli_connect("localhost", "root", "", "library") or die("Connect faild");
				// tlap bang ma cho connect
				mysqli_set_charset($connect, 'utf8');

				$sql = "select * from Category";
				$data = executeResult($sql);
				?>
				<nav class="navbar navbar-expand-sm bg-dark">
					<ul class="navbar-nav" style="margin-left:200px">
						<?php

						foreach ($data as $item) {
							echo '<li  class="nav-item">
										<a class="nav-link" style="color:white; margin-left:30px " href="theloai.php?category_id=' . $item['id'] . '"> ' . $item['name'] . '</a>
									<li>';
						}

						?>

						<div id="wamper-menu-User">
							<div id="div-menu-nguoi-dung">
								<ul>
									<li class="dropdown1">

										<a class=" dropbtn1">
										</a>
										<div class="dropdown-content1">

											<a href="#">Thể loại</a>
											<?php
											foreach ($data as $item) {
												echo '
										<a class="nav-link" style="color:white; margin-left:30px " href="theloai.php?category_id=' . $item['id'] . '"> ' . $item['name'] . '</a>
									';
											}
											?>
										</div>
									</li>
								</ul>
							</div>
						</div>

					</ul>
				</nav>
			</div>
		</div>


		<div>
</body>

<html>