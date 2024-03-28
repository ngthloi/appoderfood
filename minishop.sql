-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 07, 2022 lúc 12:08 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `minishop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `mamon` int(11) NOT NULL,
  `sdt` varchar(10) NOT NULL,
  `noidung` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `mamon`, `sdt`, `noidung`) VALUES
(1, 1, '0376701749', 'Vừa ngon lại vừa rẻ !'),
(2, 1, '0364103836', 'Hơi ít ! Ăn không no kakaa'),
(3, 7, '0376701749', 'Banh mi hoi dat xiu !'),
(4, 59, '0376701749', 'Com khong du dinh rang !'),
(5, 8, '0376701749', 'Banh mi ngon oi la ngon'),
(6, 57, '0376701749', 'Con toi noi: Chao ngon qua!');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `id` int(10) NOT NULL,
  `madonhang` int(10) NOT NULL,
  `mamon` int(10) NOT NULL,
  `tenmon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gia` double NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`id`, `madonhang`, `mamon`, `tenmon`, `gia`, `soluong`) VALUES
(1, 1, 11, 'SANDWICH CÁ CHIÊN & XÚC XÍCH XÔNG KHÓI', 25000, 2),
(2, 2, 97, 'SNACK DA CÁ HỒI', 17000, 2),
(3, 2, 45, 'CÀ PHÊ SỮA TƯƠI', 20000, 2),
(4, 3, 57, 'CHÁO THỊT BẰM CÀ RỐT', 22000, 2),
(5, 3, 90, 'CHÈ BẮP', 10000, 2),
(6, 4, 101, 'HOTDOG XÚC XÍCH ĐỨC', 18000, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cuahang`
--

CREATE TABLE `cuahang` (
  `id` int(11) NOT NULL,
  `diachi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cuahang`
--

INSERT INTO `cuahang` (`id`, `diachi`) VALUES
(1, 'MINISHOP - 25A Lam Sơn, Quận Tân Bình'),
(2, 'MINISHOP - 48A D2, Quận Bình Thạnh'),
(3, 'MINISHOP - 191 Nguyễn Hồng Đào, Quận Tân Bình'),
(4, 'MINISHOP - 165 Bạch Đằng, Quận Tân Bình'),
(5, 'MINISHOP - 77 Trần Thiện Chánh, Quận 10'),
(6, 'MINISHOP - 2 Trần Doãn Khanh, Quận 1'),
(7, 'MINISHOP - 245 Nguyễn Thượng Hiền, Quận Bình Thạnh'),
(8, 'MINISHOP - 129 - 131 Đường Số 3, Cư xá Đô Thành, Quận 3'),
(9, 'MINISTOP - 58B Hồng Hà, Quận Tân Bình'),
(10, 'MINISHOP - 101 Hoà Hưng, phường 12, Quận 10'),
(11, 'MINISHOP - 10A Hoàng Hoa Thám, phường 7, Quận Bình Thạnh'),
(12, 'MINISHOP - 475A Điện Biên Phủ, phường 25, Quận Bình Thạnh'),
(13, 'MINISHOP - 45 Hậu Giang, Phường 4, Quận Tân Bình'),
(14, 'MINISHOP - 194 Nguyễn Thái Bình, Phường 12, Quận Tân Bình'),
(15, 'MINISHOP - 37 - 39 Phạm Viết Chánh, Phường 19, Quận Bình Thạnh'),
(16, 'MINISHOP - 88 Trương Công Định, Phường 14, Quận Tân Bình'),
(17, 'MINISHOP - B22 Bạch Đằng, phường 2, Quận Tân Bình'),
(18, 'MINISTOP - 15K Vũ Huy Tấn, Phường 3, Quận Bình Thạnh'),
(19, 'MINISHOP - 69 Ngô Tất Tố, Phường 21, Quận Bình Thạnh'),
(20, 'MINISHOP - 17 Đào Duy Từ, Phường 5, Quận 10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(10) NOT NULL,
  `tendanhmuc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hinhdanhmuc` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `tendanhmuc`, `hinhdanhmuc`) VALUES
(1, 'Sandwich', 'cach-lam-banh-mi-sandwich-7.jpg'),
(2, 'Origin', '150687-tim-hieu-ve-com-nam-nhat-ban-660x410.jpg'),
(3, 'Oden', 'cach-lam-oden-nhat-ban.jpg'),
(4, 'Street Food', 'đồ-xiên-nướng.jpg'),
(5, 'Nước Giải Khát', 'vitamin-va-khoang-chat-trong-do-uong.jpg'),
(6, 'Tráng Miệng', 'myyen97-192727022703-mon-trang-mieng.jpg'),
(7, 'Thức Ăn Nhanh', 'Thuc-an-nhanh-la-gi-tac-hai-cua-thuc-an-nhanh-va-cac-loai-tot-cho-suc-khoe-1-1200x676.jpg'),
(8, 'Salad', 'saladrauqua-1635240739-5476-1635240778.jpg'),
(9, 'Sushi', 'cach-lam-sushi-nhat-ban.jpg'),
(10, 'Cơm', 'xay-dung-thưc-don-com-van-phong-1024x683.jpg'),
(11, 'Mì', 'dung-thu-3-the-gioi-ve-luong-tieu-thu-vi-sao-nguoi-viet-yeu-thich-mi-an-lien-100150455.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(10) NOT NULL,
  `tenkhachhang` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `sodienthoai` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `tongtien` double NOT NULL,
  `ghichu` text COLLATE utf8_unicode_ci NOT NULL,
  `diachi` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `tenkhachhang`, `sodienthoai`, `tongtien`, `ghichu`, `diachi`) VALUES
(1, 'Minh Thắng', '0376701749', 50000, '', 'Quận Bình Thạnh '),
(2, 'Minh Thắng', '0376701749', 74000, 'Ít đá', 'Bình Thạnh'),
(3, 'Nhật Nam', '0337662557', 64000, 'Xin thêm tương', 'Bình Thạnh'),
(4, 'Alex', '597266524', 36000, '', 'North California');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon`
--

CREATE TABLE `mon` (
  `id` int(10) NOT NULL,
  `madanhmuc` int(10) NOT NULL,
  `tenmon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hinhmon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gia` double NOT NULL,
  `mota` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mon`
--

INSERT INTO `mon` (`id`, `madanhmuc`, `tenmon`, `hinhmon`, `gia`, `mota`) VALUES
(1, 1, 'SANDWICH THỊT XÔNG KHÓI & TRỨNG', '62b2c199387b1_1b4b46a732d80c0d549b9fc9e40e9a1a.jpg', 27000, 'BỮA SÁNG ĐỦ CHẤT VỚI SANDWICH THỊT XÔNG KHÓI & TRỨNG\r\n\r\nNếu bạn muốn “đổi gió” cho bữa sáng mà chưa nghĩ ra món nào phù hợp thì ghé ngay MINISTOP để thưởng thức món SANDWICH THỊT XÔNG KHÓI & TRỨNG đầy đủ chất dinh dưỡng, ngon cực đỉnh luôn nha.\r\n\r\nThịt hun khói mặn mặn, đậm đà kết hợp với vị béo ngậy của trứng sốt mayo & trứng gà ốp la ăn kèm với bánh mì sandwich mềm xốp sẽ giúp bạn khởi đầu một buổi sáng theo cách hoàn hảo nhất!\r\n\r\nGhé ngay MINISHOP nạp đủ năng lượng cần thiết cho ngày dài năng động nhé.'),
(2, 1, 'SALAD GÀ CAY PHÔ MAI', '6285b3421b670_aa168ea3097efa3050c0835e7b99e6bf.jpg', 33000, 'Hè tới rồi, nếu ở nhà lâu đừng để tinh bột triệu hồi 6 múi mỡ của bạn ^^\r\n\r\nHôm nay đổi khẩu vị, ăn salad cho tốt dáng đẹp da đi cả nhà ơi!\r\n\r\nSalad Gà cay phô mai tươi ngon, được hòa quyện với nước sốt “bí truyền” siêu hấp dẫn.\r\n\r\nĐến MINISHOP thưởng thức ngay thôi nào!'),
(3, 1, 'SANDWICH MÌ CAY', '623190f387335_762abdcbb2333b011b92f1f8ae27ac6c.jpg', 25000, 'CỰC LẠ MIỆNG VỚI SANDWICH MÌ CAY.\nSandwich kẹp mì cay phô mai là món ăn vặt cực lạ cực hấp dẫn của giới trẻ.\nBánh sandwich thơm mùi bơ kèm theo phần nhân phô mai béo ngậy kéo sợi hấp dẫn ăn cùng mì cay nồng cực ngon.\nChỉ nghe thôi là đã thấy thèm rồi.\nĐến MINISHOP thử ngay món ăn độc lạ này nhé.'),
(4, 1, 'SANDWICH GÀ CHIÊN XÙ', '620c74b7d42f6_8afe0fe64e5d3949f5d11bece2407c9b.jpg', 27000, 'Thịt gà chiên vàng đều, giòn rụm. Bắp cải giòn, chua chua ngọt ngọt ăn cùng với sốt béo ngậy, cay cay giúp món bánh sandwich thêm hấp dẫn, thơm ngon. Rủ hội bạn đến MINISHOP cùng thưởng thức ngay các bạn ơi!'),
(5, 1, 'SANDWICH XÁ XÍU TRỨNG', '620c748dc34c6_fa6d2bc143619364813fefce347e6401.jpg', 26000, 'Một món sandwich sành điệu kiểu Tây nhưng có sự kết hợp truyền thống, mang đậm hương vị quê nhà. Miếng bánh mì tươi mềm thơm kẹp chặt xá xíu đậm đà, kết hợp thêm trứng giàu protein và xà lách tươi giòn.\nRủ hội bạn đến MINISHOP cùng thưởng thức ngay các bạn ơi!'),
(6, 1, 'SANDWICH THỊT NGUỘI XÀ LÁCH', '620c740edc337_e9a987136541431cf7656927ef647b3c.jpg', 22000, 'Sandwich Thịt nguội xà lách\nTừng miếng thịt nguội thơm ngon hòa quyện cùng xốt đậm đà, bao bọc trong lớp bánh mì mềm mịn, tơi xốp sẽ khiến bạn mê mệt.\n????Rủ hội bạn đến MINISHOP cùng thưởng thức ngay các bạn ơi!'),
(7, 1, 'BÁNH MÌ GÀ ROTI', '62033cc133814_8bc0f1e9a8de495031ad1ad4e3157ee0.jpg', 23000, 'BÁNH MÌ GÀ ROTI – điểm nhấn ấn tượng cho tuần này!\nBên cạnh món bánh mì truyền thống quen thuộc, người dân Sài Gòn còn “mê đắm” chiếc bánh mì gà roti ngon không thể tả tại MINISHOP.\nĐến MINISHOP thưởng thức ngay thôi nào!'),
(8, 1, 'BÁNH MÌ TRỨNG CUỘN NGŨ SẮC', '620339aa8cb59_1c4f6cbe78ada168421bfb4abdbcec68.jpg', 22000, 'BÁNH MÌ TRỨNG CUỘN NGŨ SẮC – điểm nhấn ấn tượng cho tuần này!\r\n???? Bên cạnh món bánh mì truyền thống quen thuộc, người dân Sài Gòn còn “mê đắm” chiếc bánh mì trứng với màu sắc cực bắt mắt ngon không thể tả tại MINISHOP.\r\n???? Đến MINISHOP thưởng thức ngay thôi nào!'),
(9, 1, 'SANDWICH THỊT XÔNG KHÓI & TRỨNG', '60a393c446e39_1b4b46a732d80c0d549b9fc9e40e9a1a.jpg', 27000, 'MINISHOP vừa mới cho “ra lò” một loại Sandwich cực gây mê: SANDWICH THỊT XÔNG KHÓI & TRỨNG.\r\nThịt xông khói sốt guchujang kèm thêm xà lách lô lô và trứng chiên, với tỉ lệ rau thịt hợp lí lại thêm sốt chua ngọt “bí truyền” rưới giữa 2 lát bánh mì mềm thơm tạo nên bữa ăn sáng nhanh, gọn, lẹ nhưng vô cùng dinh dưỡng!\r\nTrăm nghe không bằng mắt thấy, tới ngay MINISHOP bắt lấy món ngon nha.'),
(10, 1, 'SANDWICH GÀ KARAAGE', '60486e23ac30e_2cd344a0d00cb4425992b098b482358c.jpg', 23000, 'Gà Karaage tươi dinh dưỡng với từng thớ thịt trắng buốt dai ngon được bao bọc bởi lớp bột chiên vàng giòn hấp dẫn sau đó nằm gọn giữa \"hai mảnh\" bánh mì tam giác mềm thơm.'),
(11, 1, 'SANDWICH CÁ CHIÊN & XÚC XÍCH XÔNG KHÓI', '60486e00e23ac_fda982d5c4c5249b3ea433d4c58f88f6.jpg', 25000, 'Cá chiên với lớp vỏ giòn tan bao bọc lấy thịt cá mềm ngọt tự nhiên kết hợp với xúc xích xông khói dai giòn sần sật nằm gọn gẽ giữa 2 lớp bánh mì mềm thơm. Kết hợp thêm chút xà lách tươi ngon để trung hòa trọn vị, ăn hoài không ngán.'),
(12, 1, 'SANDWICH TÔM SỐT THÁI & TRỨNG CHIÊN', '601a2567adb51_d28dd18833eeb173dffccc54a8bce349.jpg', 27000, 'Vẫn là những miếng bánh mì tươi thơm lừng hương mì và trứng nhưng lại kết hợp lạ lẫm với tôm sốt Thái đậm vị và trứng chiên bùi bùi dinh dưỡng. Chút rau xanh gia nhập để trung hòa trọn vị, ăn không ngán mà lúc chán lại thèm ăn.'),
(13, 2, 'ONIGIRI BURGER CƠM NƯỚNG BÒ KIM CHI', '623abedeb9511_141c41fd35f0901a95a44171d63112a1.jpg', 18000, 'Kết nạp vào đội tuyển Onigiri của MINISTOP là một món xuất sắc mang hương vị tinh tế của ẩm thực Nhật Bản: ONIGIRI BURGER CƠM NƯỚNG BÒ KIM CHI\r\n\r\nNắm cơm được rưới một lớp nước tương bên ngoài. Sau khi nướng sơ, hương thơm của nước tương nhẹ nhàng lan tỏa khiến bạn chỉ muốn ngốn cho đầy miệng.\r\n\r\nPhần thịt bò mềm ngọt, ăn kèm với kim chi & nước sốt sền sệt, rồi hòa vào cơm dẻo, cắn một miếng là phê không tả nổi luôn đó.'),
(14, 2, 'ONIGIRI GÀ CHIÊN SỐT NANBAN NHẬT BẢN', 'icon-web---onigiri-ga-chien-sot-nanban-nhat-ban---260px.jpg', 17000, 'Kết nạp vào đội tuyển Onigiri của MINISTOP là một món xuất sắc mang hương vị tinh tế của ẩm thực Nhật Bản: ONIGIRI GÀ CHIÊN SỐT NANBAN NHẬT BẢN.\r\nThịt gà vàng giòn, ăn kèm với sốt Nanban sền sệt, rồi hòa vào cơm dẻo, cắn một miếng là phê không tả nổi luôn đó.'),
(15, 2, 'TEMAKI ONIGIRI THỊT HEO SỐT BƠ TỎI.', '61cad0aedfe0a_2e7a7110033a52721d1485f518e34ea2.jpg', 14000, 'Không cần suy nghĩ sáng nay ăn gì với TEMAKI ONIGIRI THỊT HEO SỐT BƠ TỎI.\r\nRong biển dai giòn bao bọc nắm cơm mềm dẻo thơm lừng hương gạo mới, nằm ẩn bên trong là phần nhân thịt heo sốt bơ tỏi đậm đà chuẩn vị, thơm ngon nức mũi, đảm bảo cho bạn một bữa sáng đầy dinh dưỡng và tiện lợi\r\nĐến MINISHOP nạp năng lượng cho một ngày năng động ngay cả nhà ơi!'),
(16, 2, 'ONIGIRI TÔM SỐT BƠ TỎI', '60ada50d5550b_a6991ecc9a7af60c95543c7ae90ae22a.jpg', 18000, 'Món gì mà ngon ngon thế?\r\nXin thưa rằng món mới của “dòng họ” Onigiri tại MINISHOP đó.\r\nĂn vào thì sẽ làm sao? Xin thưa, ăn vào thì sẽ bị “mê”.\r\nMuốn biết hương vị sốt bơ tỏi “mê đắm” như thế nào thì đến ngay MINISHOP thử luôn món Onigiri Tôm Sốt Bơ Tỏi nha.'),
(17, 2, 'ONIGIRI BÒ PHÔ MAI', '5ff533d781533_db412baff4289919175dc5b5cc4b1302.jpg', 17000, 'Nắm cơm chắc nịch, dẻo thơm kết hợp hoàn hảo với bò dinh dưỡng, lại còn thêm phô mai béo ngậy làm tăng hương vị. Bữa ăn gọn nhẹ mà đầy đủ như vậy thì còn gì bằng đúng không nào.'),
(18, 2, 'ONIGIRI XÚC XÍCH & PHÔ MAI', '5f5f39aaf3be0_6b535795a2348a6ccb9e2b8290e5a611.jpg', 16000, 'Cơm nắm luôn là sự lựa chọn hoàn hảo cho những bữa ăn vội vàng. Nắm cơm chắc nịch, mềm dẻo ôm lấy nhân thơm ngon.'),
(19, 2, 'TEMAKI ONIGIRI GÀ NƯỚNG', '3.jpg', 12000, 'Nắm cơm chắc nịch, mềm dẻo được bao bọc bởi rong biển dai giòn dinh dưỡng, nhân gà nướng thơm lừng được nêm nếm chuẩn vị cho bữa ăn trọn vẹn, no lâu.'),
(20, 2, 'ONIGIRI GÀ CHIÊN SỐT NANBAN NHẬT BẢN', '2.jpg', 17000, 'Kết nạp vào đội tuyển Onigiri của MINISTOP là một món xuất sắc mang hương vị tinh tế của ẩm thực Nhật Bản: ONIGIRI GÀ CHIÊN SỐT NANBAN NHẬT BẢN.\r\nThịt gà vàng giòn, ăn kèm với sốt Nanban sền sệt, rồi hòa vào cơm dẻo, cắn một miếng là phê không tả nổi luôn đó.'),
(21, 2, 'TEMAKI ONIGIRI THỊT HEO SỐT BULGOGI', '4.jpg', 15000, 'Đột phá mới trong làng cơm nắm chính là món Temaki Onirigi heo sốt bulgogi. Vẫn là rong biển dai giòn và nắm cơm mềm dẻo nhưng nhân heo sốt bulgogi sẽ khiến bao tử bạn háo hức cho mà xem. Vị beo béo cay cay của sốt hòa vào từng hạt cơm làm nên vị ngon khó cưỡng.'),
(22, 2, 'TEMAKI ONIGIRI CÁ HỒI MAYO', '1.jpg', 16000, 'Đột phá mới trong làng cơm nắm chính là món Temaki Onirigi heo sốt bulgogi. Vẫn là rong biển dai giòn và nắm cơm mềm dẻo nhưng nhân heo sốt bulgogi sẽ khiến bao tử bạn háo hức cho mà xem. Vị beo béo cay cay của sốt hòa vào từng hạt cơm làm nên vị ngon khó cưỡng.'),
(23, 2, 'TEMAKI ONIGIRI BÒ SỐT PHÔ MAI', '5.jpg', 16000, 'Temaki onigiri bò sốt phomai'),
(24, 2, 'TEMAKI ONIGIRI CÁ HỒI MAYO', '7.jpg', 12000, 'Temaki Onigiri từ lâu đã là món ăn quen thuộc được mọi người yêu thích. Và hôm nay, đến với Ministop bạn sẽ gặp một Temaki Onigiri hoàn toàn mới, sự lột xác hoàn hảo và toàn diện của chúng sẽ mang lại luồng gió mới làm hài lòng hơn khẩu vị của thực khách khó tính.'),
(25, 3, 'ỐC NHỒI ODEN', '62a94f2a5a958_aaac02ad34a00fb6dd11db935d8df003.jpg', 8000, 'Xiên ỐC NHỒI gia nhập menu Oden trứ danh\r\nNồi lẩu Oden thơm nức, cay nồng, nóng hổi luôn khiến bao tử bạn réo riết khi bước chân tới MINISHOP? ^^\r\nHàng chục xiên Oden các loại thỏa sức cho bạn chọn lựa nay lại bổ sung thêm xiên ỐC NHỒI vô cùng mới lạ. Đảm bảo “ăn không hối hận” đâu nhé!'),
(26, 3, 'CHẢ CÁ RỒNG', '622f05f8581e9_39e321a0a406246d1fab3a919b25f6b5.jpg', 10000, 'ĐẬM CHẤT HÀN QUỐC VỚI CHẢ CÁ RỒNG\r\nBình thường xem film Hàn, mấy bạn có thấy hình ảnh mấy cái xe trước cổng trường bán chả cá xiên không? Ăn miếng chả cá xiên húp miếng nước súp ngon không thể tả luôn màaaa.\r\nNay xiên Chả cá ấy đã xuất hiện tại MINISHOP với hương vị thơm ngon, tròn vị, có độ dài vừa phải cùng với vị cay nồng đã tạo nên một hương vị đặc trưng khó quên cho món ăn này.\r\nĐến MINISHOP thưởng thức ngay xiên chả cá ngon tuyệt, nóng hổi này nhé.'),
(27, 3, 'MAI GHẸ FARCE', '5ffe6def13f7d_4c1819fb17bfc90d4411cee4029d6d9e.jpg', 15000, 'Siêu phẩm Mai Ghẹ Farce hạ cánh vào nồi lẩu Oden trứ danh. Sự tươi ngon và dinh dưỡng từ ghẹ hòa cùng nước lẩu nóng hổi đậm đà, cay xé nồng nàn tạo nên một kiệt tác ẩm thực.'),
(28, 3, 'CHẢ CÁ YUBA', '5fd9dd83456d5_a0786cbd139b4316a95e75cefef2ac37.jpg', 7000, 'Sự kết hợp từ cá say hòa quyện cùng gia vị tạo nên miếng chả cá dai, mềm ngon không thể sánh với bất cứ loại chả cá nào. Nay tắm đều trong nước lẩu Oden nóng hổi cay nồng càng khiến item này trở nên tuyệt hảo.'),
(29, 3, 'CHẢ CÁ RONG BIỂN CUỘN TRỨNG', '5f05478d5615a_66c930fa885f12f812f56264be339f41.jpg', 8000, 'Nồi lẩu Oden nóng hổi nức tiếng gần xa với nước lẩu cay xé chua ngọt đầy kích thích luôn khiến giới trẻ mê mệt vào những ngày mưa. Nay bổ sung thêm item Chả cá rong biển cuộn trứng mới lạ, giòn sần sật và dinh dưỡng.'),
(30, 3, 'ĐẬU HỦ PHÔ MAI ODEN', '5d034770189e9_21feec304772980e7d23c2d8993d9547.jpg', 8000, 'Cảm nhận vị béo ngậy, mềm mại của Đậu hủ phô mai khi nhúng vào ly lẩu Oden cay nồng nóng hổi, tan ngay vào miệng khi cắn miếng đầu tiên, bảo đảm bạn sẽ quên lối về vì độ ngon của món này.'),
(31, 3, 'CHẢ QUẾ ỚT CÁ', '5b10e5bd03f0e_c9419a569df975f3370e6c735f6518c2.jpg', 8000, 'Oden là một trong những món ăn đặc trưng của người Nhật, cũng như là món ăn quen thuộc của các fan của MINISTOP. Nước hầm có vị hơi mặn vừa phải của shoyu, cộng với vị ngọt ra từ các phần ninh, nhất là củ cải. Thành phần chính có trong oden thường là những món được ưa chuộng vào mùa đông, như củ cải, trứng luộc… vì nó làm cho người ăn có cảm giác ấm lên trong tiết trời lạnh giá.'),
(32, 3, 'CÁ VIÊN (ODEN)', '5b10cfc69eb8b_3dba6ad8b07f23a5a5c77126a68cba54.jpg', 8000, 'Oden là một trong những món ăn đặc trưng của người Nhật, cũng như là món ăn quen thuộc của các fan của MINISHOP. Nước hầm có vị hơi mặn vừa phải của shoyu, cộng với vị ngọt ra từ các phần ninh, nhất là củ cải. Thành phần chính có trong oden thường là những món được ưa chuộng vào mùa đông, như củ cải, trứng luộc… vì nó làm cho người ăn có cảm giác ấm lên trong tiết trời lạnh giá.'),
(33, 3, 'CÁ HỒI (ODEN)', '5b10cf50e2409_c5808bbf636a0a76ccec0f113002e9bd.jpg', 10000, 'Oden là một trong những món ăn đặc trưng của người Nhật, cũng như là món ăn quen thuộc của các fan của MINISHOP. Nước hầm có vị hơi mặn vừa phải của shoyu, cộng với vị ngọt ra từ các phần ninh, nhất là củ cải. Thành phần chính có trong oden thường là những món được ưa chuộng vào mùa đông, như củ cải, trứng luộc… vì nó làm cho người ăn có cảm giác ấm lên trong tiết trời lạnh giá.'),
(34, 3, 'BÒ VIÊN (ODEN)', '5b10ce608ee8b_97fab76f975ddd2ad24dca77f9a66cdd.jpg', 10000, 'Oden là một trong những món ăn đặc trưng của người Nhật, cũng như là món ăn quen thuộc của các fan của MINISHOP. Nước hầm có vị hơi mặn vừa phải của shoyu, cộng với vị ngọt ra từ các phần ninh, nhất là củ cải. Thành phần chính có trong oden thường là những món được ưa chuộng vào mùa đông, như củ cải, trứng luộc… vì nó làm cho người ăn có cảm giác ấm lên trong tiết trời lạnh giá.'),
(35, 3, 'CHẢ CÁ CHIKUWA (ODEN)', '59c884c91d391_ae74a6e4a4ecf7d1ce55575ccdd353e8.jpg', 7000, 'Chả cá Chikuwa là loại chả cá hình ống của Nhật Bản với lớp vỏ ngoài hấp dẫn, hương vị thơm ngon khó cưỡng bởi lớp chả cá thơm ngon, vị dai dai đặc trưng của chả cá Chikuwa kết hợp cùng nước lẩu Oden khiến người ăn nhớ mãi hương vị quyến rũ này'),
(36, 3, 'THANH CUA SURIMI (ODEN)', '5609451692f22_4df151e3d97718e3f89511e11a3ce47d.jpg', 8000, 'MINISHOP đang sử dụng sản phẩm thanh cua có màu sắc đẹp mắt. Món ăn này sẽ ngon hơn khi vị chua cay của nước súp thấm đều vào vị ngọt của cá.'),
(37, 3, 'ĐẬU HỦ HẢI SẢN (ODEN)', '560943bc0dee1_865404d5fcbf454f3287007feb4fdc1d.jpg', 7000, 'Đậu hũ chiên sơ được chế biến sử dụng nguyên liệu từ hải sản, bán theo dạng xiên que. Miếng đậu hũ mềm, thấm đều vị chua cay của nước súp Oden, mang lại hương vị rất đặc biệt.'),
(38, 4, 'THỊT GÀ XIÊN NƯỚNG MUỐI ỚT', '625fd1675f2be_a95b8a532a588dbd823940cd09f25fbf.jpg', 15000, 'THỊT GÀ XIÊN NƯỚNG MUỐI ỚT THƠM LỪNG ĐẬM VỊ.\r\nNếu bạn là tín đồ ẩm thực đường phố thì chắc hẳn bạn không thể nào bỏ qua món Gà xiên que nướng muối ớt được ướp gia vị đầy thơm ngon tại MINISHOP.\r\nTừng que xiên thịt gà chắc nịch, mướt mát, thịt gà thấm vị, dai dai ngon ngon mà không bị bở, gia vị thấm đều khiến miếng thịt gà thơm hơn. Nếu bạn thích, chấm gà nướng với tương ớt cay cay cũng rất tuyệt đó.'),
(39, 4, 'BÁNH MÌ QUE CHÀ BÔNG PATE', '60138f0212887_73a607701cc178390c47a2494cc3f779.jpg', 13000, 'Bánh mì que Chà bông pate đậm đà bởi chà bông và béo ngậy bởi pate thơm lừng'),
(40, 4, 'BÁNH MÌ QUE GÀ SỐT PHÔ MAI', '60138e6766c9f_4d89f275f0548b3e63a4d251b1ff991c.jpg', 13000, 'Bánh mì que Gà sốt phô mai béo ngậy dinh dưỡng, nóng giòn khó cưỡng'),
(41, 4, 'CÁ VIÊN CHIÊN NGON BÁ CHÁY', '5da9175b286da_4d24adcf172550a07beb15efd9d7291a.jpg', 13000, 'Cá viên chiên vốn là một trong những món ăn vặt được yêu thích nhất của các bạn trẻ Sài Gòn. Tụ tập từng nhóm, ngồi tám chuyện và ăn những xiên cá viên thơm ngon là tuyệt cú mèo luôn nhé!'),
(42, 5, 'SỮA VỊ DÂU', 'icon-web---Sua-vi-dau---260px.jpg', 18000, 'SỮA VỊ DÂU – NGỌT NGÀO NHƯ VỊ CỦA CRUSH.\r\nNgọt ngào hơn tình đầu, “mlem” hơn tình cũ.\r\nKhông biết bạn đã thử, SỮA VỊ DÂU tại MINISHOP chưa?\r\nMINISHOP vừa kết nạp thêm “em” sữa vị dâu siêu “mlem” hứa hẹn sẽ là sản phẩm “hot hit” sắp tới tại MINISHOP đó.\r\nSữa dâu với vị dâu thơm như mùi quả dâu tây tươi mát, hương vị sữa chua chua ngọt ngọt thơm ngon kích thích vị giác.\r\nMời bạn thử liền ly sữa “siêu phẩm” gây nghiện này nhé.'),
(43, 5, 'SỮA VỊ DƯA LƯỚI', 'icon-web---Sua-vi-dua-luoi---260px.jpg', 18000, 'SỮA VỊ DƯA LƯỚI – NGỌT NGÀO NHƯ VỊ CỦA CRUSH.\r\nNgọt ngào hơn tình đầu, “mlem” hơn tình cũ.\r\nKhông biết bạn đã thử, SỮA VỊ DƯA LƯỚI tại MINISHOP chưa?\r\nMINISHOP vừa kết nạp thêm “em” sữa vị dưa lưới siêu “mlem” hứa hẹn sẽ là sản phẩm “hot hit” sắp tới tại MINISHOP đó.\r\nVị dưa lưới thơm lừng hòa quyện cùng sữa béo ngậy mang lại cảm giác tươi mát tuyệt vời trong những ngày hè.\r\nMời bạn thử liền ly sữa “siêu phẩm” gây nghiện này nhé.'),
(44, 5, 'HỒNG TRÀ SỮA NƯỚNG', 'icon-web---hong-tra-sua-nuong---260px.jpg', 18000, 'Đậm vị trà, thơm vị sữa, béo ngậy đầy mê hoặc là những gì chúng ta cảm nhận khi \"chạm môi\" với Hồng trà sữa nướng của MINISHOP.'),
(45, 5, 'CÀ PHÊ SỮA TƯƠI', '620219a96eed8_aaa5f61e5bee33930b92b2087dfd7240.jpg', 20000, 'Một ly cà phê sữa tươi vào buổi sáng sẽ giúp tinh thần bạn thoải mái, tỉnh táo để bắt đầu một ngày làm việc hiệu quả đấy.\r\nCắm vòi vào sâu tận đáy cốc, rít một hơi nhẹ, hương vị tươi béo của sữa hòa quyện với vị đắng đặc trưng của cafe, không quá ngọt cũng không quá đắng. Hương vị phù hợp để đánh thức một ngày mới tràn đầy năng lượng.'),
(46, 5, 'NƯỚC SUỐI', '5abe056f00caf_745bbcd087e2f21671a140c138b20804.jpg', 4000, 'Nước suối tinh khiết MINISHOP được sản xuất theo dây chuyền công nghệ hiện đại Nhật Bản, đảm bảo các yêu cầu về chất lượng, vệ sinh an toàn thực phẩm do Bộ Y tế kiểm định và chứng nhận. Bảo đảm cung cấp cho bạn nguồn nước tinh khiết, an toàn và tươi mát nhất.'),
(47, 11, 'MÌ GÀ PHÔ MAI CAY & TRỨNG', '62e4a1523e581_4a9ec69f3399c1498bb5506cbe71b38d.jpg', 35000, 'MÌ GÀ PHÔ MAI CAY & TRỨNG - MÓN NGON KHÔNG THỂ CHỐI TỪ\r\nLà \"tín đồ\" mì cay thì không thể bỏ qua MÌ GÀ PHÔ MAI CAY & TRỨNG tại MINISHOP đó nha.\r\nVị cay cực đã với nước sốt mì khô cùng vị gà cay đậm đà, hấp dẫn thấm đều trong từng sợi mì dai vàng thơm ngon cùng hương phô mai thơm lừng quyến rũ kích thích khứu giác lẫn vị giác.\r\nĐến ngay MINISHOP ăn thật đã nha bạn ơi!'),
(48, 11, 'SET CƠM NẮM THỊT HEO NƯỚNG & MÌ Ý SỐT BOLOGNESE', '62cf75387a8e7_87cf213994f81875e1574ef6352349dd.jpg', 32000, 'SET CƠM NẮM THỊT HEO NƯỚNG & MÌ Ý SỐT BOLOGNESE SIÊU NGON, KÍCH THÍCH VỊ GIÁC.\r\nMì Ý sốt Bolognese với màu sắc vô cùng đẹp mắt kết hợp với cơm nắm thịt heo nương dẻo thơm.\r\nKhi ăn chúng ta sẽ bị chinh phục bởi những sợi mì vàng óng sốt chua ngọt với thịt bò mềm thơm gia vị kiểu Ý. Mang đến bạn cảm giác mới lạ, thu hút ngay từ lần đầu thưởng thức!'),
(49, 11, 'MÌ GÀ SỐT KEM', '62b40818da0e8_026ca3dfb2910ef00b8dd992c7b9f465.jpg', 35000, 'MÌ GÀ SỐT KEM THƠM NGON MỜI BẠN ĂN NHA…\r\nTui đây không chờ bạn nữa giờ tui ăn liền.\r\nMì gà sốt kem với sợi mì dai dai , sốt kem béo ngậy thơm lừng hòa quyện với mùi thơm của thịt gà làm món ăn càng thêm khó cưỡng.\r\nGhé MINISHOP ăn nha.'),
(50, 11, 'SET CƠM NẮM MỰC VÀ MÌ PHÔ MAI CAY', '625651cd11261_164ef5967212693bda0cc42dffb3301f.jpg', 32000, 'SET CƠM NẮM MỰC VÀ MÌ PHÔ MAI CAY SIÊU NGON, KÍCH THÍCH VỊ GIÁC.\r\nMì phô mai cay với màu sắc vô cùng đẹp mắt kết hợp với cơm nắm mực dẻo thơm.\r\nKhi ăn chúng ta sẽ bị chinh phục bởi vị trứng và phô mai béo thơm hòa cùng với sợi mì dai dai và phần sốt cay cay thơm thơm chuẩn vi. Mang đến bạn cảm giác mới lạ, thu hút ngay từ lần đầu thưởng thức!'),
(51, 11, 'MÌ GÀ CAY KIM CHI', '6243d8ddc563b_244f5d0d317072d76098350b8fe59287.jpg', 32000, 'MÌ GÀ KIM CHI CAY XÈ QUYẾN RŨ NHƯ CRUSH, ĂN XONG CÒN THÒM THÈM.\r\n\r\nNói không ngoa chứ cái Mì Gà Cay Kim Chi này nó ăn cuốn lắm ó.\r\n\r\nMì xào chung với thịt gà ướp thấm sốt cay & kim chi chua chua, cay cay, dễ nghiện cực.\r\nTới MINISHOP đổi vị cho bữa trưa hoặc bữa sáng thiệt với món ăn thiệt hấp dẫn này nha!'),
(52, 11, 'MÌ GÀ SỐT MẮM TỎI – NGON HÚ HỒN', '61dfdda3e9b9c_90c06a89a3ded222877db537fc581ea4.jpg', 32000, 'Mì gà sốt mắm tỏi – nghe tên thôi là đã nghe hấp dẫn rồi đúng không các bạn?\r\nSợi mì dai dai không bị bở nát, được nêm nếm gia vị khá vừa ăn và thơm mùi tỏi phi. Gà được tẩm gia vị chiên giòn, bên ngoài lớp vỏ giòn rụm thơm mùi nước mắm đậm đà.\r\nĐến ngay MINISHOP để có một bữa ăn ngon lành cành đào với mì gà sốt mắm tỏi “siêu hấp dẫn” này nhé'),
(53, 11, 'MÌ Ý GÀ CAY PHÔ MAI', '60bf4b5307821_0ff3ec000c8159bf423139ae14e17d39.jpg', 30000, 'Một món ăn hoàn toàn mới dành cho những tín đồ yêu phô mai nay đã gia nhập dàn “Món ngon không thể chối từ” tại nhà MINIShOP, chính là “Mì ý gà cay phô mai”\r\nĐiểm sơ qua về hình thức món ăn, nữa bên là gà phủ phô mai, nữa bên là mì, chỉ nhìn thôi cũng đủ hấp dẫn rồi đó.\r\nGà karaage, đây mới là đỉnh nhất nè, gà được chiên có độ vàng giòn bên ngoài nhưng vẫn giữ được độ ẩm bên trong, quyện với sốt phô mai mặn mặn, béo ngậy, ăn miếng nào thèm miếng nấy.\r\nNghe tới đây thôi là cũng đủ kích thích vị giác rồi phải không nào.\r\nGhé liền Minishop để thử ngay món ăn ngon khó cưỡng này ngay và luôn nhé.\r\nBạn cũng đừng quên thực hiện các biện pháp phòng, chống dịch theo khuyến cáo \"5K\" của Bộ Y Tế để bảo đảm sức khoẻ cộng đồng & bản thân khi mua sắm tại MINISHOP nhé.'),
(54, 11, 'MỲ Ý CÁ HỒI SỐT KEM', '6098e35e4e687_55b11ff1e516c8682474c3f79840baa6.jpg', 32000, 'Chào đón thành viên mới gia nhập vào danh sách “Món ngon không thể bỏ lỡ” tại MINIShOP – Mì ý cá hồi sốt kem.\r\nMì ý cá hồi sốt kem, món ăn gây thương nhớ bởi vị béo ngậy của sốt kem kèm vị thơm mặn đặc trưng của cá hồi xông khói.\r\nMón ăn cực kì gây nghiện đấy nhé!\r\nGhé MINIShOP để thưởng thức ngay nè!'),
(55, 10, 'CƠM THỊT HEO RAM MẶN', '62a94ea8b202d_b7983ac87432b6a2f242557b17a513ba.jpg', 34000, 'CƠM THỊT HEO RAM MẶN – NGON KHỎI CHÊ, AI CŨNG MÊ.\r\nBạn đau đầu nghĩ thực đơn cho bữa trưa làm sao thoả đủ cả ngàn điều kiện như là vừa ngon, vừa tiện, ăn không no quá mà cũng không ít quá thì khỏi lăn tăn nhiều mà chọn ngay món CƠM THỊT HEO RAM MẶN ngon thần sầu tại MINISHOP nhé.\r\nVới hạt cơm dẻo thơm lừng mùi gạo mới, phần thịt heo ram mặn nóng hổi ăn kèm rau củ xào… cho hỏi ai mà chẳng mê.\r\nChờ gì nữa mà không đến ngay MINIShOP để có một bữa trưa tràn trề năng lượng nhé.'),
(56, 10, 'CƠM THỊT HEO XÀO CAY KIỂU THÁI.', '628df24d2669a_270a92e480a40a8cd4c61e759c280c15.jpg', 33000, 'ĐỔI VỊ CHO BỮA TRƯA VỚI CƠM THỊT HEO XÀO CAY KIỂU THÁI.\r\nNếu đang phân vân không biết trưa nay ăn gì vừa lạ, vừa mang hương vị đặc trưng của đồ Thái cay cay, thơm nồng, đậm vị thì để MINISTOP mách bạn món Cơm thịt heo xào cay kiểu Thái thơm ngon đổi vị nè.\r\n\r\nCơm thịt heo xào cay thơm lừng mùi tỏi ớt phi vàng, thịt quyện sốt cay cay, và đặc biệt nhất có mùi hương các lá húng vừa chống ngán, vừa \"đưa miệng“. Cay nồng, đậm vị nhưng vẫn có chút ngọt ngọt sẽ là cảm nhận của bạn khi thử món ăn này.'),
(57, 10, 'CHÁO THỊT BẰM CÀ RỐT', '626900e90fa24_91970f46dc0871dc0d2f460a18eb3fb2.jpg', 22000, 'Mấy hôm trái gió trở trời\r\nCó một bát cháo nóng hổi ôi thật tuyệt vời.\r\nĐến với MINISHOP bạn sẽ thoả mãn được nỗi lòng này với Cháo thịt bằm cà rốt thơm ngon đầy dinh dưỡng giúp tăng cường sức khỏe cho những ngày chuyển mùa.\r\nCháo thịt băm béo béo quyện cùng cà rốt ngọt thanh, hương thơm từ hành lá đầy hấp dẫn hòa quyện vào nhau tạo nên một món cháo thơm ngon, bổ dưỡng.'),
(58, 10, 'CHÁO TÔM BÍ ĐỎ', '6269009d2904f_671693cfec7bf6277b9b71932ab946e5.jpg', 22000, 'Mấy hôm trái gió trở trời\r\nCó một bát cháo nóng hổi ôi thật tuyệt vời.\r\nĐến với MINISHOP bạn sẽ thoả mãn được nỗi lòng này với Cháo tôm bí đỏ .\r\nCháo tôm bí đỏ sánh dẻo, mịn và rất thơm. Đặc biệt, món cháo tôm bí đỏ có vị ngọt dịu, thanh thanh rất dễ ăn. Đây là món cháo ngon và bổ dưỡng, đặc biệt tốt cho các bé nhỏ.'),
(59, 10, 'CƠM HẢI SẢN XỐT TOMYUM.', '625fd193aa09d_a126f08bedd8e0548c2e042a4727fbb0.jpg', 35000, 'NGON KHÔNG NGỜ MÓN CƠM HẢI SẢN XỐT TOMYUM.\r\nVới tuyệt chiêu kết hợp giữa nước xốt Tomyum cùng các loại hản sản tôm, mực cùng ớt & hành tây đã tạo nên một món Cơm hảo hạng với hương vị được cân bằng hài hòa.\r\nPhiên bản Cơm hải sản TomYum này có tất cả các hương vị của món Tom Yum. Nhưng nó được phục vụ theo một hình thức khác lạ, thú vị.'),
(60, 10, 'CƠM CHIÊN CHÀ BÔNG CÁ', '6215b070c277e_67cc3730cc55eccf71f1dc45465a1a41.jpg', 31000, 'BỮA TRƯA CHỐNG NGÁN, BAO LẠ MIỆNG VỚI CƠM CHIÊN CHÀ BÔNG CÁ.\r\nVẫn là món cơm chiên bất hủ rất được lòng người Sài Gòn nhưng biến tấu mới lạ hơn với Chà bông cá mềm ngọt, thấm đậm gia vị ‘bí truyền’ rất riêng của MINISHOP.\r\nHạt cơm thơm ngon vừa nhiều màu sắc bắt mắt, đậm đà và giàu chất dinh dưỡng, kết hợp với các nguyên liệu trứng gà, rau củ kèm xà lách ngọt giòn tạo nên món cơm chiên có hương vị không thể chối từ.\r\nMời các bạn ghé MINISHOP thưởng thức ngay nha!'),
(61, 10, 'CƠM CHIÊN GÀ RÔ TI XÉ SỢI', '60e563a89822d_9b27ae2a1a63b3f16ab3579d08b532ce.jpg', 32000, 'Cơm chiên gà rô ti xé sợi, món #bento giàu dinh dưỡng và ngon khó cưỡng mới toanh đã gia nhập “biệt đội” Bento tại MINISHOP!\r\nThịt gà mềm ẩm, thấm vị hòa quyện với gia vị đậm đà, kết hợp với cà rốt & đậu que giòn ngọt sẽ mang lại cho bạn một bữa trưa thơm ngon “ăn không dừng đũa” chứ chả đùa.\r\nLet’s try it!\r\nBạn cũng đừng quên thực hiện các biện pháp phòng, chống dịch theo khuyến cáo \"5K\" của Bộ Y Tế để bảo đảm sức khoẻ cộng đồng & bản thân khi mua sắm tại MINISHOP nhé.'),
(62, 10, 'CƠM CHIÊN XÚC XÍCH & KIM CHI', '5ef2bfb5e51f3_a8433c510111f6f63fcbb0dc61376b45.jpg', 28000, 'Xúc xích giòn sần sật hòa quyện với kim chi chua cay và nước sốt ngòn ngọt sẽ khiến chúng ta tốn cơm lắm đây! Những hạt cơm mềm dẻo được hâm nóng quyện vào nhau càng làm cho bữa ăn thêm trọn vẹn.'),
(63, 9, 'CƠM CUỘN HẢI SẢN & THỊT HEO KIM CHI', '62f46991659d4_dea3ff08ed8ba6cfdfbad9b8600cca9f.jpg', 34000, '“GIẢI LỜI NGUYỀN” THÈM CƠM CUỘN HẢI SẢN & THỊT HEO KIM CHI CÙNG MINISHOP\r\nNếu là một tín đồ đam mê cơm cuộn thì bạn không thể bỏ qua món Cơm cuộn hải sản & thịt heo kim chi siêu mê tại MINISHOP đâu nhé.\r\nCơm cuộn hải sản mang hương vị đặc trưng của Xứ Sở Hoa Anh Đào, với vị mằn mặn của rong biển, vị giòn ngọt của thanh cua & mực xào. Khi kết hợp cùng thịt heo xào kim chi với mùi thơm cay nhẹ đặc trưng của kim chi cùng miếng thịt xào mềm thấm vị sẽ khiến hương vị của những cuộn cơm sẽ được tăng lên gấp bội đấy.\r\nĐến MINISHOP “đổi gió” với sự kết hợp tuyệt hảo này nhé.'),
(64, 9, 'SUSHI TINH HOA BIỂN CẢ.', '6256440f48a3f_6a0c63ff330abf890ce7b2eaaabc57cf.jpg', 36000, 'Cùng MINISHOP thưởng trọn vị tinh hoa Nhật Bản gói gọn trong set SUSHI TINH HOA BIỂN CẢ.\r\nHương vị tự nhiên tươi ngon, mềm ngậy trong từng chiếc sushi tôm, thanh cua, mực & sò điệp cùng nguyên liệu thuần khiết, giữ trọn tinh tuý của biển cả.\r\nĐến ngay MINISHOP ăn liền một phần ngon thiệt ngon nha.'),
(65, 9, 'CƠM CUỘN XÚC XÍCH KIM CHI & GÀ PHÔ MAI', '6231922e7e6c4_ccf7713b94078816be0979363d709743.jpg', 34000, '“GIẢI LỜI NGUYỀN” THÈM CƠM CUỘN & GÀ PHÔ MAI CÙNG MINISHOP\r\nNếu là một tín đồ đam mê cơm cuộn & gà thì bạn không thể bỏ qua món Cơm cuộn xúc xích kim chi & Gà phô mai siêu mê tại MINISHOP đâu nhé.\r\nHương vị của những cuộn cơm sẽ được tăng lên khi kết hợp cùng Gà Karaage phô mai béo ngậy với lớp vỏ giòn tan bên ngoài, thịt bên trong ẩm mềm.\r\nĐến MINISHOP “đổi gió” với sự kết hợp tuyệt hảo này nhé.'),
(66, 9, 'NIGIRI PHÔ MAI SUSHI', '60dd2827f2f20_056f281178401bc5c0358a1f3d4c6857.jpg', 37000, 'KHƠI DẬY VỊ GIÁC VỚI NIGIRI PHÔ MAI SUSHI “NGON XUẤT THẦN” TẠI MINISHOP.\r\nSet Nigiri phô mai Sushi – tinh túy của ẩm thực Nhật Bản với sushi tôm, thanh cua, xúc xích, mực, kết hợp với phô mai & rong biển.\r\nHurry up! Những hương vị sushi đặc sắc nhất của xứ sở hoa anh đào đang chờ bạn ở MINISHOP.'),
(67, 9, 'SUSHI COLORFULL', '5c1c8f0f3118f_01e64ec15a927a4b4b8b8142b612798d.jpg', 32000, 'Bữa đại tiệc sushi đầy màu sắc với Sushi cá hồi khè & sốt ngọt nigiri, sushi gà sốt mè rang uramaki, sushi thanh cua nigiri, sushi bắp mayo gunkan, sushi xúc xích, sushi màu cam uramaki sẽ đem văn hóa ẩm thực Nhật Bản đến gần bạn hơn\r\nHương vị sushi tươi ngon, được chế biến theo công thức chuẩn Nhật đảm bảo ăn một lần là nhớ mãi. Các bạn đã sẵn sàng mở tiệc sushi cùng'),
(68, 9, 'SUSHI CALIFORNIA', '59f9547ba1648_67a2fdf586008b967bbc18d8dd40c3f7.jpg', 26000, 'Sushi California tại MINISTOP được chế biến thành dạng Sushi cuộn (Uramaki), loại Sushi này được làm từ chả cá hương vị cua, hạt mè trắng, bơ, Mayonnaise (cuộn sao cho theo thứ tự từ bên ngoài: dấm, rong biển khô...)'),
(69, 8, 'SALAD THỊT HEO SỐT MÈ ĐEN', '62f469639eb47_79d852a76b754ea707a122a8c86f433a.jpg', 35000, 'TEAM GIẢM CÂN NGẠI BÉO GỌI TÊN SALAD THỊT HEO SỐT MÈ ĐEN.\r\nHương vị sảng khoái của món salad này hứa hẹn sẽ làm bạn quên đi những ngày hè nóng bức, đặc biệt rất thích hợp cho những người đang muốn siết cân hay thanh lọc cơ thể đấy.\r\nĐừng để tinh bột & đồ chiên rán triệu hồi 6 múi mỡ của bạn ^^ Hôm nay đổi khẩu vị, ăn salad cho tốt dáng đẹp da đi cả nhà ơi!'),
(70, 8, 'SALAD TRỘN MÌ Ý', '6285c728ae9cb_62ab51c52a3c1a7c21efb6d80361e245.jpg', 35000, 'SALAD TRỘN MÌ Ý BỔ DƯỠNG MÀ VẪN NO BỤNG VỚI MINISHOP.\r\nNóng như thế này thì không có gì hơn một tô Salad trộn mì Ý mát lạnh, đầy đủ vitamin rau củ, đạm tốt từ trứng & thanh cua vừa giải nhiệt vừa tăng cường đề kháng cho cơ thể, vừa có thể thêm mì Ý nữa nên bao no bụng nha.'),
(71, 8, 'SALAD NHIỆT ĐỚI', '6285b21325a22_eba07c9ecc1cf8cbd44da5a2c922ae81.jpg', 33000, 'Vẫn là rau xanh tươi ngon và thịt gà dinh dưỡng, được chế biến để đảm bảo sự cân bằng về dưỡng chất nhưng vẫn vô cùng ngon miệng nhờ nước sốt “bí truyền”.\r\nNếu bạn đang theo đuổi chế độ ăn uống “eat-clean” thì đây là món không thể thiếu đúng không nào?^^\r\nĐến MINISHOP thưởng thức ngay các bạn nhé!'),
(72, 8, 'GỎI MỰC KIỂU THÁI', '627b52afab929_20d795e0a4f5f6bbffad179ede9ca8be.jpg', 31000, 'GỎI MỰC KIỂU THÁI – MÓN ĂN GÂY CHAO ĐẢO TÍN ĐỒ ẨM THỰC.\r\nBạn là dân sành ăn đồ Thái chắc chắn không thể cưỡng lại được món Gỏi mực kiểu Thái tại MINISHOP luôn đó.\r\nThịt mực ngọt thanh tự nhiên, rau củ giòn ngon tươi mát quyện cùng với vị cay nồng chua chua của nước sốt, tổng thể tạo nên một món Gỏi mực Thái Lan khó quên tRong lòng người ăn.\r\nĐến ngay MINISHOP để chiều ngay cái miệng muốn ăn mấy món chua cay đặc trưng kiểu Thái, giá lại “xinh yêu” vừa đủ để không quá tổn thương tình hình kinh tế mỗi độ cuối tháng nè.'),
(73, 8, 'SALAD NGŨ SẮC', '6080d8ace5d86_002ea4ee2368b882f7756d475c908b57.jpg', 33000, 'Ở đây có món SALAD NGŨ SẮC thanh mát “NGON” hơn người yêu cũ của bạn.\r\nSalad Ngũ sắc là sự kết hợp hài hòa giữa bắp cải trộn và xà lách lolo tươi xanh, giòn ngọt tắm đều trong sốt bơ đậu phộng chuẩn vị hấp dẫn, bổ sung thêm các loại rau củ như đậu bơ, đậu đỏ, cà chua, bắp hạt, tất cả hòa quyện tạo nên một món Salad siêu ngon có thể làm hài lòng những khẩu vị khó tính nhất.\r\nĂn một miếng salad ngũ sắc, cảm nhận các gia vị thấm đẫm, thanh mát, rau củ quả giòn tan, thơm ngon trên từng thớ lưỡi.\r\nQuay xe tới ngay MINISHOP để thử ngay vị ngon đặc biệt này nhé.'),
(74, 6, 'BÁNH SU SẦU RIÊNG', '62ce8ed998a3e_a0582206d961cea31acda42f14c1ee86.jpg', 20000, 'BÁNH SU SẦU RIÊNG – MÓN ĂN VẶT CỨU ĐÓI BUỔI XẾ CHIỀU\r\nCứ tầm xế xế, chiều chiều là bụng rột rẹt kêu đói, y như rằng cơn buồn miệng thèm vặt lại ập tới.\r\nMạnh dạn ghé MINISHOP làm một chiếc Bánh su sầu riêng ngon thần sầu với lớp kem lạnh siêu siêu béo ngay nhé.'),
(75, 6, 'HỒNG TRÀ SỮA NƯỚNG', '62b2bf5a3b0fc_750b473ca3cb2ec0488a8338ca325e5f.jpg', 18000, 'HỒNG TRÀ SỮA NƯỚNG – VƯƠNG VẤN NGỌT NGÀO.\r\nNgọt ngào hơn tình đầu, “mlem” hơn tình cũ.\r\nKhông biết bạn đã thử, HỒNG TRÀ SỮA NƯỚNG chưa?\r\nMINISTOP vừa kết nạp thêm một “em” trà sữa siêu “mlem” hứa hẹn sẽ là sản phẩm “hot hit” sắp tới tại MINISHOP đó.\r\nTrà được nướng với kỹ thuật “bí truyền”, giúp lá trà bật dậy mùi vị tạo nên mùi hương rất đặc trưng. Điều này còn đảm bảo vị trà đậm nhưng không quá chát, vị trà kết hợp với độ béo ngậy của đường nướng giúp mang đến hương vị Hồng trà sữa xuất sắc.\r\nMời bạn thử liền món trà sữa gây nghiện này nhé.'),
(76, 6, 'PANNA COTTA NHIỆT ĐỚI', '62982eafbec96_4adfd55b89e4ab00c6ebd5a89b95bf98.jpg', 20000, 'Panna cotta là món tráng miệng cực kỳ hấp dẫn giữa cái nắng oi bức của mùa hè. Độ mềm mịn, thơm ngon, cảm giác béo dai của bánh luôn khiến mọi người cảm thấy quyến luyến.\r\nĐể trải nghiệm thử hương vị \"quyến luyến\" này thì đến ngay MINISHOP nhé.'),
(77, 6, 'BÁNH MOUSSE SOCOLA', '62982dd687fc0_bd5f9a604a5522adc591a152b3ee1501.jpg', 20000, 'Với hương vị béo pha chút đắng, mousse socola trở thành một trong những món tráng miệng được nhiều người yêu thích.\r\nNếu đang cần một chút \"Vitamin ngọt ngào\" thì hãy đến ngay MINISHOP thưởng thức chiếc bánh thơm ngon này Bạn nhé.'),
(78, 6, 'BÁNH DỪA CUSTARD', '627b578d95b33_9331bc41e2f2b5028d8286cbf741bfc4.png', 14000, 'Món bánh phủ dừa sấy khô mềm mịn, thơm phức hương dừa này quả là một gợi ý thích hợp để buổi trà chiều thêm vui.\r\nVới hương dừa quyến rũ, cùng với phần cốt bánh mềm mịn, chắc hẳn đây sẽ là một món bánh khó quên với tất cả mọi người.\r\nĐến ngay MINISHOP thưởng thức ngay chiếc bánh ngọt ngào này nhé'),
(79, 6, 'SƯƠNG SÁO THẬP CẨM', '625fd2baeff6e_c61096b20b831dae19196f7077d7081b.jpg', 18000, 'GIẢI NÓNG CẤP TỐC VỚI SƯƠNG SÁO THẬP CẨM MÁT LẠNH.\r\nSài Gòn nóng như thiêu như đốt mà có chén sương sáo thập cẩm này thì hết ý luôn.\r\nSương sáo thập cẩm lại mang đến hương vị thơm mát giải nhiệt cơ thể với sự kết hợp của Sương sâm, nước bí đao, hạt é, thạch sương sa, mũ trôm, thạch dừa. Nghe thôi đã thấy mát lạnh sảng khoái rồi đúng hông.'),
(80, 6, 'CHÈ SÂM BỔ LƯỢNG', '625fd275213f4_6569b6e5f12259243379791933d776bb.jpg', 18000, 'GIẢI NÓNG CẤP TỐC VỚI CHÈ SÂM BỔ LƯỢNG MÁT LẠNH.\r\nSài Gòn nóng như thiêu như đốt mà có chén chè sâm bổ lương & sương sáo thập cẩm này thì hết ý luôn.\r\nChè sâm bổ lượng ngọt thanh có Nhãn nhục, táo khô, nho khô, đường, phổ tai, thạch dừa, ăn đến đâu mát đến đó luôn nha.'),
(81, 6, 'CHÈ SẮC MÀU', '610a10c1f419a_b18b449d4d372cf2f4b4af1c6232b0d8.jpg', 10000, 'Nắng lên, trời hanh hao, bỗng ta thèm thứ gì đó thanh mát, ngọt nhẹ. Vì thế không có gì tuyệt hơn là được ăn vài món như Chè Sắc Màu, với thập cẩm của đậu xanh, củ dền, củ sẵn hoà chung với nước dừa ngon cực.\r\nTrời mấy nay oi bức, làm ly này xong bỗng sức sống tràn trề lại còn ngọt ngào cả tâm hồn cơ.\r\nCùng MINISHOP thưởng thức món chè bắt mắt, mới lạ này nhé!\r\nBạn cũng đừng quên thực hiện các biện pháp phòng, chống dịch theo khuyến cáo \"5K\" của Bộ Y Tế để bảo đảm sức khoẻ cộng đồng & bản thân khi mua sắm tại MINISHOP nhé.'),
(82, 6, 'CREPE SẦU RIÊNG', '609b87ae35a32_5d9e74fc74bfa81fc79e09f4328268e2.jpg', 17000, 'BÁNH CREPE SẦU RIÊNG “ ĐỈNH CỦA CHÓP” NAY ĐÃ GIA NHẬP MINISHOP\r\nBánh Crepe được mệnh danh là bánh tráng miệng thơm ngon chiều lòng mọi thực khách.\r\nKhỏi phải bàn đến mùi thơm của chiếc bánh này luôn nha, chỉ cần nghe thôi đã muốn cắn ngay một miếng rồi.\r\nBánh có lớp vỏ dai dai hòa cùng nhân kem tươi và sầu riêng mềm thơm ngon. Cắn tới đâu, tan chảy tới đó.\r\nDắt tay nhau đến MINISHOP ngay để cùng nếm thử thức món ngon khó cưỡng này Bạn nhé!'),
(83, 6, 'BÔNG LAN CUỐN HAI MÙI', '601caabbb32ab_bf4a8a321a95ad563461fe58e71f4bbf.jpg', 17000, 'Chiếc bánh bông lan mềm mịn, thơm nhẹ nhàng bởi hương sữa và lá dứa sẽ giúp bạn bổ sung năng lượng và thư giãn vào những bữa xế chiều thong thả. Thưởng thức bánh cộng chút trà làm đầu óc thư thái và tràn đầy ý tưởng hơn.'),
(84, 6, 'BÁNH PANNA COTTA XOÀI', '60138d97b5e67_1fef348b12cf929b2ed7acbaa2f62143.jpg', 17000, 'Bánh Panna Cotta Xoài với vị chua chua ngọt ngọt từ xoài, vị beo béo từ kem tươi và sữa, mềm mịn tan trong miệng là món dessert tuyệt hảo không thể bỏ qua'),
(85, 6, 'BÁNH MOUSSE RED VELVET', '60138d30f2d31_2c3425da2d6a5a6107cd1663812a8044.jpg', 17000, 'Mousse Red Velvet không chỉ nổi tiếng bởi vẻ ngoài quyến rũ với sắc đỏ đặc trưng của cốt bánh xen lẫn cùng lớp kem trắng mịn, nó còn thu hút bởi hương thơm nhẹ nhàng kết hợp hài hòa với phần cream cheese chua nhẹ, béo ngậy.'),
(86, 6, 'RAU CÂU HOA ĐẬU BIẾC', '5fd9e70b4ab9a_049edcf7c8324659d09ad346f34000d2.jpg', 10000, 'Ly rau câu xanh biếc ấn tượng thu hút mọi ánh nhìn, hương đậu biếc thoang thoảng bao phủ lấy chiếc rau câu mềm mịn mát lạnh. Vị ngọt vừa phải, cân bằng mọi lượng chất cho cơ thể khỏe mạnh.'),
(87, 6, 'BÁNH MOUSSE SOCOLA', '5e3d44f2c68c5_c39aeacddd25003e15186b43717cdd20.jpg', 17000, 'Bánh Mousse vị Socola khiến người dùng mê mẩn ngay từ lần chạm đầu tiên bởi sự ngọt ngào lạ lẫm đầy cuốn hút, sự mềm mịn và beo béo đầy kích thích cùng vị Socola đăng đắng dịu nhẹ.\r\nĂn thử 1 lần là mê 1 đời!'),
(88, 6, 'CHÈ ĐẬU XANH', '5cc3d244ee1a2_e61da134943d2c6edbf923db11a3a831.jpg', 9000, 'Chè đậu xanh ngọt mát thanh nhiệt cơ thể những ngày nóng'),
(89, 6, 'BÁNH TRỨNG VÀNG VANI', '5c413bc9933f6_0fa30e7fa65b02666a8cd044c8dd84dd.jpg', 14000, 'Với nguyên liệu hoàn toàn làm bằng trứng gà tươi, những người thợ làm nên chiếc bánh xốp mềm mịn, Bên trong là lớp kem vani ngọt dịu thơm vị trứng.'),
(90, 6, 'CHÈ BẮP', '8.jpg', 10000, 'Chào ngày mới nắng lên với món chè bắp ngọt thanh, thơm lừng !\r\nHãy cùng thưởng thức vị ngon thuần của bắp, một chút biến tấu kết hợp cùng đậu xanh và nước dừa sẽ mang đến cho bạn thưởng thức 1 món chè bắp - vị ngon tinh tế ngát trời rất tuyệt nhé'),
(91, 7, 'XÚC XÍCH XÔNG KHÓI', '62bc128678441_da4211085e6a2b5f0bd03e18ec69661f.jpg', 10000, 'XÚC XÍCH XÔNG KHÓI MINISHOP liệu có ngon như lời đồn???\r\nĐược rồi đi thôi...\r\nƯm... 1 chiếc xúc xích vàng ươm, mùi xông khói đặc trưng, chấm với tương ớt rồi cắn một miếng...hương vị như bùng nổ trong khoang miệng, phần thịt dai dai thấm đều gia vị, khiến cho bạn ăn mãi không thể nào ngưng được.\r\nĐến ngay MINISHOP để trải nghiệm món ăn vặt ‘ngon thần sầu’ này nha.'),
(92, 7, 'GÀ SỐT PHÔ MAI KIM CHI', '627b532caaca2_7b586986b12b3aabecf7d5a33ac78c92.jpg', 31000, 'GÀ SỐT PHÔ MAI KIM CHI – MÓN ĂN SƯỞI ẤM TÂM HỒN NGÀY MƯA GIÔNG.\r\nTrời mưa thì mặc trời mưa, mình đây đã có món Gà sốt phô mai kim chi (*) cay cay thơm ngon sưởi ấm tâm hồn còn lắp đầy bao tử nè.\r\nPhần Gà Phô Mai với thịt gà mềm mại được chiên giòn vàng với phô mai beo béo, ăn kèm với bắp cải trắng và kim chi xào ăn cực kì bắt vị nhen.\r\nĐến ngay MINISHOP “sưởi ấm” bao tử với món gà ấm nóng ngon lành liền hen.\r\n'),
(93, 7, 'BÁNH MÌ THỊT XÁ XÍU', '6268b607a33ca_4841143f839bdef4df840aa348aa2f02.jpg', 26000, 'BÁNH MÌ THỊT XÁ XÍU NGON GỌN, ĐỦ CHẤT CHO BỮA SÁNG BẬN RỘN.\r\nNếu lười nghĩ coi sáng mai ăn gì thì BÁNH MÌ THỊT XÁ XÍU là một sự lựa chọn tối ưu cho Bạn đấy nhé.\r\nBánh Mì Thịt Xá Xíu ghi điểm 10 nhờ nhân bánh mì siêu “xôi thịt” với phần xá xíu mềm mại, mọng nước, vị đậm đà vừa phải để quyện cùng nước sốt đặc trưng và rau dưa tươi giòn tạo ra tổng thể ổ bánh mì không bị ngán chút nào nha.\r\nSáng ra chỉ cần order 1 phần bánh mì tại MINISHOP, khỏi phải nghĩ ngợi tìm kiếm gì vừa tiện vừa “đủ đô” cho cả ngày năng động luôn.'),
(94, 7, 'BÁNH BAO GÀ NẤM PHÔ MAI', '625fd0f92027c_e5bae0ecd0767c7df1d4776b3f764d0c.jpg', 20000, 'GIẢI MÃ CƠN SỐT MANG TÊN BÁNH BAO GÀ NẤM PHÔ MAI.\r\nNếu bạn là tín đồ của phô mai thì chắc hẳn bạn không thể nào bỏ qua món Bánh bao gà nấm phô mai tuyệt hảo tại MINISHOP rồi.\r\nNhững chiếc bánh bao với lớp vỏ mềm xốp nhân gà nấm đầy ắp, đậm đà thơm ngon kết hợp với phô mai kéo sợi béo ngậy chắc chắn sẽ chinh phục những người ăn khó tính nhất.'),
(95, 7, 'BÁNH BAO NHÂN THỊT NƯỚNG', '625fcfdf28692_f07a80c95bf1f5e1a21545c305d33e96.jpg', 18000, 'LÓT DẠ BUỔI CHIỀU VỚI BÁNH BAO NHÂN THỊT NƯỚNG THƠM NGON LẠ MIỆNG.\r\nChiều chiều bụng réo biểu tình mà lót dạ bằng một chiếc bánh bao nóng hổi, hương vị mới thơm nức mùi thịt nướng thì còn gì bằng đúng khum.'),
(96, 7, 'ĐẬU HỦ PHÔ MAI', '61cd239c61196_cab17369a75552de24769bcab43b0edf.jpg', 13000, 'Đậu hủ phô mai được làm từ thịt cá tươi xay nhuyễn, có dạng hình tròn, bên trong được xen vào những khối phô mai nhỏ li ti, vừa ngậy, mặn mà không bị ngấy.\r\nCảm giác sần sật dai thơm khi vừa cắn vào kết hợp thêm chút beo béo của phô mai chắc chắn sẽ khiến bạn tan chảy ngay lập tức.'),
(97, 7, 'SNACK DA CÁ HỒI', '60dd27ec90882_0aa82dbec00d5e441a1038054a19fadd.jpg', 17000, 'SNACK DA CÁ HỒI GIÒN TAN, NGON MUỐN XỈU ĐÃ “LÊN KỆ” TẠI MINISHOP.\r\nSnack da cá hồi vị BBQ và vị phô mai hứa hẹn sẽ là 2 sản phẩm “hot hit” sắp tới tại Ministop. Vị BBQ mằn mặn hay phô mai beo béo, phủ đều bên ngoài lớp da cá giòn rụm, cắn đến đâu giòn tan đến đó!\r\nRủ ngay hội bạn đến MINISHOP thử liền món snack gây nghiện này nhé.\r\nBạn cũng đừng quên thực hiện các biện pháp phòng, chống dịch theo khuyến cáo \"5K\" của Bộ Y Tế để bảo đảm sức khoẻ cộng đồng & bản thân khi mua sắm tại MINISHOP nhé.'),
(98, 7, 'BÒ CUỐN LÁ LỐT', '5f759b8dee1e8_3215ddfee14c71743ccb1d7f8016724d.jpg', 10000, 'Hương vị thơm ngon đặc trưng, hấp dẫn của thịt bò cuốn lá lốt được tạo nên từ những nguyên liệu tươi chất lượng và bí kíp tẩm ướp \'gia truyền\'.'),
(99, 8, 'GÀ KHÔNG XƯƠNG TẨM BỘT CHIÊN', '5f6ac520e41e5_89a840feaa573d576566bf2af58b43ea.jpg', 15000, 'Thịt gà dinh dưỡng được tẩm ướp gia vị vừa miệng, bao bọc bởi lớp bột chiên giòn tan sẽ là item ăn vặt cực đỉnh cho các bạn trẻ.'),
(100, 7, 'HOTDOG XÚC XÍCH HẢI SẢN', '5ebbb3e813bab_e49285c5c6ae2f47a08420ccb29bf51e.jpg', 17000, '\"Bánh mì kẹp xúc xích\" phiên bản mới mới, dài hơn, dai hơn, đậm chất hơn!'),
(101, 7, 'HOTDOG XÚC XÍCH ĐỨC', '5ebbb3ac35b85_9bdf46a327fbd0b32b9749f25ff1f278.jpg', 18000, 'Bánh mì kẹp xúc xích\" phiên bản mới mới, dài hơn, dai hơn, đậm chất hơn!'),
(102, 7, 'BÁNH BAO THỊT TRỨNG CÚT', '5ae2f3a5ab1c0_d0322a16ec9844b8f7c56ae4ee662ef7.jpg', 14000, 'Bánh bao cao cấp có nhân được làm từ trứng cút, thịt heo xay'),
(103, 7, 'BÁNH GIÒ', '593fbcca32333_d0e25bac20e30d0b3eed86fd9bdd48f5.jpg', 11000, 'Bánh giò MINISHOP với lớp bột dẻo mềm mịn, nhân thịt hòa quyện cùng nấm tai mèo, hành tây mang lại hương vị thơm ngon, bổ dưỡng.'),
(104, 7, 'ĐÙI TỎI GÀ CHIÊN', '14-04. 260x260. Web icon. Renew dui ga tam bot chien.jpg', 25000, 'Gà chiên mang thương hiệu riêng của MINISTOP, được tẩm ướp cân bằng, vừa phải giữa các loại gia vị cay.'),
(105, 7, 'BÁNH BAO THỊT TRỨNG MUỐI', 'icon-banh-bao-thit-heo-nhan-trung-muoi.jpg', 16000, 'Bánh bao cao cấp có nhân được làm từ trứng muối, trứng cút, xúc xích Salami.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `link`) VALUES
(1, '62f329ec15ad6_758eb75a917dd32168bc3c3920e8b21b.jpg'),
(2, '62f32b33db501_b4333ac30eb30b4aa679dcf3417eb9d2.jpg'),
(3, '62f4689ad3dbc_334ded7c04a1ccae3dab40fdfeaf78d6.jpg'),
(4, '6231919d30637_8922ea86f1f02de8574d9e29bbefb2b0.jpg'),
(5, '623abe8abd2c0_1a9cf23c509601f4b1e7867df88ebd1c.jpg'),
(6, '6243d89b2e549_f0b04186f64b79cf9720eeed194e788c.jpg'),
(7, '62e49f41cc02a_0b28f828ff45aef37dc48f10bd8fdbf0.jpg'),
(8, '62d77220e27cb_126614e72fb8c371964df4a7419389a7.jpg'),
(9, '62c63ca4cdc3c_541839a40edd896918db9f7f4c8e77d5.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `tenkhachhang` varchar(40) NOT NULL,
  `sdt` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `matkhau` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `tenkhachhang`, `sdt`, `email`, `matkhau`) VALUES
(1, 'Cao Minh Thắng', '0376701749', 'thangminhcaoss@gmail.com', '123456'),
(2, 'Nguyễn Văn Thiên', '0364103836', 'vanthienbs@gmail.com', '123456'),
(3, 'Thang Minh Cao', '0376701748', 'thangminhcaoss@gmail.com', '123456');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cuahang`
--
ALTER TABLE `cuahang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mon`
--
ALTER TABLE `mon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cuahang`
--
ALTER TABLE `cuahang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `mon`
--
ALTER TABLE `mon`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
