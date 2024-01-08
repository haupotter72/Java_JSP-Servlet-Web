-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2023 at 02:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perfume`
--

-- --------------------------------------------------------

--
-- Table structure for table `cat_perfume`
--

CREATE TABLE `cat_perfume` (
  `id` int(11) NOT NULL,
  `catperfume` varchar(255) NOT NULL,
  `parrent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_perfume`
--

INSERT INTO `cat_perfume` (`id`, `catperfume`, `parrent_id`) VALUES
(1, 'XÁCH TAY', 0),
(2, 'CHÍNH HÃNG', 0),
(10, 'COCO NOIR CHANEL', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cat_user`
--

CREATE TABLE `cat_user` (
  `id` int(11) NOT NULL,
  `catuser` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_user`
--

INSERT INTO `cat_user` (`id`, `catuser`) VALUES
(1, 'Administrator'),
(4, 'Admin'),
(5, 'Quản Trị Viên');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `name_comment` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `create_comment` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_per` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `name_comment`, `message`, `create_comment`, `id_per`) VALUES
(1, 'Nguyễn Văn A', 'Sản phẩm OK', '2020-12-11 11:01:54', 25),
(2, 'Lê Đức Nam', 'Sản phẩm OK', '2020-12-11 11:28:52', 33);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`) VALUES
(1, 'Văn Thọ', 'thotran@gmail.com', '0795486347', 'Sản phẩm tốt'),
(2, 'Thọ Potter', 'thoDev.Potter@gmail.com', '0919608527', 'Giá rẻ quá.!');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` longtext NOT NULL,
  `per_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `quantity`, `price`, `per_id`, `order_id`) VALUES
(3, 2, '200000', 25, 1),
(5, 2, '200000', 26, 2),
(6, 1, '200000', 26, 10),
(7, 1, '200000', 26, 11),
(8, 1, '200000', 26, 12),
(9, 1, '8500000', 33, 14),
(10, 1, '3470000', 34, 15),
(11, 1, '3470000', 34, 16);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `adress` text NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `phone`, `email`, `adress`, `note`) VALUES
(1, 2, 1, '0797207493', 'leducnam1805@gmail.com', '23 tnh', 'fgvbhjm'),
(2, 2, 1, '', 'leducnam1805@gmail.com', 'INSERT INTO order(user_id,phone,email,adress,note) VALUES(?,?,?,?,?)', 'INSERT INTO order(user_id,phone,email,adress,note) VALUES(?,?,?,?,?)'),
(10, 2, 1, '0797207493', 'leducnam1805@gmail.com', '15 Thái Phiên - Đà Nẵng', '15 Thái Phiên - Đà Nẵng'),
(11, 2, 0, '0389276829', 'nstamky24h@gmail.com', '154 Phạm Hùng - Đà Nẵng', 'Giao hàng nhanh'),
(12, 2, 0, '0389276829', 'leducnam1805@gmail.com', '154 Phạm Như Xương', 'Giao hàng'),
(14, 10, 1, '05103486987', 'huy@gmail.com', '154 lý thường kiệt - Đà nẵng', ''),
(15, 13, 0, '05678942', 'hung@gmail.com', '186 Nguyễn Lương Bằng - Đà Nẵng', ''),
(16, 14, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `perfumes`
--

CREATE TABLE `perfumes` (
  `id` int(11) NOT NULL,
  `name_per` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `brand` varchar(255) NOT NULL,
  `made` varchar(50) NOT NULL,
  `capacity` varchar(20) NOT NULL,
  `code_per` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `money` varchar(20) NOT NULL DEFAULT '0',
  `evaluate` int(5) NOT NULL DEFAULT 0,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `view` int(11) NOT NULL DEFAULT 0,
  `cat_perfume` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `perfumes`
--

INSERT INTO `perfumes` (`id`, `name_per`, `description`, `detail`, `brand`, `made`, `capacity`, `code_per`, `amount`, `money`, `evaluate`, `create_date`, `view`, `cat_perfume`) VALUES
(25, 'X-MEN', 'Hương bạc hà', 'Hương bạc hà', 'Diolona', 'Việt Nam', '200ml', '123456766543', 100, '200000', 0, '2020-12-06 03:12:36', 1, 2),
(26, 'ROMANO', 'Chuẩn đàn ông', 'Chuẩn đàn ông', 'ROMANO', 'Hàn quốc', '200ml', '123456766543', 100, '200000', 0, '2020-12-06 03:20:14', 29, 2),
(32, 'DAWANA', 'Hương bạc hà', 'Hương bạc hà', 'Diolona', 'Việt Nam', '200ml', '123456766543', 100, '300000', 0, '2020-12-10 14:55:02', 3, 1),
(33, 'Chanel', 'Chuẩn đàn ông', 'Chuẩn đàn ông', 'Diolona', 'Việt Nam', '200ml', '123456766543', 2000, '8500000', 0, '2020-12-10 14:57:42', 65, 2),
(34, 'Jean Paul Gaultier Scandal EDP', 'ự ngon lành từ mật ong mới nguyên, làm tăng cường độ các nốt hương hoa Dành Dành trắng muốt ngào ngạt và Bưởi Hồng thanh mát.', 'Hương hoa Gardenia bằng sự tinh tế nhưng hoang dã của đủ chinh phục bạn ngay ở những xúc chạm đầu tiên. Sau đó, vị ngọt trong thành phần chính của mùi hương đầy ấn tượng – mật ong – bắt đầu hé lộ những nốt hương đầu tiên của mình. Khứu giác được kích thích gợi nhớ về kinh nghiệm đầy ngon lành của vị giác, để rồi bất ngờ nhận ra Hoắc Hương cũng dần lộ diện mang lại chiều sâu và thậm chí nguyên khí mới đầy bất ngờ cho toàn bộ làn hương.', 'MY', 'Mỹ', '80ml', '123456766543', 150, '3470000', 0, '2020-12-12 03:31:22', 0, 2),
(36, 'Blue Chanel', 'Hương thơm lan tỏa, sang trọng quý phái', 'Giới tính:\r\nNam\r\nPhong cách:\r\nMạnh mẽ, nam tính, sang trọng\r\nXuất xứ:\r\nPháp\r\nGọi đặt mua:\r\n093.934.8888(7:30 - 22:00)\r\nVận chuyển:\r\nFreeship Hà Nội & HCM\r\n', 'Luxury', 'Pháp', '500M;', 'CNP102', 10, '2000000', 0, '2023-11-01 01:41:03', 2, 2),
(37, 'Nước Hoa Nam Dolce & Gabbana D&G Light Blue Summer Vibes Pour Homme EDT 125ml', 'Được thiết kế để mang lại cảm giác của một ngày hè đầy nắng và gió biển. ', 'Năm phát hành:\r\n2018\r\nGiới tính:\r\nNam\r\nPhong cách:\r\nMạnh mẽ, trẻ trung, hiện đại\r\nXuất xứ:\r\nPháp', 'Luxury', 'Pháp', '125Ml', 'CD01', 200, '2000000', 0, '2023-11-03 08:12:52', 2, 2),
(38, 'Nước Hoa Unisex Le Labo 13 Another 100ml', 'Là một trong những mùi hương quý phái và lịch lãm', 'Năm phát hành:\r\n2010\r\nGiới tính:\r\nUnisex\r\nPhong cách:\r\nCổ điển, thanh lịch, tinh tế\r\nXuất xứ:\r\nMỹ\r\nVận chuyển:\r\nFreeship Hà Nội & HCM\r\nMiễn phí vận chuyển\r\nƯu đãi dành cho bạn', 'Luxury', 'Mỹ', '100ml', 'CD02', 250, '300000', 0, '2023-11-03 08:18:22', 1, 2),
(39, 'Nước Hoa Unisex Maison Francis Kurkdjian Baccarat Rouge 540 Extrait De Parfum 70ml', 'Đây là dòng nước hoa mang hương vị ngào ngạt từ phương Đông', 'Năm phát hành:\r\n2017\r\nGiới tính:\r\nUnisex\r\nPhong cách:\r\nSang trọng, nổi bật, thu hút\r\nXuất xứ:\r\nPháp\r\nVận chuyển:\r\nFreeship Hà Nội & HCM\r\n', 'Luxury', 'Pháp', '70Ml', 'CD03', 10, '1494949', 0, '2023-11-03 08:23:25', 0, 2),
(41, 'Nước Hoa Chanel Coco Mademoiselle Thanh Lịch, 100ml', 'Được thiết kế để mang lại cảm giác của một ngày hè đầy nắng và gió biển. ', 'Năm phát hành:\r\n2001\r\nGiới tính:\r\nNữ\r\nPhong cách:\r\nNữ tính, tươi tắn, gợi cảm\r\nXuất xứ:\r\nPháp\r\nVận chuyển:\r\nFreeship Hà Nội & HCM\r\nMiễn phí vận chuyển\r\nƯu đãi dành cho bạn', 'Luxury', 'Pháp', '100ml', 'CD04', 234, '696969', 0, '2023-11-03 08:31:02', 0, 2),
(42, 'Nước Hoa Chanel Coco Noir EDP Cho Nữ 100ml', 'COCO có hương đầu tươi sáng, tinh khiết của cam, sự thanh lịch, tinh tế của hoa nhài và xạ hương trắng.', 'Năm phát hành:\r\n2012\r\nGiới tính:\r\nNữ\r\nPhong cách:\r\nBí ẩn, gợi cảm, quyến rũ\r\nXuất xứ:\r\nPháp\r\nVận chuyển:\r\nFreeship Hà Nội & HCM\r\nMiễn phí vận chuyển\r\nƯu đãi dành cho bạn', 'Luxury', 'Pháp', '100ml', 'CD05', 280, '1343434', 0, '2023-11-03 08:44:36', 0, 1),
(43, 'Giorgio Armani Acqua Di Gio Pour Homme', 'Xịt toàn thân lấy cảm hứng từ hương gỗ thơm của BLEU DE CHANEL, mang lại cảm giác tươi mát tức thì', 'thành phần\r\nXịt toàn thân BLEU DE CHANEL đại diện cho nét tươi mới và sôi nổi nhất của BLEU DE CHANEL. Một hương thơm tươi mát bắt đầu với hương cam chanh-bưởi, sau đó được nhấn mạnh thêm bởi hương bạc hà và hoa oải hương mạnh mẽ, hòa quyện với hương tuyết tùng khô nồng nàn và gợi cảm.', 'Giorgio Armani', 'Pháp', '150ML', 'CD06', 60, '1969696', 0, '2023-11-03 08:47:48', 2, 1),
(45, 'Bvlgari Aqva Pour Homme, Eau de Toilette 100ml', 'Nước hoa Aqva Pour Homme của hãng Bvlgari mang hương vị của biển cả, với các note hương tươi mát và sảng khoái', '\r\nXuất xứ:Ý\r\nNăm phát hành: 2005\r\nNhóm hương\r\nRong biển, Quýt hồng, Cam vàng\r\nPhong cách:Tươi mát, Nam tính, Mãnh mẽ\r\nHương Đầu: Tinh dầu lá chanh, Quả cam, Quả quýt hồng\r\nHương giữa: Rong biển, Hoa Lavender, Hoa bông\r\nHương cuối: Cây hoắc hương, Gỗ tuyết tùng, Hương gỗ', 'Luxury', 'Ý', '100mL', 'CD07', 300, '418080', 0, '2023-11-03 08:54:07', 4, 1),
(46, 'Bvlgari Man Glacial Essence,Eau de Parfum 100ml', 'Một hương thơm có độ tương phản cao là một luồng không khí lạnh giá', 'Xuất xứ\r\nÝ\r\nNăm phát hành\r\n2020\r\nNhóm hương:Hương gỗ, Quả bách xù, Xạ hương\r\nPhong cách:Tươi mới, Mạnh mẽ, Phóng khoáng\r\nHương Đầu: Quả Bách Xù, Gừng, Chi Mỏ Hạc.\r\nHương Giữa: Gỗ Đàn Hương, Rễ Orris, Ngải cứu.\r\nHương Cuối: Gỗ Tuyết Tùng, Clearwood, xạ hương', 'Luxury', 'Ý', '100mL', 'CD08', 300, '16800', 0, '2023-11-03 08:57:07', 1, 1),
(47, 'Bvlgari Man in Black Travel Size,Eau de Parfum 50ml', 'Một hương thơm có độ tương phản cao là một luồng không khí lạnh giá', 'Năm phát hành:2014\r\nNhóm hương:Gia vị, Rượu rum, Da thuộc\r\nPhong cách:Nam tính, Ấm áp, Lịch lãm\r\nHương đầu: Cây thuốc lá, Rượu Rum, Gia vị\r\nHương giữa: Da thuộc, Hoa huệ trắng, Hoa diên vĩ\r\nHương cuối: Gỗ Guaiac, An tức hương, Đậu Tonka', 'Luxury', 'Ý', '50ML', 'CD09', 20, '2393939', 0, '2023-11-03 09:01:50', 1, 1),
(48, 'Gucci Bloom Eau de Parfum Intense,Eau de Parfum Intense 100ml', 'Gucci luôn biết cách gây ấn tượng với những người yêu hương bằng cách biến tấu các flanker của mình', 'Năm phát hành:2023\r\nNhóm hương:Hương hoa huệ, Hoa nhài, Quảng hoắc hương\r\nPhong cách:Bí ẩn, Ngọt ngào, Sang trọng\r\nHương đầu: Quả lê, Gừng, Cam quýt\r\nHương giữa: Hoa nhài, Hoa nhuệ, Hoa cam\r\nHương cuối: Hoắc hương, Rêu sồi, Dừa\r\n ', 'Luxury', ' Anh, Đức, Pháp', '100ml', 'CD09', 40, '393939', 0, '2023-11-03 09:03:57', 1, 1),
(49, 'Gucci Flora Gorgeous Magnolia,Eau de Parfum 100ml N', 'Gucci thực sự là một nhà hương biết cách yêu chiều khứu giác của phái đẹp.', 'Năm phát hành:2023\r\nNhóm hương:Hương quả mâm xôi, Hương hoa mộc lan, Hương trái dừa\r\nPhong cách:Tươi mới, Thanh lịch, Tinh tế\r\nHương đầu: Quả mâm xôi, Dừa\r\nHương giữa: Hoa mộc lan, Hoa nhài, Xô thơm\r\nHương cuối: Xạ hương, Hoắc hương, Hương gỗ', 'Luxury', 'Anh, Đức, Pháp', '100ml', 'CD10', 300, '418080', 0, '2023-11-03 09:06:03', 19, 1),
(50, 'Narciso Rodriguez For Her Musc Noir 100ml', 'Hương thơm lan tỏa, sang trọng quý phái', 'Năm phát hành:2021\r\nNhóm hương:Xạ hương, Quả mận, Hoa vòi voi\r\nPhong cách:Quyến rũ, Cuốn hút, Gợi cảm\r\nHương đầu: Mận\r\nHương giữa: Xạ hương, Hoa vòi voi\r\nHương cuối: Da lộn', 'Luxury', 'Pháp', '100mL', 'CD11', 50, '1494949', 0, '2023-11-03 09:07:51', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `catuser_id` int(11) NOT NULL,
  `perfume_id` int(11) NOT NULL,
  `add_per` tinyint(1) NOT NULL DEFAULT 0,
  `edit_per` tinyint(1) NOT NULL DEFAULT 0,
  `del_per` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `user_id`, `catuser_id`, `perfume_id`, `add_per`, `edit_per`, `del_per`) VALUES
(1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pic_per`
--

CREATE TABLE `pic_per` (
  `id` int(11) NOT NULL,
  `picture` text NOT NULL,
  `per_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pic_per`
--

INSERT INTO `pic_per` (`id`, `picture`, `per_id`) VALUES
(34, 'MARC JACOBS DAISY LOVE-385904567803700.jpg', 32),
(35, 'p1-385904613406100.jpg', 32),
(36, 'p2-385904672383900.jpg', 32),
(37, 'p3-385904790401000.jpg', 32),
(53, 'nuoc-hoa-nam-chanel-bleu-de-chanel-parfum-100ml-620601ce4ba34-11022022132726-255340836271800.jpg', 36),
(54, 'nuoc-hoa-nam-chanel-bleu-de-chanel-parfum-100ml-620601ce27f94-11022022132726-255340848623100.jpg', 36),
(55, 'cd01-451673104762200.jpg', 37),
(56, 'cd01b-451673115545900.jpg', 37),
(57, 'cd02-452002824926100.jpg', 38),
(58, 'cd02a-452002835581600.jpg', 38),
(59, 'cd03-452305821632500.jpg', 39),
(60, 'cd04-452762739329900.jpg', 41),
(61, 'cd04a-452762748857700.jpg', 41),
(62, 'cd05-453576465305200.jpg', 42),
(63, 'cd05A-453576475450800.jpg', 42),
(64, '8837032607774-453768650402300.webp', 43),
(65, '8850015649822-453768660176800.webp', 43),
(66, '07-454147427637900.webp', 45),
(67, '071-454147437187000.webp', 45),
(68, 'bvlgari-man-glacial-essence_fbb926673dd642f5ba755717a11232bf_master-454328095162900.webp', 46),
(69, 'bvlgari-man-glacial-essence-100ml_1eed0518b21749a5a1df961926d4726c_master-454328106553800.webp', 46),
(70, 'man-in-black_1fd56222e51d40c98f5297accb3cb271_master-454610512029300.webp', 47),
(71, 'man-in-black-5ml_3602ccfcd1bb43d0b647e156cec8f6a6_compact-454610523120800.webp', 47),
(72, 'gucci-bloom-eau-de-parfum-intense_c0d3a4c415304c68bdcb5f174807237d_master-454737380408000.jpg', 48),
(73, 'gucci-bloom-eau-de-parfum-intense-3_aad0a7eafc0447d48c1f5a475eb69a80_master-454737388625600.jpg', 48),
(74, 'gucci-flora-gorgeous-magnolia_0e6835307f5347d1b8d38355104d1197_master-454863817985900.webp', 49),
(75, 'gucci-flora-gorgeous-magnolia-1_afb7f7c5fca14174b0e97d08c414363b_master-454863826222400.webp', 49),
(76, 'musc-noir-for-her-narciso-rodriguez-for-women_44928a6af0f54ffa901ecd846ad27768_master-454971471923400.webp', 50),
(77, 'narciso-rodriguez-musc-noir-for-her-30ml_576365cb5daa4b0abc7803aa75ffa1ab_master-454971479717900.webp', 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `money` varchar(20) NOT NULL DEFAULT '0',
  `cat_user` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `password`, `money`, `cat_user`) VALUES
(2, 'admin', 'Lê Đức Nam', '202cb962ac59075b964b07152d234b70', '', 4),
(5, 'tan', 'Tân Đoàn', 'e10adc3949ba59abbe56e057f20f883e', '', 5),
(6, 'binh', 'Bình Lê', '827ccb0eea8a706c4c34a16891f84e7b', '', 5),
(9, 'Lê Đức Nam', 'leducnam1805@gmail.com', '202cb962ac59075b964b07152d234b70', '0', 5),
(10, 'huypato', 'Nguyễn Quốc Huy', '202cb962ac59075b964b07152d234b70', '0', 5),
(11, 'Trần Văn Hưng', 'hung', 'd6bb922ba20fd9f14949fbb4b9efc92b', '0', 5),
(12, 'Trần Văn Hưng', 'hung', 'd0a483256bbd970137d8e1157293474f', '0', 5),
(13, 'hung', 'Trần văn Hưng', 'd0a483256bbd970137d8e1157293474f', '0', 5),
(14, 'admin123', 'Trần Văn Thọ', '192023a7bbd73250516f069df18b500', '0', 5),
(15, 'thanhtuyen123', 'Đoàn Trương Thanh Tuyến', '897954bcc79479b252946e311bf3aab2', '0', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cat_perfume`
--
ALTER TABLE `cat_perfume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat_user`
--
ALTER TABLE `cat_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_per` (`id_per`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `per_id` (`per_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `perfumes`
--
ALTER TABLE `perfumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_perfume` (`cat_perfume`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pic_per`
--
ALTER TABLE `pic_per`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pic_per_ibfk_1` (`per_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_user` (`cat_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cat_perfume`
--
ALTER TABLE `cat_perfume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cat_user`
--
ALTER TABLE `cat_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `perfumes`
--
ALTER TABLE `perfumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pic_per`
--
ALTER TABLE `pic_per`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_per`) REFERENCES `perfumes` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `perfumes` (`id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `perfumes`
--
ALTER TABLE `perfumes`
  ADD CONSTRAINT `perfumes_ibfk_1` FOREIGN KEY (`cat_perfume`) REFERENCES `cat_perfume` (`id`);

--
-- Constraints for table `pic_per`
--
ALTER TABLE `pic_per`
  ADD CONSTRAINT `pic_per_ibfk_1` FOREIGN KEY (`per_id`) REFERENCES `perfumes` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`cat_user`) REFERENCES `cat_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
