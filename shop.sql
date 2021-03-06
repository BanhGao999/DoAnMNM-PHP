-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 26, 2022 at 04:08 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', 'c4ca4238a0b923820dcc509a6f75849b');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart_detail`
--

CREATE TABLE `tbl_cart_detail` (
  `id_cart_detail` int(11) NOT NULL,
  `code_cart` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `soluongmua` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_cart_detail`
--

INSERT INTO `tbl_cart_detail` (`id_cart_detail`, `code_cart`, `id_sanpham`, `soluongmua`) VALUES
(28, '4095', 8, 2),
(29, '4095', 7, 1),
(34, '4469', 12, 1),
(35, '4469', 13, 1),
(36, '6875', 12, 1),
(37, '6875', 13, 1),
(38, '3524', 12, 1),
(39, '3524', 13, 1),
(40, '1139', 5, 1),
(41, '1139', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dangky`
--

CREATE TABLE `tbl_dangky` (
  `id_khachhang` int(11) NOT NULL,
  `hovaten` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taikhoan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sodienthoai` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chucvu` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_dangky`
--

INSERT INTO `tbl_dangky` (`id_khachhang`, `hovaten`, `taikhoan`, `matkhau`, `sodienthoai`, `email`, `diachi`, `chucvu`) VALUES
(1, 'Nguy???n Minh T??m', 'maki', 'c4ca4238a0b923820dcc509a6f75849b', 569029353, 'mikuohandsome@gmail.com', '																																																																																																																																										13/C																																																																																																																			', 1),
(3, 'Pham Anh Vinh', 'vinh', 'c4ca4238a0b923820dcc509a6f75849b', 1, 'chanhchanh145@gmail.com', '					sdasdad			', 0),
(10, 'Nguy???n H???ng Ch????ng', 'chuong', 'c157f66b4f34845b2d242afd45b48c0c', 729441753, 'chuong@gmail.com', 'sdfasdfadsff', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_danhmuc`
--

CREATE TABLE `tbl_danhmuc` (
  `id_danhmuc` int(11) NOT NULL,
  `tendanhmuc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thutu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_danhmuc`
--

INSERT INTO `tbl_danhmuc` (`id_danhmuc`, `tendanhmuc`, `thutu`) VALUES
(5, 'M?? H??NH', 1),
(6, 'M?? H??NH CHIBI', 2),
(7, 'GUNDAM', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_giohang`
--

CREATE TABLE `tbl_giohang` (
  `id_cart` int(11) NOT NULL,
  `id_khachhang` int(11) NOT NULL,
  `code_cart` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_status` int(11) NOT NULL,
  `cart_payment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_giohang`
--

INSERT INTO `tbl_giohang` (`id_cart`, `id_khachhang`, `code_cart`, `cart_status`, `cart_payment`) VALUES
(28, 1, '4095', 0, '0'),
(31, 1, '1378', 0, '0'),
(32, 3, '6909', 0, '0'),
(34, 3, '3504', 0, '0'),
(35, 3, '4469', 0, '0'),
(36, 3, '6875', 0, 'tienmat'),
(37, 3, '3524', 1, 'Chuy???n Kho???ng'),
(38, 1, '1139', 1, 'Chuy???n Kho???ng');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sanpham`
--

CREATE TABLE `tbl_sanpham` (
  `id_sanpham` int(11) NOT NULL,
  `tensanpham` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `masanpham` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `giasanpham` float NOT NULL,
  `soluong` int(11) NOT NULL,
  `hinhanh` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tomtat` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_danhmuc` int(11) NOT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_sanpham`
--

INSERT INTO `tbl_sanpham` (`id_sanpham`, `tensanpham`, `masanpham`, `giasanpham`, `soluong`, `hinhanh`, `tomtat`, `noidung`, `id_danhmuc`, `trangthai`) VALUES
(5, 'M?? h??nh aqua ', 'MHAQUA', 1000000, 2, 'FIGURE-137049.jpg', '', '', 5, 1),
(6, 'm?? h??nh fubuki', 'MHFBK', 1200000, 1, 'mohinh_fubuki.jpg', '', '', 5, 0),
(7, 'M?? h??nh Okayu', 'MHOKU', 1500000, 1, 'FIGURE-131534.jpg', '', '', 5, 1),
(8, 'M?? h??nh Aqua Chibi', 'MHAQUACB', 500000, 12, 'FIGURE-128443.jpg', '', '', 6, 0),
(10, 'METAL BUILD Hi-v Gundam ', 'MTBHiV', 3000000, 3, 'FIGURE-136396.jpg', 'Size: Approx. H205mm\r\nMaterial: ABS, PVC, Diecast\r\nMain figure\r\n-Backpack\r\n-Shield\r\n-Propellant tank left right\r\n-Beam rifle set\r\n-New Hyper bazooka\r\n-Beam saber for backpack x2\r\n-Beam saber for left arm\r\n', 'Size: Approx. H205mm\r\nMaterial: ABS, PVC, Diecast\r\nMain figure\r\n-Backpack\r\n-Shield\r\n-Propellant tank left right\r\n-Beam rifle set\r\n-New Hyper bazooka\r\n-Beam saber for backpack x2\r\n-Beam saber for left arm', 7, 0),
(11, 'GUNDAM UNIVERSE GN-0000', 'GDUGN0', 3000000, 1, 'FIGURE-138640.jpg', '', '', 7, 0),
(12, 'METAL BUILD Justice Gundam', 'MTBJG', 3500000, 1, 'FIGURE-131789.jpg', '', '', 7, 0),
(13, 'M?? h??nh chibi Shoko Komi', 'MHCBKOMI', 700000, 2, 'FIGURE-138219.jpg', '', '', 6, 1),
(14, 'M?? h??nh Genshin Impact Barbara', 'MHGSBARA', 1700000, 2, 'FIGURE-137640.jpg', '', '', 5, 1),
(15, 'M?? h??nh Spice and Wolf Holo', 'MHSAWH', 1600000, 1, 'FIGURE-138213.jpg', '', '', 5, 1),
(16, 'M?? h??nh chibi Matsuri', 'MHCBMATSURI', 700000, 1, 'FIGURE-127763.jpg', '', '', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `id_shipping` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `adress` varchar(250) NOT NULL,
  `note` varchar(250) NOT NULL,
  `id_dangky` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`id_shipping`, `name`, `phone`, `adress`, `note`, `id_dangky`) VALUES
(1, '', '', '', '', 3),
(2, '', '', '', '', 3),
(3, 'nguy???n Minh T??m', '05658421', '23/C', '', 1),
(4, 'Pham Anh Vinh', '', '', '', 3),
(5, 'Pham Anh Vinh', '', '', '', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbl_cart_detail`
--
ALTER TABLE `tbl_cart_detail`
  ADD PRIMARY KEY (`id_cart_detail`);

--
-- Indexes for table `tbl_dangky`
--
ALTER TABLE `tbl_dangky`
  ADD PRIMARY KEY (`id_khachhang`);

--
-- Indexes for table `tbl_danhmuc`
--
ALTER TABLE `tbl_danhmuc`
  ADD PRIMARY KEY (`id_danhmuc`);

--
-- Indexes for table `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  ADD PRIMARY KEY (`id_sanpham`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`id_shipping`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cart_detail`
--
ALTER TABLE `tbl_cart_detail`
  MODIFY `id_cart_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_dangky`
--
ALTER TABLE `tbl_dangky`
  MODIFY `id_khachhang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_danhmuc`
--
ALTER TABLE `tbl_danhmuc`
  MODIFY `id_danhmuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_giohang`
--
ALTER TABLE `tbl_giohang`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  MODIFY `id_sanpham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `id_shipping` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
