-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2019 at 08:05 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coreigniter`
--

-- --------------------------------------------------------

--
-- Table structure for table `table_groups`
--

CREATE TABLE `table_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_groups`
--

INSERT INTO `table_groups` (`id`, `name`, `description`, `status`) VALUES
(1, 'admin', 'Administrator', 1),
(2, 'members', 'General User', 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_group_access`
--

CREATE TABLE `table_group_access` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `c` tinyint(1) NOT NULL,
  `r` tinyint(1) NOT NULL,
  `u` tinyint(1) NOT NULL,
  `d` tinyint(1) NOT NULL,
  `s` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_group_access`
--

INSERT INTO `table_group_access` (`id`, `group_id`, `menu_id`, `position`, `c`, `r`, `u`, `d`, `s`) VALUES
(4, 2, 18, 2, 0, 0, 0, 0, 0),
(8, 1, 18, 0, 0, 0, 0, 0, 0),
(9, 1, 19, 0, 0, 0, 0, 0, 0),
(17, 4, 18, 0, 0, 0, 0, 0, 0),
(18, 4, 25, 0, 0, 0, 0, 0, 0),
(19, 4, 26, 0, 0, 0, 0, 0, 0),
(22, 5, 18, 0, 0, 0, 0, 0, 0),
(24, 5, 27, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_log`
--

CREATE TABLE `table_log` (
  `log_id` int(11) NOT NULL,
  `log_action` text NOT NULL,
  `log_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_ipaddress` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_log`
--

INSERT INTO `table_log` (`log_id`, `log_action`, `log_datetime`, `log_ipaddress`, `user_id`) VALUES
(1, 'add data user', '2018-07-13 10:28:10', '::1', 1),
(2, 'update data skpd', '2018-07-13 10:39:14', '::1', 1),
(3, 'add data userprofile', '2018-07-16 03:25:17', '::1', 1),
(4, 'update data userprofile', '2018-07-16 04:11:59', '::1', 1),
(5, 'add data usulan', '2018-07-16 10:41:07', '::1', 1),
(6, 'add data menu', '2018-07-16 17:30:32', '::1', 1),
(7, 'update data menu', '2018-07-16 17:31:37', '::1', 1),
(8, 'add data submenu', '2018-07-16 18:26:16', '::1', 1),
(9, 'add data submenu', '2018-07-16 18:28:16', '::1', 1),
(10, 'add data menu', '2018-07-16 18:33:25', '::1', 1),
(11, 'add data menu', '2018-07-16 18:33:41', '::1', 1),
(12, 'add data menu', '2018-07-16 18:33:54', '::1', 1),
(13, 'add data menu', '2018-07-16 18:34:07', '::1', 1),
(14, 'add data menu', '2018-07-16 18:34:21', '::1', 1),
(15, 'add data menu', '2018-07-16 18:35:37', '::1', 1),
(16, 'add data group', '2018-07-16 18:50:39', '::1', 1),
(17, 'add data groupmenu', '2018-07-16 19:05:13', '::1', 1),
(18, 'add data groupmenu', '2018-07-16 19:14:49', '::1', 1),
(19, 'add data groupmenu', '2018-07-16 19:16:15', '::1', 1),
(20, 'add data groupmenu', '2018-07-16 19:16:20', '::1', 1),
(21, 'add data groupmenu', '2018-07-16 19:16:24', '::1', 1),
(22, 'add data groupmenu', '2018-07-16 19:16:30', '::1', 1),
(23, 'add data groupmenu', '2018-07-16 19:16:34', '::1', 1),
(24, 'add data groupmenu', '2018-07-16 19:16:56', '::1', 1),
(25, 'update data menu', '2018-07-17 04:15:15', '::1', 1),
(26, 'add data submenu', '2018-07-17 04:16:13', '::1', 1),
(27, 'add data group', '2018-07-17 05:25:11', '::1', 1),
(28, 'add data group', '2018-07-17 05:25:31', '::1', 1),
(29, 'add data user', '2018-07-17 05:34:18', '::1', 1),
(30, 'add data user', '2018-07-17 05:35:16', '::1', 1),
(31, 'update data user', '2018-07-17 05:35:25', '::1', 1),
(32, 'add data groupmenu', '2018-07-17 05:39:40', '::1', 1),
(33, 'add data groupmenu', '2018-07-17 05:39:58', '::1', 1),
(34, 'add data menu', '2018-07-17 05:40:36', '::1', 1),
(35, 'add data groupmenu', '2018-07-17 05:41:01', '::1', 1),
(36, 'add data groupmenu', '2018-07-17 05:41:30', '::1', 1),
(37, 'add data groupmenu', '2018-07-17 05:41:35', '::1', 1),
(38, 'add data groupmenu', '2018-07-17 05:41:52', '::1', 1),
(39, 'add data groupmenu', '2018-07-17 05:42:25', '::1', 1),
(40, 'add data groupmenu', '2018-07-17 05:42:30', '::1', 1),
(41, 'add data groupmenu', '2018-07-17 05:42:38', '::1', 1),
(42, 'update data user', '2018-07-17 05:44:16', '::1', 1),
(43, 'update data user', '2018-07-17 07:11:00', '::1', 1),
(44, 'update data user', '2018-07-17 07:11:16', '::1', 1),
(45, 'add data skpd', '2018-07-17 14:03:32', '::1', 1),
(46, 'add data skpd', '2018-07-17 14:03:58', '::1', 1),
(47, 'update data user', '2018-07-17 14:04:35', '::1', 1),
(48, 'add data usulan', '2018-07-17 14:23:15', '::1', 10),
(49, 'add data skpd', '2018-07-17 14:31:28', '::1', 1),
(50, 'add data user', '2018-07-17 14:32:24', '::1', 1),
(51, 'update data periksa', '2018-07-17 15:15:15', '::1', 9),
(52, 'add data menu', '2018-07-17 17:06:04', '::1', 1),
(53, 'add data groupmenu', '2018-07-17 17:06:31', '::1', 1),
(54, 'add data menu', '2018-07-17 17:08:28', '::1', 1),
(55, 'update data menu', '2018-07-17 17:08:44', '::1', 1),
(56, 'add data submenu', '2018-07-17 17:09:05', '::1', 1),
(57, 'add data submenu', '2018-07-17 17:09:44', '::1', 1),
(58, 'add data groupmenu', '2018-07-17 17:11:00', '::1', 1),
(59, 'update data menu', '2018-07-17 17:16:14', '::1', 1),
(60, 'add data submenu', '2018-07-17 17:20:41', '::1', 1),
(61, 'add data menu', '2018-07-17 17:32:54', '::1', 1),
(62, 'add data menu', '2018-07-17 17:33:20', '::1', 1),
(63, 'add data groupmenu', '2018-07-17 17:33:32', '::1', 1),
(64, 'add data groupmenu', '2018-07-17 17:33:39', '::1', 1),
(65, 'add data pengumuman', '2018-07-17 17:34:14', '::1', 1),
(66, 'add data user', '2018-07-17 17:38:07', '::1', 1),
(67, 'add data user', '2018-07-17 17:40:09', '::1', 1),
(68, 'update data periksa', '2018-07-17 18:04:43', '::1', 13),
(69, 'add data usulan', '2018-07-18 10:39:25', '::1', 12),
(70, 'update data skpd', '2018-07-18 11:19:33', '::1', 1),
(71, 'update data skpd', '2018-07-18 11:19:57', '::1', 1),
(72, 'add data skpd', '2018-07-18 11:20:19', '::1', 1),
(73, 'update data skpd', '2018-07-18 11:20:24', '::1', 1),
(74, 'update data skpd', '2018-07-18 11:20:31', '::1', 1),
(75, 'add data skpd', '2018-07-18 11:22:05', '::1', 1),
(76, 'add data skpd', '2018-07-18 11:22:34', '::1', 1),
(77, 'add data user', '2018-07-18 11:24:48', '::1', 1),
(78, 'add data usulan', '2018-07-18 11:54:06', '::1', 12),
(79, 'add data usulan', '2018-07-18 12:18:53', '::1', 12),
(80, 'update data periksa', '2018-07-18 12:20:18', '::1', 13),
(81, 'add data usulan', '2018-07-18 13:11:16', '192.168.1.25', 12),
(82, 'update data periksa', '2018-07-18 13:16:51', '192.168.1.19', 13),
(83, 'add data usulan', '2018-07-18 13:37:43', '::1', 12),
(84, 'add data usulan', '2018-07-18 13:41:25', '192.168.1.22', 12),
(85, 'add data usulan', '2018-07-18 13:56:07', '192.168.1.25', 12),
(86, 'add data usulan', '2018-07-18 14:02:50', '192.168.1.25', 12),
(87, 'add data usulan', '2018-07-18 23:00:20', '::1', 12),
(88, 'add data usulan', '2018-07-18 23:00:38', '::1', 12),
(89, 'add data usulan', '2018-07-18 23:06:40', '::1', 12),
(90, 'add data usulan', '2018-07-18 23:18:19', '::1', 14),
(91, 'add data usulan', '2018-07-18 23:23:37', '::1', 14),
(92, 'add data usulan', '2018-07-18 23:24:25', '::1', 14),
(93, 'add data usulan', '2018-07-18 23:24:57', '::1', 14),
(94, 'add data usulan', '2018-07-18 23:49:16', '::1', 14),
(95, 'add data usulan', '2018-07-19 00:14:44', '::1', 14),
(96, 'add data usulan', '2018-07-19 00:15:48', '::1', 14),
(97, 'update data periksa', '2018-07-19 00:17:15', '::1', 13),
(98, 'update data periksa', '2018-07-19 00:18:07', '::1', 13),
(99, 'add data usulan', '2018-07-19 01:42:30', '192.168.43.103', 12),
(100, 'update data periksa', '2018-07-19 01:44:35', '192.168.43.13', 13),
(101, 'add data skpd', '2018-07-19 02:40:23', '192.168.43.13', 1),
(102, 'add data skpd', '2018-07-19 02:41:21', '192.168.43.13', 1),
(103, 'add data skpd', '2018-07-19 02:41:52', '192.168.43.13', 1),
(104, 'add data skpd', '2018-07-19 02:42:09', '192.168.43.13', 1),
(105, 'add data user', '2018-07-19 02:43:13', '192.168.43.13', 1),
(106, 'add data user', '2018-07-19 02:44:33', '192.168.43.13', 1),
(107, 'add data user', '2018-07-19 02:51:52', '192.168.0.110', 1),
(108, 'add data skpd', '2018-07-19 02:52:09', '192.168.0.110', 1),
(109, 'add data skpd', '2018-07-19 02:52:26', '192.168.0.110', 1),
(110, 'add data user', '2018-07-19 02:52:48', '192.168.0.110', 1),
(111, 'add data user', '2018-07-19 02:53:09', '192.168.0.110', 1),
(112, 'add data usulan', '2018-07-19 02:58:56', '192.168.0.120', 12),
(113, 'add data usulan', '2018-07-19 02:59:52', '192.168.0.110', 12),
(114, 'add data usulan', '2018-07-19 03:00:00', '192.168.0.115', 12),
(115, 'add data usulan', '2018-07-19 03:01:59', '192.168.0.126', 18),
(116, 'update data periksa', '2018-07-19 03:02:45', '192.168.0.110', 13),
(117, 'add data usulan', '2018-07-19 03:05:44', '192.168.0.119', 15),
(118, 'add data usulan', '2018-07-19 03:06:00', '192.168.0.111', 15),
(119, 'update data periksa', '2018-07-19 03:07:49', '192.168.0.110', 13),
(120, 'add data usulan', '2018-07-19 03:08:38', '192.168.0.127', 18),
(121, 'add data usulan', '2018-07-19 03:09:33', '192.168.0.115', 12),
(122, 'add data usulan', '2018-07-19 03:09:38', '192.168.0.116', 16),
(123, 'add data usulan', '2018-07-19 03:10:22', '192.168.0.124', 17),
(124, 'update data usulan', '2018-07-19 03:11:23', '192.168.0.115', 12),
(125, 'update data periksa', '2018-07-19 03:12:04', '192.168.0.110', 13),
(126, 'add data usulan', '2018-07-19 03:12:16', '192.168.0.114', 19),
(127, 'update data periksa', '2018-07-19 03:13:00', '192.168.0.110', 13),
(128, 'update data usulan', '2018-07-19 03:13:31', '192.168.0.127', 18),
(129, 'update data periksa', '2018-07-19 03:14:07', '192.168.0.110', 13),
(130, 'add data usulan', '2018-07-19 03:15:34', '192.168.0.128', 14),
(131, 'update data usulan', '2018-07-19 03:27:42', '192.168.0.110', 16),
(132, 'update data periksa', '2018-07-19 03:29:57', '192.168.0.110', 13),
(133, 'add data userprofile', '2018-07-19 03:41:58', '192.168.0.119', 15),
(134, 'add data userprofile', '2018-07-19 03:44:20', '192.168.0.119', 15),
(135, 'add data menu', '2018-10-10 18:31:53', '::1', 1),
(136, 'add data menu', '2018-11-12 07:51:08', '::1', 1),
(137, 'update data menu', '2018-11-13 03:07:31', '::1', 1),
(138, 'update data menu', '2018-11-13 04:49:46', '::1', 1),
(139, 'update data menu', '2018-11-13 04:50:01', '::1', 1),
(140, 'update data menu', '2018-11-13 04:50:48', '::1', 1),
(141, 'add data menu', '2018-11-14 02:06:36', '::1', 1),
(142, 'update data menu', '2018-11-14 02:06:52', '::1', 1),
(143, 'add data menu', '2018-11-14 03:23:21', '::1', 1),
(144, 'update data menu', '2018-11-14 03:29:51', '::1', 1),
(145, 'update data menu', '2018-11-14 03:30:12', '::1', 1),
(146, 'update data menu', '2018-11-14 03:33:48', '::1', 1),
(147, 'add data menu', '2018-11-14 06:34:49', '::1', 1),
(148, 'add data menu', '2018-11-15 03:13:50', '::1', 1),
(149, 'update data menu', '2018-11-15 03:14:19', '::1', 1),
(150, 'update data menu', '2018-11-15 03:14:59', '::1', 1),
(151, 'add data crud', '2018-11-15 03:43:27', '::1', 1),
(152, 'add data crud', '2018-11-15 03:55:51', '::1', 1),
(153, 'update data crud', '2018-11-15 04:01:42', '::1', 1),
(154, 'update data crud', '2018-11-15 04:17:29', '::1', 1),
(155, 'update data crud', '2018-11-15 04:17:41', '::1', 1),
(156, 'update data crud', '2018-11-15 04:17:47', '::1', 1),
(157, 'add data crud', '2018-11-15 04:21:11', '::1', 1),
(158, 'add data crud', '2018-11-15 04:22:08', '::1', 1),
(159, 'add data crudfield', '2018-11-15 04:46:49', '::1', 1),
(160, 'add data crud', '2018-11-19 04:15:20', '::1', 1),
(161, 'add data crud', '2018-11-19 04:16:56', '::1', 1),
(162, 'add data crud', '2018-11-19 04:18:20', '::1', 1),
(163, 'add data crud', '2018-11-19 04:18:44', '::1', 1),
(164, 'add data crud', '2018-11-19 04:19:19', '::1', 1),
(165, 'add data crud', '2018-11-19 04:22:37', '::1', 1),
(166, 'add data crud', '2018-11-19 04:24:19', '::1', 1),
(167, 'update data crudfield', '2018-11-19 07:20:09', '::1', 1),
(168, 'add data crud', '2018-11-19 07:24:35', '::1', 1),
(169, 'add data crudfield', '2018-11-19 07:43:22', '::1', 1),
(170, 'add data crud', '2018-11-19 07:44:06', '::1', 1),
(171, 'add data crud', '2018-11-19 07:52:43', '::1', 1),
(172, 'update data crudfield', '2018-11-21 04:32:16', '::1', 1),
(173, 'update data crudfield', '2018-11-21 04:34:46', '::1', 1),
(174, 'update data crudfield', '2018-11-21 04:53:47', '::1', 1),
(175, 'update data crudfield', '2018-11-21 04:54:47', '::1', 1),
(176, 'update data crudfield', '2018-11-21 04:56:02', '::1', 1),
(177, 'add data crud', '2018-11-21 04:56:45', '::1', 1),
(178, 'update data crud', '2018-11-21 04:56:54', '::1', 1),
(179, 'update data crud', '2018-11-21 04:57:10', '::1', 1),
(180, 'update data crud', '2018-11-21 04:57:16', '::1', 1),
(181, 'add data crud', '2018-11-21 04:57:46', '::1', 1),
(182, 'update data crud', '2018-11-21 04:58:57', '::1', 1),
(183, 'update data crud', '2018-11-21 04:59:34', '::1', 1),
(184, 'add data crud', '2018-11-21 05:03:36', '::1', 1),
(185, 'update data crud', '2018-11-21 05:05:01', '::1', 1),
(186, 'update data crud', '2018-11-21 05:05:54', '::1', 1),
(187, 'update data crud', '2018-11-21 05:06:08', '::1', 1),
(188, 'add data menu', '2018-11-21 05:26:46', '::1', 1),
(189, 'update data menu', '2018-11-21 05:33:10', '::1', 1),
(190, 'add data menu', '2018-11-22 02:33:28', '::1', 1),
(191, 'add data menu', '2018-11-22 07:35:10', '::1', 1),
(192, 'update data menu', '2018-11-22 07:35:19', '::1', 1),
(193, 'add data menu', '2018-11-22 08:36:53', '::1', 1),
(194, 'update data menu', '2018-11-22 09:12:26', '::1', 1),
(195, 'add data menu', '2018-11-22 09:19:49', '::1', 1),
(196, 'add data menu', '2018-11-22 09:20:16', '::1', 1),
(197, 'add data crud', '2018-11-23 05:52:03', '::1', 1),
(198, 'add data crud', '2018-11-26 03:26:05', '::1', 1),
(199, 'add data crudfield', '2018-11-26 03:27:06', '::1', 1),
(200, 'add data crudfield', '2018-11-26 03:39:18', '::1', 1),
(201, 'add data crudfield', '2018-11-26 03:45:28', '::1', 1),
(202, 'update data crud', '2018-11-26 03:54:50', '::1', 1),
(203, 'add data crudfield', '2018-11-26 05:22:27', '::1', 1),
(204, 'update data crudfield', '2018-11-26 05:22:38', '::1', 1),
(205, 'add data menu', '2018-11-26 05:36:14', '::1', 1),
(206, 'update data menu', '2018-11-26 06:32:59', '::1', 1),
(207, 'update data menu', '2018-11-26 06:33:21', '::1', 1),
(208, 'update data menu', '2018-11-26 06:33:35', '::1', 1),
(209, 'update data menu', '2018-11-26 06:39:07', '::1', 1),
(210, 'update data crud', '2018-11-27 04:42:15', '::1', 1),
(211, 'update data crud', '2018-11-27 04:42:23', '::1', 1),
(212, 'update data crud', '2018-11-27 04:43:19', '::1', 1),
(213, 'update data crud', '2018-11-27 04:56:24', '::1', 1),
(214, 'update data crud', '2018-11-27 05:12:10', '::1', 1),
(215, 'update data crud', '2018-11-27 05:12:57', '::1', 1),
(216, 'update data crud', '2018-11-27 05:48:49', '::1', 1),
(217, 'update data crud', '2018-11-27 05:49:06', '::1', 1),
(218, 'add data menu', '2018-11-27 06:20:58', '::1', 1),
(219, 'update data menu', '2018-11-27 06:21:05', '::1', 1),
(220, 'update data menu', '2018-11-27 06:24:11', '::1', 1),
(221, 'update data menu', '2018-11-27 06:29:58', '::1', 1),
(222, 'update data menu', '2018-11-27 06:31:33', '::1', 1),
(223, 'add data menu', '2018-11-27 08:21:54', '::1', 1),
(224, 'update data menu', '2018-11-27 08:23:27', '::1', 1),
(225, 'add data menu', '2018-11-27 08:25:47', '::1', 1),
(226, 'add data crudfield', '2018-11-27 08:26:45', '::1', 1),
(227, 'update data crudfield', '2018-11-27 08:26:51', '::1', 1),
(228, 'update data crudfield', '2018-11-27 08:30:20', '::1', 1),
(229, 'add data user', '2018-11-30 03:52:01', '::1', 1),
(230, 'update data user', '2018-11-30 03:54:39', '::1', 1),
(231, 'add data crud', '2018-11-30 04:20:05', '::1', 1),
(232, 'add data group', '2018-11-30 04:32:43', '::1', 1),
(233, 'update data group', '2018-11-30 04:33:32', '::1', 1),
(234, 'update data group', '2018-11-30 04:33:45', '::1', 1),
(235, 'update data group', '2018-11-30 08:03:05', '::1', 1),
(236, 'add data group', '2018-11-30 08:04:23', '::1', 1),
(237, 'add data crud', '2018-11-30 08:11:23', '::1', 1),
(238, 'add data group', '2018-11-30 10:10:06', '::1', 1),
(239, 'add data menu', '2018-11-30 10:10:19', '::1', 1),
(240, 'update data user', '2018-12-01 00:39:57', '::1', 1),
(241, 'add data user', '2018-12-01 00:46:52', '::1', 1),
(242, 'update data user', '2018-12-01 00:57:38', '::1', 1),
(243, 'update data user', '2018-12-01 00:57:51', '::1', 1),
(244, 'add data user', '2018-12-01 01:05:47', '::1', 1),
(245, 'add data group', '2018-12-01 06:14:49', '::1', 1),
(246, 'add data menu', '2018-12-01 06:15:05', '::1', 1),
(247, 'add data crud', '2018-12-02 07:23:33', '::1', 1),
(248, 'add data userprofile', '2018-12-03 06:34:28', '::1', 1),
(249, 'add data menu', '2018-12-03 06:44:05', '::1', 1),
(250, 'add data menu', '2018-12-03 06:44:31', '::1', 1),
(251, 'update data menu', '2018-12-04 04:23:45', '::1', 1),
(252, 'update password user', '2018-12-05 03:36:43', '::1', 1),
(253, 'add data user', '2019-01-02 12:43:06', '::1', 1),
(254, 'update data user', '2019-01-02 12:52:56', '::1', 1),
(255, 'update password user', '2019-01-02 13:19:35', '::1', 1),
(256, 'add data group', '2019-01-02 13:36:34', '::1', 1),
(257, 'update data group', '2019-01-02 13:45:16', '::1', 1),
(258, 'update data menu', '2019-01-03 03:36:43', '::1', 1),
(259, 'update data menu', '2019-01-03 03:37:02', '::1', 1),
(260, 'update data group', '2019-01-03 03:38:05', '::1', 1),
(261, 'update data menu', '2019-01-03 03:39:21', '::1', 1),
(262, 'add data menu', '2019-01-03 03:48:04', '::1', 1),
(263, 'update data menu', '2019-01-03 03:48:17', '::1', 1),
(264, 'update data menu', '2019-01-03 03:56:12', '::1', 1),
(265, 'update data menu', '2019-01-03 03:59:32', '::1', 1),
(266, 'update data menu', '2019-01-03 03:59:40', '::1', 1),
(267, 'add data crud', '2019-01-03 04:14:42', '::1', 1),
(268, 'add data menugroup', '2019-01-03 04:19:18', '::1', 1),
(269, 'update data menugroup', '2019-01-03 04:19:36', '::1', 1),
(270, 'add data menugroup', '2019-01-03 04:19:51', '::1', 1),
(271, 'add data crud', '2019-01-03 04:59:03', '::1', 1),
(272, 'add data group', '2019-01-07 02:14:27', '::1', 1),
(273, 'add data group', '2019-01-07 02:15:01', '::1', 1),
(274, 'add data group', '2019-01-07 03:40:22', '::1', 1),
(275, 'update data group', '2019-01-07 04:18:20', '::1', 1),
(276, 'update data group', '2019-01-07 04:24:02', '::1', 1),
(277, 'update data group', '2019-01-07 04:25:40', '::1', 1),
(278, 'update data group', '2019-01-07 04:30:22', '::1', 1),
(279, 'update data group', '2019-01-07 04:32:30', '::1', 1),
(280, 'update data group', '2019-01-07 04:33:34', '::1', 1),
(281, 'add data group', '2019-01-07 04:48:54', '::1', 1),
(282, 'add data menu', '2019-01-07 05:06:43', '::1', 1),
(283, 'add data menu', '2019-01-07 05:09:46', '::1', 1),
(284, 'add data group', '2019-01-07 05:23:13', '::1', 1),
(285, 'add data group', '2019-01-07 05:23:21', '::1', 1),
(286, 'update data group', '2019-01-07 10:05:27', '::1', 1),
(287, 'update data group', '2019-01-07 10:06:53', '::1', 1),
(288, 'update data group', '2019-01-07 10:09:02', '::1', 1),
(289, 'update data group', '2019-01-07 10:09:15', '::1', 1),
(290, 'update data group', '2019-01-07 10:09:30', '::1', 1),
(291, 'update data group', '2019-01-07 10:09:30', '::1', 1),
(292, 'update data group', '2019-01-07 10:40:03', '::1', 1),
(293, 'update data group', '2019-01-07 10:40:43', '::1', 1),
(294, 'add data group', '2019-01-07 10:41:26', '::1', 1),
(295, 'update data group', '2019-01-07 11:03:44', '::1', 1),
(296, 'update data group', '2019-01-07 11:11:01', '::1', 1),
(297, 'update data group', '2019-01-07 11:19:13', '::1', 1),
(298, 'update data group', '2019-01-07 11:19:22', '::1', 1),
(299, 'update data group', '2019-01-07 11:19:22', '::1', 1),
(300, 'update data group', '2019-01-07 11:19:32', '::1', 1),
(301, 'update data group', '2019-01-07 11:20:06', '::1', 1),
(302, 'update data group', '2019-01-07 11:20:18', '::1', 1),
(303, 'update data group', '2019-01-07 11:23:08', '::1', 1),
(304, 'update data group', '2019-01-07 11:23:23', '::1', 1),
(305, 'update data group', '2019-01-07 11:23:35', '::1', 1),
(306, 'update data group', '2019-01-07 11:23:43', '::1', 1),
(307, 'add data group', '2019-01-07 11:39:30', '::1', 1),
(308, 'update data group', '2019-01-07 11:39:39', '::1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_login_attempts`
--

CREATE TABLE `table_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table_menus`
--

CREATE TABLE `table_menus` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `attribute` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_menus`
--

INSERT INTO `table_menus` (`id`, `parent_id`, `name`, `link`, `icon`, `status`, `attribute`, `description`) VALUES
(18, 0, 'Dashboard', 'admin', 'home', 1, 'fa fa-home', 'Halaman Utama'),
(19, 0, 'Setting', 'setting', 'settings', 1, 'fa fa-cog', 'Menu pengaturan'),
(30, 19, 'User', 'setting/user', 'person', 1, '-', '-'),
(31, 19, 'Menu', 'setting/menu', 'list', 1, '-', '-'),
(32, 19, 'Grup User', 'setting/group', 'people', 1, '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `table_profile`
--

CREATE TABLE `table_profile` (
  `profile_id` int(11) NOT NULL,
  `profile_title` varchar(200) NOT NULL,
  `profile_content` text NOT NULL,
  `profile_postdate` date NOT NULL,
  `profile_postime` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_profile`
--

INSERT INTO `table_profile` (`profile_id`, `profile_title`, `profile_content`, `profile_postdate`, `profile_postime`, `user_id`) VALUES
(5, 'Visi & Misi', 'Konten Visi dan Misi', '2018-07-16', '0000-00-00 00:00:00', 1),
(6, 'Dasar Hukum', 'Isi Dasar Hukum 1', '2018-07-17', '0000-00-00 00:00:00', 1),
(7, 'Struktur Organisasi', 'Daftar Struktur Organisasi', '2018-07-17', '0000-00-00 00:00:00', 1),
(8, 'Tugas & Fungsi', 'Is Tugas dan Fungsi', '2018-07-17', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_userprofiles`
--

CREATE TABLE `table_userprofiles` (
  `id` int(11) NOT NULL,
  `surename` varchar(200) NOT NULL,
  `birthplace` varchar(200) NOT NULL,
  `sex` enum('Pria','Wanita','','') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_users`
--

CREATE TABLE `table_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` text NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_users`
--

INSERT INTO `table_users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `phone`, `image`, `group_id`) VALUES
(3, '::1', 'admin_test@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'admin_test@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1557662043, 1572848978, 1, 'admin', 'admin', '08233174456', '', 1),
(5, '', 'contributor@kabas.com', '21232f297a57a5a743894a0e4a801fc3', 'contributor@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1572849264, 1, 'Admin', 'Kontributor', NULL, '', 4),
(6, '', 'verificator@kabas.com', '21232f297a57a5a743894a0e4a801fc3', 'verificator@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 'admin', 'admin', NULL, '', 5),
(11, '', 'tifani@kabas.com', 'fd185573b961b03fb8925f58f367d50d', 'tifani@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 'Tifani', 'Hamlin', NULL, '', 4),
(12, '', 'muthia@kabas.com', 'ab250ab2e876197de1c2c98fd18873a9', 'muthia@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 'Muthia', 'Mutmainnah', NULL, '', 4),
(15, '', 'username', 'pass', 'email', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist', 'last', 'phoe', '', 2),
(17, '', 'username1', 'pass1', 'email1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist1', 'last1', 'phoe1', '', 1),
(18, '', 'username2', 'pass2', 'email2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist2', 'last2', 'phoe2', '', 4),
(19, '', 'username3', 'pass3', 'email3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist3', 'last3', 'phoe3', '', 4),
(20, '', 'username4', 'pass4', 'email4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist4', 'last4', 'phoe4', '', 4),
(21, '', 'username5', 'pass5', 'email5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist5', 'last5', 'phoe5', '', 4),
(22, '', 'username6', 'pass6', 'email6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist6', 'last6', 'phoe6', '', 4),
(23, '', 'username7', 'pass7', 'email7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist7', 'last7', 'phoe7', '', 4),
(24, '', 'username8', 'pass8', 'email8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist8', 'last8', 'phoe8', '', 4),
(25, '', 'username9', 'pass9', 'email9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist9', 'last9', 'phoe9', '', 4),
(26, '', 'username10', 'pass10', 'email10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist10', 'last10', 'phoe10', '', 1),
(27, '', 'username11', 'pass11', 'email11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist11', 'last11', 'phoe11', '', 1),
(28, '', 'username12', 'pass12', 'email12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist12', 'last12', 'phoe12', '', 3),
(29, '', 'username13', 'pass13', 'email13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist13', 'last13', 'phoe13', '', 1),
(30, '', 'username14', 'pass14', 'email14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist14', 'last14', 'phoe14', '', 2),
(31, '', 'username15', 'pass15', 'email15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist15', 'last15', 'phoe15', '', 1),
(32, '', 'username16', 'pass16', 'email16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist16', 'last16', 'phoe16', '', 1),
(33, '', 'username17', 'pass17', 'email17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist17', 'last17', 'phoe17', '', 4),
(34, '', 'username18', 'pass18', 'email18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist18', 'last18', 'phoe18', '', 2),
(35, '', 'username19', 'pass19', 'email19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist19', 'last19', 'phoe19', '', 4),
(36, '', 'username20', 'pass20', 'email20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist20', 'last20', 'phoe20', '', 3),
(37, '', 'username21', 'pass21', 'email21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist21', 'last21', 'phoe21', '', 3),
(38, '', 'username22', 'pass22', 'email22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist22', 'last22', 'phoe22', '', 2),
(39, '', 'username23', 'pass23', 'email23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist23', 'last23', 'phoe23', '', 2),
(40, '', 'username24', 'pass24', 'email24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist24', 'last24', 'phoe24', '', 1),
(41, '', 'username25', 'pass25', 'email25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist25', 'last25', 'phoe25', '', 3),
(42, '', 'username26', 'pass26', 'email26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist26', 'last26', 'phoe26', '', 3),
(43, '', 'username27', 'pass27', 'email27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist27', 'last27', 'phoe27', '', 2),
(44, '', 'username28', 'pass28', 'email28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist28', 'last28', 'phoe28', '', 1),
(45, '', 'username29', 'pass29', 'email29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist29', 'last29', 'phoe29', '', 1),
(46, '', 'username30', 'pass30', 'email30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist30', 'last30', 'phoe30', '', 2),
(47, '', 'username31', 'pass31', 'email31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist31', 'last31', 'phoe31', '', 3),
(48, '', 'username32', 'pass32', 'email32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist32', 'last32', 'phoe32', '', 1),
(49, '', 'username33', 'pass33', 'email33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist33', 'last33', 'phoe33', '', 3),
(50, '', 'username34', 'pass34', 'email34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist34', 'last34', 'phoe34', '', 2),
(51, '', 'username35', 'pass35', 'email35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist35', 'last35', 'phoe35', '', 4),
(52, '', 'username36', 'pass36', 'email36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist36', 'last36', 'phoe36', '', 4),
(53, '', 'username37', 'pass37', 'email37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist37', 'last37', 'phoe37', '', 3),
(54, '', 'username38', 'pass38', 'email38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist38', 'last38', 'phoe38', '', 3),
(55, '', 'username39', 'pass39', 'email39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist39', 'last39', 'phoe39', '', 2),
(56, '', 'username40', 'pass40', 'email40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist40', 'last40', 'phoe40', '', 3),
(57, '', 'username41', 'pass41', 'email41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist41', 'last41', 'phoe41', '', 3),
(58, '', 'username42', 'pass42', 'email42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist42', 'last42', 'phoe42', '', 2),
(59, '', 'username43', 'pass43', 'email43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist43', 'last43', 'phoe43', '', 1),
(60, '', 'username44', 'pass44', 'email44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist44', 'last44', 'phoe44', '', 3),
(61, '', 'username45', 'pass45', 'email45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist45', 'last45', 'phoe45', '', 1),
(62, '', 'username46', 'pass46', 'email46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist46', 'last46', 'phoe46', '', 1),
(63, '', 'username47', 'pass47', 'email47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist47', 'last47', 'phoe47', '', 1),
(64, '', 'username48', 'pass48', 'email48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist48', 'last48', 'phoe48', '', 4),
(65, '', 'username49', 'pass49', 'email49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist49', 'last49', 'phoe49', '', 2),
(66, '', 'username50', 'pass50', 'email50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist50', 'last50', 'phoe50', '', 1),
(67, '', 'username51', 'pass51', 'email51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist51', 'last51', 'phoe51', '', 4),
(68, '', 'username52', 'pass52', 'email52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist52', 'last52', 'phoe52', '', 4),
(69, '', 'username53', 'pass53', 'email53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist53', 'last53', 'phoe53', '', 3),
(70, '', 'username54', 'pass54', 'email54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist54', 'last54', 'phoe54', '', 2),
(71, '', 'username55', 'pass55', 'email55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist55', 'last55', 'phoe55', '', 2),
(72, '', 'username56', 'pass56', 'email56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist56', 'last56', 'phoe56', '', 1),
(73, '', 'username57', 'pass57', 'email57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist57', 'last57', 'phoe57', '', 4),
(74, '', 'username58', 'pass58', 'email58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist58', 'last58', 'phoe58', '', 4),
(75, '', 'username59', 'pass59', 'email59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist59', 'last59', 'phoe59', '', 2),
(76, '', 'username60', 'pass60', 'email60', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist60', 'last60', 'phoe60', '', 2),
(77, '', 'username61', 'pass61', 'email61', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist61', 'last61', 'phoe61', '', 1),
(78, '', 'username62', 'pass62', 'email62', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist62', 'last62', 'phoe62', '', 3),
(79, '', 'username63', 'pass63', 'email63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist63', 'last63', 'phoe63', '', 4),
(80, '', 'username64', 'pass64', 'email64', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist64', 'last64', 'phoe64', '', 1),
(81, '', 'username65', 'pass65', 'email65', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist65', 'last65', 'phoe65', '', 1),
(82, '', 'username66', 'pass66', 'email66', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist66', 'last66', 'phoe66', '', 3),
(83, '', 'username67', 'pass67', 'email67', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist67', 'last67', 'phoe67', '', 2),
(84, '', 'username68', 'pass68', 'email68', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist68', 'last68', 'phoe68', '', 4),
(85, '', 'username69', 'pass69', 'email69', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist69', 'last69', 'phoe69', '', 2),
(86, '', 'username70', 'pass70', 'email70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist70', 'last70', 'phoe70', '', 3),
(87, '', 'username71', 'pass71', 'email71', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist71', 'last71', 'phoe71', '', 2),
(88, '', 'username72', 'pass72', 'email72', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist72', 'last72', 'phoe72', '', 1),
(89, '', 'username73', 'pass73', 'email73', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist73', 'last73', 'phoe73', '', 1),
(90, '', 'username74', 'pass74', 'email74', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist74', 'last74', 'phoe74', '', 2),
(91, '', 'username75', 'pass75', 'email75', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist75', 'last75', 'phoe75', '', 3),
(92, '', 'username76', 'pass76', 'email76', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist76', 'last76', 'phoe76', '', 3),
(93, '', 'username77', 'pass77', 'email77', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist77', 'last77', 'phoe77', '', 2),
(94, '', 'username78', 'pass78', 'email78', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist78', 'last78', 'phoe78', '', 3),
(95, '', 'username79', 'pass79', 'email79', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist79', 'last79', 'phoe79', '', 2),
(96, '', 'username80', 'pass80', 'email80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist80', 'last80', 'phoe80', '', 4),
(97, '', 'username81', 'pass81', 'email81', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist81', 'last81', 'phoe81', '', 3),
(98, '', 'username82', 'pass82', 'email82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist82', 'last82', 'phoe82', '', 3),
(99, '', 'username83', 'pass83', 'email83', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist83', 'last83', 'phoe83', '', 2),
(100, '', 'username84', 'pass84', 'email84', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist84', 'last84', 'phoe84', '', 4),
(101, '', 'username85', 'pass85', 'email85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist85', 'last85', 'phoe85', '', 3),
(102, '', 'username86', 'pass86', 'email86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist86', 'last86', 'phoe86', '', 3),
(103, '', 'username87', 'pass87', 'email87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist87', 'last87', 'phoe87', '', 3),
(104, '', 'username88', 'pass88', 'email88', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist88', 'last88', 'phoe88', '', 2),
(105, '', 'username89', 'pass89', 'email89', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist89', 'last89', 'phoe89', '', 4),
(106, '', 'username90', 'pass90', 'email90', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist90', 'last90', 'phoe90', '', 1),
(107, '', 'username91', 'pass91', 'email91', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist91', 'last91', 'phoe91', '', 4),
(108, '', 'username92', 'pass92', 'email92', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist92', 'last92', 'phoe92', '', 1),
(109, '', 'username93', 'pass93', 'email93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist93', 'last93', 'phoe93', '', 4),
(110, '', 'username94', 'pass94', 'email94', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist94', 'last94', 'phoe94', '', 2),
(111, '', 'username95', 'pass95', 'email95', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist95', 'last95', 'phoe95', '', 2),
(112, '', 'username96', 'pass96', 'email96', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist96', 'last96', 'phoe96', '', 2),
(113, '', 'username97', 'pass97', 'email97', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist97', 'last97', 'phoe97', '', 3),
(114, '', 'username98', 'pass98', 'email98', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist98', 'last98', 'phoe98', '', 4),
(115, '', 'username99', 'pass99', 'email99', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist99', 'last99', 'phoe99', '', 2),
(116, '', 'username100', 'pass100', 'email100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist100', 'last100', 'phoe100', '', 3),
(117, '', 'username101', 'pass101', 'email101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist101', 'last101', 'phoe101', '', 4),
(118, '', 'username102', 'pass102', 'email102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist102', 'last102', 'phoe102', '', 1),
(119, '', 'username103', 'pass103', 'email103', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist103', 'last103', 'phoe103', '', 1),
(120, '', 'username104', 'pass104', 'email104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist104', 'last104', 'phoe104', '', 3),
(121, '', 'username105', 'pass105', 'email105', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist105', 'last105', 'phoe105', '', 1),
(122, '', 'username106', 'pass106', 'email106', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist106', 'last106', 'phoe106', '', 3),
(123, '', 'username107', 'pass107', 'email107', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist107', 'last107', 'phoe107', '', 1),
(124, '', 'username108', 'pass108', 'email108', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist108', 'last108', 'phoe108', '', 4),
(125, '', 'username109', 'pass109', 'email109', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist109', 'last109', 'phoe109', '', 2),
(126, '', 'username110', 'pass110', 'email110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist110', 'last110', 'phoe110', '', 1),
(127, '', 'username111', 'pass111', 'email111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist111', 'last111', 'phoe111', '', 2),
(128, '', 'username112', 'pass112', 'email112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist112', 'last112', 'phoe112', '', 4),
(129, '', 'username113', 'pass113', 'email113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist113', 'last113', 'phoe113', '', 3),
(130, '', 'username114', 'pass114', 'email114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist114', 'last114', 'phoe114', '', 1),
(131, '', 'username115', 'pass115', 'email115', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist115', 'last115', 'phoe115', '', 3),
(132, '', 'username116', 'pass116', 'email116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist116', 'last116', 'phoe116', '', 1),
(133, '', 'username117', 'pass117', 'email117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist117', 'last117', 'phoe117', '', 3),
(134, '', 'username118', 'pass118', 'email118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist118', 'last118', 'phoe118', '', 2),
(135, '', 'username119', 'pass119', 'email119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist119', 'last119', 'phoe119', '', 4),
(136, '', 'username120', 'pass120', 'email120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist120', 'last120', 'phoe120', '', 2),
(137, '', 'username121', 'pass121', 'email121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist121', 'last121', 'phoe121', '', 1),
(138, '', 'username122', 'pass122', 'email122', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist122', 'last122', 'phoe122', '', 4),
(139, '', 'username123', 'pass123', 'email123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist123', 'last123', 'phoe123', '', 4),
(140, '', 'username124', 'pass124', 'email124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist124', 'last124', 'phoe124', '', 1),
(141, '', 'username125', 'pass125', 'email125', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist125', 'last125', 'phoe125', '', 3),
(142, '', 'username126', 'pass126', 'email126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist126', 'last126', 'phoe126', '', 4),
(143, '', 'username127', 'pass127', 'email127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist127', 'last127', 'phoe127', '', 4),
(144, '', 'username128', 'pass128', 'email128', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist128', 'last128', 'phoe128', '', 3),
(145, '', 'username129', 'pass129', 'email129', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist129', 'last129', 'phoe129', '', 1),
(146, '', 'username130', 'pass130', 'email130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist130', 'last130', 'phoe130', '', 1),
(147, '', 'username131', 'pass131', 'email131', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist131', 'last131', 'phoe131', '', 1),
(148, '', 'username132', 'pass132', 'email132', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist132', 'last132', 'phoe132', '', 1),
(149, '', 'username133', 'pass133', 'email133', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist133', 'last133', 'phoe133', '', 3),
(150, '', 'username134', 'pass134', 'email134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist134', 'last134', 'phoe134', '', 4),
(151, '', 'username135', 'pass135', 'email135', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist135', 'last135', 'phoe135', '', 4),
(152, '', 'username136', 'pass136', 'email136', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist136', 'last136', 'phoe136', '', 3),
(153, '', 'username137', 'pass137', 'email137', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist137', 'last137', 'phoe137', '', 1),
(154, '', 'username138', 'pass138', 'email138', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist138', 'last138', 'phoe138', '', 4),
(155, '', 'username139', 'pass139', 'email139', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist139', 'last139', 'phoe139', '', 3),
(156, '', 'username140', 'pass140', 'email140', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist140', 'last140', 'phoe140', '', 3),
(157, '', 'username141', 'pass141', 'email141', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist141', 'last141', 'phoe141', '', 2),
(158, '', 'username142', 'pass142', 'email142', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist142', 'last142', 'phoe142', '', 1),
(159, '', 'username143', 'pass143', 'email143', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist143', 'last143', 'phoe143', '', 1),
(160, '', 'username144', 'pass144', 'email144', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist144', 'last144', 'phoe144', '', 4),
(161, '', 'username145', 'pass145', 'email145', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist145', 'last145', 'phoe145', '', 4),
(162, '', 'username146', 'pass146', 'email146', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist146', 'last146', 'phoe146', '', 4),
(163, '', 'username147', 'pass147', 'email147', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist147', 'last147', 'phoe147', '', 3),
(164, '', 'username148', 'pass148', 'email148', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist148', 'last148', 'phoe148', '', 2),
(165, '', 'username149', 'pass149', 'email149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist149', 'last149', 'phoe149', '', 2),
(166, '', 'username150', 'pass150', 'email150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist150', 'last150', 'phoe150', '', 3),
(167, '', 'username151', 'pass151', 'email151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist151', 'last151', 'phoe151', '', 4),
(168, '', 'username152', 'pass152', 'email152', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist152', 'last152', 'phoe152', '', 4),
(169, '', 'username153', 'pass153', 'email153', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist153', 'last153', 'phoe153', '', 3),
(170, '', 'username154', 'pass154', 'email154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist154', 'last154', 'phoe154', '', 2),
(171, '', 'username155', 'pass155', 'email155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist155', 'last155', 'phoe155', '', 3),
(172, '', 'username156', 'pass156', 'email156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist156', 'last156', 'phoe156', '', 3),
(173, '', 'username157', 'pass157', 'email157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist157', 'last157', 'phoe157', '', 4),
(174, '', 'username158', 'pass158', 'email158', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist158', 'last158', 'phoe158', '', 1),
(175, '', 'username159', 'pass159', 'email159', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist159', 'last159', 'phoe159', '', 4),
(176, '', 'username160', 'pass160', 'email160', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist160', 'last160', 'phoe160', '', 3),
(177, '', 'username161', 'pass161', 'email161', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist161', 'last161', 'phoe161', '', 2),
(178, '', 'username162', 'pass162', 'email162', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist162', 'last162', 'phoe162', '', 3),
(179, '', 'username163', 'pass163', 'email163', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist163', 'last163', 'phoe163', '', 2),
(180, '', 'username164', 'pass164', 'email164', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist164', 'last164', 'phoe164', '', 4),
(181, '', 'username165', 'pass165', 'email165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist165', 'last165', 'phoe165', '', 1),
(182, '', 'username166', 'pass166', 'email166', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist166', 'last166', 'phoe166', '', 4),
(183, '', 'username167', 'pass167', 'email167', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist167', 'last167', 'phoe167', '', 4),
(184, '', 'username168', 'pass168', 'email168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist168', 'last168', 'phoe168', '', 1),
(185, '', 'username169', 'pass169', 'email169', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist169', 'last169', 'phoe169', '', 2),
(186, '', 'username170', 'pass170', 'email170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist170', 'last170', 'phoe170', '', 2),
(187, '', 'username171', 'pass171', 'email171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist171', 'last171', 'phoe171', '', 3),
(188, '', 'username172', 'pass172', 'email172', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist172', 'last172', 'phoe172', '', 1),
(189, '', 'username173', 'pass173', 'email173', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist173', 'last173', 'phoe173', '', 3),
(190, '', 'username174', 'pass174', 'email174', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist174', 'last174', 'phoe174', '', 4),
(191, '', 'username175', 'pass175', 'email175', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist175', 'last175', 'phoe175', '', 4),
(192, '', 'username176', 'pass176', 'email176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist176', 'last176', 'phoe176', '', 4),
(193, '', 'username177', 'pass177', 'email177', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist177', 'last177', 'phoe177', '', 4),
(194, '', 'username178', 'pass178', 'email178', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist178', 'last178', 'phoe178', '', 1),
(195, '', 'username179', 'pass179', 'email179', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist179', 'last179', 'phoe179', '', 1),
(196, '', 'username180', 'pass180', 'email180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist180', 'last180', 'phoe180', '', 3),
(197, '', 'username181', 'pass181', 'email181', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist181', 'last181', 'phoe181', '', 1),
(198, '', 'username182', 'pass182', 'email182', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist182', 'last182', 'phoe182', '', 3),
(199, '', 'username183', 'pass183', 'email183', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist183', 'last183', 'phoe183', '', 2),
(200, '', 'username184', 'pass184', 'email184', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist184', 'last184', 'phoe184', '', 3),
(201, '', 'username185', 'pass185', 'email185', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist185', 'last185', 'phoe185', '', 2),
(202, '', 'username186', 'pass186', 'email186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist186', 'last186', 'phoe186', '', 2),
(203, '', 'username187', 'pass187', 'email187', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist187', 'last187', 'phoe187', '', 4),
(204, '', 'username188', 'pass188', 'email188', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist188', 'last188', 'phoe188', '', 2),
(205, '', 'username189', 'pass189', 'email189', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist189', 'last189', 'phoe189', '', 1),
(206, '', 'username190', 'pass190', 'email190', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist190', 'last190', 'phoe190', '', 4),
(207, '', 'username191', 'pass191', 'email191', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist191', 'last191', 'phoe191', '', 3),
(208, '', 'username192', 'pass192', 'email192', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist192', 'last192', 'phoe192', '', 2),
(209, '', 'username193', 'pass193', 'email193', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist193', 'last193', 'phoe193', '', 3),
(210, '', 'username194', 'pass194', 'email194', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist194', 'last194', 'phoe194', '', 4),
(211, '', 'username195', 'pass195', 'email195', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist195', 'last195', 'phoe195', '', 1),
(212, '', 'username196', 'pass196', 'email196', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist196', 'last196', 'phoe196', '', 1),
(213, '', 'username197', 'pass197', 'email197', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist197', 'last197', 'phoe197', '', 4),
(214, '', 'username198', 'pass198', 'email198', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist198', 'last198', 'phoe198', '', 4),
(215, '', 'username199', 'pass199', 'email199', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist199', 'last199', 'phoe199', '', 3),
(216, '', 'username200', 'pass200', 'email200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist200', 'last200', 'phoe200', '', 4),
(217, '', 'username201', 'pass201', 'email201', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist201', 'last201', 'phoe201', '', 4),
(218, '', 'username202', 'pass202', 'email202', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist202', 'last202', 'phoe202', '', 4),
(219, '', 'username203', 'pass203', 'email203', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist203', 'last203', 'phoe203', '', 1),
(220, '', 'username204', 'pass204', 'email204', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist204', 'last204', 'phoe204', '', 1),
(221, '', 'username205', 'pass205', 'email205', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist205', 'last205', 'phoe205', '', 3),
(222, '', 'username206', 'pass206', 'email206', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist206', 'last206', 'phoe206', '', 2),
(223, '', 'username207', 'pass207', 'email207', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist207', 'last207', 'phoe207', '', 4),
(224, '', 'username208', 'pass208', 'email208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist208', 'last208', 'phoe208', '', 4),
(225, '', 'username209', 'pass209', 'email209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist209', 'last209', 'phoe209', '', 4),
(226, '', 'username210', 'pass210', 'email210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist210', 'last210', 'phoe210', '', 1),
(227, '', 'username211', 'pass211', 'email211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist211', 'last211', 'phoe211', '', 1),
(228, '', 'username212', 'pass212', 'email212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist212', 'last212', 'phoe212', '', 4),
(229, '', 'username213', 'pass213', 'email213', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist213', 'last213', 'phoe213', '', 4),
(230, '', 'username214', 'pass214', 'email214', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist214', 'last214', 'phoe214', '', 2),
(231, '', 'username215', 'pass215', 'email215', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist215', 'last215', 'phoe215', '', 4),
(232, '', 'username216', 'pass216', 'email216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist216', 'last216', 'phoe216', '', 2),
(233, '', 'username217', 'pass217', 'email217', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist217', 'last217', 'phoe217', '', 3),
(234, '', 'username218', 'pass218', 'email218', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist218', 'last218', 'phoe218', '', 4),
(235, '', 'username219', 'pass219', 'email219', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist219', 'last219', 'phoe219', '', 4),
(236, '', 'username220', 'pass220', 'email220', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist220', 'last220', 'phoe220', '', 3),
(237, '', 'username221', 'pass221', 'email221', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist221', 'last221', 'phoe221', '', 3),
(238, '', 'username222', 'pass222', 'email222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist222', 'last222', 'phoe222', '', 1),
(239, '', 'username223', 'pass223', 'email223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist223', 'last223', 'phoe223', '', 4),
(240, '', 'username224', 'pass224', 'email224', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist224', 'last224', 'phoe224', '', 1),
(241, '', 'username225', 'pass225', 'email225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist225', 'last225', 'phoe225', '', 2),
(242, '', 'username226', 'pass226', 'email226', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist226', 'last226', 'phoe226', '', 3),
(243, '', 'username227', 'pass227', 'email227', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist227', 'last227', 'phoe227', '', 4),
(244, '', 'username228', 'pass228', 'email228', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist228', 'last228', 'phoe228', '', 3),
(245, '', 'username229', 'pass229', 'email229', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist229', 'last229', 'phoe229', '', 4),
(246, '', 'username230', 'pass230', 'email230', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist230', 'last230', 'phoe230', '', 4),
(247, '', 'username231', 'pass231', 'email231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist231', 'last231', 'phoe231', '', 3),
(248, '', 'username232', 'pass232', 'email232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist232', 'last232', 'phoe232', '', 4),
(249, '', 'username233', 'pass233', 'email233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist233', 'last233', 'phoe233', '', 4),
(250, '', 'username234', 'pass234', 'email234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist234', 'last234', 'phoe234', '', 3),
(251, '', 'username235', 'pass235', 'email235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist235', 'last235', 'phoe235', '', 4),
(252, '', 'username236', 'pass236', 'email236', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist236', 'last236', 'phoe236', '', 3),
(253, '', 'username237', 'pass237', 'email237', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist237', 'last237', 'phoe237', '', 3),
(254, '', 'username238', 'pass238', 'email238', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist238', 'last238', 'phoe238', '', 4),
(255, '', 'username239', 'pass239', 'email239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist239', 'last239', 'phoe239', '', 2),
(256, '', 'username240', 'pass240', 'email240', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist240', 'last240', 'phoe240', '', 1),
(257, '', 'username241', 'pass241', 'email241', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist241', 'last241', 'phoe241', '', 2),
(258, '', 'username242', 'pass242', 'email242', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist242', 'last242', 'phoe242', '', 1),
(259, '', 'username243', 'pass243', 'email243', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist243', 'last243', 'phoe243', '', 2),
(260, '', 'username244', 'pass244', 'email244', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist244', 'last244', 'phoe244', '', 3),
(261, '', 'username245', 'pass245', 'email245', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist245', 'last245', 'phoe245', '', 1),
(262, '', 'username246', 'pass246', 'email246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist246', 'last246', 'phoe246', '', 4),
(263, '', 'username247', 'pass247', 'email247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist247', 'last247', 'phoe247', '', 2),
(264, '', 'username248', 'pass248', 'email248', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist248', 'last248', 'phoe248', '', 4),
(265, '', 'username249', 'pass249', 'email249', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist249', 'last249', 'phoe249', '', 2),
(266, '', 'username250', 'pass250', 'email250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist250', 'last250', 'phoe250', '', 2),
(267, '', 'username251', 'pass251', 'email251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist251', 'last251', 'phoe251', '', 1),
(268, '', 'username252', 'pass252', 'email252', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist252', 'last252', 'phoe252', '', 4),
(269, '', 'username253', 'pass253', 'email253', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist253', 'last253', 'phoe253', '', 3),
(270, '', 'username254', 'pass254', 'email254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist254', 'last254', 'phoe254', '', 1),
(271, '', 'username255', 'pass255', 'email255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist255', 'last255', 'phoe255', '', 4),
(272, '', 'username256', 'pass256', 'email256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist256', 'last256', 'phoe256', '', 3),
(273, '', 'username257', 'pass257', 'email257', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist257', 'last257', 'phoe257', '', 2),
(274, '', 'username258', 'pass258', 'email258', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist258', 'last258', 'phoe258', '', 4),
(275, '', 'username259', 'pass259', 'email259', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist259', 'last259', 'phoe259', '', 2),
(276, '', 'username260', 'pass260', 'email260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist260', 'last260', 'phoe260', '', 3),
(277, '', 'username261', 'pass261', 'email261', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist261', 'last261', 'phoe261', '', 3),
(278, '', 'username262', 'pass262', 'email262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist262', 'last262', 'phoe262', '', 3),
(279, '', 'username263', 'pass263', 'email263', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist263', 'last263', 'phoe263', '', 4),
(280, '', 'username264', 'pass264', 'email264', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist264', 'last264', 'phoe264', '', 3),
(281, '', 'username265', 'pass265', 'email265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist265', 'last265', 'phoe265', '', 2),
(282, '', 'username266', 'pass266', 'email266', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist266', 'last266', 'phoe266', '', 3),
(283, '', 'username267', 'pass267', 'email267', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist267', 'last267', 'phoe267', '', 3),
(284, '', 'username268', 'pass268', 'email268', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist268', 'last268', 'phoe268', '', 1),
(285, '', 'username269', 'pass269', 'email269', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist269', 'last269', 'phoe269', '', 3),
(286, '', 'username270', 'pass270', 'email270', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist270', 'last270', 'phoe270', '', 3),
(287, '', 'username271', 'pass271', 'email271', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist271', 'last271', 'phoe271', '', 2),
(288, '', 'username272', 'pass272', 'email272', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist272', 'last272', 'phoe272', '', 1),
(289, '', 'username273', 'pass273', 'email273', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist273', 'last273', 'phoe273', '', 1),
(290, '', 'username274', 'pass274', 'email274', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist274', 'last274', 'phoe274', '', 1),
(291, '', 'username275', 'pass275', 'email275', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist275', 'last275', 'phoe275', '', 4),
(292, '', 'username276', 'pass276', 'email276', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist276', 'last276', 'phoe276', '', 4),
(293, '', 'username277', 'pass277', 'email277', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist277', 'last277', 'phoe277', '', 4),
(294, '', 'username278', 'pass278', 'email278', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist278', 'last278', 'phoe278', '', 2),
(295, '', 'username279', 'pass279', 'email279', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist279', 'last279', 'phoe279', '', 4),
(296, '', 'username280', 'pass280', 'email280', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist280', 'last280', 'phoe280', '', 2),
(297, '', 'username281', 'pass281', 'email281', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist281', 'last281', 'phoe281', '', 2),
(298, '', 'username282', 'pass282', 'email282', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist282', 'last282', 'phoe282', '', 2),
(299, '', 'username283', 'pass283', 'email283', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist283', 'last283', 'phoe283', '', 3),
(300, '', 'username284', 'pass284', 'email284', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist284', 'last284', 'phoe284', '', 2),
(301, '', 'username285', 'pass285', 'email285', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist285', 'last285', 'phoe285', '', 1),
(302, '', 'username286', 'pass286', 'email286', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist286', 'last286', 'phoe286', '', 1),
(303, '', 'username287', 'pass287', 'email287', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist287', 'last287', 'phoe287', '', 4),
(304, '', 'username288', 'pass288', 'email288', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist288', 'last288', 'phoe288', '', 4),
(305, '', 'username289', 'pass289', 'email289', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist289', 'last289', 'phoe289', '', 4),
(306, '', 'username290', 'pass290', 'email290', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist290', 'last290', 'phoe290', '', 2),
(307, '', 'username291', 'pass291', 'email291', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist291', 'last291', 'phoe291', '', 4),
(308, '', 'username292', 'pass292', 'email292', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist292', 'last292', 'phoe292', '', 4),
(309, '', 'username293', 'pass293', 'email293', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist293', 'last293', 'phoe293', '', 2),
(310, '', 'username294', 'pass294', 'email294', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist294', 'last294', 'phoe294', '', 4),
(311, '', 'username295', 'pass295', 'email295', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist295', 'last295', 'phoe295', '', 4),
(312, '', 'username296', 'pass296', 'email296', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist296', 'last296', 'phoe296', '', 2),
(313, '', 'username297', 'pass297', 'email297', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist297', 'last297', 'phoe297', '', 3),
(314, '', 'username298', 'pass298', 'email298', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist298', 'last298', 'phoe298', '', 4),
(315, '', 'username299', 'pass299', 'email299', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fist299', 'last299', 'phoe299', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `table_users_groups`
--

CREATE TABLE `table_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_users_groups`
--

INSERT INTO `table_users_groups` (`id`, `user_id`, `group_id`) VALUES
(4, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_groups`
--
ALTER TABLE `table_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_group_access`
--
ALTER TABLE `table_group_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_log`
--
ALTER TABLE `table_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `table_login_attempts`
--
ALTER TABLE `table_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_menus`
--
ALTER TABLE `table_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_profile`
--
ALTER TABLE `table_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `table_userprofiles`
--
ALTER TABLE `table_userprofiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_users`
--
ALTER TABLE `table_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `table_users_groups`
--
ALTER TABLE `table_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_groups`
--
ALTER TABLE `table_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `table_group_access`
--
ALTER TABLE `table_group_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `table_log`
--
ALTER TABLE `table_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `table_login_attempts`
--
ALTER TABLE `table_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_menus`
--
ALTER TABLE `table_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `table_profile`
--
ALTER TABLE `table_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table_userprofiles`
--
ALTER TABLE `table_userprofiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_users`
--
ALTER TABLE `table_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `table_users_groups`
--
ALTER TABLE `table_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `table_users_groups`
--
ALTER TABLE `table_users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `table_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `table_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
