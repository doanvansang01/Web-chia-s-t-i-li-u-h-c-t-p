-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 13, 2022 lúc 12:59 AM
-- Phiên bản máy phục vụ: 5.7.36
-- Phiên bản PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `library`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `hoten` text COLLATE utf8_vietnamese_ci,
  `namsinh` text COLLATE utf8_vietnamese_ci,
  `gioitinh` bit(1) DEFAULT NULL,
  `email` text COLLATE utf8_vietnamese_ci,
  `matkhau` text COLLATE utf8_vietnamese_ci,
  `downloads` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `role_id`, `hoten`, `namsinh`, `gioitinh`, `email`, `matkhau`, `downloads`) VALUES
(1, 1, 'An Nguyen', '2021-10-13', b'1', 'nguyentrian01112001@gmail.com', '5f421d404aee120d86a7cdeccdffe3f6', 2),
(2, 0, 'Nguyen Tri An', '2001-11-01', b'1', 'admin@gmail.com', 'a0a0be68d91f1a997e47f2be8a4f2eb5', 1),
(3, 1, 'An Nguyen', '2021-11-07', b'1', 'an@gmail.com', '5f421d404aee120d86a7cdeccdffe3f6', 0),
(4, 1, 'An Nguyen', '2021-11-08', b'1', 'an01112001@gmail.com', 'a52c6e08861567c521e764e013e16547', 0),
(5, 1, 'An', '2022-01-12', b'1', 'abc@gmail.com', 'a52c6e08861567c521e764e013e16547', 0),
(7, 1, 'An', '2022-01-13', b'1', 'a@gmail.com', 'a52c6e08861567c521e764e013e16547', 0),
(10, 0, 'Đình Thơ', '2022-01-13', b'1', 'tho@gmail.com', 'a52c6e08861567c521e764e013e16547', 5),
(11, 1, 'hoangtanhihi', '2000-01-19', b'1', 'hoangtanhihi0204@gmail.com', 'a8af76a728f23ae155ac9e5f9f32902f', 0),
(12, 1, 'vu', '2022-01-06', b'1', 'cc@gmail.com', '202cb962ac59075b964b07152d234b70', 1),
(13, 1, 'Doan Van Sang', '2022-10-14', b'1', 'doanvansang2016@gmail.com', 'a20425f4efd36da41dfb3cd353929c20', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_vietnamese_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'PHP'),
(1, 'HTML/CSS'),
(4, 'C Sharp'),
(3, 'Java'),
(17, 'Java Script'),
(18, 'Python'),
(23, 'C++');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_vietnamese_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_account` (`user_id`),
  KEY `fk_comment_document` (`document_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `content`, `user_id`, `document_id`) VALUES
(1, 'a', 2, 2),
(2, 'Tài liệu hay', 2, 2),
(3, 'quá hay', 2, 2),
(6, 'cũng được', 5, 2),
(7, 'tài liệu hay', 5, 8),
(9, 'tài liệu hay quá', 5, 8),
(16, 'Tài liệu', 5, 8),
(17, 'Sách khá hay ', 5, 5),
(18, 'Sách nên đọc đối với lập trình viên java', 2, 5),
(30, 'hay nè', 7, 2),
(31, 'hay', 11, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `filename` text COLLATE utf8_vietnamese_ci,
  `title` text COLLATE utf8_vietnamese_ci,
  `thumbnail` text COLLATE utf8_vietnamese_ci,
  `downloads` int(11) DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `role_id` (`role_id`),
  KEY `license_id` (`license_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `document`
--

INSERT INTO `document` (`id`, `role_id`, `user_id`, `category_id`, `filename`, `title`, `thumbnail`, `downloads`, `license_id`, `status`, `deleted`, `created_at`, `update_at`) VALUES
(1, 1, 2, 1, 'HTML.pdf', 'Tài Liệu HTML/CSS ', 'htmlcss.jpg', 0, 0, 1, 0, '0000-00-00 00:00:00', '2022-01-14 01:35:08'),
(2, 1, 1, 3, 'javacoban.pdf', 'Tài Liệu Java ', 'java.jpg', 0, 0, 1, 0, '0000-00-00 00:00:00', '2022-01-14 01:35:10'),
(4, 0, 2, 2, 'Lap trinh web php-main - 2017 (3).pptx', 'Tài Liệu PHP', 'php.jpg', 0, 0, 1, 0, '2021-11-07 02:07:08', '2022-01-14 01:35:03'),
(5, 0, 2, 3, 'EffectiveJava.pdf', 'Sách Effective Java', 'effectivejava.jpg', 0, 0, 1, 0, '2021-11-09 01:21:52', '2022-01-14 01:35:06'),
(11, 0, 2, 3, 'OOP_JAVA.pdf', 'Lập trình hướng đối tượng JAVA', 'OOP_java.png', 0, 0, 1, 0, '2021-12-14 06:42:54', '2021-12-14 08:01:47'),
(12, 0, 2, 3, 'thinkjava.pdf', 'Sách Think Java', 'thinkjava.jpg', 0, 0, 1, 0, '2021-12-14 06:52:59', '2021-12-14 08:01:48'),
(8, 0, 2, 4, 'laptrinhcsharp.pdf', 'Lập trình C# từ cơ bản đến nâng cao', 'csharp.jpg', 0, 0, 1, 0, '2021-11-23 07:58:41', '2021-12-14 08:01:49'),
(16, 0, 2, 18, 'Python cơ bản - Võ Duy Tuấn_1088524.pdf', 'Tài liệu Python cơ bản', 'python.png', 0, 0, 1, 0, '2021-12-14 07:10:16', '2021-12-14 08:01:50'),
(15, 0, 2, 17, 'JS.pdf', 'Tài liệu JavaScript', 'Javascript.png', 0, 0, 1, 0, '2021-12-14 07:02:17', '2021-12-14 08:01:51'),
(17, 0, 2, 23, 'OOP_ccc.pdf', 'Lập trình hướng đối tượng C++', 'OOP_ccc.jpg', 0, 0, 1, 0, '2021-12-14 07:14:56', '2021-12-14 08:01:53'),
(19, 0, 2, 18, 'learnpythehardway.pdf', 'Sách Learn Python The Hard Way', 'sachpy.jpg', 0, 0, 1, 0, '2021-12-14 07:21:49', '2021-12-16 09:03:36'),
(20, 0, 2, 18, 'pycookbook.zip', 'Sách Python Cook Book', 'pycookbook.jpg', 0, 0, 1, 0, '2021-12-14 07:36:36', '2021-12-16 12:46:27'),
(24, 0, 2, 2, 'Giao Trinh PHP.pdf', 'Giáo trình PHP', 'phptl.jpg', 0, 0, 1, 0, '2021-12-16 08:01:52', '2021-12-16 09:03:37'),
(23, 0, 1, 3, 'sach Java 8 Action.zip', 'Sách Java in 8 Action', 'sachjavain8action.jpg', 0, 0, 1, 0, '2021-12-14 07:56:51', '2021-12-16 12:46:29'),
(28, 0, 2, 2, 'CSDL.pdf', '123', 'hoaanhdao.jpg', 0, 1, 1, 1, '2021-12-17 12:49:46', '2021-12-17 12:50:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `license`
--

DROP TABLE IF EXISTS `license`;
CREATE TABLE IF NOT EXISTS `license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_vietnamese_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `license`
--

INSERT INTO `license` (`id`, `name`) VALUES
(0, 'Không bản quyền'),
(1, 'Có bản quyền');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_vietnamese_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(0, 'Admin'),
(1, 'User');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
