-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 18, 2025 at 07:27 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u644578691_sportwall`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`u644578691_sportwall`@`127.0.0.1` PROCEDURE `ResetAutoIncrement` ()   BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE tableName VARCHAR(255);
    DECLARE cur CURSOR FOR 
        SELECT 'card_groups' UNION SELECT 'cards' UNION SELECT 'cmn_branches' UNION 
        SELECT 'cmn_business_holidays' UNION SELECT 'cmn_business_hours' UNION 
        SELECT 'cmn_categories' UNION SELECT 'cmn_companies' UNION SELECT 'cmn_coupons' UNION
        SELECT 'cmn_currency_setups' UNION SELECT 'cmn_customers' UNION SELECT 'cmn_languages' UNION 
        SELECT 'cmn_order_details' UNION SELECT 'cmn_orders' UNION SELECT 'cmn_payment_infos' UNION
        SELECT 'cmn_payment_types' UNION SELECT 'cmn_paypal_api_configs' UNION SELECT 'cmn_products' UNION 
        SELECT 'cmn_stripe_api_configs' UNION SELECT 'cmn_translations' UNION SELECT 'cmn_twilio_configs' UNION 
        SELECT 'cmn_types' UNION SELECT 'cmn_user_balances' UNION SELECT 'failed_jobs' UNION 
        SELECT 'hrm_departments' UNION SELECT 'hrm_designations' UNION SELECT 'jobs' UNION 
        SELECT 'migrations' UNION SELECT 'notifications' UNION SELECT 'password_resets' UNION 
        SELECT 'sch_employee_offdays' UNION SELECT 'sch_employee_schedules' UNION 
        SELECT 'sch_employee_services' UNION SELECT 'sch_employees' UNION SELECT 'sch_salaries' UNION 
        SELECT 'sch_service_booking_feedback' UNION SELECT 'sch_service_booking_infos' UNION 
        SELECT 'sch_service_bookings' UNION SELECT 'sch_service_categories' UNION SELECT 'sch_services' UNION 
        SELECT 'sec_resource_permissions' UNION SELECT 'sec_resources' UNION SELECT 'sec_role_permission_infos' UNION 
        SELECT 'sec_role_permissions' UNION SELECT 'sec_roles' UNION SELECT 'sec_user_branches' UNION 
        SELECT 'sec_user_roles' UNION SELECT 'site_about_us' UNION SELECT 'site_appearances' UNION 
        SELECT 'site_client_testimonials' UNION SELECT 'site_frequently_asked_questions' UNION 
        SELECT 'site_google_maps' UNION SELECT 'site_menus' UNION SELECT 'site_photo_galleries' UNION 
        SELECT 'site_terms_and_conditions' UNION SELECT 'st_otp_configurations' UNION 
        SELECT 'st_otp_messages' UNION SELECT 'users';
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    reset_loop: LOOP
        FETCH cur INTO tableName;
        IF done THEN
            LEAVE reset_loop;
        END IF;
        SET @sql = CONCAT('ALTER TABLE `', tableName, '` AUTO_INCREMENT = 1;');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `is_charged` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `code`, `group_id`, `is_charged`, `created_at`, `updated_at`) VALUES
(1, '798479348983', 1, 1, '2024-12-06 17:55:28', '2024-12-06 17:56:28'),
(2, '24082516', 2, 1, '2024-12-15 20:43:46', '2024-12-15 20:44:42'),
(3, '61649047', 2, 1, '2024-12-15 20:43:46', '2024-12-15 20:45:04'),
(4, '02517927', 2, 1, '2024-12-15 20:43:46', '2024-12-15 20:45:29'),
(5, '48679735', 3, 1, '2025-01-11 18:48:23', '2025-01-11 18:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `card_groups`
--

CREATE TABLE `card_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `formula` enum('numbers','letters','both') NOT NULL,
  `count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `card_groups`
--

INSERT INTO `card_groups` (`id`, `price`, `formula`, `count`, `created_at`, `updated_at`) VALUES
(1, 100, 'numbers', 1, '2024-12-06 17:55:28', '2024-12-06 17:55:28'),
(2, 100, 'numbers', 3, '2024-12-15 20:43:46', '2024-12-15 20:43:46'),
(3, 100, 'numbers', 1, '2025-01-11 18:48:23', '2025-01-11 18:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `cmn_branches`
--

CREATE TABLE `cmn_branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(190) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_branches`
--

INSERT INTO `cmn_branches` (`id`, `name`, `phone`, `email`, `address`, `order`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'ملعب تجريبي', '0916776600', 'aatagreb@gmail.com', 'ليبيا -  مدينة مصراتة', 0, 1, 1, 1, '2024-11-26 13:53:05', '2024-11-26 13:59:24'),
(3, 'تجريبى 2', '13241654', 'aa@aa.com', 'sadsas', 0, 1, 1, NULL, '2024-11-30 13:07:20', '2024-11-30 13:07:20'),
(4, 'ملعب ايوب', '0918151127', 'ayoub@gmail.com', 'ليبيا مصراته', 0, 1, 1, NULL, '2024-12-01 18:52:12', '2024-12-01 18:52:12'),
(5, 'ملاعب الجدار الرياضي', '0916262694', 'goalmasters@gmail.com', 'مصراته قزير', 50, 1, 1, NULL, '2024-12-08 18:15:23', '2024-12-08 18:15:23'),
(6, 'ملعب الاهلي', '0930622220', 'alaheli.1@gmail.com', 'مصراته', 50, 1, 1, NULL, '2024-12-15 20:08:48', '2024-12-15 20:08:48'),
(7, 'ملعب الزروق', '0912134567', 'alzaroq@gmail.com', 'الزروق', 0, 1, 1, NULL, '2025-01-02 19:16:32', '2025-01-02 19:16:32'),
(8, 'ملعب قزير', '0917307166', 'kj20056299@gmail.com', 'قزير', 0, 1, 1, 1, '2025-01-03 16:24:36', '2025-01-11 18:34:15'),
(9, 'ملاعب القوشي', '0916655442', 'igiythtiu@gmail.com', 'مصراتة', 0, 1, 1, NULL, '2025-01-03 17:37:24', '2025-01-03 17:37:24'),
(11, 'ملعب  الهدف', '0917307185', 'hupuhgvi@gmail.com', 'الغيران', 0, 1, 1, 1, '2025-01-15 15:13:55', '2025-01-15 15:32:50');

-- --------------------------------------------------------

--
-- Table structure for table `cmn_business_holidays`
--

CREATE TABLE `cmn_business_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cmn_branch_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmn_business_hours`
--

CREATE TABLE `cmn_business_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_off_day` tinyint(1) NOT NULL DEFAULT 0,
  `cmn_branch_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_business_hours`
--

INSERT INTO `cmn_business_hours` (`id`, `day`, `start_time`, `end_time`, `is_off_day`, `cmn_branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 0, '13:00:00', '23:55:00', 0, 1, 24, NULL, NULL, NULL),
(2, 1, '13:00:00', '23:55:00', 0, 1, 24, NULL, NULL, NULL),
(3, 2, '13:00:00', '23:55:00', 0, 1, 24, NULL, NULL, NULL),
(4, 3, '13:00:00', '23:55:00', 0, 1, 24, NULL, NULL, NULL),
(5, 4, '13:00:00', '23:55:00', 0, 1, 24, NULL, NULL, NULL),
(6, 5, '13:00:00', '23:55:00', 0, 1, 24, NULL, NULL, NULL),
(7, 6, '13:00:00', '23:55:00', 0, 1, 24, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cmn_categories`
--

CREATE TABLE `cmn_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_content` varchar(255) DEFAULT NULL,
  `cmn_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmn_companies`
--

CREATE TABLE `cmn_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `web_address` varchar(200) DEFAULT NULL,
  `image_link` varchar(2000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_companies`
--

INSERT INTO `cmn_companies` (`id`, `name`, `address`, `phone`, `mobile`, `email`, `web_address`, `image_link`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(9, 'goal masters - جوول ماسترز', '83Q7+844, Misrata, Libya', '0916771600', '0916771600', 'support@goalmasters.top', 'www.goalmasters.online', NULL, 1, 1, '2021-10-18 10:17:27', '2024-11-04 13:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `cmn_coupons`
--

CREATE TABLE `cmn_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `percent` tinyint(4) NOT NULL,
  `coupon_type` tinyint(4) NOT NULL DEFAULT 1,
  `use_limit` int(11) NOT NULL DEFAULT 1,
  `min_order_value` decimal(12,2) NOT NULL DEFAULT 0.00,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `max_discount_value` decimal(12,2) NOT NULL,
  `is_fixed` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmn_currency_setups`
--

CREATE TABLE `cmn_currency_setups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_currency_setups`
--

INSERT INTO `cmn_currency_setups` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'دينار', 'دينار', '2021-10-31 18:00:00', '2021-12-24 13:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `cmn_customers`
--

CREATE TABLE `cmn_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `otp` varchar(6) DEFAULT NULL,
  `email` varchar(160) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `street_address` varchar(500) DEFAULT NULL,
  `street_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_customers`
--

INSERT INTO `cmn_customers` (`id`, `user_id`, `created_by`, `full_name`, `phone_no`, `is_phone_verified`, `otp`, `email`, `dob`, `country`, `state`, `postal_code`, `city`, `street_address`, `street_number`, `remarks`, `created_at`, `updated_at`) VALUES
(17, 39, NULL, 'ايوب بالحاج', '0916776600', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-29 19:59:23', '2024-12-06 17:44:49'),
(18, 24, NULL, 'ايوب', '916776600', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-29 21:20:13', '2024-11-29 21:20:13'),
(19, 24, NULL, 'مهند', '916242494', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-29 21:22:25', '2024-11-29 21:22:25'),
(23, NULL, 1, 'Lynn Briggs', '17299564985', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-30 19:15:51', '2024-11-30 19:15:51'),
(24, NULL, NULL, 'William King تجريبى 2', '11469488142', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-30 19:16:48', '2024-11-30 19:16:48'),
(25, NULL, NULL, 'DIAA UDDIN ABABNEH', '0798402930', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-30 21:19:22', '2024-12-06 12:20:19'),
(28, NULL, NULL, 'محمد احمد محمد', '0918151127', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-01 17:24:11', '2024-12-06 12:07:01'),
(30, NULL, 1, 'DIAA', '798402930', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 08:58:09', '2024-12-04 08:58:09'),
(31, NULL, 1, 'DROPIDEA0200', '798402935', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 09:00:05', '2024-12-04 09:00:05'),
(32, NULL, 1, 'Diaa uddin abbab', '7985425221', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 09:14:02', '2024-12-04 09:14:02'),
(33, 38, NULL, 'abdo', '01112474982', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 12:30:07', '2024-12-04 12:32:05'),
(42, NULL, NULL, 'أكرّم الجبو', '0913723278', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-05 20:23:52', '2024-12-06 12:07:01'),
(43, NULL, NULL, 'abdelghany', '01550048098', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-06 12:38:15', '2024-12-07 09:58:02'),
(44, 46, NULL, 'Mohammed Abbas', '0917307185', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-06 18:56:39', '2024-12-06 18:56:55'),
(45, 47, NULL, 'JKPJKsNkewZZmq', '9901319652', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-06 20:32:12', '2024-12-07 09:48:02'),
(46, 48, NULL, 'KFJcrqDjHg', '8320190350', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-07 07:03:00', '2024-12-07 09:48:02'),
(47, 49, NULL, 'hVVatjkQQFfLppH', '9675662501', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-07 11:20:05', '2024-12-07 11:26:02'),
(48, 50, NULL, 'JkmxbpHxJmkYNl', '3624580030', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-07 21:45:30', '2024-12-07 21:51:02'),
(49, 51, NULL, 'RRXdhNhy', '9039824336', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-08 00:21:43', '2024-12-08 00:27:01'),
(50, 52, NULL, 'FVbfwrpONq', '3955412812', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-08 06:20:43', '2024-12-08 06:26:02'),
(51, NULL, NULL, 'شهاب احمد ابوتركية', '0912849569', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-08 21:16:29', '2024-12-08 21:30:03'),
(52, NULL, NULL, 'احمد', '0914577574', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-09 15:38:52', '2024-12-09 15:44:02'),
(53, NULL, NULL, 'اطلب', '0931331622', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-09 21:12:30', '2024-12-20 18:44:02'),
(55, 54, NULL, 'PcyvTDhbFbdPWf', '6441947037', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-10 19:57:41', '2024-12-10 20:03:01'),
(56, 55, NULL, 'tqeUPrmHEN', '4768431856', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 18:58:03', '2024-12-11 19:04:02'),
(57, 56, NULL, 'xAEkHWDg', '5732508390', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 20:06:25', '2024-12-11 20:12:01'),
(58, 57, NULL, 'DuoLrWZhaPWB', '2748284153', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-11 20:58:04', '2024-12-11 21:04:01'),
(59, NULL, 1, 'معاد كرواد', '0921774065', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-15 20:53:01', '2024-12-15 20:58:02'),
(60, NULL, NULL, 'moktar', '0915513545', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-17 16:50:16', '2024-12-17 16:52:02'),
(61, 59, NULL, 'HnPDHHDdGrBPsKx', '4132396098', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-20 12:01:06', '2024-12-20 12:07:01'),
(62, NULL, 1, 'ياسين احمد', '0911662086', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-22 18:24:26', '2024-12-22 18:35:02'),
(63, 60, NULL, 'itikbBPNy', '2481758202', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-26 10:44:38', '2024-12-26 10:50:02'),
(64, 61, NULL, 'tkepziEqUOo', '8826899571', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-30 20:43:37', '2024-12-30 20:49:02'),
(65, NULL, NULL, 'محمد عباس', '0930622220', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-03 18:55:09', '2025-01-03 18:55:09'),
(66, 66, NULL, 'hXApxCIB', '4308245634', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-05 23:59:48', '2025-01-06 00:05:02'),
(67, 67, NULL, 'HbslAwdfrOKX', '2066975986', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-08 09:33:12', '2025-01-08 09:39:01'),
(68, NULL, NULL, 'حسن  الواكشي', '0917911791', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-08 18:26:09', '2025-01-08 18:32:01'),
(69, NULL, NULL, 'rabee', '0923069159', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-08 18:28:44', '2025-01-08 18:34:01'),
(70, 68, NULL, 'ZutiTxIAfYPWPL', '2260308088', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-11 02:01:11', '2025-01-11 02:07:02'),
(72, 70, NULL, 'IhShptZnrjWnCU', '9198120240', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-11 18:06:35', '2025-01-11 18:12:02'),
(75, NULL, NULL, 'Mohammed Abbas', '917307185', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-11 21:49:05', '2025-01-15 16:02:01'),
(76, 73, NULL, 'ZsQoyamtKdZoTKw', '9259267464', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-13 05:47:49', '2025-01-13 05:53:01'),
(77, 74, NULL, 'RuHlesrJuypIJ', '8054610036', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-14 21:00:10', '2025-01-14 21:06:01'),
(78, 75, NULL, 'DdpLEKTjpo', '5981618041', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-15 06:38:06', '2025-01-15 06:44:01'),
(79, 76, NULL, 'tAEcYnDwwL', '2276626418', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-15 07:48:19', '2025-01-15 07:54:01'),
(80, NULL, NULL, 'Mohammed', '+218XXXXXXXXX', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-15 08:12:44', '2025-01-15 08:12:44'),
(81, 78, NULL, 'ftlHfwNhsr', '7417716909', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 19:05:03', '2025-01-16 19:11:01'),
(82, 79, NULL, 'fPjMWMZWQYyoP', '8764458817', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 19:53:03', '2025-01-16 19:59:01'),
(83, 80, NULL, 'evyiupPmNCXFF', '6610382297', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 23:48:06', '2025-01-16 23:54:01'),
(84, 81, NULL, 'AqMPVteN', '2619342177', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-17 14:46:08', '2025-01-17 14:52:01'),
(85, 82, NULL, 'nRjbVQiL', '9505032870', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-18 01:13:30', '2025-01-18 01:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `cmn_languages`
--

CREATE TABLE `cmn_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(5) NOT NULL,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_language` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_languages`
--

INSERT INTO `cmn_languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`, `default_language`) VALUES
(1, 'English', 'en', 0, '2024-09-19 10:22:06', '2024-09-19 07:20:24', 0),
(3, 'العربية', 'ar', 1, '2024-09-16 07:42:21', '2024-10-29 00:58:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cmn_orders`
--

CREATE TABLE `cmn_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `discount_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `shipping_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `shipping_details` text DEFAULT NULL,
  `cmn_coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `shipping_status` varchar(255) NOT NULL DEFAULT 'on_process',
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmn_order_details`
--

CREATE TABLE `cmn_order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cmn_order_id` bigint(20) UNSIGNED NOT NULL,
  `cmn_product_id` bigint(20) UNSIGNED NOT NULL,
  `product_price` decimal(12,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `discount_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `shipping_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmn_payment_infos`
--

CREATE TABLE `cmn_payment_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paymentable_id` int(11) NOT NULL,
  `paymentable_type` varchar(500) NOT NULL,
  `payment_type` int(11) NOT NULL COMMENT '1=local,2=paypal',
  `payment_amount` decimal(18,2) NOT NULL,
  `payment_fee` decimal(18,2) NOT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `payee_email_address` varchar(300) DEFAULT NULL,
  `payee_crd_no` varchar(50) DEFAULT NULL,
  `payment_create_time` varchar(50) DEFAULT NULL,
  `payment_details` varchar(2000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_payment_infos`
--

INSERT INTO `cmn_payment_infos` (`id`, `paymentable_id`, `paymentable_type`, `payment_type`, `payment_amount`, `payment_fee`, `currency_code`, `order_id`, `payee_email_address`, `payee_crd_no`, `payment_create_time`, `payment_details`, `created_at`, `updated_at`) VALUES
(1, 30, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 80.00, 0.00, 'user_balance', '2', 'user_balance', 'user_balance', '2024-12-06 17:57:43', '', '2024-12-06 17:57:43', '2024-12-06 17:57:43'),
(2, 35, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 80.00, 0.00, 'user_balance', '3', 'user_balance', 'user_balance', '2024-12-09 21:30:51', '', '2024-12-09 21:30:51', '2024-12-09 21:30:51'),
(3, 37, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 120.00, 0.00, 'user_balance', '5', 'user_balance', 'user_balance', '2024-12-10 08:55:03', '', '2024-12-10 08:55:03', '2024-12-10 08:55:03'),
(4, 38, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 80.00, 0.00, 'user_balance', '6', 'user_balance', 'user_balance', '2024-12-11 13:44:12', '', '2024-12-11 13:44:12', '2024-12-11 13:44:12'),
(5, 42, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 80.00, 0.00, 'user_balance', '10', 'user_balance', 'user_balance', '2024-12-15 20:47:03', '', '2024-12-15 20:47:03', '2024-12-15 20:47:03'),
(6, 45, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 80.00, 0.00, 'user_balance', '11', 'user_balance', 'user_balance', '2024-12-15 21:30:37', '', '2024-12-15 21:30:37', '2024-12-15 21:30:37'),
(7, 68, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 5.00, 0.00, 'user_balance', '14', 'user_balance', 'user_balance', '2025-01-11 18:51:11', '', '2025-01-11 18:51:11', '2025-01-11 18:51:11'),
(8, 69, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 5.00, 0.00, 'user_balance', '15', 'user_balance', 'user_balance', '2025-01-11 18:53:38', '', '2025-01-11 18:53:38', '2025-01-11 18:53:38'),
(9, 70, 'App\\Models\\Booking\\SchServiceBookingInfo', 4, 185.00, 0.00, 'user_balance', '16', 'user_balance', 'user_balance', '2025-01-11 19:02:01', '', '2025-01-11 19:02:01', '2025-01-11 19:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `cmn_payment_types`
--

CREATE TABLE `cmn_payment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(190) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_payment_types`
--

INSERT INTO `cmn_payment_types` (`id`, `name`, `type`, `order`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'نقدا', 1, 1, 1, 1, NULL, NULL, NULL),
(2, 'Paypal', 2, 2, 0, 1, NULL, NULL, '2024-09-21 07:26:31'),
(3, 'Stripe', 3, 3, 0, 1, NULL, NULL, '2024-09-17 15:50:28'),
(4, 'User Balance', 4, 4, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cmn_paypal_api_configs`
--

CREATE TABLE `cmn_paypal_api_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cmn_payment_type_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` varchar(1000) NOT NULL,
  `client_secret` varchar(1000) NOT NULL,
  `sandbox` tinyint(4) NOT NULL,
  `charge_type` tinyint(4) NOT NULL COMMENT '1=addition, 2=deduction',
  `charge_percentage` decimal(4,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_paypal_api_configs`
--

INSERT INTO `cmn_paypal_api_configs` (`id`, `cmn_payment_type_id`, `client_id`, `client_secret`, `sandbox`, `charge_type`, `charge_percentage`, `created_at`, `updated_at`) VALUES
(1, 2, 'test_id', 'test_key', 1, 1, 0.00, NULL, '2022-01-23 13:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `cmn_products`
--

CREATE TABLE `cmn_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cmn_type_id` bigint(20) UNSIGNED NOT NULL,
  `cmn_category_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(12,2) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `description` text DEFAULT NULL,
  `unit` varchar(255) NOT NULL,
  `discount` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_type` int(11) NOT NULL DEFAULT 1,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_hotdeal` tinyint(4) NOT NULL DEFAULT 0,
  `is_new` tinyint(4) NOT NULL DEFAULT 0,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_content` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmn_stripe_api_configs`
--

CREATE TABLE `cmn_stripe_api_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cmn_payment_type_id` bigint(20) UNSIGNED NOT NULL,
  `api_key` varchar(1000) NOT NULL,
  `api_secret` varchar(1000) NOT NULL,
  `charge_type` tinyint(4) NOT NULL COMMENT '1=addition, 2=deduction',
  `charge_percentage` decimal(4,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmn_translations`
--

CREATE TABLE `cmn_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cmn_language_id` bigint(20) UNSIGNED NOT NULL,
  `lang_key` varchar(1500) NOT NULL,
  `lang_value` varchar(1500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_translations`
--

INSERT INTO `cmn_translations` (`id`, `cmn_language_id`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(1, 3, 'Book An Appointment', 'احجز موعدًا', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(2, 3, 'A fresh verification link has been sent to your email address.', 'لقد تم إرسال رابط تحقق جديد إلى عنوان بريدك الإلكتروني.', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(3, 3, 'Next', 'التالي', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(4, 3, 'Satisfied Clients', 'العملاء الراضون', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(5, 3, 'Done Services', 'الخدمات المكتملة', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(6, 3, 'Available Our Top and Popular Services', 'الخدمات الأكثر شيوعًا لدينا المتاحة', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(7, 3, 'We calculate top services based on our client feedback and number of provided services.', 'نحسب أفضل الخدمات بناءً على ملاحظات العملاء وعدد الخدمات المقدمة.', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(8, 3, 'Learn More', 'تعرف على المزيد', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(9, 3, 'Our new available playgrounds', 'الملاعب الجديدة المتوفرة لدينا', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(10, 3, 'We provide you with a service designed to meet your needs, ensuring you receive the utmost satisfaction and achieve your desired outcomes.', 'نقدم لك خدمة مصممة لتلبية احتياجاتك، مع ضمان حصولك على أقصى درجات الرضا وتحقيق النتائج التي تطمح إليها.', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(11, 3, 'Book Now', 'احجز الآن', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(12, 3, 'Valuable Clients Testimonials', 'شهادات العملاء القيمة', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(13, 3, 'We got testimonials from our valued clients both online and offline and they are very much happy.', 'حصلنا على شهادات من عملائنا المميزين سواء عبر الإنترنت أو خارجها، وهم سعداء جدًا.', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(14, 3, 'Sign Up', 'سجل', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(15, 3, 'Sign In', 'تسجيل الدخول', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(16, 3, 'Home', 'الرئيسية', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(17, 3, 'Service', 'الخدمة', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(18, 3, 'Our Team', 'فريقنا', '2022-04-15 10:30:59', '2022-04-15 10:30:59'),
(19, 3, 'Photo Galley', 'معرض الصور', '2022-04-15 10:30:59', '2022-04-15 10:30:59'),
(20, 3, 'FAQ', 'الأسئلة الشائعة', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(21, 3, 'About Us', 'من نحن', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(22, 3, 'Contact Us', 'اتصل بنا', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(23, 3, 'About Service', 'خدماتنا', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(24, 3, 'Website Navigation Links', 'روابط التنقل في الموقع', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(25, 3, 'Terms & Conditions', 'الشروط والأحكام', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(26, 3, 'Contact Information', 'معلومات الاتصال', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(27, 3, 'Phone', 'الهاتف', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(28, 3, 'Email to', 'إرسال بريد إلى', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(29, 3, 'Website', 'الموقع الإلكتروني', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(30, 3, 'Address', 'العنوان', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(31, 3, 'Payment Method', 'طريقة الدفع', '2022-04-15 10:30:59', '2024-09-16 15:54:50'),
(32, 3, 'Email', 'البريد الإلكتروني', '2022-04-15 10:31:44', '2022-04-15 10:31:44'),
(33, 3, 'Send Password Reset Link', 'إرسال رابط إعادة تعيين كلمة المرور', '2022-04-15 10:31:44', '2022-04-15 10:31:44'),
(34, 3, 'Sign in existing account', 'تسجيل الدخول إلى الحساب الحالي', '2022-04-15 10:31:44', '2022-04-15 10:31:44'),
(35, 3, 'Welcome back', 'مرحبًا بعودتك', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(36, 3, 'Please sign in to your account.', 'يرجى تسجيل الدخول إلى حسابك.', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(37, 3, 'No account', 'لا يوجد حساب', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(38, 3, 'now', 'الآن', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(39, 3, 'Eamil Or Username', 'البريد الإلكتروني أو اسم المستخدم', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(40, 3, 'Password', 'كلمة المرور', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(41, 3, 'Remember Me', 'تذكرني', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(43, 3, 'Forgot Your Password?', 'نسيت كلمة المرور؟', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(44, 3, 'Go to Website', 'اذهب إلى الموقع', '2022-04-15 10:37:38', '2022-04-15 10:37:38'),
(45, 3, 'Welcome to', 'مرحبًا بك في', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(46, 3, 'It only takes a few seconds to create your account', 'يستغرق إنشاء حسابك بضع ثوانٍ فقط', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(47, 3, 'Email address', 'عنوان البريد الإلكتروني', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(48, 3, 'User Name', 'اسم المستخدم', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(49, 3, 'Name', 'الاسم', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(50, 3, 'Name here', 'الاسم هنا', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(51, 3, 'Password here', 'كلمة المرور هنا', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(52, 3, 'Repeat Password', 'أعد إدخال كلمة المرور', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(53, 3, 'Repeat Password here', 'أعد إدخال كلمة المرور هنا', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(54, 3, 'Terms and Conditions', 'الشروط والأحكام', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(55, 3, 'Already have an account', 'لديك حساب بالفعل', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(56, 3, 'Create Account', 'إنشاء حساب', '2022-04-15 10:38:32', '2022-04-15 10:38:32'),
(57, 3, 'Booking Info', 'معلومات الحجز', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(58, 3, 'Date From', 'التاريخ من', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(59, 3, 'Date To', 'التاريخ إلى', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(60, 3, 'Employee', 'الحجز', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(61, 3, 'Customer', 'العميل', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(62, 3, 'Service Status', 'حالة الخدمة', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(63, 3, 'Booking No', 'رقم الحجز', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(64, 3, 'Filter', 'تصفية', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(65, 3, 'Booking No#', 'رقم الحجز#', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(66, 3, 'Send notification by email', 'إرسال إشعار عبر البريد الإلكتروني', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(67, 3, 'Close', 'إغلاق', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(68, 3, 'Save Change', 'حفظ التغيير', '2022-04-15 11:42:06', '2022-04-15 11:42:06'),
(69, 3, 'Add multiple:', 'إضافة متعددة:', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(70, 3, 'Yes', 'نعم', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(71, 3, 'No', 'لا', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(72, 3, 'Date', 'التاريخ', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(73, 3, 'Previous day', 'اليوم السابق', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(74, 3, 'Next day', 'اليوم التالي', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(75, 3, 'Load', 'تحميل', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(76, 3, 'Total Booking', 'إجمالي الحجوزات', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(77, 3, 'Done', 'خالص', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(78, 3, 'Cancel', 'إلغاء', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(79, 3, 'Approved', 'موافق عليه', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(80, 3, 'Processing', 'قيد المعالجة', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(81, 3, 'Pending', 'قيد الانتظار', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(82, 3, 'Add Schedule', 'إضافة جدول', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(83, 3, 'Add/Edit Service', 'إضافة/تحرير الخدمة', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(84, 3, 'Branch', 'الادارة', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(85, 3, 'Category', 'الفئة', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(86, 3, 'Select One', 'اختر واحدًا', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(87, 3, 'Staff', 'الحجز', '2022-04-15 11:42:35', '2022-04-15 11:42:35'),
(88, 3, 'Service Date', 'تاريخ الخدمة', '2022-04-15 11:42:36', '2022-04-15 11:42:36'),
(89, 3, 'Add Customer', 'إضافة عميل', '2022-04-15 11:42:36', '2022-04-15 11:42:36'),
(90, 3, 'Payment By', 'الدفع بواسطة', '2022-04-15 11:42:36', '2022-04-15 11:42:36'),
(91, 3, 'Paid Amount', 'المبلغ المدفوع', '2022-04-15 11:42:36', '2022-04-15 11:42:36'),
(92, 3, 'Paid/Unpaid', 'مدفوع/غير مدفوع', '2022-04-15 11:42:36', '2022-04-15 11:42:36'),
(93, 3, 'Application Status', 'حالة الطلب', '2022-04-15 11:42:36', '2022-04-15 11:42:36'),
(94, 3, 'Remarks', 'ملاحظات', '2022-04-15 11:42:36', '2022-04-15 11:42:36'),
(95, 3, 'Send booking notification by email', 'إرسال إشعار الحجز عبر البريد الإلكتروني', '2022-04-15 11:42:36', '2022-04-15 11:42:36'),
(96, 3, 'Customer Info', 'معلومات العميل', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(97, 3, 'Customer Name', 'اسم العميل', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(98, 3, 'full name', 'الاسم الكامل', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(99, 3, 'System User', 'مستخدم النظام', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(100, 3, 'Customer Phone', 'هاتف العميل', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(101, 3, 'Phone Number', 'رقم الهاتف', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(102, 3, 'Date of Birth', 'تاريخ الميلاد', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(103, 3, 'Street Address', 'عنوان الشارع', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(104, 3, 'Country', 'البلد', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(105, 3, 'City', 'المدينة', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(106, 3, 'State Name', 'اسم الولاية', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(107, 3, 'Postal Code', 'الرمز البريدي', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(108, 3, 'Customer Information', 'معلومات العميل', '2022-04-15 11:44:27', '2022-04-15 11:44:27'),
(109, 3, 'Add New Customer', 'إضافة عميل جديد', '2022-04-15 11:44:28', '2022-04-15 11:44:28'),
(110, 3, 'Appointment Booking Dashboard', 'لوحة حجز المواعيد', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(111, 3, 'Add New Booking', 'إضافة حجز جديد', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(112, 3, 'Total Done', 'إجمالي المكتمل', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(113, 3, 'Total Cancel', 'إجمالي الملغى', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(114, 3, 'Total Approved', 'إجمالي الموافق عليه', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(115, 3, 'Processing & Pending', 'قيد المعالجة والانتظار', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(116, 3, 'Today\'s Service statistics', 'إحصائيات خدمة اليوم', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(117, 3, 'Show all service statistics based on user branch permission.', 'عرض جميع إحصائيات الخدمة بناءً على إذن فرع المستخدم.', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(118, 3, 'Total', 'الإجمالي', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(119, 3, 'Today\'s Income & Other Statistics', 'إحصائيات الدخل اليومي والإحصائيات الأخرى', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(120, 3, 'Total Income', 'إجمالي الدخل', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(121, 3, 'Total Due', 'إجمالي المستحق', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(122, 3, 'Total Cash Payment', 'إجمالي المدفوع نقدًا', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(123, 3, 'Total Online Payment', 'إجمالي المدفوع عبر الإنترنت', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(124, 3, 'Today', 'اليوم', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(125, 3, 'Month', 'الشهر', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(126, 3, 'Top Booking Service', 'أفضل خدمات الحجز', '2022-04-15 11:45:13', '2022-04-15 11:45:13'),
(127, 3, 'Add or update off day', 'إضافة أو تحديث يوم عطلة', '2022-04-15 11:47:09', '2022-04-15 11:47:09'),
(128, 3, 'Subject', 'الموضوع', '2022-04-15 11:47:09', '2022-04-15 11:47:09'),
(129, 3, 'Start date', 'تاريخ البدء', '2022-04-15 11:47:09', '2022-04-15 11:47:09'),
(130, 3, 'End date', 'تاريخ الانتهاء', '2022-04-15 11:47:09', '2022-04-15 11:47:09'),
(131, 3, 'Edit', 'تعديل', '2022-04-15 11:47:09', '2022-04-15 11:47:09'),
(132, 3, 'Delete', 'حذف', '2022-04-15 11:47:09', '2022-04-15 11:47:09'),
(133, 3, 'Reservations Info', 'معلومات الحجز', '2022-04-15 11:47:09', '2022-04-15 11:47:09'),
(134, 3, 'Basic Profile', 'الملف الحجز الأساسي', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(135, 3, 'Available Service', 'الخدمة المتاحة', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(136, 3, 'Service Time', 'وقت الخدمة', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(137, 3, 'Day Off', 'يوم عطلة', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(138, 3, 'Image', 'صورة', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(139, 3, 'Reservations Name', 'اسم الحجز', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(140, 3, 'Staff/Employee Name', 'اسم الحجز', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(141, 3, 'Reservations ID', 'رقم تعريف الحجز', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(142, 3, 'Staff/Employee ID', 'رقم تعريف الحجز', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(143, 3, 'Phone No', 'رقم الهاتف', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(144, 3, 'Department', 'القسم', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(145, 3, 'Designation', 'اضافة فترة حجز', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(146, 3, 'Gender', 'طبيعة المعروض', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(147, 3, 'Specialist', 'متخصص', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(148, 3, 'Present Address', 'العنوان الحالي', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(149, 3, 'Permanent Address', 'العنوان الدائم', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(150, 3, 'Note', 'ملاحظة', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(151, 3, 'Visibility Status', 'حالة الظهور', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(152, 3, 'Day', 'اليوم', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(153, 3, 'Start Time', 'وقت البدء', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(154, 3, 'End Time', 'وقت الانتهاء', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(155, 3, 'Break Start', 'بداية الاستراحة', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(156, 3, 'Break End', 'نهاية الاستراحة', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(157, 3, 'Weekly Holiday', 'العطلة الأسبوعية', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(158, 3, 'Monday', 'الإثنين', '2022-04-15 11:47:10', '2022-04-15 11:47:10'),
(159, 3, 'Tuesday', 'الثلاثاء', '2022-04-15 11:47:11', '2022-04-15 11:47:11'),
(160, 3, 'Wednesday', 'الأربعاء', '2022-04-15 11:47:11', '2022-04-15 11:47:11'),
(161, 3, 'Thursday', 'الخميس', '2022-04-15 11:47:11', '2022-04-15 11:47:11'),
(162, 3, 'Friday', 'الجمعة', '2022-04-15 11:47:11', '2022-04-15 11:47:11'),
(163, 3, 'Saturday', 'السبت', '2022-04-15 11:47:11', '2022-04-15 11:47:11'),
(164, 3, 'Staff Info', 'معلومات الحجز', '2022-04-15 11:47:11', '2022-04-15 11:47:11'),
(165, 3, 'Add New Staff', 'إضافة معلومات حجز', '2022-04-15 11:47:11', '2022-04-15 11:47:11'),
(166, 3, 'Search', 'بحث', '2022-04-15 11:48:40', '2022-04-15 11:48:40'),
(167, 3, 'Messages', 'الرسائل', '2022-04-15 11:48:40', '2022-04-15 11:48:40'),
(168, 3, 'Mark all as read', 'وضع علامة مقروءة على الكل', '2022-04-15 11:48:40', '2022-04-15 11:48:40'),
(169, 3, 'See all messages', 'عرض جميع الرسائل', '2022-04-15 11:48:40', '2022-04-15 11:48:40'),
(170, 3, 'You have 4 new notification', 'لديك 4 إشعارات جديدة', '2022-04-15 11:48:40', '2022-04-15 11:48:40'),
(171, 3, 'Notification 1', 'إشعار 1', '2022-04-15 11:48:40', '2022-04-15 11:48:40'),
(172, 3, '5 minutes ago', 'منذ 5 دقائق', '2022-04-15 11:48:40', '2022-04-15 11:48:40'),
(173, 3, 'See all notifications', 'عرض جميع الإشعارات', '2022-04-15 11:48:40', '2022-04-15 11:48:40'),
(174, 3, 'Quick Actions', 'إجراءات سريعة', '2022-04-15 11:48:41', '2022-04-15 11:48:41'),
(175, 3, 'Shortcuts', 'اختصارات', '2022-04-15 11:48:41', '2022-04-15 11:48:41'),
(176, 3, 'Booking Calendar', 'تقويم الحجز', '2022-04-15 11:48:41', '2022-04-15 11:48:41'),
(177, 3, 'Booking Information', 'معلومات الحجز', '2022-04-15 11:48:41', '2022-04-15 11:48:41'),
(178, 3, 'Create New Customer', 'إنشاء عميل جديد', '2022-04-15 11:48:41', '2022-04-15 11:48:41'),
(179, 3, 'Change Photo', 'تغيير الصورة', '2022-04-15 11:48:41', '2022-04-15 11:48:41'),
(180, 3, 'Change Password', 'تغيير كلمة المرور', '2022-04-15 11:48:41', '2022-04-15 11:48:41'),
(181, 3, 'Logout', 'تسجيل الخروج', '2022-04-15 11:48:41', '2022-04-15 11:48:41'),
(182, 3, 'Currency Setup', 'إعداد العملة', '2022-04-15 11:49:23', '2022-04-15 11:49:23'),
(183, 3, 'Local Payment', 'الدفع المحلي', '2022-04-15 11:49:23', '2022-04-15 11:49:23'),
(184, 3, 'Paypal Payment', 'الدفع عبر باي بال', '2022-04-15 11:49:23', '2022-04-15 11:49:23'),
(185, 3, 'Paypal Config', 'إعدادات باي بال', '2022-04-15 11:49:23', '2022-04-15 11:49:23'),
(186, 3, 'Client ID', 'معرف العميل', '2022-04-15 11:49:23', '2022-04-15 11:49:23'),
(187, 3, 'Client Secret', 'السرية الخاصة بالعميل', '2022-04-15 11:49:24', '2022-04-15 11:49:24'),
(188, 3, 'Charge Type', 'نوع الرسوم', '2022-04-15 11:49:24', '2022-04-15 11:49:24'),
(189, 3, 'Charge Percentage', 'نسبة الرسوم', '2022-04-15 11:49:24', '2022-04-15 11:49:24'),
(190, 3, 'Enable Sandbox', 'تمكين وضع التجربة', '2022-04-15 11:49:24', '2022-04-15 11:49:24'),
(191, 3, 'Stripe Config', 'إعدادات سترايب', '2022-04-15 11:49:24', '2022-04-15 11:49:24'),
(192, 3, 'Enable Stripe Payment', 'تمكين الدفع عبر سترايب', '2022-04-15 11:49:24', '2022-04-15 11:49:24'),
(193, 3, 'API Key', 'مفتاح API', '2022-04-15 11:49:24', '2022-04-15 11:49:24'),
(194, 3, 'API Secret', 'سرية API', '2022-04-15 11:49:24', '2022-04-15 11:49:24'),
(195, 3, 'Category Info', 'معلومات الفئة', '2022-04-15 11:49:48', '2022-04-15 11:49:48'),
(196, 3, 'Category name', 'اسم الفئة', '2022-04-15 11:49:48', '2022-04-15 11:49:48'),
(197, 3, 'Add New Category', 'إضافة فئة جديدة', '2022-04-15 11:49:48', '2022-04-15 11:49:48'),
(198, 3, 'Service Information', 'معلومات الخدمة', '2022-04-15 11:50:30', '2022-04-15 11:50:30'),
(199, 3, 'Service Category', 'فئة الخدمة', '2022-04-15 11:50:30', '2022-04-15 11:50:30'),
(200, 3, 'Service Title', 'عنوان الخدمة', '2022-04-15 11:50:30', '2022-04-15 11:50:30'),
(201, 3, 'Service Price', 'سعر الخدمة', '2022-04-15 11:50:30', '2022-04-15 11:50:30'),
(202, 3, 'Service Duration', 'مدة الخدمة', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(203, 3, 'Service Time Slot', 'فترة الخدمة', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(204, 3, 'Gap Time Before', 'الفترة الزمنية قبل', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(205, 3, 'Gap Time After', 'الفترة الزمنية بعد', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(206, 3, 'Appointment Limit Type', 'نوع حد المواعيد', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(207, 3, 'No of Limit', 'عدد الحدود', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(208, 3, 'Minimum Time Required to Service Booking', 'الحد الأدنى للوقت المطلوب لحجز الخدمة', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(209, 3, 'Minimum Time Required to Cancel', 'الحد الأدنى للوقت المطلوب للإلغاء', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(210, 3, 'Details', 'التفاصيل', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(211, 3, 'Service Visibility', 'ظهور الخدمة', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(212, 3, 'Service Info', 'معلومات الخدمة', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(213, 3, 'Add New Service', 'إضافة خدمة جديدة', '2022-04-15 11:50:31', '2022-04-15 11:50:31'),
(214, 3, 'Branch Info', 'معلومات الفرع', '2022-04-15 11:50:55', '2022-04-15 11:50:55'),
(215, 3, 'Branch name', 'اسم الفرع', '2022-04-15 11:50:55', '2022-04-15 11:50:55'),
(216, 3, 'Email address number', 'رقم عنوان البريد الإلكتروني', '2022-04-15 11:50:55', '2022-04-15 11:50:55'),
(217, 3, 'Order', 'الطلب', '2022-04-15 11:50:55', '2022-04-15 11:50:55'),
(218, 3, 'Order value', 'قيمة الطلب', '2022-04-15 11:50:55', '2022-04-15 11:50:55'),
(219, 3, 'Status', 'الحالة', '2022-04-15 11:50:55', '2022-04-15 11:50:55'),
(220, 3, 'Active', 'نشط', '2022-04-15 11:50:55', '2022-04-15 11:50:55'),
(221, 3, 'Inactive', 'غير نشط', '2022-04-15 11:50:55', '2022-04-15 11:50:55'),
(222, 3, 'Add New Branch', 'إضافة فرع جديد', '2022-04-15 11:50:56', '2022-04-15 11:50:56'),
(223, 3, 'Business Holiday', 'عطلة العمل', '2022-04-15 11:51:36', '2022-04-15 11:51:36'),
(224, 3, 'Business Hour Settings', 'إعدادات ساعات العمل', '2022-04-15 11:51:56', '2022-04-15 11:51:56'),
(225, 3, 'Sunday', 'الأحد', '2022-04-15 11:51:56', '2022-04-15 11:51:56'),
(226, 3, 'Is Weekly Holiday', 'هل هي عطلة أسبوعية', '2022-04-15 11:51:56', '2022-04-15 11:51:56'),
(227, 3, 'Company Settings', 'إعدادات الشركة', '2022-04-15 11:52:14', '2022-04-15 11:52:14'),
(228, 3, 'Company Name', 'اسم الشركة', '2022-04-15 11:52:14', '2022-04-15 11:52:14'),
(229, 3, 'Mobile', 'الجوال', '2022-04-15 11:52:14', '2022-04-15 11:52:14'),
(230, 3, 'Web Address', 'عنوان الموقع الإلكتروني', '2022-04-15 11:52:14', '2022-04-15 11:52:14'),
(231, 3, 'Department Info', 'معلومات القسم', '2022-04-15 11:52:24', '2022-04-15 11:52:24'),
(232, 3, 'Department name', 'اسم القسم', '2022-04-15 11:52:24', '2022-04-15 11:52:24'),
(233, 3, 'Add New Department', 'إضافة قسم جديد', '2022-04-15 11:52:24', '2022-04-15 11:52:24'),
(234, 3, 'Add Designation', 'إضافة فترة حجز', '2022-04-15 11:52:38', '2022-04-15 11:52:38'),
(235, 3, 'Designation name', 'اسم فترة الحجز', '2022-04-15 11:52:38', '2022-04-15 11:52:38'),
(236, 3, 'Designation Info', 'معلومات فترة الحجز', '2022-04-15 11:52:38', '2022-04-15 11:52:38'),
(237, 3, 'Add New Designation', 'إضافة فترة حجز جديد', '2022-04-15 11:52:38', '2022-04-15 11:52:38'),
(238, 3, 'Language Information', 'معلومات اللغة', '2022-04-15 11:52:52', '2022-04-15 11:52:52'),
(239, 3, 'Code', 'الرمز', '2022-04-15 11:52:52', '2022-04-15 11:52:52'),
(240, 3, 'Language List', 'قائمة اللغات', '2022-04-15 11:52:52', '2022-04-15 11:52:52'),
(241, 3, 'Translate', 'ترجمة', '2022-04-15 11:53:54', '2022-04-15 11:53:54'),
(242, 3, 'Complete Booking', 'إتمام الحجز', '2022-04-15 12:07:55', '2022-04-15 12:07:55'),
(243, 3, 'Cancel Booking', 'إلغاء الحجز', '2022-04-15 12:07:55', '2022-04-15 12:07:55'),
(244, 3, 'Pending & Other', 'قيد الانتظار وأخرى', '2022-04-15 12:07:55', '2022-04-15 12:07:55'),
(245, 3, 'Last 10 booking info', 'آخر 10 معلومات حجز', '2022-04-15 12:07:55', '2022-04-15 12:07:55'),
(246, 3, 'New Booking', 'حجز جديد', '2022-04-15 12:07:55', '2022-04-15 12:07:55'),
(247, 3, 'My Panel', 'لوحتي', '2022-04-15 12:07:56', '2022-04-15 12:07:56'),
(248, 3, 'All pending & other booking info', 'جميع معلومات الحجوزات قيد الانتظار والأخرى', '2022-04-15 12:08:23', '2022-04-15 12:08:23'),
(249, 3, 'User Info', 'معلومات المستخدم', '2022-04-15 12:08:25', '2022-04-15 12:08:25'),
(250, 3, 'Your Name', 'اسمك', '2022-04-15 12:08:25', '2022-04-15 12:08:25'),
(251, 3, 'Street number', 'رقم الشارع', '2022-04-15 12:08:25', '2022-04-15 12:08:25'),
(252, 3, 'State', 'الولاية', '2022-04-15 12:08:25', '2022-04-15 12:08:25'),
(253, 3, 'Current Password', 'كلمة المرور الحالية', '2022-04-15 12:18:46', '2022-04-15 12:18:46'),
(254, 3, 'New Password', 'كلمة المرور الجديدة', '2022-04-15 12:18:46', '2022-04-15 12:18:46'),
(255, 3, 'Confirm New Password', 'تأكيد كلمة المرور الجديدة', '2022-04-15 12:18:46', '2022-04-15 12:18:46'),
(256, 3, 'Role & Permission', 'الدور والصلاحيات', '2022-04-15 12:19:03', '2022-04-15 12:19:03'),
(257, 3, 'Add New Role', 'إضافة دور جديد', '2022-04-15 12:19:03', '2022-04-15 12:19:03'),
(258, 3, 'Role Name', 'اسم الدور', '2022-04-15 12:19:03', '2022-04-15 12:19:03'),
(259, 3, 'Save Role Permission', 'حفظ صلاحيات الدور', '2022-04-15 12:19:03', '2022-04-15 12:19:03'),
(260, 3, 'Menu List', 'قائمة القائمة', '2022-04-15 12:19:03', '2022-04-15 12:19:03'),
(261, 3, 'Select All', 'اختر الكل', '2022-04-15 12:19:03', '2022-04-15 12:19:03'),
(262, 3, 'click for edit', 'اضغط للتعديل', '2022-04-15 12:19:03', '2022-04-15 12:19:03'),
(263, 3, 'click to save', 'اضغط للحفظ', '2022-04-15 12:19:03', '2022-04-15 12:19:03'),
(264, 3, 'Role Info', 'معلومات الدور', '2022-04-15 12:19:14', '2022-04-15 12:19:14'),
(265, 3, 'Is Default Role', 'هل هو دور افتراضي', '2022-04-15 12:19:14', '2022-04-15 12:19:14'),
(266, 3, 'Role Information', 'معلومات الدور', '2022-04-15 12:19:14', '2022-04-15 12:19:14'),
(267, 3, 'Confirm Password', 'تأكيد كلمة المرور', '2022-04-15 12:19:24', '2022-04-15 12:19:24'),
(269, 3, 'Staff/Employee', 'الحجز/الحجوزات', '2022-04-15 12:19:24', '2022-04-15 12:19:24'),
(270, 3, 'User Branch', 'فرع المستخدم', '2022-04-15 12:19:25', '2022-04-15 12:19:25'),
(271, 3, 'User Information', 'معلومات المستخدم', '2022-04-15 12:19:25', '2022-04-15 12:19:25'),
(272, 3, 'Add New User', 'إضافة مستخدم جديد', '2022-04-15 12:19:25', '2022-04-15 12:19:25'),
(273, 3, 'Image Size 658x542', 'حجم الصورة 658x542', '2022-04-15 12:19:46', '2022-04-15 12:19:46'),
(274, 3, 'Title', 'العنوان', '2022-04-15 12:19:46', '2022-04-15 12:19:46'),
(275, 3, 'Is Active', 'نشط', '2022-04-15 12:19:46', '2022-04-15 12:19:46'),
(276, 3, 'Add New', 'إضافة جديد', '2022-04-15 12:19:46', '2022-04-15 12:19:46'),
(277, 3, 'General Settings', 'الإعدادات العامة', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(278, 3, 'App Name', 'اسم التطبيق', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(279, 3, 'Example', 'مثال', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(280, 3, 'Website Motto', 'شعار الموقع', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(281, 3, 'Theme Color', 'لون السمة', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(282, 3, 'Page Menu Color', 'لون قائمة الصفحة', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(283, 3, 'Theme Hover Color', 'لون التحويم على السمة', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(284, 3, 'Theme Active Color', 'لون السمة النشط', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(285, 3, 'Icon 32x32', 'أيقونة 32x32', '2022-04-15 12:19:55', '2022-04-15 12:19:55'),
(286, 3, 'Logo 212x60', 'شعار 212x60', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(287, 3, 'Background Image 1920x800', 'صورة الخلفية 1920x800', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(288, 3, 'Login Background 1920x1080', 'خلفية تسجيل الدخول 1920x1080', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(289, 3, 'Contact Info', 'معلومات الاتصال', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(290, 3, 'Social Media Link', 'روابط وسائل التواصل الاجتماعي', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(291, 3, 'Facebook Link', 'رابط الفيسبوك', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(292, 3, 'Youtube Link', 'رابط اليوتيوب', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(293, 3, 'Twitter Link', 'رابط التويتر', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(294, 3, 'Instagram Link', 'رابط الإنستغرام', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(295, 3, 'SEO Settings', 'إعدادات تحسين محركات البحث', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(296, 3, 'Meta Title', 'عنوان الميتا', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(297, 3, 'Meta Description', 'وصف الميتا', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(298, 3, 'Meta keywords', 'كلمات الميتا المفتاحية', '2022-04-15 12:19:56', '2022-04-15 12:19:56'),
(299, 3, 'Client Testimonial', 'شهادة العميل', '2022-04-15 12:20:06', '2022-04-15 12:20:06'),
(300, 3, 'Image Size 80x80', 'حجم الصورة 80x80', '2022-04-15 12:20:06', '2022-04-15 12:20:06'),
(301, 3, 'Client Name', 'اسم العميل', '2022-04-15 12:20:06', '2022-04-15 12:20:06'),
(302, 3, 'Description', 'الوصف', '2022-04-15 12:20:06', '2022-04-15 12:20:06'),
(303, 3, 'Rating', 'التقييم', '2022-04-15 12:20:06', '2022-04-15 12:20:06'),
(304, 3, 'Email Settings', 'إعدادات البريد الإلكتروني', '2022-04-15 12:20:18', '2022-04-15 12:20:18'),
(305, 3, 'Mailer', 'برنامج البريد', '2022-04-15 12:20:18', '2022-04-15 12:20:18'),
(306, 3, 'Host', 'المضيف', '2022-04-15 12:20:18', '2022-04-15 12:20:18'),
(307, 3, 'Port', 'المنفذ', '2022-04-15 12:20:18', '2022-04-15 12:20:18'),
(308, 3, 'Username/email', 'اسم المستخدم/البريد الإلكتروني', '2022-04-15 12:20:18', '2022-04-15 12:20:18'),
(309, 3, 'Force add new configuration', 'فرض إضافة إعداد جديد', '2022-04-15 12:20:18', '2022-04-15 12:20:18'),
(310, 3, 'At first try to update, if not update then check force update. Don\'t try before update.', 'حاول التحديث أولاً، إذا لم يتم التحديث فحاول فرض التحديث. لا تحاول قبل التحديث.', '2022-04-15 12:20:19', '2022-04-15 12:20:19'),
(311, 3, 'Question', 'السؤال', '2022-04-15 12:20:31', '2022-04-15 12:20:31'),
(312, 3, 'Answer', 'الإجابة', '2022-04-15 12:20:31', '2022-04-15 12:20:31'),
(313, 3, 'Order/Serial', 'الترتيب/التسلسل', '2022-04-15 12:20:31', '2022-04-15 12:20:31'),
(314, 3, 'FAQ List', 'قائمة الأسئلة الشائعة', '2022-04-15 12:20:31', '2022-04-15 12:20:31'),
(315, 3, 'Add New FAQ', 'إضافة سؤال شائع جديد', '2022-04-15 12:20:31', '2022-04-15 12:20:31'),
(316, 3, 'Google Map Settings', 'إعدادات خرائط جوجل', '2022-04-15 12:20:54', '2022-04-15 12:20:54'),
(317, 3, 'Lat', 'خط العرض', '2022-04-15 12:20:54', '2022-04-15 12:20:54'),
(318, 3, 'Long', 'خط الطول', '2022-04-15 12:20:54', '2022-04-15 12:20:54'),
(319, 3, 'Map Key', 'مفتاح الخريطة', '2022-04-15 12:20:54', '2022-04-15 12:20:54'),
(320, 3, 'Photo Gallery', 'معرض الصور', '2022-04-15 12:20:56', '2024-09-16 15:54:50'),
(321, 3, 'Photo Gallary', 'معرض الصور', '2022-04-15 12:20:56', '2022-04-15 12:20:56'),
(322, 3, 'Active Terms & Conditions', 'تفعيل الشروط والأحكام', '2022-04-15 12:21:06', '2022-04-15 12:21:06'),
(323, 3, 'Website Menu', 'قائمة الموقع', '2022-04-15 12:21:17', '2022-04-15 12:21:17'),
(324, 3, 'Menu Under', 'القائمة تحت', '2022-04-15 12:21:17', '2022-04-15 12:21:17'),
(325, 3, 'Menu Name', 'اسم القائمة', '2022-04-15 12:21:17', '2022-04-15 12:21:17'),
(326, 3, 'Route', 'المسار', '2022-04-15 12:21:17', '2022-04-15 12:21:17'),
(327, 3, 'Route Name', 'اسم المسار', '2022-04-15 12:21:17', '2022-04-15 12:21:17'),
(328, 3, 'Add New Menu', 'إضافة قائمة جديدة', '2022-04-15 12:21:17', '2022-04-15 12:21:17'),
(329, 3, 'Dashboard', 'لوحة التحكم', '2022-04-15 12:22:44', '2022-04-15 12:22:44'),
(330, 3, 'Main Dashboard', 'لوحة التحكم الرئيسية', '2022-04-15 12:22:44', '2022-04-15 12:22:44'),
(331, 3, 'User Management', 'إدارة المستخدمين', '2022-04-15 12:22:44', '2022-04-15 12:22:44'),
(332, 3, 'Role Permission', 'صلاحيات الدور', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(333, 3, 'Settings', 'الإعدادات', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(334, 3, 'Department', 'القسم', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(335, 3, 'Company', 'الشركة', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(336, 3, 'Business Hour', 'ساعات العمل', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(337, 3, 'Language', 'اللغة', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(338, 3, 'Staff / Employee', 'الحجز/الحجوزات', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(339, 3, 'Staff Manage', 'إدارة الحجوزات', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(340, 3, 'Service Booking', 'حجز الخدمة', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(341, 3, 'Payment', 'الدفع', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(342, 3, 'Payment Setup', 'إعداد الدفع', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(343, 3, 'Appearance', 'المظهر', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(344, 3, 'Email Configuration', 'إعدادات البريد الإلكتروني', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(345, 3, 'Google Map', 'خرائط جوجل', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(346, 3, 'Terms & Condition', 'الشروط والأحكام', '2022-04-15 12:22:45', '2022-04-15 12:22:45'),
(347, 3, 'Appointment Booking', 'حجز موعد', '2022-04-15 23:50:01', '2022-04-15 23:50:01'),
(348, 3, 'Call for any Emergency Support!', 'اتصل للحصول على دعم طارئ!', '2022-04-15 23:50:01', '2022-04-15 23:50:01'),
(349, 3, 'Service Remarks', 'ملاحظات الخدمة', '2022-04-15 23:50:02', '2022-04-15 23:50:02'),
(350, 3, 'Your service booking is completed & service is under processing, Check your email.', 'تم إكمال حجز خدمتك والخدمة قيد المعالجة، تحقق من بريدك الإلكتروني.', '2022-04-15 23:50:02', '2022-04-15 23:50:02'),
(351, 3, 'Vouchers', 'القسائم', '2024-09-14 17:30:17', '2024-09-14 17:30:17'),
(352, 3, 'Our Photo Gallery', 'معرض الصور الخاص بنا', '2024-09-14 17:30:36', '2024-09-14 17:30:36'),
(353, 3, 'Sign in', 'تسجيل الدخول', '2024-09-14 17:30:43', '2024-09-14 17:30:43'),
(354, 3, 'Sign up', 'إنشاء حساب', '2024-09-14 17:30:47', '2024-09-14 17:30:47'),
(355, 3, 'Email Or Username', 'البريد الإلكتروني أو اسم المستخدم', '2024-09-14 17:30:47', '2024-09-14 17:30:47'),
(356, 3, 'Salary', '', '2024-09-16 07:38:15', '2024-09-16 07:38:15'),
(357, 3, 'E-Commerce', 'التجارة الإلكترونية', '2024-09-16 07:38:15', '2024-09-16 07:38:15'),
(358, 3, 'Coupon', 'القسيمة', '2024-09-16 07:38:15', '2024-09-16 07:38:15'),
(359, 3, 'Order Info', 'معلومات الطلب', '2024-09-16 07:38:15', '2024-09-16 07:38:15'),
(360, 3, 'Product', 'المنتج', '2024-09-16 07:38:15', '2024-09-16 07:38:15'),
(361, 3, 'OTP', 'رمز التحقق', '2024-09-16 07:38:15', '2024-09-16 07:38:15'),
(362, 3, 'Twilio Configuration', 'إعدادات Twilio', '2024-09-16 07:38:15', '2024-09-16 07:38:15'),
(363, 3, 'OTP Customization', 'تخصيص رمز التحقق', '2024-09-16 07:38:15', '2024-09-16 07:38:15'),
(364, 3, 'Default Language', 'اللغة الافتراضية', '2024-09-16 07:40:20', '2024-09-16 07:40:20'),
(365, 3, 'Phone number', 'رقم الهاتف', '2024-09-16 07:41:44', '2024-09-16 07:41:44'),
(366, 3, '24/7 ABOUT US', 'عنا على مدار 24/7', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(367, 3, '24/7 Hours online booking', 'الحجز عبر الإنترنت على مدار 24/7', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(368, 3, 'Expertise staffs', 'موظفون ذو خبرة', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(369, 3, 'On time service delivery', 'تقديم الخدمة في الوقت المحدد', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(370, 3, 'Top quality services', 'خدمات عالية الجودة', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(371, 3, 'See our services', 'شاهد خدماتنا', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(372, 3, 'Contact with us', 'تواصل معنا', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(373, 3, 'OUR SPECIALIST', 'أخصائينا', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(374, 3, 'Meet Our Specialist', 'التق بأخصائينا', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(375, 3, 'OUR CLIENTS', 'عملاؤنا', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(376, 3, 'Valuable Clients Comments', 'تعليقات العملاء القيمة', '2024-09-16 09:23:47', '2024-09-16 09:23:47'),
(377, 3, 'For any query contact us by email or phone', 'لأي استفسار، تواصل معنا عبر البريد الإلكتروني أو الهاتف', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(378, 3, 'Call us in Office time only', 'اتصل بنا في أوقات العمل فقط', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(379, 3, 'Send your query anytime!', 'أرسل استفسارك في أي وقت!', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(380, 3, 'Your Full Name', 'اسمك الكامل', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(381, 3, 'Your Email Address', 'عنوان بريدك الإلكتروني', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(382, 3, 'Your Query Topic/Subject', 'موضوع/عنوان استفسارك', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(383, 3, 'Your Message', 'رسالتك', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(384, 3, 'Send Mail', 'إرسال البريد', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(385, 3, 'Our Map Location', 'موقعنا على الخريطة', '2024-09-16 09:24:26', '2024-09-16 09:24:26'),
(386, 3, 'Book An Appointment', 'حجز موعد', '2024-09-16 09:24:26', '2024-09-16 15:54:50'),
(387, 3, 'Total Services', 'مجموع الخدمات', '2024-09-16 09:24:26', '2024-09-16 15:54:50'),
(388, 3, 'Expertise Staffs', 'طاقم الخبراء', '2024-09-16 09:24:26', '2024-09-16 15:54:50'),
(389, 1, 'Book An Appointment', 'Book An Appointment', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(390, 1, 'Total Services', 'Total Services', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(391, 1, 'Expertise Staffs', 'Expertise Staffs', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(392, 1, 'Satisfied Clients', 'Satisfied Clients', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(393, 1, 'Done Services', 'Done Services', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(394, 1, 'Available Our Top and Popular Services', 'Available Our Top and Popular Services', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(395, 1, 'We calculate top services based on our client feedback and number of provided services.', 'We calculate top services based on our client feedback and number of provided services.', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(396, 1, 'Recently Joined New Team Members Us', 'Recently Joined New Team Members Us', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(397, 1, 'We are offering, you can take service from our new team member, hope they will provide to you best services.', 'We are offering, you can take service from our new team member, hope they will provide to you best services.', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(398, 1, 'Book Now', 'Book Now', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(399, 1, 'Valuable Clients Testimonials', 'Valuable Clients Testimonials', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(400, 1, 'We got testimonials from our valued clients both online and offline and they are very much happy.', 'We got testimonials from our valued clients both online and offline and they are very much happy.', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(401, 1, 'Sign Up', 'Sign Up', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(402, 1, 'Sign In', 'Sign In', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(403, 1, 'Home', 'Home', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(404, 1, 'Service', 'Service', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(405, 1, 'Photo Gallery', 'Photo Gallery', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(406, 1, 'FAQ', 'FAQ', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(407, 3, 'About Us', 'حولنا', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(408, 1, 'Contact Us', 'Contact Us', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(409, 1, 'About Service', 'About Service', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(410, 1, 'Website Navigation Links', 'Website Navigation Links', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(411, 1, 'Terms & Conditions', 'Terms & Conditions', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(412, 1, 'Contact Information', 'Contact Information', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(413, 1, 'Phone', 'Phone', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(414, 1, 'Email to', 'Email to', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(415, 1, 'Website', 'Website', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(416, 1, 'Address', 'Address', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(417, 1, 'Payment Method', 'Payment Method', '2024-09-16 15:47:26', '2024-09-16 15:47:26'),
(418, 1, 'Appointment Booking', 'Appointment Booking', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(419, 1, 'Call for any Emergency Support!', 'Call for any Emergency Support!', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(420, 1, 'Branch', 'Branch', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(421, 1, 'Category', 'Category', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(422, 1, 'Staff', 'Reservations', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(423, 1, 'Service Date', 'Service Date', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(424, 3, 'Add more service', 'أضف الحجز الان', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(425, 3, 'SL', 'ت', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(426, 1, 'Date', 'Date', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(427, 3, 'Time', 'الوقت', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(428, 3, 'Fee', 'المبلغ', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(429, 3, 'Opt', 'اعدادات', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(430, 1, 'Details', 'Details', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(431, 1, 'Full Name', 'إسمك كاملا', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(432, 1, 'Email', 'Email', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(433, 1, 'State', 'State', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(434, 1, 'City', 'City', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(435, 1, 'Postal Code', 'Postal Code', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(436, 1, 'Street Address', 'Street Address', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(437, 1, 'Service Remarks', 'Service Remarks', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(438, 3, 'Pay', 'الدفع', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(439, 3, 'Order Summary', 'ملخص الطلب', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(440, 3, 'Subtotal', 'المجموع', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(441, 3, 'Discount', 'الخصم', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(442, 3, 'Apply Coupon Code', 'استخدم رمز القسيمة', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(443, 3, 'Apply Coupon', 'فعل القسيمة', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(444, 3, 'Total Amount', 'المجموع النهائي', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(445, 1, 'Done', 'Done', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(446, 1, 'Your service booking is completed & service is under processing, Check your email.', 'Your service booking is completed & service is under processing, Check your email.', '2024-09-16 16:29:02', '2024-09-16 16:29:02'),
(447, 1, 'Learn More', 'Learn More', '2024-09-17 12:02:46', '2024-09-17 12:02:46'),
(448, 1, 'Welcome back', 'Welcome back', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(449, 1, 'Please sign in to your account.', 'Please sign in to your account.', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(450, 1, 'No account', 'No account', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(451, 1, 'Sign up', 'Sign up', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(452, 1, 'now', 'now', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(453, 1, 'Email Or Username', 'Email Or Username', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(454, 1, 'Password', 'Password', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(455, 1, 'Remember Me', 'Remember Me', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(456, 3, 'Click to Login', 'دخول', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(457, 1, 'Forgot Your Password?', 'Forgot Your Password?', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(458, 1, 'Go to Website', 'Go to Website', '2024-09-17 15:21:29', '2024-09-17 15:21:29'),
(459, 1, 'Our Services', 'Our Services', '2024-09-17 15:23:05', '2024-09-17 15:23:05'),
(460, 1, 'Available Our Services', 'Available Our Services', '2024-09-17 15:23:05', '2024-09-17 15:23:05'),
(461, 1, 'All available services of our all branches you can choose any service based on your need.', 'All available services of our all branches you can choose any service based on your need.', '2024-09-17 15:23:05', '2024-09-17 15:23:05'),
(462, 1, 'Total Service Time', 'Total Service Time', '2024-09-17 15:23:05', '2024-09-17 15:23:05'),
(463, 1, 'Service Limit', 'Service Limit', '2024-09-17 15:23:05', '2024-09-17 15:23:05'),
(464, 1, 'Price per service', 'Price per service', '2024-09-17 15:23:05', '2024-09-17 15:23:05'),
(465, 1, 'Our Photo Gallery', 'Our Photo Gallery', '2024-09-17 15:23:08', '2024-09-17 15:23:08'),
(466, 1, 'Welcome to', 'Welcome to', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(467, 1, 'It only takes a few seconds to create your account', 'It only takes a few seconds to create your account', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(468, 1, 'Email address', 'Email address', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(469, 1, 'User Name', 'User Name', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(470, 1, 'Name', 'Name', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(471, 1, 'Name here', 'Name here', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(472, 3, 'Password here', 'ضع كلمة المرور هنا', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(473, 1, 'Repeat Password', 'Repeat Password', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(474, 1, 'Repeat Password here', 'Repeat Password here', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(475, 1, 'Terms and Conditions', 'Terms and Conditions', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(476, 1, 'Already have an account', 'Already have an account', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(477, 1, 'Sign in', 'Sign in', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(478, 1, 'Create Account', 'Create Account', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(479, 1, 'Product Add', 'Product Add', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(480, 1, 'Type', 'Type', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(481, 1, 'Product', 'Product', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(482, 1, 'Voucher', 'Voucher', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(483, 1, 'Thumbnail', 'Thumbnail', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(484, 1, 'Voucher Value', 'Voucher Value', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(485, 1, 'Value', 'Value', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(486, 1, 'Discount %', 'Discount %', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(487, 1, 'Quantity', 'Quantity', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(488, 1, 'Status', 'Status', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(489, 1, 'Enable', 'Enable', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(490, 1, 'Disable', 'Disable', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(491, 1, 'Close', 'Close', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(492, 1, 'Save Change', 'Save Change', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(493, 1, 'Product Informaton', 'Product Informaton', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(494, 1, 'Add New Product', 'Add New Product', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(495, 1, 'Search', 'Search', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(496, 1, 'Messages', 'Messages', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(497, 1, 'Mark all as read', 'Mark all as read', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(498, 1, 'See all messages', 'See all messages', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(499, 1, 'You have 4 new notification', 'You have 4 new notification', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(500, 1, 'Notification 1', 'Notification 1', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(501, 1, '5 minutes ago', '5 minutes ago', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(502, 1, 'See all notifications', 'See all notifications', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(503, 1, 'Quick Actions', 'Quick Actions', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(504, 1, 'Shortcuts', 'Shortcuts', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(505, 3, 'All available services of our all branches you can choose any service based on your need.', 'جميع الخدمات المتوفرة في كافة ملاعبنا يمكنك اختيار أي خدمة حسب احتياجاتك.', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(506, 1, 'Booking Information', 'Booking Information', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(507, 1, 'Create New Customer', 'Create New Customer', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(508, 1, 'Change Photo', 'Change Photo', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(509, 1, 'Change Password', 'Change Password', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(510, 1, 'Logout', 'Logout', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(511, 1, 'Dashboard', 'Dashboard', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(512, 1, 'Main Dashboard', 'Main Dashboard', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(513, 1, 'User Management', 'User Management', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(514, 1, 'User Info', 'User Info', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(515, 1, 'Role Info', 'Role Info', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(516, 1, 'Role Permission', 'Role Permission', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(517, 1, 'Settings', 'Settings', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(518, 1, 'Department', 'Department', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(519, 1, 'Designation', 'Designation', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(520, 1, 'Company', 'Company', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(521, 1, 'Business Hour', 'Business Hour', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(522, 1, 'Business Holiday', 'Business Holiday', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(523, 1, 'Language', 'Language', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(524, 1, 'Staff / Employee', 'Reservations', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(525, 1, 'Staff Manage', 'Reservations Manage', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(526, 1, 'Salary', 'Salary', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(527, 1, 'Customer', 'Customer', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(528, 1, 'Add Customer', 'Add Customer', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(529, 1, 'Service Booking', 'Service Booking', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(530, 1, 'Booking Info', 'Booking Info', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(531, 1, 'Payment', 'Payment', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(532, 1, 'Payment Setup', 'Payment Setup', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(533, 1, 'Website Menu', 'Website Menu', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(534, 1, 'Appearance', 'Appearance', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(535, 1, 'Client Testimonial', 'Client Testimonial', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(536, 1, 'Email Configuration', 'Email Configuration', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(537, 1, 'Google Map', 'Google Map', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(538, 1, 'Terms & Condition', 'Terms & Condition', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(539, 1, 'E-Commerce', 'E-Commerce', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(540, 1, 'Coupon', 'Coupon', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(541, 1, 'Order Info', 'Order Info', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(542, 1, 'OTP', 'OTP', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(543, 1, 'Twilio Configuration', 'Twilio Configuration', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(544, 1, 'OTP Customization', 'OTP Customization', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(545, 1, 'Currency Setup', 'Currency Setup', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(546, 1, 'Local Payment', 'Local Payment', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(547, 1, 'Paypal Payment', 'Paypal Payment', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(548, 1, 'Paypal Config', 'Paypal Config', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(549, 1, 'Client ID', 'Client ID', '2024-09-17 15:50:12', '2024-09-17 15:50:12');
INSERT INTO `cmn_translations` (`id`, `cmn_language_id`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(550, 1, 'Client Secret', 'Client Secret', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(551, 1, 'Charge Type', 'Charge Type', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(552, 1, 'Charge Percentage', 'Charge Percentage', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(553, 1, 'Enable Sandbox', 'Enable Sandbox', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(554, 1, 'Stripe Config', 'Stripe Config', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(555, 1, 'Enable Stripe Payment', 'Enable Stripe Payment', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(556, 1, 'API Key', 'API Key', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(557, 1, 'API Secret', 'API Secret', '2024-09-17 15:50:12', '2024-09-17 15:50:12'),
(558, 1, 'General Settings', 'General Settings', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(559, 1, 'App Name', 'App Name', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(560, 1, 'Example', 'Example', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(561, 1, 'Website Motto', 'Website Motto', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(562, 1, 'Theam Color', 'Theam Color', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(563, 1, 'Page Menu Color', 'Page Menu Color', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(564, 1, 'Theam Hover Color', 'Theam Hover Color', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(565, 1, 'Theam Active Color', 'Theam Active Color', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(566, 1, 'Icon 32x32', 'Icon 32x32', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(567, 1, 'Logo 212x60', 'Logo 212x60', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(568, 1, 'Background Image 1920x800', 'Background Image 1920x800', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(569, 1, 'Login Background 1920x1080', 'Login Background 1920x1080', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(570, 1, 'Contact Info', 'Contact Info', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(571, 1, 'Social Media Link', 'Social Media Link', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(572, 1, 'Facebook Link', 'Facebook Link', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(573, 1, 'Youtube Link', 'Youtube Link', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(574, 1, 'Twitter Link', 'Twitter Link', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(575, 1, 'Instagram Link', 'Instagram Link', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(576, 1, 'SEO Settings', 'SEO Settings', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(577, 1, 'Meta Title', 'Meta Title', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(578, 1, 'Meta Description', 'Meta Description', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(579, 1, 'Meta keywords', 'Meta keywords', '2024-09-17 15:50:35', '2024-09-17 15:50:35'),
(580, 1, 'Image Size 658x542', 'Image Size 658x542', '2024-09-17 15:50:52', '2024-09-17 15:50:52'),
(581, 1, 'Title', 'Title', '2024-09-17 15:50:52', '2024-09-17 15:50:52'),
(582, 1, 'Order', 'Order', '2024-09-17 15:50:52', '2024-09-17 15:50:52'),
(583, 1, 'Is Active', 'Is Active', '2024-09-17 15:50:52', '2024-09-17 15:50:52'),
(584, 1, 'Add New', 'Add New', '2024-09-17 15:50:52', '2024-09-17 15:50:52'),
(585, 1, 'Google Map Settings', 'Google Map Settings', '2024-09-17 15:51:05', '2024-09-17 15:51:05'),
(586, 1, 'Lat', 'Lat', '2024-09-17 15:51:05', '2024-09-17 15:51:05'),
(587, 1, 'Long', 'Long', '2024-09-17 15:51:05', '2024-09-17 15:51:05'),
(588, 1, 'Map Key', 'Map Key', '2024-09-17 15:51:05', '2024-09-17 15:51:05'),
(589, 1, 'Photo Gallary', 'Photo Gallary', '2024-09-17 15:51:18', '2024-09-17 15:51:18'),
(590, 1, 'Active Terms & Conditions', 'Active Terms & Conditions', '2024-09-17 15:51:32', '2024-09-17 15:51:32'),
(591, 1, 'Appointment Booking Dashboard', 'Appointment Booking Dashboard', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(592, 1, 'Add New Booking', 'Add New Booking', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(593, 1, 'Total Done', 'Total Done', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(594, 1, 'Total Cancel', 'Total Cancel', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(595, 1, 'Total Approved', 'Total Approved', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(596, 1, 'Processing & Pending', 'Processing & Pending', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(597, 1, 'Today\'s Service statistics', 'Today\'s Service statistics', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(598, 1, 'Show all service statistics based on user branch permission.', 'Show all service statistics based on user branch permission.', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(599, 1, 'Total', 'Total', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(600, 1, 'Cancel', 'Cancel', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(601, 1, 'Approved', 'Approved', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(602, 1, 'Processing', 'Processing', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(603, 1, 'Pending', 'Pending', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(604, 1, 'Today\'s Income & Other Statistics', 'Today\'s Income & Other Statistics', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(605, 1, 'Total Income', 'Total Income', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(606, 1, 'Total Due', 'Total Due', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(607, 1, 'Total Cash Payment', 'Total Cash Payment', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(608, 1, 'Total Online Payment', 'Total Online Payment', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(609, 1, 'Today', 'Today', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(610, 1, 'Month', 'Month', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(611, 1, 'Top Booking Service', 'Top Booking Service', '2024-09-17 15:52:16', '2024-09-17 15:52:16'),
(612, 1, 'Add mutiple:', 'Add mutiple:', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(613, 1, 'Yes', 'Yes', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(614, 1, 'No', 'No', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(615, 1, 'Previous day', 'Previous day', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(616, 1, 'Next day', 'Next day', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(617, 1, 'Preview', 'Preview', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(618, 1, 'Load', 'Load', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(619, 1, 'Total Booking', 'Total Booking', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(620, 1, 'Add Schedule', 'Add Schedule', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(621, 1, 'Add/Edit Service', 'Add/Edit Service', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(622, 1, 'Select One', 'إختر واحداً', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(623, 1, 'Total Amount:', 'Total Amount:', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(624, 1, 'Discount Amount:', 'Discount Amount:', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(625, 1, 'Payable Amount:', 'Payable Amount:', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(626, 1, 'Payment By', 'Payment By', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(627, 1, 'Paid Amount', 'Paid Amount', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(628, 1, 'Paid/Unpaid', 'Paid/Unpaid', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(629, 1, 'Application Status', 'Application Status', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(630, 1, 'Remarks', 'Remarks', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(631, 1, 'Send booking notification by email', 'Send booking notification by email', '2024-09-17 15:52:33', '2024-09-17 15:52:33'),
(632, 1, 'Customer Info', 'Customer Info', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(633, 1, 'Customer Name', 'Customer Name', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(634, 1, 'Full name', 'Full name', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(635, 1, 'System User', 'System User', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(636, 1, 'Customer Phone', 'Customer Phone', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(637, 1, 'Phone Number', 'Phone Number', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(638, 1, 'Date of Birth', 'Date of Birth', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(639, 1, 'Country', 'Country', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(640, 1, 'State Name', 'State Name', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(641, 1, 'Customer Information', 'Customer Information', '2024-09-17 15:52:43', '2024-09-17 15:52:43'),
(642, 1, 'Add New Customer', 'Add New Customer', '2024-09-17 15:52:43', '2024-09-17 15:52:43'),
(643, 1, 'Add or update off day', 'Add or update off day', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(644, 1, 'Subject', 'Subject', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(645, 1, 'Start date', 'Start date', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(646, 1, 'End date', 'End date', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(647, 1, 'Edit', 'Edit', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(648, 1, 'Delete', 'Delete', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(649, 3, 'Staff / Employee Info', 'معلومات الحجز', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(650, 1, 'Basic Profile', 'Basic Profile', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(651, 1, 'Available Service', 'Available Service', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(652, 1, 'Service Time', 'Service Time', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(653, 1, 'Day Off', 'Day Off', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(654, 1, 'Image', 'Image', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(655, 3, 'Staff Name', 'اسم الحجز', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(656, 3, 'Staff/Employee Name', 'اسم الحجز', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(657, 3, 'Staff ID', 'رقم الحجز', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(658, 1, 'Staff/Employee ID', 'Reservations ID', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(659, 1, 'Phone No', 'Phone No', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(660, 3, 'Email Address', 'البريد الالكتروني', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(661, 1, 'Monthly Salary', 'Monthly Salary', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(662, 1, 'Commission per service', 'Commission per service', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(663, 1, 'Commission based on', 'Commission based on', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(664, 1, 'Target service amount', 'Target service amount', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(665, 1, 'service', 'service', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(666, 1, 'Gender', 'Gender', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(667, 1, 'Date Of Birth', 'Date Of Birth', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(668, 1, 'Specialist', 'Specialist', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(669, 1, 'Present Address', 'Present Address', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(670, 1, 'Permanent Address', 'Permanent Address', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(671, 1, 'Note', 'Note', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(672, 1, 'ID Card', 'ID Card', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(673, 1, 'Passport', 'Passport', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(674, 1, 'Visibility Status', 'Visibility Status', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(675, 1, 'Day', 'Day', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(676, 1, 'Start Time', 'Start Time', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(677, 1, 'End Time', 'End Time', '2024-09-17 16:00:15', '2024-09-17 16:00:15'),
(678, 1, 'Break Start', 'Break Start', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(679, 1, 'Break End', 'Break End', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(680, 1, 'Weekly Holiday', 'Weekly Holiday', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(681, 1, 'Monday', 'Monday', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(682, 1, 'Tuesday', 'Tuesday', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(683, 1, 'Wednesday', 'Wednesday', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(684, 1, 'Thursday', 'Thursday', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(685, 1, 'Friday', 'Friday', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(686, 1, 'Saturday', 'Saturday', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(687, 1, 'Staff Info', 'Reservations Info', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(688, 1, 'Add New Staff', 'Add New Reservations', '2024-09-17 16:00:16', '2024-09-17 16:00:16'),
(689, 1, 'Date From', 'Date From', '2024-09-17 16:00:48', '2024-09-17 16:00:48'),
(690, 1, 'Date To', 'Date To', '2024-09-17 16:00:48', '2024-09-17 16:00:48'),
(691, 1, 'Employee', 'reservation', '2024-09-17 16:00:48', '2024-09-17 16:00:48'),
(692, 1, 'Service Status', 'Service Status', '2024-09-17 16:00:48', '2024-09-17 16:00:48'),
(693, 1, 'Booking No', 'Booking No', '2024-09-17 16:00:48', '2024-09-17 16:00:48'),
(694, 1, 'Filter', 'Filter', '2024-09-17 16:00:48', '2024-09-17 16:00:48'),
(695, 1, 'Booking No#', 'Booking No#', '2024-09-17 16:00:48', '2024-09-17 16:00:48'),
(696, 1, 'Send notification by email', 'Send notification by email', '2024-09-17 16:00:48', '2024-09-17 16:00:48'),
(697, 1, 'Category Info', 'Category Info', '2024-09-17 16:04:11', '2024-09-17 16:04:11'),
(698, 1, 'Category name', 'Category name', '2024-09-17 16:04:11', '2024-09-17 16:04:11'),
(699, 1, 'Add New Category', 'Add New Category', '2024-09-17 16:04:11', '2024-09-17 16:04:11'),
(700, 1, 'Branch Info', 'Branch Info', '2024-09-17 16:04:22', '2024-09-17 16:04:22'),
(701, 1, 'Branch name', 'Branch name', '2024-09-17 16:04:22', '2024-09-17 16:04:22'),
(702, 1, 'Phone number', 'Phone number', '2024-09-17 16:04:22', '2024-09-17 16:04:22'),
(703, 1, 'Email address number', 'Email address number', '2024-09-17 16:04:22', '2024-09-17 16:04:22'),
(704, 1, 'Order value', 'Order value', '2024-09-17 16:04:22', '2024-09-17 16:04:22'),
(705, 1, 'Active', 'Active', '2024-09-17 16:04:22', '2024-09-17 16:04:22'),
(706, 1, 'Inactive', 'Inactive', '2024-09-17 16:04:22', '2024-09-17 16:04:22'),
(707, 1, 'Add New Branch', 'Add New Branch', '2024-09-17 16:04:22', '2024-09-17 16:04:22'),
(708, 1, 'User name', 'User name', '2024-09-17 17:38:43', '2024-09-17 17:38:43'),
(709, 1, 'Confirm Password', 'Confirm Password', '2024-09-17 17:38:43', '2024-09-17 17:38:43'),
(710, 1, 'User Role', 'User Role', '2024-09-17 17:38:43', '2024-09-17 17:38:43'),
(711, 1, 'Staff/Employee', 'Reservations', '2024-09-17 17:38:43', '2024-09-17 17:38:43'),
(712, 1, 'User Branch', 'User Branch', '2024-09-17 17:38:43', '2024-09-17 17:38:43'),
(713, 1, 'User Information', 'User Information', '2024-09-17 17:38:43', '2024-09-17 17:38:43'),
(714, 1, 'Add New User', 'Add New User', '2024-09-17 17:38:43', '2024-09-17 17:38:43'),
(715, 1, 'Salary Info', 'Salary Info', '2024-09-17 17:59:08', '2024-09-17 17:59:08'),
(716, 1, 'Year', 'Year', '2024-09-17 17:59:08', '2024-09-17 17:59:08'),
(717, 1, 'All Employees', 'All Employees', '2024-09-17 17:59:08', '2024-09-17 17:59:08'),
(718, 1, 'Download', 'Download', '2024-09-17 17:59:08', '2024-09-17 17:59:08'),
(719, 1, 'Preview Salary Sheet', 'Preview Salary Sheet', '2024-09-17 17:59:08', '2024-09-17 17:59:08'),
(720, 1, 'Save Changes', 'Save Changes', '2024-09-17 17:59:08', '2024-09-17 17:59:08'),
(721, 1, 'Pay', 'Pay', '2024-09-19 05:38:08', '2024-09-19 05:38:08'),
(722, 1, 'Reservations Info', 'Reservations Info', '2024-09-19 05:54:58', '2024-09-19 05:54:58'),
(723, 1, 'Reservations Name', 'Reservations Name', '2024-09-19 06:00:19', '2024-09-19 06:00:19'),
(724, 1, 'Reservations ID', 'Reservations ID', '2024-09-19 06:01:19', '2024-09-19 06:01:19'),
(725, 1, 'Service Details', 'Service Details', '2024-09-19 06:42:22', '2024-09-19 06:42:22'),
(726, 1, 'About', 'About', '2024-09-19 06:42:22', '2024-09-19 06:42:22'),
(727, 1, 'Available Our Popular Services', 'Available Our Popular Services', '2024-09-19 06:42:22', '2024-09-19 06:42:22'),
(728, 1, 'Our new available playgrounds', 'Our new available playgrounds', '2024-09-19 06:54:09', '2024-09-19 06:54:09'),
(729, 1, 'Language Information', 'Language Information', '2024-09-19 07:19:48', '2024-09-19 07:19:48'),
(730, 1, 'Code', 'Code', '2024-09-19 07:19:48', '2024-09-19 07:19:48'),
(731, 1, 'Default Language', 'Default Language', '2024-09-19 07:19:48', '2024-09-19 07:19:48'),
(732, 1, 'Language List', 'Language List', '2024-09-19 07:19:48', '2024-09-19 07:19:48'),
(733, 3, 'Previous', 'السابق', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(734, 3, ' Accept our', 'اوافق على', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(735, 3, 'Frequently Asked Questions', 'الاسئلة الشائعة', '2024-09-17 15:52:42', '2024-09-17 15:52:42'),
(736, 3, 'Our Services', 'خدماتنا', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(737, 3, 'Available Our Services', 'خدماتنا المتاحة لعملائنا', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(738, 3, 'Example service description.', 'وصف الخدمة يظهر هنا ...', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(739, 3, 'Total Service Time', 'اجمالي وقت الخدمة', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(740, 3, 'minute', 'دقيقة', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(741, 3, 'Service Limit Weekly', 'حد الخدمة اسبوعيا', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(742, 3, 'Price per service', 'السعر لكل خدمة كحد اقصى', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(743, 3, 'Online booking available', 'الحجز متاح عبر الإنترنت', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(744, 3, 'Sunday', 'الاحد', '2022-04-15 11:52:38', '2022-04-15 11:52:38'),
(745, 3, 'Service Limit', 'الحد الاقصى اليومي', '2022-04-15 11:52:38', '2022-04-15 11:52:38'),
(746, 3, 'Unlimited', 'مفتوح', '2022-04-15 11:52:38', '2022-04-15 11:52:38'),
(747, 3, 'Click to Login', 'دخول', '2024-09-17 15:49:51', '2024-09-17 15:49:51'),
(748, 3, 'Password here', 'ضع كلمة المرور هنا', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(749, 3, 'All done booking info', 'كل الحجوزات المكتملة', '2024-09-17 15:25:12', '2024-09-17 15:25:12'),
(750, 3, 'Your Orders Details', 'كل تفاصيل الطلبات', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(751, 3, 'Your Orders', 'طلباتك', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(752, 3, 'Street address', 'عنوان الشارع', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(753, 3, 'Profile', 'حسابي', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(754, 3, 'Pending Booking', 'الطلبات المعلقة', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(755, 3, 'Done Booking', 'الطلبات الموافق عليها', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(756, 3, 'Orders', 'الطلبات', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(757, 3, 'Sign Out', 'تسجيل خروج', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(758, 3, 'Price', 'السعر', '2024-09-17 15:23:05', '2024-09-17 15:23:05'),
(759, 3, 'Verify Your Email Address', 'التحقق من عنوان بريدك الإلكتروني', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(760, 3, 'Before proceeding, please check your email for a verification link.', 'قبل المتابعة، يرجى التحقق من بريدك الإلكتروني للحصول على رابط التحقق.', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(761, 3, 'If you did not receive the email', 'إذا لم تستلم البريد الإلكتروني', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(762, 3, 'click here to request another', 'انقر هنا لطلب آخر', '2022-04-15 10:30:58', '2024-09-16 15:54:50'),
(763, 3, 'Add Balance', 'إضافة رصيد', '2022-04-15 10:30:58', '2022-04-15 10:30:58'),
(764, 3, 'Charge Card', 'أشحن الكارت', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(765, 3, 'Charge Your Card', 'أشحن كارتك', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(766, 3, 'Card Number', 'رقم الكارت', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(767, 3, 'Submit', 'أشحن', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(768, 3, 'Enter card number', 'أدخل الكود هنا', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(769, 3, 'Card System', 'التحكم بالكروت', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(770, 3, 'Generate New Cards', 'أنشاء كروت جديدة', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(771, 3, 'View All Cards', 'عرض جميع الكروت', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(772, 3, 'Group Id', 'رقم المجموعة', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(773, 3, 'Formula', 'الصيغة', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(774, 3, 'Numbers', 'ارقام', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(775, 3, 'numbers', 'ارقام', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(776, 3, 'Letters', 'حروف', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(777, 3, 'letters', 'حروف', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(778, 3, 'Letters & Numbers', 'حروف و ارقام', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(779, 3, 'letters & numbers', 'حروف و ارقام', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(780, 3, 'Count From', 'العدد من', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(781, 3, 'To', 'إلى', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(782, 3, 'Price From', 'السعر من', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(783, 3, 'Date From', 'التاريخ من', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(784, 3, 'Filter', 'تصفية', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(785, 3, 'Clear Filters', 'الغاء التصفية', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(786, 3, 'Count', 'العدد', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(787, 3, 'Created At', 'تاريخ الانشاء', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(788, 3, 'Action', 'إجراء', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(789, 3, 'Download PDF', 'تنزيل بصيغة Excel', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(790, 3, 'No cards available.', 'لا يوجد كروت متاحة', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(791, 3, 'Balance Amount', 'كمية الرصيد', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(792, 3, 'Enter amount', 'ادخل الكمية', '2024-11-03 17:45:20', '2024-11-03 17:45:20'),
(793, 3, 'This Week', 'هذا الاسبوع', '2024-11-12 13:00:46', '2024-11-12 13:00:46'),
(794, 3, 'This Month', 'هذا الشهر', '2024-11-12 13:00:46', '2024-11-12 13:00:46'),
(795, 3, 'Custom Time Period', 'فترة زمنية مخصصة', '2024-11-12 13:00:46', '2024-11-12 13:00:46'),
(796, 3, 'Select duration', 'اختر المدة', '2024-11-12 13:00:46', '2024-11-12 13:00:46'),
(797, 3, 'Service statistics', 'إحصائيات الخدمة', '2024-11-12 13:00:46', '2024-11-12 13:00:46'),
(798, 3, 'Web User', 'مستخدم الموقع', NULL, NULL),
(799, 3, 'Web User', 'مستخدم الموقع', '2024-11-26 01:21:50', '2024-11-26 01:21:50'),
(800, 3, 'User Dashboard', 'لوحة التحكم الرئيسية', '2024-11-26 01:41:10', '2024-11-26 01:41:10'),
(801, 3, 'Add Service', 'أضفة خدمة', '2024-11-26 01:53:26', '2024-11-26 01:53:26'),
(802, 3, 'User Type', 'نوع المستخدم', '2024-11-30 20:26:31', '2024-11-30 20:26:31'),
(803, 3, 'User Role', 'صلاحيات المستخدم', '2024-11-30 20:28:02', '2024-11-30 20:28:02'),
(804, 3, 'Branch Name', 'إسم الإدارة', '2024-11-30 20:44:14', '2024-11-30 20:44:14'),
(805, 3, 'All Except Done', 'كل الخيارات ماعد (تم)', '2024-12-01 06:29:35', '2024-12-01 06:29:35'),
(806, 3, 'Your service booking is completed & service is under processing, Check your WhatsApp.', 'تم إكمال حجز الخدمة وجاري معالجتها، تحقق من الواتساب الخاص بك.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cmn_twilio_configs`
--

CREATE TABLE `cmn_twilio_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sid` varchar(300) NOT NULL,
  `token` varchar(500) NOT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmn_types`
--

CREATE TABLE `cmn_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_types`
--

INSERT INTO `cmn_types` (`id`, `name`, `slug`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Product', 'product', 1, NULL, NULL, NULL, NULL),
(2, 'Voucher', 'voucher', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cmn_user_balances`
--

CREATE TABLE `cmn_user_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `balanceable_type` varchar(255) NOT NULL,
  `balanceable_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance_type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cmn_user_balances`
--

INSERT INTO `cmn_user_balances` (`id`, `balanceable_type`, `balanceable_id`, `amount`, `user_id`, `balance_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 39, 100.00, 39, 1, 1, '2024-12-06 17:56:28', '2024-12-06 17:56:28'),
(2, 'App\\Models\\User', 39, 80.00, 39, 0, 1, '2024-12-06 17:57:43', '2024-12-06 17:57:43'),
(3, 'App\\Models\\User', 39, 80.00, 39, 0, 1, '2024-12-09 21:30:51', '2024-12-09 21:30:51'),
(6, 'App\\Models\\User', 39, 80.00, 39, 0, 1, '2024-12-11 13:44:12', '2024-12-11 13:44:12'),
(7, 'App\\Models\\User', 39, 100.00, 39, 1, 1, '2024-12-15 20:44:42', '2024-12-15 20:44:42'),
(8, 'App\\Models\\User', 39, 100.00, 39, 1, 1, '2024-12-15 20:45:04', '2024-12-15 20:45:04'),
(9, 'App\\Models\\User', 39, 100.00, 39, 1, 1, '2024-12-15 20:45:29', '2024-12-15 20:45:29'),
(10, 'App\\Models\\User', 39, 80.00, 39, 0, 1, '2024-12-15 20:47:03', '2024-12-15 20:47:03'),
(11, 'App\\Models\\User', 39, 80.00, 39, 0, 1, '2024-12-15 21:30:36', '2024-12-15 21:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(190) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrm_departments`
--

CREATE TABLE `hrm_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(190) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrm_designations`
--

CREATE TABLE `hrm_designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrm_designations`
--

INSERT INTO `hrm_designations` (`id`, `name`, `order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'حجز مسائي من 1:00 ظهرا الي 12:00 ليلا', 1, 24, 24, '2024-11-29 19:21:44', '2024-11-29 20:39:46'),
(3, 'حجز ليلي من 12:00 بعد منتصف الليل', 2, 24, 24, '2024-11-29 19:22:01', '2024-11-29 21:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_27_184012_create_sec_resources_table', 1),
(5, '2020_11_27_184157_create_sec_roles_table', 1),
(6, '2020_11_27_184348_create_sec_user_roles_table', 1),
(7, '2020_11_27_184630_create_sec_role_permission_infos_table', 1),
(8, '2020_11_27_184730_create_sec_resource_permissions_table', 1),
(9, '2020_11_27_184902_create_sec_role_permissions_table', 1),
(10, '2020_12_01_193358_add_new_column_users_table', 1),
(11, '2020_12_23_165116_add_new_columns_to_users', 1),
(12, '2021_01_05_163345_add_new_column_to_sec_role', 1),
(13, '2021_01_08_190858_add_new_column_sec_resources_and_sec_role_perm_info', 1),
(14, '2021_10_12_155950_create_hrm_departments_table', 1),
(15, '2021_10_13_092517_create_sch_service_categories_table', 1),
(16, '2021_10_13_175830_create_hrm_designations_table', 1),
(17, '2021_10_14_181034_create_cmn_companies_table', 1),
(18, '2021_10_15_063004_create_cmn_payment_types_table', 1),
(19, '2021_10_15_065043_create_cmn_branches_table', 1),
(20, '2021_10_17_045856_create_cmn_business_hours_table', 1),
(21, '2021_10_20_033418_create_cmn_paypal_api_configs_table', 1),
(22, '2021_10_20_033452_create_cmn_currency_setups_table', 1),
(23, '2021_10_20_101650_create_sch_employees_table', 1),
(24, '2021_10_20_143659_create_sch_services_table', 1),
(25, '2021_10_20_152840_create_sch_employee_schedules_table', 1),
(26, '2021_10_20_162746_create_sch_employee_services_table', 1),
(27, '2021_10_20_163303_create_sch_employee_offdays_table', 1),
(28, '2021_10_25_152303_alter_cmn_business_hours_table', 1),
(29, '2021_10_30_161513_create_cmn_customers_table', 1),
(30, '2021_10_30_182258_create_cmn_business_holidays_table', 1),
(31, '2021_11_10_150621_create_sch_service_bookings_table', 1),
(32, '2021_11_21_192012_create_cmn_payment_infos_table', 1),
(33, '2021_11_24_173750_create_site_menus_table', 1),
(34, '2021_11_25_175550_create_site_appearances_table', 1),
(35, '2021_11_27_034130_create_site_client_testimonials_table', 1),
(36, '2021_11_28_174549_create_site_photo_galleries_table', 1),
(37, '2021_11_29_150423_create_site_about_us_table', 1),
(38, '2021_11_29_150856_create_site_frequently_asked_questions_table', 1),
(39, '2021_11_29_173145_create_site_google_maps', 1),
(40, '2021_11_29_175219_create_site_terms_and_conditions_table', 1),
(41, '2021_11_30_174221_create_sec_user_branches_table', 1),
(42, '2022_01_03_150114_add_new_column_sch_employee_id_users_table', 1),
(43, '2022_01_22_085920_insert_or_update_user_role_other_init_info', 1),
(44, '2022_03_11_183147_update_site_frequently_asked_questions_table', 1),
(45, '2022_03_22_143034_create_cmn_stripe_api_configs_table', 1),
(46, '2022_03_22_180651_create_cmn_languages_table', 1),
(47, '2022_03_22_181433_create_cmn_translations_table', 1),
(48, '2022_04_15_153024_insert_update_version_updated_data_dependency', 1),
(49, '2022_04_16_091624_insert_translation_default_en_language', 1),
(50, '2022_04_25_182944_create_cmn_coupons_table', 1),
(51, '2022_05_07_184510_add_new_column_sch_employee_table', 1),
(52, '2022_05_07_185540_modify_column_sch_service_table', 1),
(53, '2022_05_09_163614_modify_column_sch_employee_table', 1),
(54, '2022_05_10_183751_change_table_sch_services_add_cupon_id', 1),
(55, '2022_05_12_172137_create_cmn_twillo_config_table', 1),
(56, '2022_05_12_232836_create_sch_salaries_table', 1),
(57, '2022_05_13_041333_add_column_sch_employee_table', 1),
(58, '2022_05_13_174511_change_sch_salaries_table_based_on', 1),
(59, '2022_05_14_183851_modify_cmn_twillo_config_table', 1),
(60, '2022_05_14_194151_create_st_otp_configurations_table', 1),
(61, '2022_05_14_200151_create_st_otp_messages_table', 1),
(62, '2022_05_14_201332_rename_table_twillo_to_twilio_config_table', 1),
(63, '2022_05_15_082549_add_column_st_otp_configuration_table', 1),
(64, '2022_05_15_095852_insert_data_otp_message_table', 1),
(65, '2022_05_15_180518_rename_table_cmn_twillo_config_to_cmn_twillo_configs', 1),
(66, '2022_05_17_174129_create_sch_service_booking_infos_table', 1),
(67, '2022_05_22_152017_create_categories_table', 1),
(68, '2022_05_22_152055_create_types_table', 1),
(69, '2022_05_22_191248_create_products_table', 1),
(70, '2022_05_22_191416_create_orders_table', 1),
(71, '2022_05_22_201437_create_cmn_order_details_table', 1),
(72, '2022_05_27_191340_insert_user_balance_in_payment_type_table', 1),
(73, '2022_05_28_223614_create_user_balances_table', 1),
(74, '2022_05_31_153222_add_new_column_sec_service_booking_info_table', 1),
(75, '2022_05_31_185949_insert_data_otp_message1_table', 1),
(76, '2022_06_08_172755_change_cmn_coupons_table_add_extra', 1),
(77, '2022_06_08_174255_create_sch_service_booking_feedback_table', 1),
(78, '2022_06_13_190935_insert_update_version_updated_data_dependency1', 1),
(79, '2022_06_28_082059_add_new_column_language_table', 1),
(80, '2022_07_12_092027_insert_update_version_updated_data_dependency2', 1),
(81, '2024_10_17_042013_create_card_groups_table', 2),
(82, '2024_10_18_053033_create_cards_table', 3),
(83, '2024_10_24_160124_insert_sec_resources_and_permissions', 4),
(84, '2024_10_25_051050_add_cmn_branch_id_to_sch_service_categories_table', 5),
(85, '2024_11_07_140456_create_jobs_table', 6),
(86, '2024_11_07_142635_create_notifications_table', 6),
(87, '2024_11_20_081115_add_created_by_to_users_table', 7),
(88, '2024_11_20_100534_add_otp_to_users_table', 7),
(89, '2024_11_30_153703_add_created_by_to_cmn_customers_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('003db386-c613-42d5-801a-d57df5604e1f', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 69, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\",\"id\":89}', NULL, '2025-01-11 18:53:37', '2025-01-11 18:53:37'),
('03c6bbae-16f7-4dc6-afb8-6c2cdbcdb340', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":53}', NULL, '2024-12-15 20:53:39', '2024-12-15 20:53:39'),
('06039612-c65d-425a-8ed7-1148ef8dc2dd', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0623\\u0643\\u0631\\u0651\\u0645 \\u0627\\u0644\\u062c\\u0628\\u0648\",\"id\":26}', '2024-12-08 17:59:49', '2024-12-05 20:24:36', '2024-12-08 17:59:49'),
('091d0e89-7515-42cb-98b8-6b9327afd64b', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Dia\",\"id\":10}', NULL, '2024-12-02 19:12:52', '2024-12-02 19:12:52'),
('09d8b524-678e-425a-b5b5-2653aa7737b0', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 69, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\",\"id\":88}', NULL, '2025-01-11 18:51:10', '2025-01-11 18:51:10'),
('0b4c9e5f-f271-4fa4-9420-c0e336c70a92', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0627\\u0646\\u0648\\u0631 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":25}', NULL, '2024-12-05 16:09:02', '2024-12-05 16:09:02'),
('0b678522-dfc5-43b5-ab98-07bde63b06e4', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":17}', NULL, '2024-12-04 11:46:08', '2024-12-04 11:46:08'),
('0cbdb2b1-75a9-4343-9882-9ea92c291033', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0627\\u0646\\u0648\\u0631 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":25}', NULL, '2024-12-05 16:09:21', '2024-12-05 16:09:21'),
('0f1e058c-2381-4e65-8771-5720b811c8ca', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 27, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0639\\u0628\\u0627\\u0633 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":1}', NULL, '2024-12-01 17:32:36', '2024-12-01 17:32:36'),
('10ae638c-22ba-4f9a-9d82-afe1607ae890', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":65}', '2025-01-09 00:05:16', '2024-12-26 02:01:53', '2025-01-09 00:05:16'),
('131e94cf-9017-4f8d-bc45-ecb796727237', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":50}', NULL, '2024-12-15 20:47:02', '2024-12-15 20:47:02'),
('1340d053-4fe0-474d-a76e-60298d4efcd3', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":31}', NULL, '2024-12-08 16:21:31', '2024-12-08 16:21:31'),
('136a8ca7-bfc0-44d8-8c49-b9f5e14729ef', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DpWxRiYTRffOtQ\",\"id\":12}', NULL, '2024-12-03 07:16:29', '2024-12-03 07:16:29'),
('15b97f06-0117-4ccd-b32d-f2be46e4edff', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062d\\u0645\\u062f \\u0627\\u062d\\u0645\\u062f \\u0645\\u062d\\u0645\\u062f\",\"id\":2}', '2024-12-01 18:44:07', '2024-12-01 17:24:51', '2024-12-01 18:44:07'),
('174e7ba9-7cc9-4538-b993-a20a040e05f1', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 77, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":96}', NULL, '2025-01-15 16:05:06', '2025-01-15 16:05:06'),
('17609e48-a0fa-438b-b95f-d50ed000baf5', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":39}', NULL, '2024-12-09 21:30:51', '2024-12-09 21:30:51'),
('1976d896-0ec2-481e-87c3-fea41f1c2b61', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 moktar\",\"id\":56}', '2024-12-20 19:50:49', '2024-12-17 16:51:33', '2024-12-20 19:50:49'),
('19994d40-848a-4f78-b128-b0f620a702c7', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062f\\u064a\\u0631\",\"id\":83}', NULL, '2025-01-11 18:40:54', '2025-01-11 18:40:54'),
('1a7ae0f6-fc0f-4fd7-9d43-020e0eedfd90', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":30}', '2024-12-08 17:59:49', '2024-12-06 17:57:42', '2024-12-08 17:59:49'),
('1ca73e28-02b0-4b55-b4ca-91b25f8361e9', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0634\\u0647\\u0627\\u0628 \\u0627\\u062d\\u0645\\u062f \\u0627\\u0628\\u0648\\u062a\\u0631\\u0643\\u064a\\u0629 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":32}', NULL, '2024-12-08 21:20:22', '2024-12-08 21:20:22'),
('1dc92d3b-2942-440e-8475-0067c7f6e034', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":64}', '2025-01-09 00:05:16', '2024-12-26 02:01:53', '2025-01-09 00:05:16'),
('1e26fe95-031b-4b41-9a8c-beee74b0540b', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u0639\\u0627\\u062f \\u0643\\u0631\\u0648\\u0627\\u062f\",\"id\":54}', NULL, '2024-12-15 20:57:30', '2024-12-15 20:57:30'),
('1f31f0fd-3d23-4348-b461-71e975cef2b3', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Ayoub\",\"id\":22}', '2024-12-08 17:59:49', '2024-12-04 15:56:01', '2024-12-08 17:59:49'),
('20284795-5ca8-4842-8a90-777d0e7f5f04', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0639\\u0628\\u0627\\u0633\",\"id\":1}', NULL, '2024-11-29 21:41:46', '2024-11-29 21:41:46'),
('21fa669a-1e1e-4c2c-836c-d7f629ed2010', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":76}', NULL, '2025-01-09 01:56:14', '2025-01-09 01:56:14'),
('24e3f989-7de9-488b-bb7a-ed1a401d27ee', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 25, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0639\\u0628\\u0627\\u0633 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":1}', NULL, '2024-12-01 17:32:36', '2024-12-01 17:32:36'),
('250d3b49-6ad5-4993-98be-7b3f280024db', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 27, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":6}', NULL, '2024-12-01 18:12:35', '2024-12-01 18:12:35'),
('25378dac-2000-48ff-98f2-fcca3176fa77', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":6}', '2024-12-01 18:44:07', '2024-12-01 18:12:35', '2024-12-01 18:44:07'),
('2556f6e7-b121-4593-b8d3-280e8289e15e', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":20}', NULL, '2024-12-04 12:02:02', '2024-12-04 12:02:02'),
('25ae73b2-ed80-4037-ad48-526ce8f1eec4', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 25, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0645\\u062d\\u0645\\u062f \\u0627\\u062d\\u0645\\u062f \\u0645\\u062d\\u0645\\u062f \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":2}', NULL, '2024-12-01 17:32:12', '2024-12-01 17:32:12'),
('297b47c0-e7d4-4560-9951-1b9c8d9de0c2', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":57}', NULL, '2024-12-19 02:48:26', '2024-12-19 02:48:26'),
('29993c4f-d1ed-4a8a-8a06-de381d5fc6c7', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DIAA UDDIN ABABNEH\",\"id\":28}', NULL, '2024-12-06 12:08:24', '2024-12-06 12:08:24'),
('2b03dcf1-4bd5-41bd-a80a-e2543f0e2db1', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0623\\u0643\\u0631\\u0651\\u0645 \\u0627\\u0644\\u062c\\u0628\\u0648\",\"id\":26}', NULL, '2024-12-05 20:24:36', '2024-12-05 20:24:36'),
('2c5fc4c7-6092-4b61-a6b2-08b4ce2cd311', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":4}', '2024-12-01 18:44:07', '2024-12-01 17:41:37', '2024-12-01 18:44:07'),
('2e28bd0c-ed1a-4a41-a6b0-141f29fc4e3e', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 32, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":8}', '2024-12-02 19:12:09', '2024-12-02 08:48:02', '2024-12-02 19:12:09'),
('2eda9c7c-cd08-440a-8ee1-b057c29ed71d', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 69, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":81}', NULL, '2025-01-11 17:50:34', '2025-01-11 17:50:34'),
('303ffaa8-8df6-4079-b97c-e58a4e0112c9', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":23}', NULL, '2024-12-04 15:57:54', '2024-12-04 15:57:54'),
('30ff9744-802d-44b7-9584-62ea57c56e1a', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":20}', NULL, '2024-12-04 11:59:58', '2024-12-04 11:59:58'),
('382a13f4-b2cd-490c-aaae-0f8aad843d8c', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":18}', NULL, '2024-12-04 11:49:12', '2024-12-04 11:49:12'),
('39313847-b5e0-4704-9f29-b0be83933f22', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Dia\",\"id\":10}', '2024-12-04 08:53:44', '2024-12-02 19:12:52', '2024-12-04 08:53:44'),
('3b80770e-92f2-48fe-be11-a03e5d649588', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628moktar \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":56}', NULL, '2024-12-17 17:03:16', '2024-12-17 17:03:16'),
('3b8f7a22-7068-4edf-a2e0-c4ad80bb7256', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 27, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":3}', NULL, '2024-12-01 17:39:21', '2024-12-01 17:39:21'),
('3bda3317-58f4-4ef7-a36b-cca6a9717f6e', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":31}', '2024-12-08 17:59:49', '2024-12-08 16:21:31', '2024-12-08 17:59:49'),
('3dbe4098-c547-40ce-9ed7-2eab538de439', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 27, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":4}', NULL, '2024-12-01 17:41:37', '2024-12-01 17:41:37'),
('3e63b4c4-e20c-4913-9474-16c68d8400d9', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\",\"id\":87}', NULL, '2025-01-11 18:46:28', '2025-01-11 18:46:28'),
('4015b55e-f752-41eb-b772-200a2fc4a7dc', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0623\\u0643\\u0631\\u0651\\u0645 \\u0627\\u0644\\u062c\\u0628\\u0648 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":26}', NULL, '2024-12-05 20:27:37', '2024-12-05 20:27:37'),
('4370c640-0eb1-4328-96ed-38f63158ee8e', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":57}', NULL, '2024-12-19 02:46:16', '2024-12-19 02:46:16'),
('44138a69-feae-4f07-a650-6f924b6a9ebf', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 25, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0639\\u0628\\u0627\\u0633\",\"id\":1}', NULL, '2024-11-29 21:41:46', '2024-11-29 21:41:46'),
('45638af3-0c87-4074-b88f-b92289298406', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Pending \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":57}', NULL, '2024-12-19 02:49:03', '2024-12-19 02:49:03'),
('464950ee-b94d-4b09-80e9-b317bb08f00d', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Ayoub\",\"id\":5}', '2024-12-01 18:44:07', '2024-12-01 17:47:09', '2024-12-01 18:44:07'),
('48931941-1937-430b-a28b-a5b69f49ac85', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 32, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DpWxRiYTRffOtQ\",\"id\":12}', NULL, '2024-12-03 07:16:29', '2024-12-03 07:16:29'),
('48d81d3d-6cf2-4021-8531-78250c02ca11', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":96}', NULL, '2025-01-15 16:05:06', '2025-01-15 16:05:06'),
('497dbe76-d4bc-41ba-bd3f-91dadbc0fdcb', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Ayoub\",\"id\":22}', NULL, '2024-12-04 15:56:01', '2024-12-04 15:56:01'),
('4b2a12ef-0fba-46bf-a853-80529566e1b8', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062f\\u064a\\u0631\",\"id\":84}', NULL, '2025-01-11 18:41:21', '2025-01-11 18:41:21'),
('4c6a9ea2-9a18-4147-ab6e-c56445184f11', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 1, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":97}', NULL, '2025-01-15 16:07:23', '2025-01-15 16:07:23'),
('4dad4a8b-a123-49b8-9a62-bb1bd809e96a', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Processing \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":20}', NULL, '2024-12-04 12:02:23', '2024-12-04 12:02:23'),
('4dc545fa-7d7e-44b9-8d92-84e18f68b1d8', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 58, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":67}', NULL, '2024-12-29 19:41:37', '2024-12-29 19:41:37'),
('4fe0531f-1ba3-4aea-8fbe-305833232537', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 32, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":11}', NULL, '2024-12-03 07:14:06', '2024-12-03 07:14:06'),
('517189cf-60b2-4482-8ce1-ef30115354bf', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 69, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\",\"id\":90}', NULL, '2025-01-11 19:02:00', '2025-01-11 19:02:00'),
('523b91e7-e1a3-4de9-9486-ebb7400891c2', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 1, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 \\u062e\\u0627\\u0644\\u0635 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u0644\\u0639\\u0628 \\u0627\\u0644\\u0647\\u062f\\u0641\",\"id\":94}', NULL, '2025-01-15 15:46:17', '2025-01-15 15:46:17'),
('5289f621-bdd2-43bf-b7b1-798a7b8d9a7c', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DIAA UDDIN ABABNEH\",\"id\":28}', '2024-12-08 17:59:49', '2024-12-06 12:08:24', '2024-12-08 17:59:49'),
('52cc6cf5-2638-4dfa-ab5d-273984cdcdbd', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Ayoub\",\"id\":5}', NULL, '2024-12-01 17:47:09', '2024-12-01 17:47:09'),
('53169a91-53d8-4b15-aff4-0db837756d1e', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u064a\\u0627\\u0633\\u064a\\u0646 \\u0627\\u062d\\u0645\\u062f \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":62}', NULL, '2024-12-22 18:45:54', '2024-12-22 18:45:54'),
('56c55424-bda1-40ad-8300-eb8d8f52e8ea', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0639\\u0628\\u0627\\u0633\",\"id\":1}', '2024-11-30 10:11:17', '2024-11-29 21:41:46', '2024-11-30 10:11:17'),
('57ba7050-9e4e-457b-8b3f-330406b118a9', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":44}', NULL, '2024-12-12 22:37:11', '2024-12-12 22:37:11'),
('58501d2a-483d-4275-96d1-61636a320380', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 69, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\",\"id\":87}', NULL, '2025-01-11 18:46:28', '2025-01-11 18:46:28'),
('5ac43a6a-32e1-4c5f-9ca3-9ac5a4a74d56', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\",\"id\":89}', NULL, '2025-01-11 18:53:37', '2025-01-11 18:53:37'),
('5b3a84c0-43ab-4bda-8757-7d49a4096a44', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":20}', NULL, '2024-12-04 12:03:56', '2024-12-04 12:03:56'),
('5b3f8853-dfc5-4020-af06-7f27361ca407', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u064a\\u0627\\u0633\\u064a\\u0646 \\u0627\\u062d\\u0645\\u062f \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":59}', NULL, '2024-12-22 18:26:24', '2024-12-22 18:26:24'),
('5b60f260-f33d-4c58-b4ae-12515c957a27', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062d\\u0645\\u062f \\u0627\\u062d\\u0645\\u062f \\u0645\\u062d\\u0645\\u062f\",\"id\":2}', NULL, '2024-12-01 17:24:51', '2024-12-01 17:24:51'),
('5bc5be4a-4ee1-46da-9428-d41f3e36c539', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 25, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":3}', NULL, '2024-12-01 17:39:21', '2024-12-01 17:39:21'),
('5cc7aaeb-8f84-45e3-90e7-9d2f917fd260', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 24, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628DpWxRiYTRffOtQ \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Dia\",\"id\":9}', NULL, '2024-12-02 19:30:20', '2024-12-02 19:30:20'),
('5ce6c3d7-1953-403f-9425-edbbb970e30f', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DpWxRiYTRffOtQ\",\"id\":12}', '2024-12-04 08:53:44', '2024-12-03 07:16:29', '2024-12-04 08:53:44'),
('5eb0a869-269e-461c-8fc6-afa94d86163d', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 62, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Mohammed Abbas\",\"id\":91}', NULL, '2025-01-11 22:49:20', '2025-01-11 22:49:20'),
('600d936d-b8e4-49fe-a92c-3896ec8b7430', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":57}', NULL, '2024-12-19 02:49:31', '2024-12-19 02:49:31'),
('6046b03e-4646-4c22-aadf-21b480faf11f', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0634\\u0647\\u0627\\u0628 \\u0627\\u062d\\u0645\\u062f \\u0627\\u0628\\u0648\\u062a\\u0631\\u0643\\u064a\\u0629\",\"id\":32}', '2024-12-14 23:47:46', '2024-12-08 21:17:25', '2024-12-14 23:47:46'),
('655ed212-48aa-4ca6-862b-33caf351cced', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":20}', NULL, '2024-12-04 12:09:49', '2024-12-04 12:09:49'),
('65e4ae63-9d8d-48a5-bd70-c746aba02833', 'App\\Notifications\\CardChargedNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u0644\\u0642\\u062f \\u062a\\u0645 \\u0634\\u062d\\u0646 \\u0643\\u0627\\u0631\\u062a \\u0628\\u0642\\u064a\\u0645\\u0629 100 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\"}', '2024-12-15 20:48:07', '2024-12-15 20:45:04', '2024-12-15 20:48:07'),
('6869326f-05f7-44ea-8e9d-54916c813643', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u064a\\u0627\\u0633\\u064a\\u0646 \\u0627\\u062d\\u0645\\u062f\",\"id\":63}', NULL, '2024-12-22 18:34:31', '2024-12-22 18:34:31'),
('6987c9b7-19ac-4034-9fcb-a2aeed7ed8df', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":55}', '2024-12-20 19:50:49', '2024-12-15 21:30:36', '2024-12-20 19:50:49'),
('698f2b5e-089d-4ad2-8219-fc261cb0974b', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":20}', NULL, '2024-12-04 12:09:32', '2024-12-04 12:09:32'),
('69f50ad4-8716-437f-a1d0-300196be21b1', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":8}', NULL, '2024-12-02 08:48:02', '2024-12-02 08:48:02'),
('6a110d9d-4466-445e-931f-07f9f9efd950', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":92}', NULL, '2025-01-15 12:20:41', '2025-01-15 12:20:41'),
('6df37aab-524e-4b31-8057-34706ebcf087', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":58}', '2024-12-20 19:50:49', '2024-12-20 18:44:11', '2024-12-20 19:50:49'),
('6e194f3a-2258-4ef9-8087-6989d87d0b4d', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas\",\"id\":79}', NULL, '2025-01-11 17:25:04', '2025-01-11 17:25:04'),
('6fd69232-b7ff-47ac-949c-0bb457bbd986', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 1, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0639\\u0628\\u0627\\u0633 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":1}', '2024-12-01 18:44:07', '2024-12-01 17:32:36', '2024-12-01 18:44:07'),
('705df348-87cc-4be0-a260-779c719978fd', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628Ayoub \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":22}', NULL, '2024-12-04 16:00:45', '2024-12-04 16:00:45'),
('71a5daef-cf06-4ede-a6d2-24202c465d85', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 62, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":75}', NULL, '2025-01-09 01:42:07', '2025-01-09 01:42:07'),
('722b5245-26e3-431e-a9ff-4dfcd1ef3fbd', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":50}', '2024-12-15 20:48:07', '2024-12-15 20:47:02', '2024-12-15 20:48:07'),
('751862f3-0bcd-4c85-859c-1019b275fb00', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DpWxRiYTRffOtQ\",\"id\":9}', '2024-12-04 08:53:44', '2024-12-02 19:10:02', '2024-12-04 08:53:44'),
('786f71c4-b739-4542-a2cd-58484c0c61a2', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\",\"id\":88}', NULL, '2025-01-11 18:51:10', '2025-01-11 18:51:10'),
('79b20d9c-b4e0-4aef-858a-9b8b435a1660', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 25, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":6}', NULL, '2024-12-01 18:12:35', '2024-12-01 18:12:35'),
('79b416a7-ac0a-4450-a78e-e9845612e57f', 'App\\Notifications\\CardChargedNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u0644\\u0642\\u062f \\u062a\\u0645 \\u0634\\u062d\\u0646 \\u0643\\u0627\\u0631\\u062a \\u0628\\u0642\\u064a\\u0645\\u0629 100 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\"}', '2024-12-15 20:48:07', '2024-12-15 20:44:42', '2024-12-15 20:48:07'),
('7a6c3337-2682-478b-84e0-35a5c322dc90', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":97}', NULL, '2025-01-15 16:06:21', '2025-01-15 16:06:21'),
('7c857c8b-b342-426a-8fd3-198a7f6d2560', 'App\\Notifications\\CardChargedNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u0644\\u0642\\u062f \\u062a\\u0645 \\u0634\\u062d\\u0646 \\u0643\\u0627\\u0631\\u062a \\u0628\\u0642\\u064a\\u0645\\u0629 100 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\"}', '2024-12-08 17:59:49', '2024-12-06 17:56:28', '2024-12-08 17:59:49'),
('7d439164-8cfb-4a89-bb66-e09a570edfc5', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":55}', NULL, '2024-12-15 21:30:36', '2024-12-15 21:30:36'),
('7db40192-0c99-423a-8f46-cef38758e11e', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 64, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":78}', NULL, '2025-01-09 16:35:37', '2025-01-09 16:35:37'),
('7ddaaee0-c970-4718-bf17-299bad2c67be', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":47}', NULL, '2024-12-12 22:39:44', '2024-12-12 22:39:44'),
('7f4259d4-38f7-40eb-9fcf-45dbda6104db', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":93}', NULL, '2025-01-15 12:27:52', '2025-01-15 12:27:52'),
('800db818-625f-4647-894d-6e04cd2f74bb', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas\",\"id\":80}', NULL, '2025-01-11 17:44:23', '2025-01-11 17:44:23'),
('811ad0c4-e86a-43f3-b40f-b7b514b61ea1', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":66}', '2025-01-09 00:05:16', '2024-12-26 02:01:52', '2025-01-09 00:05:16'),
('829602c6-ae61-4b93-ba62-eb27558e616e', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 25, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062d\\u0645\\u062f \\u0627\\u062d\\u0645\\u062f \\u0645\\u062d\\u0645\\u062f\",\"id\":2}', NULL, '2024-12-01 17:24:51', '2024-12-01 17:24:51'),
('83a13342-b56c-4e2c-96bd-23ca72ef2950', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0634\\u0647\\u0627\\u0628 \\u0627\\u062d\\u0645\\u062f \\u0627\\u0628\\u0648\\u062a\\u0631\\u0643\\u064a\\u0629\",\"id\":32}', NULL, '2024-12-08 21:17:25', '2024-12-08 21:17:25'),
('8498ba36-7346-4db2-ba14-60a836f8b3c5', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 25, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Ayoub\",\"id\":5}', NULL, '2024-12-01 17:47:09', '2024-12-01 17:47:09'),
('8719ec37-feeb-400d-8c54-22db754edebc', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u0639\\u0627\\u062f \\u0643\\u0631\\u0648\\u0627\\u062f\",\"id\":54}', '2024-12-20 19:50:49', '2024-12-15 20:57:30', '2024-12-20 19:50:49'),
('8c087488-c07f-4eff-9d80-3b4855d6603f', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DpWxRiYTRffOtQ\",\"id\":9}', NULL, '2024-12-02 19:10:02', '2024-12-02 19:10:02'),
('8c455eeb-e079-4ce0-8fc7-e2fdc22b71fa', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0627\\u0646\\u0648\\u0631 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":25}', NULL, '2024-12-05 16:06:04', '2024-12-05 16:06:04'),
('90dd5f71-ef1a-446c-a1c8-0a6bfcb76dda', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 abdelghany\",\"id\":29}', '2024-12-08 17:59:49', '2024-12-06 12:39:20', '2024-12-08 17:59:49'),
('90eecd1c-dfb2-4d53-9777-be40151ffa8e', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 1, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628DpWxRiYTRffOtQ \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Dia\",\"id\":9}', '2024-12-04 08:53:44', '2024-12-02 19:30:20', '2024-12-04 08:53:44'),
('924a61d7-3af8-4a4d-9ab9-8e3abf17ffad', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":49}', NULL, '2024-12-15 17:21:04', '2024-12-15 17:21:04'),
('92b5409b-f849-4989-a145-0551e33c018e', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 1, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 \\u0645\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u064a\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u0644\\u0639\\u0628 \\u0627\\u0644\\u0647\\u062f\\u0641\",\"id\":94}', NULL, '2025-01-15 15:45:29', '2025-01-15 15:45:29'),
('9317de80-3e72-4244-b6db-d4bfef840660', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 32, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DpWxRiYTRffOtQ\",\"id\":9}', '2024-12-02 19:12:09', '2024-12-02 19:10:02', '2024-12-02 19:12:09'),
('95446eb4-3ef3-4a72-a787-a516f1bd8ad2', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628 \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":20}', NULL, '2024-12-04 12:10:24', '2024-12-04 12:10:24'),
('95ec0152-f2ea-4934-be3d-ad98abfd8a62', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062f\\u064a\\u0631\",\"id\":82}', NULL, '2025-01-11 17:53:41', '2025-01-11 17:53:41'),
('993abf33-bed6-48d8-9919-d42d080ba881', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0634\\u0647\\u0627\\u0628 \\u0627\\u062d\\u0645\\u062f \\u0627\\u0628\\u0648\\u062a\\u0631\\u0643\\u064a\\u0629\",\"id\":38}', NULL, '2024-12-08 21:29:46', '2024-12-08 21:29:46'),
('99575536-0a87-486b-9555-f896a6ba704f', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 abdelghany\",\"id\":29}', NULL, '2024-12-06 12:39:20', '2024-12-06 12:39:20'),
('9bfd8349-5afa-4bee-89f6-761bde462cfd', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":66}', NULL, '2024-12-26 02:01:52', '2024-12-26 02:01:52'),
('9cc74dfc-861d-4006-8b96-a0478e858cba', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 moktar\",\"id\":56}', NULL, '2024-12-17 16:51:33', '2024-12-17 16:51:33');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('9df51747-889c-4ed7-8ab1-948922283138', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 77, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":97}', NULL, '2025-01-15 16:07:23', '2025-01-15 16:07:23'),
('9ed9d2ff-0dce-4c85-b49a-029acfed8093', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 62, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":72}', NULL, '2025-01-09 01:30:51', '2025-01-09 01:30:51'),
('9edf7dff-28a5-4a7f-a3d9-a0759202124a', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DIAA UDDIN ABABNEH\",\"id\":27}', '2024-12-08 17:59:49', '2024-12-06 12:01:23', '2024-12-08 17:59:49'),
('a0727960-a9fd-4a53-8be7-ac89008a7980', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":50}', NULL, '2024-12-15 20:48:30', '2024-12-15 20:48:30'),
('a17f45f0-aac0-4d37-b696-dea403940f1a', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 62, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":93}', NULL, '2025-01-15 12:27:52', '2025-01-15 12:27:52'),
('a218785d-10f2-4d7e-93f9-aea40f61f69e', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":57}', '2024-12-20 19:50:49', '2024-12-19 02:46:16', '2024-12-20 19:50:49'),
('a3cfea4c-b390-405d-b0d8-2e7cc559ee07', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628abdo \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":21}', NULL, '2024-12-04 12:33:32', '2024-12-04 12:33:32'),
('a7771a0c-85d7-4e72-8c69-d8b17559df56', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\",\"id\":90}', NULL, '2025-01-11 19:02:00', '2025-01-11 19:02:00'),
('a866d38a-912e-4e63-85ed-0d1fea23814a', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 77, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":94}', NULL, '2025-01-15 15:44:45', '2025-01-15 15:44:45'),
('a8722be5-4138-464b-a84b-ede0c637275a', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":30}', NULL, '2024-12-06 18:02:51', '2024-12-06 18:02:51'),
('ac2067f7-7d6c-4555-b216-6f5758883acc', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 27, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062d\\u0645\\u062f \\u0627\\u062d\\u0645\\u062f \\u0645\\u062d\\u0645\\u062f\",\"id\":2}', NULL, '2024-12-01 17:24:51', '2024-12-01 17:24:51'),
('ac52092c-73ff-4001-ac6c-611d48bbaf51', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":71}', NULL, '2025-01-08 18:36:42', '2025-01-08 18:36:42'),
('ad6c8cf6-1ddf-4799-b093-4caf3871a821', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":21}', NULL, '2024-12-04 12:33:05', '2024-12-04 12:33:05'),
('aeea1792-436f-4e02-865c-eee2e6ebf8e7', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 62, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":74}', NULL, '2025-01-09 01:42:06', '2025-01-09 01:42:06'),
('af052e1e-5639-4708-b226-a50379438eb7', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Ayoub\",\"id\":24}', '2024-12-08 17:59:49', '2024-12-05 15:58:38', '2024-12-08 17:59:49'),
('b01d26df-4ea5-4b12-9fb3-5f7869c7dcd4', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 1, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0645\\u062d\\u0645\\u062f \\u0627\\u062d\\u0645\\u062f \\u0645\\u062d\\u0645\\u062f \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":2}', '2024-12-01 18:44:07', '2024-12-01 17:32:12', '2024-12-01 18:44:07'),
('b0e13afd-2900-4489-aa4d-1266e4886bc7', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 27, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0645\\u062d\\u0645\\u062f \\u0627\\u062d\\u0645\\u062f \\u0645\\u062d\\u0645\\u062f \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":2}', NULL, '2024-12-01 17:32:12', '2024-12-01 17:32:12'),
('b0fda10f-d33b-4d93-84c8-d10cf9499053', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 64, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":77}', NULL, '2025-01-09 16:26:48', '2025-01-09 16:26:48'),
('b1245aa8-9267-4ef1-87ae-6f516a37270a', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062f\\u064a\\u0631\",\"id\":85}', NULL, '2025-01-11 18:41:21', '2025-01-11 18:41:21'),
('b2bf7faa-1071-4874-a454-c9288b827f13', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Dia\",\"id\":7}', '2024-12-04 08:53:44', '2024-12-02 08:21:06', '2024-12-04 08:53:44'),
('b68e21f7-a874-4a32-b8fe-e3797ab6e8e0', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Dia\",\"id\":7}', NULL, '2024-12-02 08:21:06', '2024-12-02 08:21:06'),
('b6a47797-7ff4-4d70-8998-f4de2507090d', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas\",\"id\":43}', '2024-12-14 23:47:46', '2024-12-10 08:55:02', '2024-12-14 23:47:46'),
('b77f2519-6924-442d-a261-7d64bf81f88f', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0627\\u0646\\u0648\\u0631 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":25}', '2024-12-08 17:59:49', '2024-12-05 16:06:04', '2024-12-08 17:59:49'),
('b7b90af0-1b79-4cbf-a4a5-b105add159e2', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0634\\u0647\\u0627\\u0628 \\u0627\\u062d\\u0645\\u062f \\u0627\\u0628\\u0648\\u062a\\u0631\\u0643\\u064a\\u0629\",\"id\":38}', '2024-12-14 23:47:46', '2024-12-08 21:29:46', '2024-12-14 23:47:46'),
('ba112f83-91f4-461f-b764-9b19fcd63a77', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":58}', NULL, '2024-12-20 18:47:03', '2024-12-20 18:47:03'),
('bb65b124-dacb-4c8e-9cb8-fd293e446e17', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas\",\"id\":86}', NULL, '2025-01-11 18:44:19', '2025-01-11 18:44:19'),
('bbaaac8f-80fb-4e8a-92c4-6e9ef250d6c2', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":48}', NULL, '2024-12-14 03:13:03', '2024-12-14 03:13:03'),
('bd2f7fd5-f56d-41c9-b31a-6e22a366422a', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":39}', '2024-12-14 23:47:46', '2024-12-09 21:30:51', '2024-12-14 23:47:46'),
('bd5b0bd1-d691-44cb-9258-1af1c665b24e', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":59}', NULL, '2024-12-22 18:25:37', '2024-12-22 18:25:37'),
('bf01306c-bb6b-4f6a-a5a4-4b6aa497e245', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628Ayoub \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":5}', NULL, '2024-12-04 13:35:04', '2024-12-04 13:35:04'),
('c0cb608c-c300-4d14-9b81-50124fb67efb', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Processing \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":57}', NULL, '2024-12-19 02:50:04', '2024-12-19 02:50:04'),
('c32c9741-a739-4fd0-b51c-3a4851e5fab8', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 77, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":97}', NULL, '2025-01-15 16:06:21', '2025-01-15 16:06:21'),
('c37a4e33-fedc-44b0-88d1-e73f67f99528', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":30}', NULL, '2024-12-06 17:57:42', '2024-12-06 17:57:42'),
('c5a1a449-301d-47d5-b91c-0a9aa56d0ce2', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":49}', '2024-12-15 20:11:06', '2024-12-15 17:21:04', '2024-12-15 20:11:06'),
('c6737ad6-8b56-438d-aa43-e6d776efe220', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":19}', NULL, '2024-12-04 11:55:53', '2024-12-04 11:55:53'),
('c6ac8633-3f62-4c3c-a652-698fd6cc5cf9', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 69, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas\",\"id\":80}', NULL, '2025-01-11 17:44:23', '2025-01-11 17:44:23'),
('c7f0930c-59b9-4a4b-bb47-69aa2d853cb2', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":36}', NULL, '2024-12-08 21:23:15', '2024-12-08 21:23:15'),
('cf015841-fc38-4ffd-a0f6-d1185d332c7e', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":69}', NULL, '2025-01-08 18:36:42', '2025-01-08 18:36:42'),
('d1b048e0-9463-4ec7-81c0-6a4de11d77d5', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 62, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":92}', NULL, '2025-01-15 12:20:41', '2025-01-15 12:20:41'),
('d42ce63a-c52c-4021-9377-90c92a5d673f', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 69, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas\",\"id\":86}', NULL, '2025-01-11 18:44:19', '2025-01-11 18:44:19'),
('d5fe7d7b-e718-4ef5-aa63-91cb2b7dc4b0', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 DIAA UDDIN ABABNEH\",\"id\":27}', NULL, '2024-12-06 12:01:23', '2024-12-06 12:01:23'),
('d634599e-b75a-43c4-bef5-02c3cb74331e', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Cancel \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":58}', NULL, '2024-12-20 18:47:24', '2024-12-20 18:47:24'),
('da2c404e-d7a8-46a1-8211-c65e20b7bd84', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 1, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u0644\\u0639\\u0628 \\u0627\\u0644\\u0647\\u062f\\u0641\",\"id\":94}', NULL, '2025-01-15 16:03:27', '2025-01-15 16:03:27'),
('dbd23879-01e1-4e03-88f3-984aa3c8cba1', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":94}', NULL, '2025-01-15 15:44:45', '2025-01-15 15:44:45'),
('dfa795d8-cef7-4a5f-8ca4-2b7b23836362', 'App\\Notifications\\CardChargedNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u0644\\u0642\\u062f \\u062a\\u0645 \\u0634\\u062d\\u0646 \\u0643\\u0627\\u0631\\u062a \\u0628\\u0642\\u064a\\u0645\\u0629 100 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas2\"}', NULL, '2025-01-11 18:49:10', '2025-01-11 18:49:10'),
('e008efaf-9c06-41f6-ac73-d0efd051384a', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u064a\\u0627\\u0633\\u064a\\u0646 \\u0627\\u062d\\u0645\\u062f\",\"id\":63}', '2025-01-09 00:05:16', '2024-12-22 18:34:31', '2025-01-09 00:05:16'),
('e0496979-93c9-4ec0-b1f8-cd21b38412b7', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":68}', NULL, '2025-01-08 18:36:42', '2025-01-08 18:36:42'),
('e1434183-9f22-4690-8c52-780793c1ee49', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 24, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":11}', NULL, '2024-12-03 07:14:06', '2024-12-03 07:14:06'),
('e16a7d4a-fd27-4210-a434-29bb3fe2ef1d', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":44}', '2024-12-14 23:47:46', '2024-12-11 13:44:11', '2024-12-14 23:47:46'),
('e1dec3b6-bbf7-48d5-9bd4-621d1f7ec5a3', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":70}', NULL, '2025-01-08 18:36:42', '2025-01-08 18:36:42'),
('e2fdfa98-1c17-419f-bb93-00e8813e7343', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 77, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":95}', NULL, '2025-01-15 16:00:55', '2025-01-15 16:00:55'),
('e5d659a4-bbae-4420-baa0-5fd08a39736d', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":58}', NULL, '2024-12-20 18:44:11', '2024-12-20 18:44:11'),
('e5ea72e4-7db7-44b3-9389-925dd4cb07d7', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0645\\u062f\\u064a\\u0631\",\"id\":82}', NULL, '2025-01-11 17:53:41', '2025-01-11 17:53:41'),
('e85c2fa2-c425-48e6-a030-269787438522', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":95}', NULL, '2025-01-15 16:00:55', '2025-01-15 16:00:55'),
('e9d5e0d3-0b80-4daf-b604-213a610a7dfc', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 27, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Ayoub\",\"id\":5}', NULL, '2024-12-01 17:47:09', '2024-12-01 17:47:09'),
('eb286ef8-4b3e-489d-b7d6-bddb92b74b28', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 62, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":73}', NULL, '2025-01-09 01:37:29', '2025-01-09 01:37:29'),
('eb53f051-19b9-419f-8e56-dd1c954ded40', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":65}', NULL, '2024-12-26 02:01:53', '2024-12-26 02:01:53'),
('ec6e181d-cb2c-4156-82ee-9c986ffa9775', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 62, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 \\u0645\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u064a\\u0647 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":92}', NULL, '2025-01-15 12:23:46', '2025-01-15 12:23:46'),
('ee4bf81d-128f-48e8-a264-033600acefa5', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":58}', NULL, '2024-12-20 18:47:35', '2024-12-20 18:47:35'),
('ef8171cb-89ca-47dd-8493-3a0bed7d73ae', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 25, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":4}', NULL, '2024-12-01 17:41:37', '2024-12-01 17:41:37'),
('efe2735a-596a-4a64-b6b3-9ce2fc9511aa', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 \\u0625\\u0644\\u063a\\u0627\\u0621 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":69}', NULL, '2025-01-15 12:28:56', '2025-01-15 12:28:56'),
('f21edf46-cdfc-44a9-ae5e-cd8aa14ae5ff', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Completed \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":57}', NULL, '2024-12-19 02:49:44', '2024-12-19 02:49:44'),
('f5d65b24-38d1-4d22-a300-3f78d1502757', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Ayoub\",\"id\":24}', NULL, '2024-12-05 15:58:38', '2024-12-05 15:58:38'),
('f61ce658-bf92-423b-a82a-14562ee514b0', 'App\\Notifications\\ServiceBookingNotification', 'App\\Models\\User', 37, '{\"message\":\" \\u062a\\u0645 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062d\\u062c\\u0632 \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u064a\\u0627\\u0633\\u064a\\u0646 \\u0627\\u062d\\u0645\\u062f \\u0625\\u0644\\u064a \\u062d\\u0627\\u0644\\u0629 Approved \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 admin User\",\"id\":63}', NULL, '2024-12-22 18:43:13', '2024-12-22 18:43:13'),
('f7bab4f6-1260-40af-9a1e-96a168020282', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u0644\\u062a\\u062c\\u0631\\u064a\\u0628\",\"id\":3}', '2024-12-01 18:44:07', '2024-12-01 17:39:21', '2024-12-01 18:44:07'),
('fb295af1-9cf6-4105-9633-d269ca6b3de1', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 Mohammed Abbas\",\"id\":91}', NULL, '2025-01-11 22:49:20', '2025-01-11 22:49:20'),
('fbce3277-d43b-4361-bd55-04150060f0ff', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":64}', NULL, '2024-12-26 02:01:53', '2024-12-26 02:01:53'),
('fc77fc4c-cdf2-44c7-b1cf-69abbf764e29', 'App\\Notifications\\CardChargedNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u0644\\u0642\\u062f \\u062a\\u0645 \\u0634\\u062d\\u0646 \\u0643\\u0627\\u0631\\u062a \\u0628\\u0642\\u064a\\u0645\\u0629 100 \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\"}', '2024-12-15 20:48:07', '2024-12-15 20:45:29', '2024-12-15 20:48:07'),
('fd15cc56-a277-4e0c-a035-be043734defb', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 1, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 anas\",\"id\":40}', '2024-12-14 23:47:46', '2024-12-10 08:52:15', '2024-12-14 23:47:46'),
('fdbf4c92-68cb-4cf2-963d-807f30ae1cd8', 'App\\Notifications\\ServiceOrderNotification', 'App\\Models\\User', 37, '{\"message\":\"\\u062a\\u0645 \\u0625\\u0636\\u0627\\u0641\\u0629 \\u062d\\u062c\\u0632 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 \\u0627\\u064a\\u0648\\u0628 \\u0628\\u0627\\u0644\\u062d\\u0627\\u062c\",\"id\":44}', NULL, '2024-12-11 13:44:11', '2024-12-11 13:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('prigorota999@gmail.com', '$2y$10$EhoTcbVakGgsfaY//rFmsuFsTBGSL9UVG3fg99l12Ds/dxsfcWN7O', '2024-10-10 12:15:17'),
('tralfas4@gmail.com', '$2y$10$ES/gpSl7LquqpmvMv8OrMeopscvjdoa066YqWnt7a/dlXNUUoqtMe', '2024-10-10 14:26:28'),
('rohdenl123@gmail.com', '$2y$10$o1cXE7HR6KwMAhL.QFXdSOGdOkO/8wQLMsQpgcxfZ79FjjtmqINUy', '2024-10-10 17:19:24'),
('srusr2@kstp.at', '$2y$10$8pfy9Et1H2TjDX1CiYfSL.AOxqcZpWgH4X.wB6kXOZoDO0nW35u4q', '2024-10-11 10:57:14'),
('annettbrueckner07@icloud.com', '$2y$10$L5cCIqvC/4DLHCdb7snG9.tFeBrC7U9sfNOAT9pIADwtCVEY2WSRW', '2024-10-11 17:32:38'),
('victorponce37@gmail.com', '$2y$10$msEDm7NbM/Lp/i0PdqA4zezyAm.4B.wXNyr6zDaKVm86xXCQPc9dC', '2024-10-12 11:47:12'),
('eloizasc721@gmail.com', '$2y$10$BHKkMYy7ISZQoVqGP7fYCeKURSQ2SZewfxQU9kt/SZLpM.dIS6pva', '2024-10-21 04:04:39'),
('sallyfhy@126.com', '$2y$10$xz73rCccoDkGkErB.4i.v.gr7Ue2lYtupidQN3hD9y3Dj/OBxa6di', '2024-11-04 22:11:00'),
('marselusmanov9071@gmail.com', '$2y$10$ED6J8xUZo3/clVDlf62tcOjn2JydAKKQQwd8JGSLTWdv8Cb40zVqq', '2024-11-05 20:04:54'),
('loren.sahay@gmail.com', '$2y$10$riksU92SnvB9Hx.rHLrVROipaRk14kvS52Xa25eb8gcFK/VEjybVq', '2024-11-05 23:08:36'),
('sirokuro3110@gmail.com', '$2y$10$R/YpW4N20P76qjUwnWzIQehzNY1v3jy8rmNj71cCbjy5YF5O.1Spq', '2024-11-06 00:34:45'),
('mills2086@gmail.com', '$2y$10$ybDZKpE/aa3R89x1vHNhwuhgZrB0IIOUZrG9X7wYSlFksomJKpvku', '2024-11-06 00:38:22'),
('jloved31211@gmail.com', '$2y$10$VBl4ADQ.eD6zy.tWKOljZOwDeuP83rq0hLTp06Kh4.3nteBuofk7.', '2024-11-06 00:50:11'),
('poikathu4696@gmail.com', '$2y$10$cAPDWVuTBdSQwqVNG3jEPOh9x0B3ZcvQH.mAWQAnd2/YA8wxCyWZi', '2024-11-06 00:58:33'),
('tom.lynas@hotmail.co.uk', '$2y$10$SDV9.YpaQU.ZXc55rqHVWe6ZE52zI/iAVZa6vrT3AoUtu7IoYdXxS', '2024-11-06 01:49:12'),
('whitefrederick992@gmail.com', '$2y$10$2o6H/q4aZ3tzFd6lRBLadu/ppNydeDYxBqHrX.W4qPaj0mLgaVtxS', '2024-11-06 01:52:43'),
('kirstenrauffer@gmail.com', '$2y$10$fm04WRJNectHoQkqSHvvLODOn3SthNzDnFQk3JLHmTHN5fX/TVESS', '2024-11-06 01:53:02'),
('nasirloh@gmail.com', '$2y$10$X1aL8QGuKlznr8u7BT8nRukI5d.GrLR27EN2DeVV/wIGRIFy4HDl.', '2024-11-06 02:03:55'),
('williambarrettiow@gmail.com', '$2y$10$smMkSbRX6.BPH0ab5RCZ3uFiBaSfXszpBE6hjjB51BhL4OnE1ypbm', '2024-11-06 02:18:03'),
('brinauer@gmail.com', '$2y$10$BTRSOqnN3R2sa0WQn.ucqutQVMlJUli1TbsCRdxTDJv/cHunm1KTK', '2024-11-06 03:31:46'),
('charmsounique@gmail.com', '$2y$10$7SSbFEtDqdkjOPQbolV6COIAWmGzlAugqWvuS6gp.7lXUBcLVPpCq', '2024-11-06 03:32:05'),
('ashcdomer@gmail.com', '$2y$10$TM/FhEf.Go7muYb3jGtDoejN7pdd951vCkPZgapVquE3B480oxiQi', '2024-11-06 03:59:09'),
('basem.alosh@gmail.com', '$2y$10$lElY/qLcJH8vYP0O8WbZzOtUdHGrLVy7FdyROMszwY2U.te6qLoBG', '2024-11-06 04:32:44'),
('2wigzellst@gmail.com', '$2y$10$3b3s/JzsE67je84X0.7xvexAZn/4yEkrL4uYo1.E/vACj9XUV6M5e', '2024-11-06 04:43:22'),
('mnaylor1@gmail.com', '$2y$10$FN5i3vjH5Eo57poXtt63EOziqLodHTty9BzSZmi3JDkRDF9FCGUE.', '2024-11-06 05:48:53'),
('stephen.w.jackson2@gmail.com', '$2y$10$iQv5jQOco/KbHBgMuz5E6ed7yRDNdmiwhmB8cT1akQjvzQlLX.Ex6', '2024-11-06 06:46:38'),
('carl.werner@cms-hs.com', '$2y$10$g62ep7FtF4lgsQPhNIhWpOzsEclOM0rLO2EXTlbkVgoFFVkJMgfAq', '2024-11-06 07:51:42'),
('arne.claussen@secop.com', '$2y$10$sO4JIp3ygEjOlhqKDbrvK.lEfhPjsIkEr4pkwVtkq5n7KKeYKcWm6', '2024-11-06 08:09:59'),
('benjamin.widmann@herma.com', '$2y$10$mxMaHuNwnh5YAbHeBUwkke8GMsIQctZZtgBtyFvQUkcawvi44us5O', '2024-11-06 08:17:03'),
('barbara.gerstenberg@centrotherm.de', '$2y$10$.zuLzO6Lri3x8sFKjGLqPuaLH/IVefnWQ/anouCcSkmo6.3HVd.o6', '2024-11-06 08:32:21'),
('britta.peters@clage.de', '$2y$10$rclJzCcOeVkr.44/79mpvegasNpWs9O8fQJKd4L/5eaXzlRVgDomy', '2024-11-06 08:33:12'),
('daniel.tahmasebi@lewa.com', '$2y$10$qi.Y6rQAiePCb.ivoCfSf.xZk.IkFRHQr0RS./bdWBDGDDsIRk5my', '2024-11-06 08:56:46'),
('christian.bloedner@silbitz-group.com', '$2y$10$3R5jXjGij0498IX72yciQerZwycneet6S5GJyPjd3HBAR1Ha5vfO.', '2024-11-06 08:59:10'),
('carolin.lind@dbag.de', '$2y$10$2RtkpYYTn9GKd7XHTwrC7OLce4/5u8gsr0RPEa6iQMu3rD1rHt11C', '2024-11-06 09:12:17'),
('christoph.schmidt@verbio.de', '$2y$10$rXYGeMqx1TeoVVftgEbr3ucNXnH5.sBjhVrHZxgS4j8KLrNdyY2iW', '2024-11-06 09:34:18'),
('carina.harmeling@heiderefinery.com', '$2y$10$.K.ynSWrkQhisaP6Cc7PYeZwhVGGSj8p.HnT4ibFLU85DU4bbuFhm', '2024-11-06 09:44:23'),
('falko.pohle@gmail.com', '$2y$10$KL6JvCTDsH5amHfX.djYGeRKo5yohB3YVKdH.pRycyCsz/HYyHKqW', '2024-11-06 09:48:19'),
('ayandgupta@gmail.com', '$2y$10$ywoONuZ0ZKPtPiMGepxhlO9mqinxUp.buFl/8n4YvBGX4LHpUqjrW', '2024-11-06 12:27:39'),
('lfyang2012@gmail.com', '$2y$10$exR5udjxbCd9r1KS2OinaehzINARDl7xiYu/z9XcWyxIvd8DkHl/i', '2024-11-06 13:40:07'),
('nicolafoxley@gmail.com', '$2y$10$mrJTEP9Rg/hHL5Y5OSabwOUhNW6Amz9JL/.5GlTDiGOBsbdXqJMYu', '2024-11-06 14:59:29'),
('aeliptico@gmail.com', '$2y$10$J/QdBos6XTwGEuq96Ln3K.Bfuno2.NIi8Rsx9vg6o7aNgOLQWloh6', '2024-11-06 17:25:34'),
('garnettaterry@gmail.com', '$2y$10$awxRontPhpo3SrnwvzC/y.B66HpuLUGmM35nOK5e2kcMFGB9c4sR.', '2024-11-06 22:15:44'),
('mitnfst@gmail.com', '$2y$10$k6oMjMyhuCS9KlnUpuTNF./HWntOBZ0pzjgJdGFQstGEZFA9k.4Jq', '2024-11-07 04:49:41'),
('jaymccuskey@hotmail.com', '$2y$10$q9Bvirpaa3J5HwIc1Nt7OewJ0UGi9bZUp.oS/lzB8q/aXnV5TNMS2', '2024-11-07 05:14:00'),
('macross720223@gmail.com', '$2y$10$oMeAPDwh/pcw6JxVQjYFEuZ4dWOdX4uMUkKy1KUwcaBFowfaW1Y32', '2024-11-07 05:17:35'),
('melodie08@live.de', '$2y$10$4TUsXBlMk/AJ7p0Nl.qtLeVUktRvPMgNpGAcFusmvYUkB8addmFSm', '2024-11-07 05:34:34'),
('adturnerbbq@gmail.com', '$2y$10$OoP55qZYpIiUFdAvKLOYSue4x3LPt0/.Tp/97s6igoHbBs2oPc3wu', '2024-11-07 06:15:48'),
('chevillaverde01101@outlook.com', '$2y$10$sV238tX0P8T4G5mRBq.PlubB835UDyxVU2PVZE4tSXe2/EVephIjK', '2024-11-07 06:17:25'),
('s.komeizi@gmail.com', '$2y$10$nNW9KojZ4VPH4hnvM6EKpuxbKb4qdlJEgRFgT0F3ekb7nQX4bK2AK', '2024-11-07 08:38:11'),
('g.kellmann@traxit.com', '$2y$10$DuqQHcee3G5jy4hc8borBeC55XrkgnOztMDMyP91zS9LVjuqAFfNK', '2024-11-07 08:55:00'),
('jezzika223@hotmail.com', '$2y$10$hVPYxfghII0.fHcyuUWWpe./DRItKZRVWJf9.JjVskyp4tdZCgqIa', '2024-11-07 09:06:20'),
('mitnfst@gmail.com2', '$2y$10$cF5DC7ZxtP4MFrb7cGNDoeG2TijdbWy1XIRJIUQVzIaSXKYA2x/my', '2024-11-07 09:14:51'),
('kgaffney@freedomboatclub.com', '$2y$10$QSLPVJ/vhaXYSecA0WYf0.WBgrDKYhfD1xjiZy4Zp27Z2/Y37/7GO', '2024-11-07 09:16:31'),
('martitahitia@gmail.com', '$2y$10$YZHJJLVD1ZiZaIfYp0lYOemWf/dK9T0hEcrJfson1y4RmscsmK39y', '2024-11-07 11:07:54'),
('rciot@tempestive.com', '$2y$10$bUTtkhmdqhr0aCjcCLuQPOMo5QFRyx1GGoaGTgJ9lkoFiJXOIbe2e', '2024-11-07 17:21:23'),
('tchinchilla@tscga.com', '$2y$10$4njhNxFHYiYEq6h4VmJcXOfRyOe4m0Ll2viXTbgSfysuLyv6nZea.', '2024-11-07 17:50:13'),
('davisfelicia0915@icloud.com', '$2y$10$A/X.bXmhMRKd7M65LZ8EIuUXGR4TAGowQ.0hXqgAL8eosXpNCC2Xa', '2024-11-07 18:50:22'),
('logan020@gmail.com', '$2y$10$RVTOMQDKdhvu15CEthzs0uY9LXBIrDBl1fuWlPzc5C0dp2BsMsCxS', '2024-11-07 20:16:11'),
('gary@tech8.net', '$2y$10$y5UfLyvP4YPPvJ5P4YfKAOLtpq5T2Z8ZDL/0h4CehN.JXxyL05ibq', '2024-11-07 20:16:43'),
('bj@cakenstuff.co.uk', '$2y$10$v1vGsvbFM4ToYoPZezgQh.MBOk1vVOs3msqkGM40mG7Se0p/3fy/a', '2024-11-07 20:21:33'),
('goldwing65@gmx.ch', '$2y$10$gOD4daN8QcVPVr7FcdZrm.TvqYrZi3W9uwHObbyXhUaU7HcjLosHO', '2024-11-07 20:21:47'),
('laura.mangan@hotmail.co.uk', '$2y$10$hCgx7rFxP0T0u3PBdSzgBOcmxsc3tJI7BsG3le/DLDyEe.W.vxBt.', '2024-11-07 20:27:43'),
('titring@blueyonder.co.uk', '$2y$10$UdrZqSTgaBRykhHueoPh5eKXewDbnDN0GGKuHcSsTZMp5HxW0/yvi', '2024-11-07 20:30:55'),
('yfritz11.yc@gmail.com', '$2y$10$LoGAfxsYg8xP.fOla7MXzOnx.C4Kli4y5Tlega1PxaNO0FLSffgBC', '2024-11-07 20:41:19'),
('halley.shanley@stoel.com', '$2y$10$Mte.5yWdP4hXMwlA1OTluOsuT44KZ4sIhPQ6iRzDdKThICNETPf2q', '2024-11-07 20:49:04'),
('09042277xxx@gmail.com', '$2y$10$5635TH.ZgttdTX3peNlWzee4ayMn4EX0QR/zd4Fc/xt5hLS1mT1HG', '2024-11-07 21:07:15'),
('james@bohlsinterests.com', '$2y$10$1UHWasIAYKr02NRAdkoLlukgicaDdUv5eaDrZbA2mDSiXi5/7WZJq', '2024-11-07 21:21:41'),
('mandylcannon@yahoo.com', '$2y$10$fTG8oN6iHYmwt2hvkSZeIenRou9iagS.u0YkIAzubaiCAbL2FrZ5q', '2024-11-07 21:39:39'),
('m.delisha@yahoo.com', '$2y$10$KwNVfyCeyZkgTxz4vyTFEOS0iwojR/0qTUiE.NWKUqYPE37wcGTE6', '2024-11-07 21:40:49'),
('fewgtive@verizon.net', '$2y$10$u7E7axqbZi3.zPP/L1vA4eyopVbQIIi5dR/EW4U55WGdfPFh6jazO', '2024-11-07 21:59:05'),
('david_mckinnon111@yahoo.co.uk', '$2y$10$EdqKR4ETKqMA2/EyoYGxGufGuCtCQgeF.LfdRqo17g6UUhYvZwku6', '2024-11-07 22:10:44'),
('bruce@littlejohncpa.net', '$2y$10$7cDRwXz0NawOUzWvHQKHsOskfZW2QGfv0NSrNgQiQUgTd8k93UjDS', '2024-11-07 22:59:02'),
('john@sailsolar.com', '$2y$10$E.IxJ46kNb.cjvz7Ib5XNOYbJRpXK8jXonn0TzN3RfYzSIa1GaZde', '2024-11-07 23:02:10'),
('ramoncitomang@gmail.com', '$2y$10$VfCf2ikNldAar63FMZXTSu2v1bbnldbJg1SyUZEBODoO1KKOHWwlu', '2024-11-07 23:20:12'),
('sanjive@gmail.com', '$2y$10$L9h1wrbGQon4RQNJJyKQguo/UXxCL5U.lAf9JCVk2IK253KZc8V9q', '2024-11-07 23:43:15'),
('ms_kidwell2004@yahoo.com', '$2y$10$wccvunfzdU66kGq4JGiJh.J5HmVyCmizpFBXFf.XASjGaM5c4ZXOe', '2024-11-08 01:06:56'),
('reagan.b.strey@pwc.com', '$2y$10$B/aziEYcg2RWS0tw02T7xuh2aBe9u4MDAVVv5d6lyEb1Qmw/jDtsa', '2024-11-08 03:35:33'),
('chaz255@outlook.com', '$2y$10$QhNJiyadU5/41mxULDoGLeBVN1CsKoxpHUTWEL7lLOKMtdA3tB.r6', '2024-11-08 03:36:12'),
('rickshaw785@gmail.com', '$2y$10$dp4tyrQUK5CV8ykslr4SNuPpzs3oXdiBPkcMA50DBkZNtxmeP2tzG', '2024-11-08 04:04:49'),
('uomogawa@gmail.com', '$2y$10$M3pS0NeIH3ap8DJFU9INFubdRbazzsNCV755E8Kw0.DJIk5FcD0v.', '2024-11-08 04:48:43'),
('sowaltz555@gmail.com', '$2y$10$1ccuBe9B/7A03E3cS0oHM.mGYe7.kyvcxR.Q2/wPus35/RP6qpEsO', '2024-11-08 05:22:15'),
('myoken7676@gmail.com', '$2y$10$34f1mopnzJvkZhoGBqOsh.4RkXbmOG6vIszrJbR/Q7jaiprqY7En.', '2024-11-08 05:42:32'),
('pookiemcclain@yahoo.com', '$2y$10$JBPU/qdwmdgh3i2NERJ.x.diSMV2D0JBag6VdUJutzV4X2j5Jdc3q', '2024-11-08 06:43:50'),
('blackirish331@gmail.com', '$2y$10$x4nHChw3AQsoim4Nh/Db.u7ur0u4Z1dWfksJaN6EuXIQprphSyX/e', '2024-11-08 06:49:10'),
('tes327@yahoo.com', '$2y$10$lj5MX8z0lRfEpzbOgengYO2Sd6FdymaKOJMiZbLy5dr8i6ZhZvLYy', '2024-11-08 08:08:44'),
('m.schroeder@regupol.de', '$2y$10$25zm0bjpD03Dgm0ceCNmDOWkuaQw73Ja4LMBPDXNbsJvCrWv/FqdS', '2024-11-08 10:55:15'),
('peter-rosenfeld@dg-email.de', '$2y$10$FPiLEOP3BIZQQ9H1xaEf2.65Z5zDhl0eP.9UNLhglowiRM4vaJ2Fe', '2024-11-08 11:41:04'),
('fam.pilz@kabelbw.de', '$2y$10$//H1Yhh3eT6VmFUGvOnHj.QQM4rlVL72TN.mOzD7sJgrkNV5EcE92', '2024-11-08 12:19:38'),
('bmcclelland@emberit.com', '$2y$10$/bYpbbGZBtvchPCCR/R8r.i0sElvzopmKf6d23Iz1k1fhEt0KRKfC', '2024-11-08 15:50:29'),
('ansunt61@gmail.com', '$2y$10$Mxxp9lNrLIUOU5NuXfhTFuQYNMHouMJICxIK9kTtulQmnG7YDSdIy', '2024-11-08 18:11:28'),
('kkimstan@aol.com', '$2y$10$lXg9cFBHdhyJf6rCWMzCcut2ZGJgYENn7W594ex8r7KTO7DjD3VNm', '2024-11-08 20:04:40'),
('drodmd@yahoo.com', '$2y$10$iVKIZbzMVgD4sfc0308knutX5gOmHIQ/dX9BR17Ad675Ntc6OJrFK', '2024-11-08 20:06:26'),
('ingridkneeshaw@live.co.uk', '$2y$10$bs.hdCCjTmZZ4rtChuxHX.COYBj6jiXtjmallAQ9rTG9w/ejOvxR6', '2024-11-08 21:07:14'),
('bkillion@dukemfg.com', '$2y$10$V0A6Soqpive7xzT.0T6i0OlARa9nxgvgY5FzG706pyyMFPQclmANy', '2024-11-08 21:32:32'),
('andrej.kolbasow@pvatepla.com', '$2y$10$WKAPGhDNc1OuukmQ.3/aEOE6zThyBsBckhn8t4QZBRC7YnVezerAi', '2024-11-08 21:42:20'),
('gtp666@yahoo.com', '$2y$10$sUIGccqqWWFUrN9Cc6HY6.6rNUlsZ1GEFGjJF5RIPGiHG1R2jg/AW', '2024-11-08 21:49:09'),
('khusm00@gmail.com', '$2y$10$FnSxQh1KdFGDvttJChRkueFEMKNlTIr8DiM3gGjcS1oDgoqVl7P6u', '2024-11-08 22:04:07'),
('hyperjenn713@aol.com', '$2y$10$DNXJh1az3.XAf0QlzLg3LuAON4zRCN2mFnAC9Pkpz8JCjP9B0LpDy', '2024-11-09 00:56:26'),
('rydolfrussell235@gmail.com', '$2y$10$e3pR1sbkFOHqh4eCeT/OZu3hkoumbxIUluCF3oWFNno7pIbM6cayq', '2024-11-09 02:16:07'),
('donnacowperthwaite@yahoo.co.uk', '$2y$10$Q5K2KdFjkUD8xcXy4TB3JutNZqH8JiI7CfrsK6.njGYXdAVSVRSKS', '2024-11-09 02:33:26'),
('hoangalaszeski@yahoo.com', '$2y$10$1BFzJZhPNFzuBkyHcwKESuibww948QVvKnA6.L6OQvP.CkNgtWBSi', '2024-11-09 04:46:26'),
('jimenezfinella7615@gmail.com', '$2y$10$Ulc2uWuisSB6/DlQIkWjx.p8AaUuhNHo2v7PUiTTivx0keNOjzrn.', '2024-11-09 05:18:30'),
('goiti2@yahoo.com.jp', '$2y$10$6xVUS3ywL7.9Z7FqnRUL3OKZozgPCxqoMOS4M.qgTBRha8750AkfS', '2024-11-09 05:55:49'),
('mshumar1@sbcglobal.net', '$2y$10$eTviCrZfHkC.F9sji10gLOwYFJIqAPT2QGFCf5p24dvfrg.7eAej.', '2024-11-09 07:55:52'),
('stephruiz91@yahoo.com', '$2y$10$vKL7tSO.2HqknNvqXv59xO4i7RmxqGQKb2X0.DwGfN.h5ezgydlcu', '2024-11-09 09:21:59'),
('mrschappy2001@yahoo.com', '$2y$10$dyb0bEHL28mUDATr376NU.ugnJKjAo/bKA/sFTZ3yQNP/4P4Op/Lu', '2024-11-10 05:07:57'),
('nubian3289@aol.com', '$2y$10$3FXYyXZ6E7JKR0mb8P9v/Oz741y9B3GQfyh5iYQStHx0ZRAltXB0O', '2024-11-10 05:56:37'),
('matthew.d.oliver.98@gmail.com', '$2y$10$9YqMm99Tdy2GfqEqkGg.DOSfQOJ/4rngVQw6SGT.yjfw2YDzoLecW', '2024-11-11 15:40:50'),
('jfwilliamsgt@gmail.com', '$2y$10$lnG7qqbbclqSt2CVutMiI.eitRRaKU7bmPSVMxcvzWp2Lk3tTOfBW', '2024-11-12 19:55:27'),
('dennisbosley303@gmail.com', '$2y$10$rQd056xzxtwWhzgCjKyc5OZ4hTNYIMazb/j0eFhvdtFkCIXwNavS.', '2024-11-13 10:17:30'),
('jensbachmann@aviareps.com', '$2y$10$1r.0p2hru212VrdnlU86be2h099a4GaNGVzZdMS5k0zyYMgXf3RxC', '2024-11-13 10:24:04'),
('tporter@dtool.com', '$2y$10$eLCPmUqk9RZrlG4w43hYh.RbpmEB0u40SoSUj9GvezaDBD/uunyt2', '2024-11-13 10:47:26'),
('gabriele.delmistro@bertschi.com', '$2y$10$P0wZzt/4Egl.S4GXO7BoLuE6dMcG0J1fX.GZaDh69igsgxfjdHvVG', '2024-11-13 11:30:49'),
('kimberlynykiforuk@gmail.com', '$2y$10$vaLePgq6eiAly07s78buk.U/hRp2Q7KO5CN.bpe6wUPxcmGuQ8ISy', '2024-11-13 15:27:12'),
('ron.gaydos@gmail.com', '$2y$10$WbEnLCkrWBf0.blrFHFMQeTyuDeCni6hBZFgFLnP5sGVw4J08XkjW', '2024-11-13 18:40:49'),
('jimpetrino@earthlink.net', '$2y$10$HlZww8adhDpUQ0EynME2eOSH.iRlDhdlEF6AFucZTYmHeHK7HZdua', '2024-11-14 03:25:14'),
('kimwbecker@gmail.com', '$2y$10$3bwuQ7EeFlcm/5X1op/2muaiyFG9f99I4dCkSENpppjQjC8M6K6a2', '2024-11-14 04:10:38'),
('j.emmanuel48@gmail.com', '$2y$10$xh.SKny8o0tso0GrpTrDquQzr1CwrIiDon0f.ninyMiwAT8f47JMe', '2024-11-14 06:56:11'),
('jeanmariekondek@gmail.com', '$2y$10$2hEf.59xIk5RbAL.cMw58Ob0kqdtf8afpPfFPspeQsIJTbpHAK.Gi', '2024-11-14 07:38:14'),
('k.ruttmann@gmx.at', '$2y$10$paWjP3ojb8PUhhGOsXGWpu7R7QO.xpmVFbRRezL4U1yvvOI8BOOcS', '2024-11-14 09:39:22'),
('oakhilld@gmail.com', '$2y$10$4w9m25f/CvPNReowoJTaVeZ8CXMnxUilOgotibiP9Za8q2Zbry0Ve', '2024-11-14 17:28:38'),
('nadine.gravelle@boartlongyear.com', '$2y$10$pvghu6tRvEJnEt/yB.K2euIqHVxBsoVbiWqaYt37UgEQWYgh3P8Jy', '2024-11-14 20:26:14'),
('marianelamary14@gmail.com', '$2y$10$/ANc994aB6V.gwP1caRBs.2U6emZCoM9RhkPjQQiH5TosbwIulD86', '2024-11-14 22:01:28'),
('doriangray8000@gmail.com', '$2y$10$q0SA/YdijlegvHWK5tzqiOG3NPTb/pNU7Fp6/U1jHrD3t76q4aSSm', '2024-11-14 22:20:01'),
('arroyetti@live.com', '$2y$10$u5NILIkRyR0Gas2O1o9nIuthV/AflCdNTD2i6F1KjSP1HeVczPnYu', '2024-11-15 02:15:30'),
('flint740@gmail.com', '$2y$10$75iVZjcrrHaKh3tCz3Wf2uqpdlszSqOyKF2iIiAGeO/EYNlLj/SMO', '2024-11-15 04:33:56'),
('morgwnrimel@gmail.com', '$2y$10$3EeO6wLohnyxdGxYkbAlUO7dIdeCzUpZqiFW..5e8fHgG9iUJpHiq', '2024-11-15 08:33:48'),
('pkconley58@gmail.com', '$2y$10$JEY5Jr18NV0NddCzlMdBU.61VFtM9S6KeMJ87A13sJgeQ0ZHiADU.', '2024-11-15 15:08:17'),
('db941955@gmail.com', '$2y$10$XwDWhOUs9C/Sc.RMCZY.4.ZsKifOEbk4qoklO3ejcCYSIzEh8VRVi', '2024-11-15 18:51:14'),
('j.j.mehilba@gmail.com', '$2y$10$7Bs8K2EzhmCT5R.lAhQ.auUffEm4ZeXG/DoytqWENAmCnrqtKtpRe', '2024-11-15 20:45:29'),
('connieghill@gmail.com', '$2y$10$k2gaQTP72mWz92qXktS1YeyBu7WcK40tVsBz11xLF.24uSekI41Om', '2024-11-15 20:51:19'),
('agulatt@live.com', '$2y$10$/3x6UKszmakxkpJ3OtYIfOd8H/xhnAycc8kifTn9SSH82bTCtgSMC', '2024-11-15 21:30:28'),
('jsf050847@gmail.com', '$2y$10$qHz6uleyo5DxrCPhT.O1Fu5CkxTqeGZ66mD/0blbfgUP5WD6PuxiS', '2024-11-15 23:03:00'),
('sven.lobstein@eizadesign.de', '$2y$10$GLYgOuF71fbZAGpLGJ.JLOheH9PfGWqboj0ic1BHQ5/P9kUSuLRIK', '2024-11-15 23:12:01'),
('collinslarryr@gmail.com', '$2y$10$qDI4adYemKaipuHvIlA1dOhYdKpcYZezDXDymLdjt51FshtnrlE4.', '2024-11-16 00:08:33'),
('bahamilton7777777@gmail.com', '$2y$10$xT634Ae0bpZrl8nPky8zB.n0VIP0OuXr5nkRY6x3RX5RNhGqnWuv2', '2024-11-16 04:06:36'),
('vqunh17@yahoo.com', '$2y$10$AZ2KClr72aDMlKma8TK12.5/4i1uPmD9JuBzIcMnuKyFk6lvV1TQu', '2024-11-21 22:52:59'),
('dario.1955@yahoo.com', '$2y$10$2KV7ahYfCP/oeC18.rHMEOsICEf31jeG8PO0oId1ibuhXgTczXB/e', '2024-11-23 11:36:11'),
('ksiliyapearson742@gmail.com', '$2y$10$3Sn7GxJjA92wLhHGkn8oDe8Mz9e2muU8UtnTpBXvagH5g71bLqts2', '2024-11-23 19:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `sch_employees`
--

CREATE TABLE `sch_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `image_url` varchar(1000) DEFAULT NULL,
  `employee_id` varchar(20) DEFAULT NULL,
  `cmn_branch_id` bigint(20) UNSIGNED NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `hrm_department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hrm_designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gender` tinyint(4) NOT NULL,
  `dob` date DEFAULT NULL,
  `specialist` varchar(300) DEFAULT NULL,
  `present_address` varchar(500) DEFAULT NULL,
  `permanent_address` varchar(500) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `pay_commission_based_on` tinyint(4) NOT NULL DEFAULT 1,
  `target_service_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `passport` varchar(1500) DEFAULT NULL,
  `id_card` varchar(1500) DEFAULT NULL,
  `commission` decimal(5,2) NOT NULL DEFAULT 0.00,
  `salary` decimal(9,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sch_employees`
--

INSERT INTO `sch_employees` (`id`, `full_name`, `image_url`, `employee_id`, `cmn_branch_id`, `email_address`, `country_code`, `contact_no`, `hrm_department_id`, `hrm_designation_id`, `user_id`, `gender`, `dob`, `specialist`, `present_address`, `permanent_address`, `note`, `pay_commission_based_on`, `target_service_amount`, `passport`, `id_card`, `commission`, `salary`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'حجز مسائي', 'uploadfiles/pJWslVw7VuTQaXSrd1GQbk54yoeBNtd2hOGCCQpU.jpg', '1234561', 1, 'm@gmail.com', NULL, '++', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 24, 32, '2024-11-29 19:58:09', '2024-12-02 08:19:42'),
(3, '123', 'uploadfiles/zC3KOUVw9QfJi48blepm9EPVzSv417VwRwj4vIWy.jpg', '1', 1, 'abdelghany1699@GMAIL.COM', NULL, '+20111111111', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(4, '1111', 'uploadfiles/fuh7XInmukOly1M0TrRjEB0tNFXbSWEGeaJ06Wjw.jpg', '3', 1, 'abdelghany1699e@GMAIL.COM', NULL, '+2012312312', NULL, 3, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(12, 'حجز تجريبى 2', 'uploadfiles/KVLHOdYdVFXlSEAdc6xE9IpCkRiEuNCfU7ydgjXj.png', 'حجز تجريبى 2', 3, 'aa@aa.com', NULL, '+20565465464', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(13, 'ملاعب تجريبي 2', 'uploadfiles/eMNj67bAyQMCTThbUuxNRHKHuOaCxdcvPVMo8ofx.png', '5263252', 3, 'goal10000@master.com', NULL, '+++', NULL, 3, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(20, 'تجريى الثالث 8*8', NULL, '2123', 3, 'asd@asd.com', NULL, '+2000123123', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 1, '2024-12-03 16:32:12', '2024-12-03 17:30:24'),
(21, 'حجز مسائي', 'uploadfiles/wahDw0A6xjHtFipj3FCDF5hTEWmXo9MBPQG5QLpz.jpg', '1234562', 6, 'mg@gmail.com', NULL, '++++++', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:29:32'),
(22, 'حجز مسائي', 'uploadfiles/5ki6RK6dujCxjWla5xaj6EDt9UEOkfmEBOlcbLzs.png', '1234568', 6, 'ahli@gmail.com', NULL, '++++++++++', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:48:19'),
(25, 'hh', 'uploadfiles/yu8nkg69AKPCHiM9j5eY1z4GHI9JG4poZSU9FZpI.png', '12345679', 6, 'am@gmail.com', NULL, '+++', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:52'),
(26, 'ضياء2', 'uploadfiles/8lE6XBqixCgtBSpurC7RXCRZGnnmYnBIB0Cexipg.png', '52521', 4, 'diaa@gmail.com', NULL, '++', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(27, 'ضياء2', 'uploadfiles/dVGN5S9kPJBQJBCm2CDHD7UT6HlNUTE9NNuQutUO.png', '55222', 4, 'sdad@gmail.com', NULL, '++++', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(28, 'حجز', 'uploadfiles/OAev1ygh97dImQgBa5PjVvfrTZAjywixcwfDIVN8.png', '12345610', 7, 'Agt@gmail.com', NULL, '+++', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(29, 'حجز مسائي', 'uploadfiles/L0A1f8qNbU55yufbTs41eMrfdZgNGKDS4iIL43GI.jpg', '12345611', 8, 'mlaebgzer@gmail.com', NULL, '+218', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(30, 'حجز مسائي', NULL, '12345612', 9, 'bkvsk@gmail.com', NULL, '+218', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(32, 'حجز مسائي', 'uploadfiles/xAeEHDFZkvyd6gNuO4PRNb7S9fQxWh4YSWHlgFEd.jpg', '1622', 11, 'kfjffu8f@gmail.com', NULL, '+0917307185', NULL, 2, NULL, 1, NULL, '', '', '', '', 1, 0.00, NULL, NULL, 0.00, 0.00, 1, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `sch_employee_offdays`
--

CREATE TABLE `sch_employee_offdays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sch_employee_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `title` varchar(200) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_employee_schedules`
--

CREATE TABLE `sch_employee_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sch_employee_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `break_start_time` time NOT NULL DEFAULT '00:00:00',
  `break_end_time` time NOT NULL DEFAULT '00:00:00',
  `is_off_day` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sch_employee_schedules`
--

INSERT INTO `sch_employee_schedules` (`id`, `sch_employee_id`, `day`, `start_time`, `end_time`, `break_start_time`, `break_end_time`, `is_off_day`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(9, 3, 0, '12:10:00', '12:20:00', '12:30:00', '12:35:00', 0, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(10, 3, 1, '12:05:00', '12:10:00', '12:30:00', '12:35:00', 0, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(11, 3, 2, '12:10:00', '12:10:00', '12:30:00', '12:35:00', 0, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(12, 3, 3, '12:15:00', '12:25:00', '12:30:00', '12:35:00', 0, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(13, 3, 4, '12:10:00', '12:35:00', '12:30:00', '12:35:00', 0, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(14, 3, 5, '12:15:00', '12:40:00', '12:30:00', '12:35:00', 0, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(15, 3, 6, '12:20:00', '12:45:00', '12:30:00', '12:35:00', 0, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(16, 4, 0, '12:10:00', '12:10:00', '12:10:00', '12:10:00', 0, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(17, 4, 1, '12:15:00', '12:15:00', '12:10:00', '12:10:00', 0, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(18, 4, 2, '12:10:00', '12:15:00', '12:15:00', '12:15:00', 0, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(19, 4, 3, '12:15:00', '12:15:00', '12:10:00', '12:10:00', 0, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(20, 4, 4, '12:35:00', '13:00:00', '12:35:00', '13:00:00', 0, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(21, 4, 5, '12:30:00', '12:50:00', '12:35:00', '13:00:00', 0, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(22, 4, 6, '12:30:00', '12:55:00', '12:30:00', '12:55:00', 0, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(31, 12, 0, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(32, 12, 1, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(33, 12, 2, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(34, 12, 3, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(35, 12, 4, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(36, 12, 5, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(37, 12, 6, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(38, 13, 0, '13:00:00', '14:00:00', '14:05:00', '14:10:00', 0, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(39, 13, 1, '13:00:00', '14:00:00', '14:05:00', '14:10:00', 0, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(40, 13, 2, '13:00:00', '14:00:00', '14:05:00', '14:10:00', 0, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(41, 13, 3, '13:00:00', '14:00:00', '14:05:00', '14:10:00', 0, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(42, 13, 4, '13:00:00', '14:00:00', '14:05:00', '14:10:00', 0, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(43, 13, 5, '13:00:00', '14:00:00', '14:05:00', '14:10:00', 0, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(44, 13, 6, '13:00:00', '14:00:00', '14:05:00', '14:10:00', 0, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(45, 2, 0, '13:00:00', '23:55:00', '23:57:00', '23:59:00', 0, 32, NULL, '2024-12-02 08:19:42', '2024-12-02 08:19:42'),
(46, 2, 1, '13:00:00', '23:55:00', '23:57:00', '23:59:00', 0, 32, NULL, '2024-12-02 08:19:42', '2024-12-02 08:19:42'),
(47, 2, 2, '13:00:00', '23:55:00', '23:57:00', '23:59:00', 0, 32, NULL, '2024-12-02 08:19:42', '2024-12-02 08:19:42'),
(48, 2, 3, '13:00:00', '23:55:00', '23:57:00', '23:59:00', 0, 32, NULL, '2024-12-02 08:19:42', '2024-12-02 08:19:42'),
(49, 2, 4, '13:00:00', '23:55:00', '23:57:00', '23:59:00', 0, 32, NULL, '2024-12-02 08:19:42', '2024-12-02 08:19:42'),
(50, 2, 5, '13:00:00', '23:55:00', '23:57:00', '23:59:00', 0, 32, NULL, '2024-12-02 08:19:42', '2024-12-02 08:19:42'),
(51, 2, 6, '13:00:00', '23:55:00', '23:57:00', '23:59:00', 0, 32, NULL, '2024-12-02 08:19:42', '2024-12-02 08:19:42'),
(58, 20, 0, '20:00:00', '21:00:00', '21:05:00', '21:10:00', 0, 1, 1, '2024-12-03 16:32:12', '2024-12-03 17:29:31'),
(59, 20, 1, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-12-03 16:32:12', '2024-12-03 16:33:00'),
(60, 20, 2, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-12-03 16:32:12', '2024-12-03 16:33:00'),
(61, 20, 3, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-12-03 16:32:12', '2024-12-03 16:33:00'),
(62, 20, 4, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-12-03 16:32:12', '2024-12-03 16:33:00'),
(63, 20, 5, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-12-03 16:32:12', '2024-12-03 16:33:00'),
(64, 20, 6, '03:00:00', '04:00:00', '04:05:00', '04:10:00', 0, 1, 1, '2024-12-03 16:32:12', '2024-12-03 16:33:00'),
(65, 21, 0, '13:00:00', '23:00:00', '23:10:00', '23:15:00', 0, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:29:32'),
(66, 21, 1, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:25:26'),
(67, 21, 2, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:25:26'),
(68, 21, 3, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:25:26'),
(69, 21, 4, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:25:26'),
(70, 21, 5, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:25:26'),
(71, 21, 6, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:25:26'),
(72, 22, 0, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:48:19'),
(73, 22, 1, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:48:19'),
(74, 22, 2, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:48:19'),
(75, 22, 3, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:48:19'),
(76, 22, 4, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:38:25'),
(77, 22, 5, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:38:25'),
(78, 22, 6, '13:00:00', '23:00:00', '23:57:00', '23:59:00', 0, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:38:25'),
(81, 25, 0, '13:00:00', '00:00:00', '00:05:00', '00:10:00', 0, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:52'),
(82, 25, 1, '13:00:00', '00:00:00', '01:05:00', '01:10:00', 0, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:25'),
(83, 25, 2, '13:00:00', '00:00:00', '01:05:00', '01:10:00', 0, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:25'),
(84, 25, 3, '13:00:00', '00:00:00', '01:05:00', '01:10:00', 0, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:25'),
(85, 25, 4, '13:00:00', '00:00:00', '01:05:00', '01:10:00', 0, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:25'),
(86, 25, 5, '13:00:00', '00:00:00', '01:05:00', '01:10:00', 0, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:25'),
(87, 25, 6, '13:00:00', '00:00:00', '01:05:00', '01:10:00', 0, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:25'),
(88, 26, 0, '13:00:00', '23:00:00', '23:56:00', '23:57:00', 0, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(89, 26, 1, '13:00:00', '23:00:00', '23:56:00', '23:57:00', 0, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(90, 26, 2, '13:00:00', '23:00:00', '23:56:00', '23:57:00', 0, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(91, 26, 3, '13:00:00', '23:00:00', '23:56:00', '23:57:00', 0, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(92, 26, 4, '13:00:00', '23:00:00', '23:56:00', '23:57:00', 0, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(93, 26, 5, '13:00:00', '23:00:00', '23:56:00', '23:57:00', 0, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(94, 26, 6, '13:00:00', '23:00:00', '23:56:00', '23:57:00', 0, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(95, 27, 0, '13:00:00', '23:00:00', '23:57:00', '23:58:00', 0, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(96, 27, 1, '13:00:00', '23:55:00', '23:57:00', '23:58:00', 0, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(97, 27, 2, '13:00:00', '23:55:00', '23:57:00', '23:58:00', 0, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(98, 27, 3, '13:00:00', '23:55:00', '23:57:00', '23:58:00', 0, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(99, 27, 4, '13:00:00', '23:55:00', '23:57:00', '23:58:00', 0, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(100, 27, 5, '13:00:00', '23:55:00', '23:57:00', '23:58:00', 0, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(101, 27, 6, '13:00:00', '23:55:00', '23:57:00', '23:58:00', 0, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(102, 28, 0, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(103, 28, 1, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(104, 28, 2, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(105, 28, 3, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(106, 28, 4, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(107, 28, 5, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(108, 28, 6, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(109, 29, 0, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(110, 29, 1, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(111, 29, 2, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(112, 29, 3, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(113, 29, 4, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(114, 29, 5, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(115, 29, 6, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(116, 30, 0, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(117, 30, 1, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(118, 30, 2, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(119, 30, 3, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(120, 30, 4, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(121, 30, 5, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(122, 30, 6, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(130, 32, 0, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58'),
(131, 32, 1, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58'),
(132, 32, 2, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58'),
(133, 32, 3, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58'),
(134, 32, 4, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58'),
(135, 32, 5, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58'),
(136, 32, 6, '13:00:00', '23:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `sch_employee_services`
--

CREATE TABLE `sch_employee_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sch_employee_id` bigint(20) UNSIGNED NOT NULL,
  `sch_service_id` bigint(20) UNSIGNED NOT NULL,
  `fees` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sch_employee_services`
--

INSERT INTO `sch_employee_services` (`id`, `sch_employee_id`, `sch_service_id`, `fees`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 3, 2, 80.00, 1, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(4, 3, 3, 60.00, 1, 1, 32, '2024-11-30 10:07:09', '2024-12-02 08:18:24'),
(5, 4, 2, 80.00, 1, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(6, 4, 3, 60.00, 1, 1, 32, '2024-11-30 10:10:41', '2024-12-02 08:17:35'),
(7, 2, 3, 60.00, 1, 1, 32, '2024-11-30 10:11:34', '2024-12-02 08:19:42'),
(15, 12, 4, 30.00, 1, 1, 1, '2024-11-30 13:25:41', '2024-12-03 17:26:40'),
(16, 13, 4, 40.00, 1, 1, 1, '2024-12-01 18:26:29', '2024-12-03 16:23:39'),
(17, 2, 2, 80.00, 1, 32, NULL, '2024-12-02 08:19:42', '2024-12-02 08:19:42'),
(24, 20, 5, 22.00, 0, 1, 1, '2024-12-03 16:32:12', '2024-12-03 17:30:24'),
(25, 20, 4, 30.00, 1, 1, NULL, '2024-12-03 17:30:24', '2024-12-03 17:30:24'),
(26, 21, 8, 80.00, 1, 58, 1, '2024-12-20 19:32:16', '2024-12-26 19:29:32'),
(27, 22, 8, 80.00, 0, 1, 1, '2024-12-26 02:11:22', '2024-12-26 19:48:19'),
(28, 22, 9, 70.00, 1, 1, 1, '2024-12-26 02:19:42', '2024-12-26 19:48:19'),
(32, 25, 8, 80.00, 1, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:52'),
(33, 25, 9, 70.00, 1, 1, 1, '2024-12-26 19:13:58', '2024-12-26 19:39:52'),
(35, 26, 10, 80.00, 1, 1, NULL, '2024-12-26 19:52:21', '2024-12-26 19:52:21'),
(36, 27, 11, 80.00, 1, 1, 1, '2024-12-26 19:59:30', '2024-12-26 20:01:41'),
(39, 28, 12, 60.00, 1, 1, 62, '2025-01-02 19:30:39', '2025-01-02 19:35:59'),
(40, 29, 13, 80.00, 1, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(41, 29, 14, 80.00, 1, 1, NULL, '2025-01-03 17:04:26', '2025-01-03 17:04:26'),
(42, 30, 15, 100.00, 1, 1, NULL, '2025-01-03 17:42:52', '2025-01-03 17:42:52'),
(44, 32, 17, 80.00, 1, 1, 1, '2025-01-15 15:20:12', '2025-01-15 15:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `sch_salaries`
--

CREATE TABLE `sch_salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sch_employee_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `month` varchar(2) NOT NULL,
  `basic_salary` decimal(12,2) NOT NULL,
  `total_service` int(11) NOT NULL,
  `total_service_amount` decimal(8,2) NOT NULL,
  `commission` decimal(12,2) NOT NULL,
  `commission_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `pay_commission_based_on` tinyint(4) NOT NULL,
  `addition` decimal(12,2) NOT NULL,
  `total_salary` decimal(8,2) NOT NULL,
  `deduction` decimal(12,2) NOT NULL,
  `netpay` decimal(8,2) NOT NULL,
  `is_paid` tinyint(4) NOT NULL DEFAULT 0,
  `paid_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_services`
--

CREATE TABLE `sch_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(300) NOT NULL,
  `image` varchar(1500) DEFAULT NULL,
  `sch_service_category_id` bigint(20) UNSIGNED NOT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 1,
  `price` decimal(18,2) NOT NULL,
  `cmn_coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cmn_coupon_amount` bigint(20) UNSIGNED DEFAULT NULL,
  `duration_in_days` int(11) NOT NULL DEFAULT 0,
  `duration_in_time` time NOT NULL DEFAULT '00:00:00',
  `time_slot_in_time` time NOT NULL,
  `padding_time_before` time NOT NULL DEFAULT '00:00:00',
  `padding_time_after` time NOT NULL DEFAULT '00:00:00',
  `appoinntment_limit_type` int(11) NOT NULL DEFAULT 0,
  `appoinntment_limit` int(11) NOT NULL DEFAULT 0,
  `minimum_time_required_to_booking_in_days` int(11) NOT NULL DEFAULT 0,
  `minimum_time_required_to_booking_in_time` time NOT NULL DEFAULT '00:00:00',
  `minimum_time_required_to_cancel_in_days` int(11) NOT NULL DEFAULT 0,
  `minimum_time_required_to_cancel_in_time` time NOT NULL DEFAULT '00:00:00',
  `remarks` varchar(500) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sch_services`
--

INSERT INTO `sch_services` (`id`, `title`, `image`, `sch_service_category_id`, `visibility`, `price`, `cmn_coupon_id`, `cmn_coupon_amount`, `duration_in_days`, `duration_in_time`, `time_slot_in_time`, `padding_time_before`, `padding_time_after`, `appoinntment_limit_type`, `appoinntment_limit`, `minimum_time_required_to_booking_in_days`, `minimum_time_required_to_booking_in_time`, `minimum_time_required_to_cancel_in_days`, `minimum_time_required_to_cancel_in_time`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'ملعب 7*7', 'uploadfiles/9Jw4bNBetaXc0LVZw3hkyE6lUOhZL3LDw5F8HT4K.jpg', 1, 1, 80.00, NULL, NULL, 0, '00:55:00', '00:55:00', '00:00:00', '00:05:00', 1, 30, 0, '00:30:00', 0, '12:00:00', '7&times;7', NULL, NULL, '2024-11-29 19:18:06', '2024-11-29 21:04:06'),
(3, 'ملعب 6&times;6', 'uploadfiles/HsZS18OGRwPWkBZBit3ink4YOZzJXIEukuGDy17L.jpg', 1, 1, 60.00, NULL, NULL, 0, '00:55:00', '00:55:00', '00:05:00', '00:05:00', 1, 30, 0, '00:30:00', 0, '12:00:00', '6&times;6', NULL, NULL, '2024-11-29 20:50:06', '2024-11-29 20:50:06'),
(4, '2x2 مدير تجريبى 2', 'uploadfiles/J1KYnhfyKTid0Azboiy4lFRXOTzgZ189GAbnuxE9.jpg', 4, 1, 25.00, NULL, NULL, 0, '00:00:00', '00:59:00', '00:00:00', '00:00:00', 0, 0, 0, '02:00:00', 0, '04:00:00', '', NULL, NULL, '2024-11-30 13:16:25', '2024-12-03 17:32:23'),
(5, 'تجريبى الثالث', 'uploadfiles/XXc002BxypEXZv8xw7dM9KKHa2B5d2jhqv8RWTjV.jpg', 4, 1, 22.00, NULL, NULL, 0, '00:00:00', '00:30:00', '00:00:00', '00:00:00', 0, 0, 0, '02:00:00', 0, '04:00:00', 'يبشسي', NULL, NULL, '2024-12-03 16:29:11', '2024-12-03 16:35:39'),
(8, '7*7 ملعب رقم 1', 'uploadfiles/ivQf0XFUgB8jROsHWXpJagAmb6LuoLMXgTMT4M4s.jpg', 20, 1, 80.00, NULL, NULL, 0, '00:00:00', '00:55:00', '00:00:00', '00:00:00', 0, 0, 0, '00:30:00', 0, '12:00:00', '7*7', NULL, NULL, '2024-12-20 19:08:38', '2024-12-26 02:15:11'),
(9, 'ملعب 6*6', 'uploadfiles/08Gigq1MUZ0HPamIfw9F1vJ4KNcrfuT31peYT1gJ.jpg', 20, 1, 70.00, NULL, NULL, 0, '00:00:00', '01:00:00', '00:00:00', '00:00:00', 0, 0, 0, '01:00:00', 0, '01:00:00', 'wwww', NULL, NULL, '2024-12-26 02:19:17', '2024-12-26 19:32:27'),
(10, 'ملعب ضياء', 'uploadfiles/l7c1SsRqJK0Pp9eAUo6SoMt8yQLQJBVOAzx7JJ8W.png', 6, 1, 80.00, NULL, NULL, 0, '00:00:00', '01:00:00', '00:00:00', '00:00:00', 0, 0, 0, '03:00:00', 0, '03:00:00', '', NULL, NULL, '2024-12-26 19:49:49', '2024-12-26 19:49:49'),
(11, 'ملعب ضياء 2', 'uploadfiles/X3HzaRJcYymj3j3FesiYU4oCBDvlwT40H4LuclHR.png', 6, 1, 80.00, NULL, NULL, 0, '00:00:00', '00:55:00', '00:00:00', '00:00:00', 0, 0, 0, '04:00:00', 0, '02:04:00', '', NULL, NULL, '2024-12-26 19:57:25', '2024-12-26 19:57:25'),
(12, 'ملعب الزروق', 'uploadfiles/AgjnLFE81x7Zy1g6VpYVrA4zzjjRuOD9QtUMRSMw.png', 21, 1, 60.00, NULL, NULL, 0, '00:00:00', '01:00:00', '00:00:00', '00:00:00', 0, 0, 0, '00:10:00', 0, '05:00:00', '6*6', NULL, NULL, '2025-01-02 19:26:10', '2025-01-02 19:27:16'),
(13, 'قزير', 'uploadfiles/PpErN9lgDW1kJIiaZ8ZD0YTSkKcdu5zzdVugKjHI.jpg', 22, 1, 80.00, NULL, NULL, 0, '00:00:00', '19:00:00', '00:00:00', '00:00:00', 0, 0, 0, '00:30:00', 0, '05:00:00', '', NULL, NULL, '2025-01-03 16:44:57', '2025-01-03 16:44:57'),
(14, '7*7', 'uploadfiles/y1On7XW4MmVaiKykW9ggC6YSymRGXTZHyCSnQnVa.jpg', 22, 1, 80.00, NULL, NULL, 0, '00:00:00', '01:00:00', '00:00:00', '00:00:00', 0, 0, 0, '00:30:00', 0, '05:00:00', '', NULL, NULL, '2025-01-03 16:53:41', '2025-01-03 16:53:41'),
(15, 'ملعب7*7', 'uploadfiles/Z2uhbe91HrDrw1CCxz9YMAtyWhnrjCKwfw20uqPK.jpg', 23, 1, 100.00, NULL, NULL, 0, '00:00:00', '01:00:00', '00:00:00', '00:00:00', 0, 0, 0, '00:30:00', 0, '05:00:00', '', NULL, NULL, '2025-01-03 17:39:25', '2025-01-03 17:39:25'),
(17, '7*7', 'uploadfiles/t4gXmZ9Q9ptHXgpxP6TCuNSPiSK1A1vV2Vg1Lyv3.jpg', 25, 1, 80.00, NULL, NULL, 0, '00:00:00', '01:00:00', '00:00:00', '00:00:00', 0, 0, 0, '00:20:00', 0, '05:00:00', '', NULL, NULL, '2025-01-15 15:17:28', '2025-01-15 15:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `sch_service_bookings`
--

CREATE TABLE `sch_service_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cmn_branch_id` bigint(20) UNSIGNED NOT NULL,
  `cmn_customer_id` bigint(20) UNSIGNED NOT NULL,
  `sch_employee_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `sch_service_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `service_amount` decimal(18,2) NOT NULL,
  `paid_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `payment_status` tinyint(4) NOT NULL,
  `cmn_payment_type_id` bigint(20) UNSIGNED NOT NULL,
  `canceled_paid_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `cancel_paid_status` tinyint(4) NOT NULL,
  `cancel_cmn_payment_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remarks` varchar(400) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sch_service_booking_info_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sch_service_bookings`
--

INSERT INTO `sch_service_bookings` (`id`, `cmn_branch_id`, `cmn_customer_id`, `sch_employee_id`, `date`, `start_time`, `end_time`, `sch_service_id`, `status`, `service_amount`, `paid_amount`, `payment_status`, `cmn_payment_type_id`, `canceled_paid_amount`, `cancel_paid_status`, `cancel_cmn_payment_type_id`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`, `sch_service_booking_info_id`) VALUES
(2, 1, 28, 2, '2024-12-02', '16:00:00', '16:55:00', 2, 3, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 28, 24, NULL, '2024-12-01 17:32:12', 2),
(3, 1, 28, 2, '2024-12-01', '23:00:00', '23:55:00', 2, 1, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 24, NULL, NULL, NULL, 3),
(4, 1, 28, 2, '2024-12-01', '22:00:00', '22:55:00', 2, 1, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 24, NULL, NULL, NULL, 4),
(5, 1, 17, 2, '2024-12-03', '22:00:00', '22:55:00', 2, 3, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, 1, NULL, '2024-12-04 13:35:04', 5),
(7, 1, 28, 2, '2024-12-05', '18:30:00', '19:25:00', 3, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 32, 1, NULL, '2024-12-04 08:53:16', 7),
(8, 1, 19, 2, '2024-12-03', '19:35:00', '20:30:00', 3, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 8),
(10, 1, 28, 2, '2024-12-03', '17:00:00', '17:55:00', 2, 1, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 32, NULL, NULL, NULL, 10),
(11, 1, 24, 2, '2024-12-03', '21:00:00', '21:55:00', 2, 4, 80.00, 0.00, 1, 1, 0.00, 2, NULL, 'من الادمن', 1, 1, NULL, '2024-12-04 08:57:24', 11),
(13, 1, 30, 2, '2024-01-06', '15:00:00', '15:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 13),
(14, 1, 31, 2, '2024-01-05', '18:30:00', '19:25:00', 3, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 14),
(15, 1, 31, 2, '2024-01-05', '19:35:00', '20:30:00', 3, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 15),
(16, 1, 31, 2, '2024-12-05', '19:35:00', '20:30:00', 3, 4, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, 1, NULL, '2024-12-04 09:12:22', 16),
(17, 1, 18, 2, '2024-01-05', '22:00:00', '22:55:00', 2, 1, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 17),
(18, 1, 17, 2, '2024-01-06', '18:00:00', '18:55:00', 2, 1, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 18),
(19, 1, 17, 2, '2024-12-05', '23:00:00', '23:55:00', 2, 1, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 19),
(20, 1, 18, 2, '2024-12-04', '22:00:00', '22:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, 1, NULL, '2024-12-04 12:09:49', 20),
(21, 1, 33, 2, '2024-12-05', '22:00:00', '22:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, 1, NULL, '2024-12-04 12:33:32', 21),
(22, 1, 17, 2, '2024-12-05', '16:00:00', '16:55:00', 2, 2, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, 1, NULL, '2024-12-04 16:00:44', 22),
(23, 1, 32, 2, '2024-12-04', '19:35:00', '20:30:00', 3, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 23),
(24, 1, 17, 2, '2024-12-05', '17:25:00', '18:20:00', 3, 1, 60.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 24),
(26, 1, 42, 2, '2024-12-06', '19:00:00', '19:55:00', 2, 3, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 42, 1, NULL, '2024-12-05 20:27:37', 26),
(27, 1, 25, 2, '2024-12-07', '18:30:00', '19:25:00', 3, 1, 60.00, 0.00, 2, 1, 0.00, 2, NULL, '', 25, NULL, NULL, NULL, 27),
(28, 1, 25, 2, '2024-12-07', '19:35:00', '20:30:00', 3, 1, 60.00, 0.00, 2, 1, 0.00, 2, NULL, '', 25, NULL, NULL, NULL, 28),
(29, 1, 43, 2, '2024-12-06', '17:00:00', '17:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 43, NULL, NULL, NULL, 29),
(30, 1, 17, 2, '2024-12-06', '22:00:00', '22:55:00', 2, 4, 80.00, 80.00, 1, 4, 0.00, 2, NULL, '', 17, 1, NULL, '2024-12-06 18:02:51', 30),
(31, 1, 17, 2, '2024-12-08', '23:00:00', '23:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 31),
(32, 1, 51, 2, '2024-12-09', '20:00:00', '20:55:00', 2, 2, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 51, 1, NULL, '2024-12-08 21:20:22', 32),
(33, 1, 51, 2, '2024-12-09', '19:00:00', '19:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 33),
(34, 1, 51, 2, '2024-12-16', '19:00:00', '19:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 33),
(35, 1, 51, 2, '2024-12-23', '19:00:00', '19:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 33),
(36, 1, 51, 2, '2024-12-30', '19:00:00', '19:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 33),
(37, 1, 51, 2, '2024-12-09', '22:00:00', '22:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 51, NULL, NULL, NULL, 34),
(38, 1, 51, 2, '2024-12-16', '22:00:00', '22:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 51, NULL, NULL, NULL, 34),
(39, 1, 17, 2, '2024-12-10', '23:00:00', '23:55:00', 2, 2, 80.00, 80.00, 1, 4, 0.00, 2, NULL, '', 17, NULL, NULL, '2024-12-09 21:30:51', 35),
(44, 1, 17, 2, '2024-12-11', '22:00:00', '22:55:00', 2, 4, 80.00, 80.00, 1, 4, 0.00, 2, NULL, '', 17, 1, NULL, '2024-12-12 22:37:11', 38),
(45, 1, 17, 2, '2024-01-17', '22:00:00', '22:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 39),
(46, 1, 17, 2, '2024-01-18', '22:00:00', '22:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 39),
(47, 1, 17, 2, '2024-01-19', '22:00:00', '22:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 39),
(48, 1, 17, 2, '2024-12-27', '23:00:00', '23:55:00', 2, 4, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 40),
(49, 1, 17, 2, '2024-12-16', '23:00:00', '23:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 41),
(50, 1, 17, 2, '2024-12-17', '22:00:00', '22:55:00', 2, 4, 80.00, 80.00, 1, 4, 0.00, 2, NULL, '', 17, 1, NULL, '2024-12-15 20:48:30', 42),
(51, 1, 59, 2, '2024-12-16', '21:00:00', '21:55:00', 2, 4, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 43),
(52, 1, 59, 2, '2024-12-23', '21:00:00', '21:55:00', 2, 4, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 43),
(53, 1, 59, 2, '2024-12-30', '21:00:00', '21:55:00', 2, 4, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 43),
(54, 1, 59, 2, '2024-12-16', '20:00:00', '20:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 59, NULL, NULL, NULL, 44),
(55, 1, 17, 2, '2024-12-16', '18:00:00', '18:55:00', 2, 2, 80.00, 80.00, 1, 4, 0.00, 2, NULL, '', 17, NULL, NULL, '2024-12-15 21:30:37', 45),
(56, 1, 60, 2, '2024-12-19', '23:00:00', '23:55:00', 2, 3, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 60, 1, NULL, '2024-12-17 17:03:16', 46),
(57, 1, 17, 2, '2024-12-20', '23:00:00', '23:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, 1, NULL, '2024-12-19 02:50:04', 47),
(58, 1, 17, 2, '2024-12-21', '23:00:00', '23:55:00', 2, 4, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, 1, NULL, '2024-12-20 18:47:35', 48),
(59, 1, 62, 2, '2024-12-23', '22:00:00', '22:55:00', 2, 4, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 1, 1, NULL, '2024-12-22 18:26:24', 49),
(60, 1, 62, 2, '2024-12-26', '23:00:00', '23:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 62, NULL, NULL, NULL, 50),
(61, 1, 62, 2, '2025-01-02', '22:00:00', '22:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 62, NULL, NULL, NULL, 50),
(62, 1, 62, 2, '2025-01-09', '22:00:00', '22:55:00', 2, 3, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 62, 1, NULL, '2024-12-22 18:45:54', 50),
(63, 1, 62, 2, '2025-01-16', '22:00:00', '22:55:00', 2, 2, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 62, 1, NULL, '2024-12-22 18:43:13', 50),
(64, 1, 17, 2, '2024-12-27', '18:00:00', '18:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 51),
(65, 1, 17, 2, '2024-12-28', '20:00:00', '20:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 51),
(66, 1, 17, 2, '2024-12-29', '20:00:00', '20:55:00', 2, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 51),
(67, 6, 17, 22, '2024-12-29', '23:00:00', '00:00:00', 9, 2, 70.00, 0.00, 2, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 52),
(68, 1, 17, 2, '2025-01-08', '21:15:00', '22:10:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 53),
(69, 1, 17, 2, '2025-01-15', '21:15:00', '22:10:00', 2, 3, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, 1, NULL, '2025-01-15 12:28:56', 53),
(70, 1, 17, 2, '2025-01-22', '21:15:00', '22:10:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 53),
(71, 1, 17, 2, '2025-01-29', '21:15:00', '22:10:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 53),
(72, 7, 17, 28, '2025-01-09', '18:00:00', '19:00:00', 12, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 54),
(73, 7, 17, 28, '2025-01-09', '20:00:00', '21:00:00', 12, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 55),
(74, 7, 53, 28, '2025-01-09', '21:00:00', '22:00:00', 12, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 56),
(75, 7, 53, 28, '2025-01-09', '20:00:00', '21:00:00', 12, 2, 60.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 56),
(76, 1, 17, 2, '2025-01-09', '13:00:00', '13:55:00', 2, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 57),
(77, 8, 17, 29, '2025-01-09', '21:00:00', '22:00:00', 14, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 58),
(78, 8, 17, 29, '2025-01-09', '21:00:00', '22:00:00', 14, 2, 80.00, 0.00, 1, 1, 0.00, 2, NULL, '', 1, NULL, NULL, NULL, 59),
(91, 7, 75, 28, '2025-01-12', '13:00:00', '14:00:00', 12, 1, 60.00, 0.00, 2, 1, 0.00, 2, NULL, '', 75, NULL, NULL, NULL, 71),
(92, 7, 17, 28, '2025-01-15', '23:00:00', '00:00:00', 12, 2, 60.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, 1, NULL, '2025-01-15 12:23:46', 72),
(93, 7, 17, 28, '2025-01-15', '22:00:00', '23:00:00', 12, 1, 60.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 73),
(94, 11, 17, 32, '2025-01-15', '21:00:00', '22:00:00', 17, 3, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, 77, NULL, '2025-01-15 16:03:27', 74),
(95, 11, 17, 32, '2025-01-15', '22:00:00', '23:00:00', 17, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 75),
(96, 11, 17, 32, '2025-01-15', '23:00:00', '00:00:00', 17, 1, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, NULL, NULL, NULL, 76),
(97, 11, 17, 32, '2025-01-16', '23:00:00', '00:00:00', 17, 3, 80.00, 0.00, 2, 1, 0.00, 2, NULL, '', 17, 39, NULL, '2025-01-15 16:07:23', 77);

-- --------------------------------------------------------

--
-- Table structure for table `sch_service_booking_feedback`
--

CREATE TABLE `sch_service_booking_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sch_service_booking_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hash_code` varchar(255) DEFAULT NULL,
  `rating` decimal(3,1) NOT NULL DEFAULT 0.0,
  `feedback` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_service_booking_infos`
--

CREATE TABLE `sch_service_booking_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_date` date NOT NULL,
  `total_amount` decimal(18,2) NOT NULL,
  `paid_amount` decimal(18,2) NOT NULL,
  `due_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(128) DEFAULT NULL,
  `coupon_discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `is_due_paid` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` varchar(500) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cmn_customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payable_amount` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sch_service_booking_infos`
--

INSERT INTO `sch_service_booking_infos` (`id`, `booking_date`, `total_amount`, `paid_amount`, `due_amount`, `coupon_code`, `coupon_discount`, `is_due_paid`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`, `cmn_customer_id`, `payable_amount`) VALUES
(2, '2024-12-01', 80.00, 0.00, 80.00, '', 0.00, 0, '', NULL, NULL, '2024-12-01 17:24:50', '2024-12-01 17:24:50', 28, 80.00),
(3, '2024-12-01', 80.00, 80.00, 0.00, '', 0.00, 1, '', 24, NULL, '2024-12-01 17:39:21', '2024-12-01 17:39:21', 28, 80.00),
(4, '2024-12-01', 80.00, 80.00, 0.00, '', 0.00, 1, '', 24, NULL, '2024-12-01 17:41:37', '2024-12-01 17:41:37', 28, 80.00),
(5, '2024-12-01', 80.00, 0.00, 80.00, '', 0.00, 0, '', NULL, NULL, '2024-12-01 17:47:09', '2024-12-01 17:47:09', 17, 80.00),
(7, '2024-12-02', 60.00, 60.00, 0.00, '', 0.00, 1, '', 32, NULL, '2024-12-02 08:21:05', '2024-12-02 08:21:05', 28, 60.00),
(8, '2024-12-02', 60.00, 60.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-02 08:48:01', '2024-12-02 08:48:01', 19, 60.00),
(10, '2024-12-02', 80.00, 80.00, 0.00, '', 0.00, 1, '', 32, NULL, '2024-12-02 19:12:51', '2024-12-02 19:12:51', 28, 80.00),
(11, '2024-12-03', 80.00, 80.00, 0.00, '', 0.00, 1, 'من الادمن', 1, NULL, '2024-12-03 07:14:05', '2024-12-03 07:14:05', 24, 80.00),
(13, '2024-12-04', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 08:58:43', '2024-12-04 08:58:43', 30, 80.00),
(14, '2024-12-04', 60.00, 60.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 09:01:02', '2024-12-04 09:01:02', 31, 60.00),
(15, '2024-12-04', 60.00, 60.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 09:03:45', '2024-12-04 09:03:45', 31, 60.00),
(16, '2024-12-04', 60.00, 60.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 09:11:53', '2024-12-04 09:11:53', 31, 60.00),
(17, '2024-12-04', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 11:46:07', '2024-12-04 11:46:07', 18, 80.00),
(18, '2024-12-04', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 11:49:12', '2024-12-04 11:49:12', 17, 80.00),
(19, '2024-12-04', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 11:55:52', '2024-12-04 11:55:52', 17, 80.00),
(20, '2024-12-04', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 11:59:57', '2024-12-04 11:59:57', 18, 80.00),
(21, '2024-12-04', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 12:33:05', '2024-12-04 12:33:05', 33, 80.00),
(22, '2024-12-04', 80.00, 0.00, 80.00, '', 0.00, 0, '', NULL, NULL, '2024-12-04 15:56:01', '2024-12-04 15:56:01', 17, 80.00),
(23, '2024-12-04', 60.00, 60.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-04 15:57:53', '2024-12-04 15:57:53', 32, 60.00),
(24, '2024-12-05', 60.00, 0.00, 60.00, '', 0.00, 0, '', NULL, NULL, '2024-12-05 15:58:36', '2024-12-05 15:58:36', 17, 60.00),
(26, '2024-12-05', 80.00, 0.00, 80.00, '', 0.00, 0, '', NULL, NULL, '2024-12-05 20:24:35', '2024-12-05 20:24:35', 42, 80.00),
(27, '2024-12-06', 60.00, 0.00, 60.00, '', 0.00, 0, '', NULL, NULL, '2024-12-06 12:01:22', '2024-12-06 12:01:22', 25, 60.00),
(28, '2024-12-06', 60.00, 0.00, 60.00, '', 0.00, 0, '', NULL, NULL, '2024-12-06 12:08:23', '2024-12-06 12:08:23', 25, 60.00),
(29, '2024-12-06', 80.00, 0.00, 80.00, '', 0.00, 0, '', NULL, NULL, '2024-12-06 12:39:19', '2024-12-06 12:39:19', 43, 80.00),
(30, '2024-12-06', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-06 17:57:41', '2024-12-06 17:57:41', 17, 80.00),
(31, '2024-12-08', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-08 16:21:30', '2024-12-08 16:21:30', 17, 80.00),
(32, '2024-12-08', 80.00, 0.00, 80.00, '', 0.00, 0, '', NULL, NULL, '2024-12-08 21:17:25', '2024-12-08 21:17:25', 51, 80.00),
(33, '2024-12-08', 320.00, 320.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-08 21:23:14', '2024-12-08 21:23:14', 51, 320.00),
(34, '2024-12-08', 160.00, 0.00, 160.00, '', 0.00, 0, '', NULL, NULL, '2024-12-08 21:29:45', '2024-12-08 21:29:45', 51, 160.00),
(35, '2024-12-09', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-09 21:30:49', '2024-12-09 21:30:49', 17, 80.00),
(38, '2024-12-11', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-11 13:44:10', '2024-12-11 13:44:10', 17, 80.00),
(39, '2024-12-12', 240.00, 240.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-12 22:39:43', '2024-12-12 22:39:43', 17, 240.00),
(40, '2024-12-14', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-14 03:13:02', '2024-12-14 03:13:02', 17, 80.00),
(41, '2024-12-15', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-15 17:21:03', '2024-12-15 17:21:03', 17, 80.00),
(42, '2024-12-15', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-15 20:47:01', '2024-12-15 20:47:01', 17, 80.00),
(43, '2024-12-15', 240.00, 240.00, 0.00, '', 0.00, 1, '', 1, NULL, '2024-12-15 20:53:39', '2024-12-15 20:53:39', 59, 240.00),
(44, '2024-12-15', 80.00, 0.00, 80.00, '', 0.00, 0, '', NULL, NULL, '2024-12-15 20:57:29', '2024-12-15 20:57:29', 59, 80.00),
(45, '2024-12-15', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-15 21:30:35', '2024-12-15 21:30:35', 17, 80.00),
(46, '2024-12-17', 80.00, 0.00, 80.00, '', 0.00, 0, '', NULL, NULL, '2024-12-17 16:51:32', '2024-12-17 16:51:32', 60, 80.00),
(47, '2024-12-19', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-19 02:46:15', '2024-12-19 02:46:15', 17, 80.00),
(48, '2024-12-20', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2024-12-20 18:44:10', '2024-12-20 18:44:10', 17, 80.00),
(49, '2024-12-22', 80.00, 0.00, 80.00, '', 0.00, 0, '', 1, NULL, '2024-12-22 18:25:37', '2024-12-22 18:25:37', 62, 80.00),
(50, '2024-12-22', 320.00, 0.00, 320.00, '', 0.00, 0, '', NULL, NULL, '2024-12-22 18:34:29', '2024-12-22 18:34:29', 62, 320.00),
(51, '2024-12-26', 240.00, 0.00, 240.00, '', 0.00, 0, '', 39, NULL, '2024-12-26 02:01:49', '2024-12-26 02:01:49', 17, 240.00),
(52, '2024-12-29', 70.00, 0.00, 70.00, '', 0.00, 0, '', 1, NULL, '2024-12-29 19:41:36', '2024-12-29 19:41:36', 17, 70.00),
(53, '2025-01-08', 320.00, 320.00, 0.00, '', 0.00, 1, '', 1, NULL, '2025-01-08 18:36:39', '2025-01-08 18:36:39', 17, 320.00),
(54, '2025-01-09', 60.00, 60.00, 0.00, '', 0.00, 1, '', 1, NULL, '2025-01-09 01:30:49', '2025-01-09 01:30:49', 17, 60.00),
(55, '2025-01-09', 60.00, 60.00, 0.00, '', 0.00, 1, '', 1, NULL, '2025-01-09 01:37:28', '2025-01-09 01:37:28', 17, 60.00),
(56, '2025-01-09', 120.00, 120.00, 0.00, '', 0.00, 1, '', 1, NULL, '2025-01-09 01:42:04', '2025-01-09 01:42:04', 53, 120.00),
(57, '2025-01-09', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2025-01-09 01:56:12', '2025-01-09 01:56:12', 17, 80.00),
(58, '2025-01-09', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2025-01-09 16:26:47', '2025-01-09 16:26:47', 17, 80.00),
(59, '2025-01-09', 80.00, 80.00, 0.00, '', 0.00, 1, '', 1, NULL, '2025-01-09 16:35:35', '2025-01-09 16:35:35', 17, 80.00),
(71, '2025-01-11', 60.00, 0.00, 60.00, '', 0.00, 0, '', NULL, NULL, '2025-01-11 22:49:19', '2025-01-11 22:49:19', 75, 60.00),
(72, '2025-01-15', 60.00, 0.00, 60.00, '', 0.00, 0, '', 39, NULL, '2025-01-15 12:20:39', '2025-01-15 12:20:39', 17, 60.00),
(73, '2025-01-15', 60.00, 0.00, 60.00, '', 0.00, 0, '', 39, NULL, '2025-01-15 12:27:51', '2025-01-15 12:27:51', 17, 60.00),
(74, '2025-01-15', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2025-01-15 15:44:43', '2025-01-15 15:44:43', 17, 80.00),
(75, '2025-01-15', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2025-01-15 16:00:54', '2025-01-15 16:00:54', 17, 80.00),
(76, '2025-01-15', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2025-01-15 16:05:05', '2025-01-15 16:05:05', 17, 80.00),
(77, '2025-01-15', 80.00, 0.00, 80.00, '', 0.00, 0, '', 39, NULL, '2025-01-15 16:06:20', '2025-01-15 16:06:20', 17, 80.00);

-- --------------------------------------------------------

--
-- Table structure for table `sch_service_categories`
--

CREATE TABLE `sch_service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(190) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cmn_branch_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sch_service_categories`
--

INSERT INTO `sch_service_categories` (`id`, `name`, `created_by`, `modified_by`, `created_at`, `updated_at`, `cmn_branch_id`) VALUES
(1, 'ملعب كره قدم', 1, NULL, '2024-11-26 20:37:38', '2024-11-26 20:37:38', 1),
(4, 'ملاعب كرة قدم تجريبي 2', NULL, NULL, '2024-11-30 13:09:11', '2024-12-01 18:24:07', 3),
(5, 'ملاعب كره سلة', 1, NULL, '2024-12-01 18:23:50', '2024-12-01 18:23:50', 3),
(6, 'ملاعب كرة قدم', 30, NULL, '2024-12-01 18:55:34', '2024-12-01 18:55:34', 4),
(7, 'كرة قدم', 1, NULL, '2024-12-08 18:17:00', '2024-12-08 18:17:00', 5),
(8, 'كرة سله', 1, NULL, '2024-12-08 18:17:17', '2024-12-08 18:17:17', 5),
(9, 'كرة طائره', 1, NULL, '2024-12-08 18:17:40', '2024-12-08 18:17:40', 5),
(10, 'كرة ستاك', 1, NULL, '2024-12-08 18:18:06', '2024-12-08 18:18:06', 5),
(11, 'تنس ارضي', 1, NULL, '2024-12-08 18:18:25', '2024-12-08 18:18:25', 5),
(20, 'كرة قدم', NULL, NULL, '2024-12-18 20:28:17', '2024-12-20 19:02:44', 6),
(21, 'كره قدم', 1, NULL, '2025-01-02 19:23:04', '2025-01-02 19:23:04', 7),
(22, 'ملعب كرة قدم', 1, NULL, '2025-01-03 16:43:13', '2025-01-03 16:43:13', 8),
(23, 'ملعب كرة قدم', 1, NULL, '2025-01-03 17:37:51', '2025-01-03 17:37:51', 9),
(25, 'ملعب كرة قدم', 1, NULL, '2025-01-15 15:14:39', '2025-01-15 15:14:39', 11);

-- --------------------------------------------------------

--
-- Table structure for table `sec_resources`
--

CREATE TABLE `sec_resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `display_name` varchar(250) NOT NULL,
  `sec_resource_id` int(11) DEFAULT NULL,
  `sec_module_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `serial` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `method` varchar(300) NOT NULL,
  `icon` varchar(400) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_resources`
--

INSERT INTO `sec_resources` (`id`, `name`, `display_name`, `sec_resource_id`, `sec_module_id`, `status`, `serial`, `level`, `method`, `icon`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'Dashboard', NULL, 1, 1, 0, 1, '', 'fas fa-tachometer-alt', 1, NULL, NULL, NULL),
(2, 'dashboard.blade.php', 'Main Dashboard', 1, 1, 1, 1, 2, 'home', NULL, 1, NULL, NULL, NULL),
(3, 'User Management', 'User Management', NULL, 1, 1, 1, 1, '', 'fas fa-user-shield', 1, 1, NULL, '2021-10-11 11:22:17'),
(4, 'user.blade.php', 'User Info', 3, 1, 1, 0, 2, 'user.info', NULL, 1, NULL, NULL, NULL),
(5, 'role.blade.php', 'Role Info', 3, 1, 1, 1, 2, 'role', NULL, 1, NULL, NULL, NULL),
(6, 'role_permission.blade.php', 'Role Permission', 3, 1, 1, 2, 2, 'role.permission', NULL, 1, NULL, NULL, NULL),
(7, 'Top Menu Settings', 'Settings', NULL, 1, 1, 3, 1, '', 'fas fa-cogs', 1, 1, '2021-10-12 09:48:55', '2021-10-20 03:12:03'),
(8, 'department.blade.php', 'Department', 7, 1, 1, 1, 2, 'department', NULL, 1, NULL, '2021-10-12 09:51:03', '2021-10-12 09:51:03'),
(9, 'designation.blade.php', 'Designation', 7, 1, 1, 2, 2, 'designation', NULL, 1, NULL, '2021-10-13 10:59:45', '2021-10-13 10:59:45'),
(10, 'company.blade.php', 'Company', 7, 1, 1, 3, 2, 'company', NULL, 1, NULL, '2021-10-18 09:29:57', '2021-10-18 09:29:57'),
(11, 'business-hour.blade.php', 'Business Hour', 7, 1, 1, 3, 2, 'business.hour', NULL, 1, NULL, '2021-10-18 09:35:29', '2021-10-18 09:35:29'),
(12, 'Top Menu Service', 'Service', NULL, 1, 1, 4, 1, '', 'fas fa-briefcase', 1, 1, '2021-10-18 09:39:17', '2021-10-20 03:12:17'),
(13, 'category.blade.php', 'Category', 12, 1, 1, 1, 2, 'category', NULL, 1, NULL, '2021-10-18 11:30:39', '2021-10-18 11:30:39'),
(14, 'service.blade.php', 'Add Service', 12, 1, 1, 2, 2, 'service', '', 1, 1, '2021-10-18 12:56:25', '2021-10-30 10:41:24'),
(15, 'Top Menu Employee', 'Staff / Employee', NULL, 1, 1, 5, 1, '', 'fas fa-user-tie', 1, 1, '2021-10-20 03:10:40', '2021-10-20 03:12:29'),
(16, 'employee.blade.php', 'Staff Manage', 15, 1, 1, 1, 2, 'employee', NULL, 1, NULL, '2021-10-20 03:13:39', '2021-10-20 03:13:39'),
(17, 'business-holiday.blade.php', 'Business Holiday', 7, 1, 1, 4, 2, 'business.holiday', '', 1, 1, '2021-10-30 12:49:01', '2021-10-30 12:51:42'),
(18, 'branch.blade.php', 'Branch', 7, 1, 1, 1, 2, 'branch', NULL, 1, NULL, '2021-10-31 11:41:05', '2021-10-31 11:41:05'),
(19, 'Top Menu Service Booking', 'Service Booking', NULL, 1, 1, 6, 1, 'service.booking', 'far fa-calendar-alt', 1, 1, '2021-11-10 11:18:04', '2021-11-10 11:23:34'),
(20, 'booking-calendar.blade.php', 'Booking Calendar', 19, 1, 1, 1, 2, 'booking.calendar', '', 1, 1, '2021-11-10 11:18:58', '2021-11-10 11:23:24'),
(22, 'customer.blade.php', 'Add Customer', 23, 1, 1, 1, 2, 'customer', '', 1, 1, '2021-11-14 12:37:21', '2021-11-14 12:43:38'),
(23, 'Top Menu Customer', 'Customer', NULL, 1, 1, 5, 1, 'top.customer', 'fas fa-hands-helping', 1, NULL, '2021-11-14 12:42:53', '2021-11-14 12:42:53'),
(24, 'Top Menu Website', 'Website', NULL, 1, 1, 8, 1, 'website', 'fas fa-globe-africa', 1, NULL, '2021-12-12 12:57:30', '2021-12-12 12:57:30'),
(25, 'appearance.blade.php', 'Appearance', 24, 1, 1, 1, 2, 'website.appearance', NULL, 1, NULL, '2021-12-12 13:01:26', '2021-12-12 13:01:26'),
(26, 'about-us.blade.php', 'About Us', 24, 1, 1, 2, 2, 'website.aboutus', NULL, 1, NULL, '2021-12-18 08:18:52', '2021-12-18 08:18:52'),
(27, 'client-testimonial.blade.php', 'Client Testimonial', 24, 1, 1, 3, 2, 'website.client.testimonial', NULL, 1, NULL, '2021-12-19 10:23:07', '2021-12-19 10:23:07'),
(28, 'frequently-asked-question.blade.php', 'FAQ', 24, 1, 1, 4, 2, 'website.frequently.asked.question', '', 1, 1, '2021-12-21 13:31:47', '2021-12-21 13:53:33'),
(29, 'google-map.blade.php', 'Google Map', 24, 1, 1, 5, 2, 'website.google.map', '', 1, 1, '2021-12-21 23:40:11', '2021-12-21 23:44:03'),
(30, 'photo-gallery.blade.php', 'Photo Gallery', 24, 1, 1, 6, 2, 'website.photo.gallery', '', 1, 1, '2021-12-22 00:30:30', '2021-12-22 00:33:37'),
(31, 'terms-and-condition.blade.php', 'Terms & Condition', 24, 1, 1, 6, 2, 'website.terms.and.condition', '', 1, 1, '2021-12-22 10:34:22', '2021-12-22 10:35:04'),
(32, 'website.menu.blade.php', 'Website Menu', 24, 1, 1, 0, 2, 'website.menu', NULL, 1, NULL, '2021-12-23 09:40:46', '2021-12-23 09:40:46'),
(33, 'Top Menu Payment', 'Payment', NULL, 1, 1, 7, 1, '', 'fas fa-dollar-sign', 1, NULL, '2021-12-24 02:43:20', '2021-12-24 02:43:20'),
(34, 'payment-config.blade.php', 'Payment Setup', 33, 1, 1, 1, 2, 'payment.config', NULL, 1, NULL, '2021-12-24 02:49:55', '2021-12-24 02:49:55'),
(36, 'service-booking-info.blade.php', 'Booking Info', 19, 1, 1, 2, 2, 'service.booking.info', NULL, 1, NULL, '2022-01-04 08:56:26', '2022-01-04 08:56:26'),
(37, 'email.configuration.blade.php', 'Email Configuration', 24, 1, 1, 3, 2, 'email.configuration', '', 1, 1, '2022-01-08 12:20:44', '2022-01-08 12:21:31'),
(38, 'language.blade.php', 'Language', 7, 1, 1, 7, 2, 'language', '', 1, 1, '2022-03-23 11:09:59', '2022-03-23 11:12:34'),
(39, 'E-Commerce', 'E-Commerce', NULL, 1, 1, 8, 1, '', 'fas fa-cart-arrow-down', 1, NULL, '2022-06-03 13:24:07', '2022-06-03 13:24:07'),
(40, 'coupon.blade.php', 'Coupon', 39, 1, 1, 1, 2, 'coupons', '', 1, NULL, '2022-06-03 13:26:22', '2022-06-03 13:26:22'),
(41, 'order.blade.php', 'Order Info', 39, 1, 1, 2, 2, 'orders.index', '', 1, 1, '2022-06-03 13:31:52', '2022-06-11 11:52:50'),
(42, 'salaries.blade.php', 'Salary', 15, 1, 1, 2, 2, 'employee.salaries', '', 1, NULL, '2022-06-03 14:00:39', '2022-06-03 14:00:39'),
(43, 'product.blade.php', 'Product', 39, 1, 1, 3, 2, 'products.index', '', 1, NULL, '2022-06-11 11:53:34', '2022-06-11 11:53:34'),
(44, 'OTP', 'OTP', NULL, 1, 1, 8, 1, '', 'far fa-envelope', 1, 1, '2022-07-12 03:00:16', '2022-07-12 03:17:21'),
(45, 'index.blade.php', 'Twilio Configuration', 44, 1, 1, 1, 2, 'sms.index', '', 1, NULL, '2022-07-12 03:05:41', '2022-07-12 03:05:41'),
(46, 'otp.blade.php', 'OTP Customization', 44, 1, 1, 2, 2, 'sms.otp', '', 1, 1, '2022-07-12 03:11:19', '2022-07-12 03:13:57'),
(47, 'card_system', 'Card System', NULL, 1, 1, 3, 1, '', 'fas fa-credit-card', 1, NULL, '2024-10-21 14:25:52', NULL),
(48, 'cards', 'Generate New Cards', 47, 1, 1, 3, 2, 'card', 'fas fa-card', 1, NULL, '2024-10-21 14:32:34', NULL),
(49, 'View Cards', 'View Cards', 47, 1, 1, 3, 2, 'getcards', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sec_resource_permissions`
--

CREATE TABLE `sec_resource_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `display_name` varchar(250) NOT NULL,
  `sec_resource_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sec_role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_resource_permissions`
--

INSERT INTO `sec_resource_permissions` (`id`, `display_name`, `sec_resource_id`, `sec_role_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 1, 1, 1, 1, NULL, NULL, NULL),
(2, 'Main Dashboard', 2, 1, 1, 1, NULL, NULL, '2021-12-25 01:21:20'),
(3, 'User Management', 3, 1, 1, 1, NULL, NULL, NULL),
(4, 'User Info', 4, 1, 1, 1, NULL, NULL, NULL),
(5, 'Role Info', 5, 1, 1, 1, NULL, NULL, NULL),
(6, 'Role Permission', 6, 1, 1, 1, NULL, NULL, NULL),
(7, 'لوحة التحكم', 1, 3, 1, 1, 1, NULL, '2024-11-16 19:11:32'),
(8, 'لوحة تحكم اليوزر', 2, 3, 1, 1, 1, NULL, '2024-11-16 19:11:47'),
(9, 'ادارة المستخدمين', 3, 3, 1, 1, 1, NULL, '2024-11-16 19:12:39'),
(10, 'بيانات اليوزر', 4, 3, 1, 1, 1, NULL, '2024-11-16 19:12:09'),
(11, 'معلومات الصلاحية', 5, 3, 0, 1, 1, NULL, '2024-11-16 19:12:20'),
(12, 'الصلاحيات', 6, 3, 0, 1, 1, NULL, '2024-11-16 19:12:30'),
(13, 'Dashboard', 1, 2, 1, 1, NULL, NULL, NULL),
(14, 'Main Dashboard', 2, 2, 1, 1, NULL, NULL, '2021-12-25 01:18:34'),
(15, 'User Management', 3, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(16, 'User Info', 4, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(17, 'Role Info', 5, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(18, 'Role Permission', 6, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(19, 'Settings', 7, 1, 1, 1, NULL, '2021-10-12 09:49:38', NULL),
(20, 'Department', 8, 1, 1, 1, NULL, '2021-10-12 09:53:39', NULL),
(21, 'Designation', 9, 1, 1, 1, NULL, '2021-10-13 11:00:07', NULL),
(22, 'Company', 10, 1, 1, 1, NULL, '2021-10-18 10:04:23', NULL),
(23, 'Business Hour', 11, 1, 1, 1, NULL, '2021-10-18 10:04:23', NULL),
(24, 'Service', 12, 1, 1, 1, NULL, '2021-10-18 10:04:23', NULL),
(25, 'Category', 13, 1, 1, 1, NULL, '2021-10-20 03:17:07', NULL),
(26, 'Service', 14, 1, 1, 1, 1, '2021-10-20 03:17:07', '2021-10-30 10:42:00'),
(27, 'Staff / Employee', 15, 1, 1, 1, NULL, '2021-10-20 03:17:07', NULL),
(28, 'Staff Manage', 16, 1, 1, 1, NULL, '2021-10-20 03:17:07', NULL),
(29, 'Business Holiday', 17, 1, 1, 1, NULL, '2021-10-30 12:52:02', NULL),
(30, 'Branch', 18, 1, 1, 1, NULL, '2021-10-31 11:44:48', NULL),
(31, 'Service Booking', 19, 1, 1, 1, NULL, '2021-11-10 11:20:42', NULL),
(32, 'Booking Calendar', 20, 1, 1, 1, NULL, '2021-11-10 11:20:42', NULL),
(33, 'Customer', 23, 1, 1, 1, NULL, '2021-11-14 12:43:50', NULL),
(34, 'Add Customer', 22, 1, 1, 1, NULL, '2021-11-14 12:43:50', NULL),
(35, 'Website', 24, 1, 1, 1, NULL, '2021-12-12 12:58:01', NULL),
(36, 'Appearance', 25, 1, 1, 1, NULL, '2021-12-12 13:05:19', NULL),
(37, 'About Us', 26, 1, 1, 1, NULL, '2021-12-18 08:19:11', NULL),
(38, 'Client Testimonial', 27, 1, 1, 1, NULL, '2021-12-19 10:23:30', NULL),
(39, 'FAQ', 28, 1, 1, 1, NULL, '2021-12-21 13:53:53', NULL),
(40, 'Google Map', 29, 1, 1, 1, NULL, '2021-12-21 23:41:05', NULL),
(41, 'Photo Gallery', 30, 1, 1, 1, NULL, '2021-12-22 00:31:33', NULL),
(42, 'Terms & Condition', 31, 1, 1, 1, NULL, '2021-12-22 10:35:42', NULL),
(43, 'Website Menu', 32, 1, 1, 1, NULL, '2021-12-23 09:41:02', NULL),
(44, 'Payment', 33, 1, 1, 1, NULL, '2021-12-24 02:43:49', NULL),
(45, 'Payment Setup', 34, 1, 1, 1, NULL, '2021-12-24 08:52:54', NULL),
(46, 'Settings', 7, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(47, 'Department', 8, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(48, 'Branch', 18, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(49, 'Designation', 9, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(50, 'Company', 10, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(51, 'Business Hour', 11, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(52, 'Business Holiday', 17, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(53, 'Service', 12, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(54, 'Category', 13, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(55, 'Add Service', 14, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(56, 'Staff / Employee', 15, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(57, 'Staff Manage', 16, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(58, 'Customer', 23, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(59, 'Add Customer', 22, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(60, 'Service Booking', 19, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(61, 'Booking Calendar', 20, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(62, 'Payment', 33, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(63, 'Payment Setup', 34, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(64, 'Website', 24, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(65, 'Website Menu', 32, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(66, 'Appearance', 25, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(67, 'About Us', 26, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(68, 'Client Testimonial', 27, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(69, 'FAQ', 28, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(70, 'Google Map', 29, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(71, 'Photo Gallery', 30, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(72, 'Terms & Condition', 31, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(74, 'Booking Info', 36, 1, 1, 1, NULL, '2022-01-04 09:44:41', NULL),
(75, 'Email Configuration', 37, 1, 1, 1, NULL, '2022-01-08 12:22:14', NULL),
(76, 'الاعدادات', 7, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:13:00'),
(77, 'القسم', 8, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-29 12:53:35'),
(78, 'الادارة', 18, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-29 12:53:28'),
(79, 'فنرة الحجز', 9, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-30 21:09:40'),
(80, 'الشركة', 10, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:21:51'),
(81, 'ساعات العمل', 11, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-29 21:10:37'),
(82, 'العطل الرسمية', 17, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:14:00'),
(83, 'الخدمة', 12, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:14:46'),
(84, 'الفئة', 13, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:14:56'),
(85, 'الخدمة', 14, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-12-01 18:57:51'),
(86, 'الحجز والحجوزات', 15, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 21:10:30'),
(87, 'ادارة الحجوزات', 16, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:15:31'),
(88, 'العميل', 23, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-29 21:20:08'),
(89, 'اضافة عميل', 22, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-29 21:20:08'),
(90, 'حجز الخدمة', 19, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:15:55'),
(91, 'تقويم الحجز', 20, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:16:12'),
(92, 'معلومات الحجز', 36, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:16:20'),
(93, 'الدفع', 33, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:16:28'),
(94, 'اعدادات الدفع', 34, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:16:42'),
(95, 'الموقع الالكتروني', 24, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:16:53'),
(96, 'القائمة الرئيسية', 32, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:17:06'),
(97, 'المظهر', 25, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:17:12'),
(98, 'حولنا', 26, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:17:31'),
(99, 'شهادة العميل', 27, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:17:42'),
(100, 'اعدادات البريد الالكرتوني', 37, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:17:53'),
(101, 'الاسئلة الشائعة', 28, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:18:00'),
(102, 'اعدادات جوجل ماب', 29, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:18:08'),
(103, 'معرض الصور', 30, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:18:15'),
(104, 'الشروط والاحكام', 31, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:18:23'),
(105, 'Booking Info', 36, 2, 1, 1, NULL, '2022-01-14 12:56:16', NULL),
(106, 'Email Configuration', 37, 2, 1, 1, NULL, '2022-01-14 12:56:16', NULL),
(107, 'Dashboard', 1, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(108, 'Main Dashboard', 2, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(109, 'User Management', 3, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(110, 'User Info', 4, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(111, 'Role Info', 5, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(112, 'Role Permission', 6, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(113, 'Settings', 7, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(114, 'Department', 8, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(115, 'Branch', 18, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(116, 'Designation', 9, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(117, 'Company', 10, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(118, 'Business Hour', 11, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(119, 'Business Holiday', 17, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(120, 'Service', 12, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(121, 'Category', 13, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(122, 'Add Service', 14, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(123, 'Staff / Employee', 15, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(124, 'Staff Manage', 16, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(125, 'Customer', 23, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(126, 'Add Customer', 22, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(127, 'Service Booking', 19, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(128, 'Booking Calendar', 20, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(129, 'Booking Info', 36, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(130, 'Payment', 33, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(131, 'Payment Setup', 34, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(132, 'Website', 24, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(133, 'Website Menu', 32, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(134, 'Appearance', 25, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(135, 'About Us', 26, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(136, 'Client Testimonial', 27, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(137, 'Email Configuration', 37, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(138, 'FAQ', 28, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(139, 'Google Map', 29, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(140, 'Photo Gallery', 30, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(141, 'Terms & Condition', 31, 4, 0, 1, 1, '2022-01-14 12:58:41', '2022-01-14 13:10:16'),
(142, 'Language', 38, 1, 1, 1, NULL, '2022-03-23 11:13:11', NULL),
(143, 'E-Commerce', 39, 1, 1, 1, NULL, '2022-06-03 13:50:36', NULL),
(144, 'Coupon', 40, 1, 1, 1, NULL, '2022-06-03 13:50:36', NULL),
(145, 'Order Info', 41, 1, 1, 1, NULL, '2022-06-03 13:50:36', NULL),
(146, 'Salary', 42, 1, 1, 1, NULL, '2022-06-03 14:00:53', NULL),
(147, 'Product', 43, 1, 1, 1, NULL, '2022-06-11 11:54:10', NULL),
(148, 'OTP', 44, 1, 1, 1, NULL, '2022-07-12 03:15:50', NULL),
(149, 'Twilio Configuration', 45, 1, 1, 1, NULL, '2022-07-12 03:15:50', NULL),
(150, 'OTP Customization', 46, 1, 1, 1, NULL, '2022-07-12 03:15:50', NULL),
(151, 'Card System', 47, 1, 1, 1, NULL, '2024-10-21 14:33:05', NULL),
(152, 'Generate New Cards', 48, 1, 1, 1, NULL, '2024-10-21 14:33:21', NULL),
(153, 'View All Cards', 49, 1, 1, NULL, NULL, NULL, NULL),
(154, 'اللغة', 38, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:14:06'),
(155, 'الكروت', 47, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:14:18'),
(156, 'انشاء كرت جديد', 48, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:14:28'),
(157, 'مشاهدة الكروت', 49, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:14:36'),
(158, 'الرواتب', 42, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:21:51'),
(159, 'التجارة الالكترونية', 39, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:18:37'),
(160, 'الكوبون', 40, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:18:44'),
(161, 'معلومات الطلب', 41, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:18:51'),
(162, 'المنتجات', 43, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:19:01'),
(163, 'رمز التحقق', 44, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:19:16'),
(164, 'تويلو', 45, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:19:24'),
(165, 'اعدادات رمز التحقق', 46, 3, 0, 1, 1, '2024-10-27 12:01:25', '2024-11-16 19:19:36'),
(166, 'Language', 38, 4, 1, 1, NULL, '2024-11-26 01:23:30', NULL),
(167, 'Card System', 47, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(168, 'Generate New Cards', 48, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(169, 'View Cards', 49, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(170, 'Salary', 42, 4, 1, 1, NULL, '2024-11-26 01:23:30', NULL),
(171, 'E-Commerce', 39, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(172, 'Coupon', 40, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(173, 'Order Info', 41, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(174, 'Product', 43, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(175, 'OTP', 44, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(176, 'Twilio Configuration', 45, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27'),
(177, 'OTP Customization', 46, 4, 0, 1, 1, '2024-11-26 01:23:30', '2024-11-26 01:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `sec_roles`
--

CREATE TABLE `sec_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `is_default_user_role` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_roles`
--

INSERT INTO `sec_roles` (`id`, `name`, `is_default_user_role`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'صلاحيات الادمن', 0, 1, 1, 1, NULL, '2024-11-24 09:50:36'),
(3, 'مدير ملعب', 0, 1, 1, 1, NULL, '2024-10-27 12:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `sec_role_permissions`
--

CREATE TABLE `sec_role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sec_role_permission_info_id` bigint(20) UNSIGNED NOT NULL,
  `sec_role_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_role_permissions`
--

INSERT INTO `sec_role_permissions` (`id`, `sec_role_permission_info_id`, `sec_role_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, NULL, NULL, NULL),
(2, 2, 1, 1, 1, NULL, NULL, NULL),
(3, 3, 1, 1, 1, NULL, NULL, NULL),
(4, 4, 1, 1, 1, NULL, NULL, NULL),
(5, 5, 1, 1, 1, NULL, NULL, NULL),
(6, 6, 1, 1, 1, NULL, NULL, NULL),
(7, 7, 1, 1, 1, NULL, NULL, NULL),
(8, 8, 1, 1, 1, 1, NULL, '2021-10-11 11:27:44'),
(9, 9, 1, 1, 1, NULL, NULL, NULL),
(10, 1, 3, 1, 1, 1, NULL, '2024-11-08 14:43:07'),
(11, 2, 3, 1, 1, 1, NULL, '2024-11-08 14:43:07'),
(12, 3, 3, 1, 1, 1, NULL, '2024-11-08 14:43:07'),
(13, 4, 3, 0, 1, 1, NULL, '2024-11-16 19:21:51'),
(14, 5, 3, 0, 1, 1, NULL, '2024-11-15 20:57:54'),
(15, 6, 3, 0, 1, 1, NULL, '2024-11-15 20:57:54'),
(16, 7, 3, 0, 1, 1, NULL, '2024-11-15 20:57:54'),
(17, 8, 3, 0, 1, 1, NULL, '2024-11-15 20:52:19'),
(18, 9, 3, 0, 1, 1, NULL, '2024-11-15 20:52:19'),
(19, 1, 2, 1, 1, NULL, NULL, NULL),
(20, 2, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(21, 3, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(22, 4, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(23, 5, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(24, 6, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(25, 7, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(26, 8, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(27, 9, 2, 0, 1, 1, NULL, '2022-01-14 12:56:16'),
(28, 10, 1, 1, 1, NULL, '2021-10-12 09:53:39', NULL),
(29, 11, 1, 1, 1, NULL, '2021-10-12 09:53:39', NULL),
(30, 12, 1, 1, 1, NULL, '2021-10-12 09:53:39', NULL),
(31, 13, 1, 1, 1, 1, '2021-10-18 10:04:23', '2021-10-18 10:04:28'),
(32, 14, 1, 1, 1, 1, '2021-10-18 10:04:23', '2021-10-18 10:04:28'),
(33, 15, 1, 1, 1, 1, '2021-10-18 10:04:23', '2021-10-18 10:04:28'),
(34, 16, 1, 1, 1, NULL, '2021-10-18 10:04:23', NULL),
(35, 17, 1, 1, 1, NULL, '2021-10-18 10:04:23', NULL),
(36, 18, 1, 1, 1, NULL, '2021-10-18 10:04:23', NULL),
(37, 19, 1, 1, 1, NULL, '2021-10-18 10:04:23', NULL),
(38, 20, 1, 1, 1, 1, '2021-10-20 03:17:07', '2021-10-30 10:42:00'),
(39, 21, 1, 1, 1, 1, '2021-10-20 03:17:07', '2021-10-30 10:42:00'),
(40, 22, 1, 1, 1, 1, '2021-10-20 03:17:07', '2021-10-30 10:42:00'),
(41, 23, 1, 1, 1, NULL, '2021-10-20 03:17:07', NULL),
(42, 24, 1, 1, 1, NULL, '2021-10-20 03:17:07', NULL),
(43, 25, 1, 1, 1, 1, '2021-10-30 10:42:00', '2021-12-12 12:58:01'),
(44, 26, 1, 1, 1, 1, '2021-10-30 10:42:00', '2021-12-12 12:58:01'),
(45, 27, 1, 1, 1, 1, '2021-10-30 10:42:00', '2021-12-12 12:58:01'),
(46, 28, 1, 1, 1, NULL, '2021-10-31 11:44:48', NULL),
(47, 29, 1, 1, 1, NULL, '2021-10-31 11:44:48', NULL),
(48, 30, 1, 1, 1, NULL, '2021-10-31 11:44:48', NULL),
(49, 31, 1, 1, 1, 1, '2021-10-31 11:44:48', '2021-12-12 12:58:01'),
(50, 32, 1, 1, 1, 1, '2021-10-31 11:44:48', '2021-12-12 12:58:01'),
(51, 33, 1, 1, 1, 1, '2021-10-31 11:44:48', '2021-12-12 12:58:01'),
(52, 34, 1, 1, 1, NULL, '2021-12-07 10:07:06', NULL),
(53, 35, 1, 1, 1, NULL, '2021-12-11 11:14:24', NULL),
(54, 36, 1, 1, 1, NULL, '2021-12-12 12:58:01', NULL),
(55, 37, 1, 1, 1, NULL, '2021-12-12 12:58:01', NULL),
(56, 38, 1, 1, 1, NULL, '2021-12-18 08:19:11', NULL),
(57, 42, 1, 1, 1, 1, '2021-12-21 13:53:53', '2021-12-21 23:41:05'),
(58, 43, 1, 1, 1, 1, '2021-12-21 13:53:53', '2021-12-21 23:41:05'),
(59, 44, 1, 1, 1, 1, '2021-12-21 13:53:53', '2021-12-21 23:41:05'),
(60, 39, 1, 1, 1, 1, '2021-12-21 13:53:53', '2021-12-21 23:41:05'),
(61, 40, 1, 1, 1, 1, '2021-12-21 13:53:53', '2021-12-21 23:41:05'),
(62, 41, 1, 1, 1, 1, '2021-12-21 13:53:53', '2021-12-21 23:41:05'),
(63, 45, 1, 1, 1, NULL, '2021-12-21 23:41:05', NULL),
(64, 46, 1, 1, 1, NULL, '2021-12-21 23:41:05', NULL),
(65, 47, 1, 1, 1, NULL, '2021-12-21 23:41:05', NULL),
(66, 48, 1, 1, 1, NULL, '2021-12-21 23:41:05', NULL),
(67, 49, 1, 1, 1, NULL, '2021-12-22 00:31:33', NULL),
(68, 50, 1, 1, 1, NULL, '2021-12-22 00:31:33', NULL),
(69, 51, 1, 1, 1, NULL, '2021-12-22 00:31:33', NULL),
(70, 52, 1, 1, 1, 1, '2021-12-23 09:41:02', '2021-12-24 02:43:49'),
(71, 53, 1, 1, 1, 1, '2021-12-24 08:52:54', '2021-12-24 13:15:43'),
(72, 54, 1, 1, 1, 1, '2021-12-24 08:52:54', '2021-12-24 13:15:43'),
(73, 55, 1, 1, 1, 1, '2021-12-24 08:52:54', '2021-12-24 13:15:44'),
(74, 56, 1, 1, 1, NULL, '2021-12-24 13:15:43', NULL),
(75, 57, 1, 1, 1, NULL, '2021-12-24 13:15:43', NULL),
(76, 58, 1, 1, 1, NULL, '2021-12-24 13:15:43', NULL),
(77, 59, 1, 1, 1, NULL, '2021-12-24 13:15:43', NULL),
(78, 10, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(79, 11, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(80, 12, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(81, 28, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(82, 29, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(83, 30, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(84, 13, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(85, 14, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(86, 15, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(87, 16, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(88, 17, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(89, 18, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(90, 19, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(91, 31, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(92, 32, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(93, 33, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(94, 20, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(95, 21, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(96, 22, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(97, 23, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(98, 24, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(99, 25, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(100, 26, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(101, 27, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(102, 34, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(103, 35, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(104, 36, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(105, 37, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(106, 56, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(107, 57, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(108, 58, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(109, 59, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(110, 53, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(111, 54, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(112, 55, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(113, 38, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(114, 42, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(115, 43, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(116, 44, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(117, 39, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(118, 40, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(119, 41, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(120, 45, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(121, 46, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(122, 47, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(123, 48, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(124, 49, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(125, 50, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(126, 51, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(127, 52, 2, 1, 1, NULL, '2021-12-25 01:11:41', NULL),
(128, 60, 1, 1, 1, NULL, '2022-01-01 13:08:33', NULL),
(131, 63, 1, 1, 1, 1, '2022-01-04 09:44:41', '2022-01-10 13:27:45'),
(132, 64, 1, 1, 1, 1, '2022-01-04 09:44:41', '2022-01-10 13:27:45'),
(133, 65, 1, 1, 1, 1, '2022-01-04 09:44:41', '2022-01-10 13:27:45'),
(134, 66, 1, 1, 1, NULL, '2022-01-10 13:26:22', NULL),
(135, 67, 1, 1, 1, NULL, '2022-01-10 13:27:45', NULL),
(136, 68, 1, 1, 1, NULL, '2022-01-14 12:32:41', NULL),
(137, 69, 1, 1, 1, NULL, '2022-01-14 12:32:41', NULL),
(138, 70, 1, 1, 1, NULL, '2022-01-14 12:32:41', NULL),
(139, 10, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-29 12:50:39'),
(140, 11, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-15 21:12:31'),
(141, 12, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(142, 28, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-29 13:06:29'),
(143, 29, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-29 13:06:29'),
(144, 30, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-29 13:06:29'),
(145, 13, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-30 10:09:28'),
(146, 14, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-30 10:09:28'),
(147, 15, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-30 10:09:28'),
(148, 16, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-15 21:12:31'),
(149, 17, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-16 19:21:51'),
(150, 18, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-29 21:10:37'),
(151, 19, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-29 21:10:37'),
(152, 31, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 17:53:46'),
(153, 32, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 17:53:46'),
(154, 33, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 17:53:46'),
(155, 68, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-23 20:45:29'),
(156, 69, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-08 14:43:07'),
(157, 70, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-15 17:53:46'),
(158, 20, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-12-01 18:57:51'),
(159, 21, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-12-01 18:57:51'),
(160, 22, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-12-01 18:57:56'),
(161, 23, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 21:10:30'),
(162, 24, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 21:10:30'),
(163, 25, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 21:10:30'),
(164, 26, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 21:10:30'),
(165, 27, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-15 21:10:30'),
(166, 63, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-29 21:20:08'),
(167, 64, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-29 21:20:08'),
(168, 65, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-15 17:53:46'),
(169, 34, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-08 14:43:07'),
(170, 35, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-08 14:43:07'),
(171, 36, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-08 14:43:07'),
(172, 37, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-11-15 17:53:46'),
(173, 60, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-08 14:43:07'),
(174, 67, 3, 1, 1, 1, '2022-01-14 12:51:34', '2024-11-08 14:43:07'),
(175, 56, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(176, 57, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(177, 58, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(178, 59, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(179, 53, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(180, 54, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(181, 55, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(182, 38, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(183, 42, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(184, 43, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(185, 44, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(186, 39, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(187, 40, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(188, 41, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(189, 66, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(190, 45, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(191, 46, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(192, 47, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(193, 48, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(194, 49, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(195, 50, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(196, 51, 3, 0, 1, 1, '2022-01-14 12:51:34', '2024-10-27 12:01:25'),
(197, 52, 3, 0, 1, 1, '2022-01-14 12:51:34', '2022-01-14 12:57:37'),
(198, 68, 2, 0, 1, NULL, '2022-01-14 12:56:16', NULL),
(199, 69, 2, 0, 1, NULL, '2022-01-14 12:56:16', NULL),
(200, 70, 2, 0, 1, NULL, '2022-01-14 12:56:16', NULL),
(201, 63, 2, 0, 1, NULL, '2022-01-14 12:56:16', NULL),
(202, 64, 2, 0, 1, NULL, '2022-01-14 12:56:16', NULL),
(203, 65, 2, 0, 1, NULL, '2022-01-14 12:56:16', NULL),
(204, 60, 2, 0, 1, NULL, '2022-01-14 12:56:16', NULL),
(205, 67, 2, 0, 1, NULL, '2022-01-14 12:56:16', NULL),
(206, 66, 2, 1, 1, NULL, '2022-01-14 12:56:17', NULL),
(207, 1, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(208, 2, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(209, 3, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(210, 4, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(211, 5, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(212, 6, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(213, 7, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(214, 8, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(215, 9, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(216, 10, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(217, 11, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(218, 12, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(219, 28, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(220, 29, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(221, 30, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(222, 13, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(223, 14, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(224, 15, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(225, 16, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(226, 17, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(227, 18, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(228, 19, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(229, 31, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(230, 32, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(231, 33, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(232, 68, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(233, 69, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(234, 70, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(235, 20, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(236, 21, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(237, 22, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(238, 23, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(239, 24, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(240, 25, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(241, 26, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(242, 27, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(243, 63, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(244, 64, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(245, 65, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(246, 34, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(247, 35, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(248, 36, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(249, 37, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(250, 60, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(251, 67, 4, 0, 1, 1, '2022-01-14 12:58:41', '2024-11-26 01:23:30'),
(252, 56, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(253, 57, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(254, 58, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(255, 59, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(256, 53, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(257, 54, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(258, 55, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(259, 38, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(260, 42, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(261, 43, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(262, 44, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(263, 39, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(264, 40, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(265, 41, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(266, 66, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(267, 45, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(268, 46, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(269, 47, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(270, 48, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(271, 49, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(272, 50, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(273, 51, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(274, 52, 4, 0, 1, NULL, '2022-01-14 12:58:41', NULL),
(275, 71, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(276, 72, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(277, 73, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(278, 74, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(279, 75, 1, 1, 1, NULL, '2022-03-25 00:30:54', NULL),
(280, 76, 1, 1, 1, NULL, '2022-04-14 01:04:39', NULL),
(281, 77, 1, 1, 1, NULL, '2022-04-14 02:04:15', NULL),
(282, 78, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(283, 79, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(284, 80, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(285, 81, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(286, 82, 1, 1, 1, NULL, '2022-03-25 00:30:54', NULL),
(287, 83, 1, 1, 1, NULL, '2022-04-14 01:04:39', NULL),
(288, 84, 1, 1, 1, NULL, '2022-04-14 02:04:15', NULL),
(289, 85, 1, 1, 1, NULL, '2022-04-14 02:04:15', NULL),
(290, 86, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(291, 87, 1, 1, 1, NULL, '2022-03-24 23:30:52', NULL),
(292, 90, 1, 1, 1, NULL, NULL, NULL),
(293, 89, 1, 1, 1, NULL, NULL, NULL),
(294, 88, 1, 1, 1, NULL, NULL, NULL),
(295, 71, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(296, 72, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(297, 73, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(298, 74, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(299, 75, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(300, 88, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(301, 89, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(302, 90, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(303, 76, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(304, 77, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(305, 81, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(306, 82, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(307, 83, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(308, 79, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(309, 80, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(310, 78, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(311, 84, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(312, 85, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(313, 86, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(314, 87, 3, 0, 1, NULL, '2024-10-27 12:01:25', NULL),
(315, 71, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(316, 72, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(317, 73, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(318, 74, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(319, 75, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(320, 88, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(321, 89, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(322, 90, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(323, 76, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(324, 77, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(325, 81, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(326, 82, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(327, 83, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(328, 79, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(329, 80, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(330, 78, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(331, 84, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(332, 85, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(333, 86, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL),
(334, 87, 4, 0, 1, NULL, '2024-11-26 01:23:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sec_role_permission_infos`
--

CREATE TABLE `sec_role_permission_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sec_resource_id` bigint(20) UNSIGNED NOT NULL,
  `permission_name` varchar(150) NOT NULL,
  `route_name` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_role_permission_infos`
--

INSERT INTO `sec_role_permission_infos` (`id`, `sec_resource_id`, `permission_name`, `route_name`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'Booking Status', 'dashboard.booking.status', 1, 1, NULL, '2021-12-25 03:34:40'),
(2, 4, 'Add', 'add.new.user', 1, 1, NULL, NULL),
(3, 4, 'Edit', 'edit.user.info', 1, 1, NULL, NULL),
(4, 4, 'Delete', 'delete.user.info', 1, 1, NULL, NULL),
(5, 5, 'Add', 'add.new.role', 1, 1, NULL, NULL),
(6, 5, 'Edit', 'edit.role.info', 1, 1, NULL, NULL),
(7, 5, 'Delete', 'delete.role.info', 1, 1, NULL, NULL),
(8, 6, 'Save Permission', 'save.or.update.permission', 1, 1, NULL, NULL),
(9, 6, 'Edit Menu Name', 'update.resource.display.name', 1, 1, NULL, NULL),
(10, 8, 'Update', 'department.update', 1, 1, '2021-10-12 09:51:58', '2021-10-12 09:52:25'),
(11, 8, 'Add', 'department.add', 1, 1, '2021-10-12 09:53:02', '2021-10-12 09:53:02'),
(12, 8, 'Delete', 'department.delete', 1, 1, '2021-10-12 09:53:18', '2021-10-12 09:53:18'),
(13, 9, 'Add', 'designation.store', 1, 1, '2021-10-13 11:01:56', '2021-10-13 11:01:56'),
(14, 9, 'Update', 'designation.update', 1, 1, '2021-10-13 11:03:21', '2021-10-13 11:03:21'),
(15, 9, 'Delete', 'designation.delete', 1, 1, '2021-10-13 11:03:37', '2021-10-13 11:03:37'),
(16, 10, 'Add', 'company.add', 1, 1, '2021-10-18 09:32:18', '2021-10-18 09:32:18'),
(17, 10, 'Update', 'company.update', 1, 1, '2021-10-18 09:32:49', '2021-10-18 09:32:49'),
(18, 11, 'Add', 'business.hour.add', 1, 1, '2021-10-18 09:35:59', '2021-10-18 09:35:59'),
(19, 11, 'Update', 'business.hour.update', 1, 1, '2021-10-18 09:36:30', '2021-10-18 09:36:30'),
(20, 14, 'Add', 'service.add', 1, 1, '2021-10-18 12:57:28', '2021-10-30 10:47:35'),
(21, 14, 'Update', 'service.update', 1, 1, '2021-10-18 12:57:46', '2021-10-30 10:47:54'),
(22, 14, 'Delete', 'service.delete', 1, 1, '2021-10-18 12:58:00', '2021-10-30 10:48:07'),
(23, 16, 'Add', 'employee.add', 1, 1, '2021-10-20 03:13:59', '2021-10-20 03:13:59'),
(24, 16, 'Update', 'employee.update', 1, 1, '2021-10-20 03:14:13', '2021-10-20 03:14:13'),
(25, 16, 'Save Change Off Day', 'save.update.offday', 1, 1, '2021-10-29 11:21:35', '2021-10-29 11:21:35'),
(26, 16, 'Delete Off day', 'delete.employee.offday', 1, 1, '2021-10-29 23:58:05', '2021-10-29 23:58:05'),
(27, 16, 'Move Off day', 'update.offday.by.move', 1, 1, '2021-10-30 01:09:56', '2021-10-30 01:09:56'),
(28, 18, 'Add', 'branch.add', 1, 1, '2021-10-31 11:42:22', '2021-10-31 11:42:22'),
(29, 18, 'Update', 'branch.update', 1, 1, '2021-10-31 11:42:36', '2021-10-31 11:42:36'),
(30, 18, 'Delete', 'branch.delete', 1, 1, '2021-10-31 11:43:05', '2021-10-31 11:43:05'),
(31, 17, 'Save Change', 'save.update.business.holiday', 1, 1, '2021-10-31 11:43:37', '2021-10-31 11:43:37'),
(32, 17, 'Move', 'update.business.holiday.by.move', 1, 1, '2021-10-31 11:44:11', '2021-10-31 11:44:11'),
(33, 17, 'Delete', 'delete.business.holiday', 1, 1, '2021-10-31 11:44:27', '2021-10-31 11:44:27'),
(34, 20, 'Save Booking', 'save.service.booking', 1, 1, '2021-12-07 10:06:46', '2021-12-07 10:06:46'),
(35, 20, 'Update Booking', 'update.service.booking', 1, 1, '2021-12-11 11:14:10', '2021-12-11 11:14:10'),
(36, 20, 'Cancel Booking', 'cancel.service.booking', 1, 1, '2021-12-12 12:53:43', '2021-12-27 08:49:08'),
(37, 20, 'Delete Booking', 'delete.service.booking', 1, 1, '2021-12-12 12:54:02', '2021-12-12 12:54:02'),
(38, 25, 'Save Change', 'save.or.update.appearance', 1, 1, '2021-12-18 08:17:31', '2021-12-18 08:17:31'),
(39, 27, 'Save', 'website.save.client.testimonial', 1, 1, '2021-12-21 13:28:52', '2021-12-21 13:28:52'),
(40, 27, 'Update', 'website.update.client.testimonial', 1, 1, '2021-12-21 13:29:08', '2021-12-21 13:29:08'),
(41, 27, 'Delete', 'website.delete.client.testimonial', 1, 1, '2021-12-21 13:29:22', '2021-12-21 13:29:22'),
(42, 26, 'Save', 'website.save.aboutus', 1, 1, '2021-12-21 13:29:37', '2021-12-21 13:29:37'),
(43, 26, 'Update', 'website.update.aboutus', 1, 1, '2021-12-21 13:29:55', '2021-12-21 13:29:55'),
(44, 26, 'Delete', 'website.delete.aboutus', 1, 1, '2021-12-21 13:30:09', '2021-12-21 13:30:09'),
(45, 28, 'Save', 'website.save.frequently.asked.question', 1, 1, '2021-12-21 13:54:32', '2021-12-21 13:54:32'),
(46, 28, 'Update', 'website.update.frequently.asked.question', 1, 1, '2021-12-21 13:54:44', '2021-12-21 13:54:44'),
(47, 28, 'Delete', 'website.delete.frequently.asked.Question', 1, 1, '2021-12-21 13:55:05', '2021-12-21 13:55:05'),
(48, 29, 'Save Change', 'website.save.or.update.google.map', 1, 1, '2021-12-21 23:40:48', '2021-12-21 23:40:48'),
(49, 30, 'Save', 'website.save.photo.gallery', 1, 1, '2021-12-22 00:30:49', '2021-12-22 00:30:49'),
(50, 30, 'Update', 'website.update.photo.gallery', 1, 1, '2021-12-22 00:31:08', '2021-12-22 00:31:08'),
(51, 30, 'Delete', 'website.delete.photo.gallery', 1, 1, '2021-12-22 00:31:20', '2021-12-22 00:31:20'),
(52, 31, 'Save Change', 'website.save.or.update.terms.condition', 1, 1, '2021-12-22 12:49:07', '2021-12-22 12:49:07'),
(53, 32, 'Save', 'website.save.menu', 1, 1, '2021-12-24 08:52:04', '2021-12-24 08:52:04'),
(54, 32, 'Update', 'website.update.menu', 1, 1, '2021-12-24 08:52:23', '2021-12-24 08:52:23'),
(55, 32, 'Delete', 'website.delete.menu', 1, 1, '2021-12-24 08:52:40', '2021-12-24 08:52:40'),
(56, 34, 'Save Change Currency', 'save.or.update.currency', 1, 1, '2021-12-24 13:14:02', '2022-01-23 13:50:46'),
(57, 34, 'Enable Local Payment', 'currency.update', 1, 1, '2021-12-24 13:14:19', '2022-01-23 13:50:19'),
(58, 34, 'Enable Paypal Payment', 'enable.or.disable.paypa.payment', 1, 1, '2021-12-24 13:14:38', '2022-01-23 13:49:48'),
(59, 34, 'Save Paypal API', 'save.or.update.paypal.config', 1, 1, '2021-12-24 13:15:23', '2022-01-23 13:49:25'),
(60, 20, 'Done Booking', 'done.service.booking', 1, 1, '2021-12-27 08:49:29', '2021-12-27 08:49:29'),
(63, 22, 'Save', 'customer.store', 1, 1, '2022-01-04 08:57:54', '2022-01-04 08:57:54'),
(64, 22, 'Update', 'customer.update', 1, 1, '2022-01-04 08:58:14', '2022-01-04 08:58:14'),
(65, 22, 'Delete', 'customer.delete', 1, 1, '2022-01-04 08:58:31', '2022-01-04 08:58:31'),
(66, 37, 'Save Change', 'save.email.configuration', 1, 1, '2022-01-10 13:25:56', '2022-01-10 13:25:56'),
(67, 36, 'Change Service Status', 'change.service.booking.status', 1, 1, '2022-01-10 13:27:32', '2022-01-10 13:27:32'),
(68, 13, 'Add', 'category.add', 1, 1, '2022-01-14 12:31:24', '2022-01-14 12:31:24'),
(69, 13, 'Update', 'category.update', 1, 1, '2022-01-14 12:31:38', '2022-01-14 12:31:38'),
(70, 13, 'Delete', 'category.delete', 1, 1, '2022-01-14 12:31:53', '2022-01-14 12:31:53'),
(71, 38, 'Save Change', 'save.language', 1, 1, '2022-03-24 23:12:28', '2022-03-24 23:12:28'),
(72, 38, 'Update', 'update.language', 1, 1, '2022-03-24 23:13:03', '2022-03-24 23:13:03'),
(73, 38, 'Delete', 'delete.language', 1, 1, '2022-03-24 23:13:19', '2022-03-24 23:13:19'),
(74, 38, 'Save Translated Language', 'save.translated.language', 1, 1, '2022-03-24 23:14:17', '2022-03-24 23:14:17'),
(75, 38, 'Update RTL', 'update.rtl.status', 1, 1, '2022-03-25 00:30:34', '2022-03-25 00:30:34'),
(76, 34, 'Enable Stripe Payment', 'enable.or.disable.stripe.payment', 1, 1, '2022-04-14 01:04:14', '2022-04-14 01:04:14'),
(77, 34, 'Save Stripe API', 'save.or.update.stripe.config', 1, 1, '2022-04-14 02:00:41', '2022-04-14 02:00:41'),
(78, 43, 'Add', 'products.store', 1, 1, '2022-06-11 11:56:56', '2022-06-13 13:22:45'),
(79, 41, 'Details', 'orders.show', 1, 1, '2022-06-11 12:03:49', '2022-06-11 12:08:10'),
(80, 41, 'Update', 'orders.update', 1, 1, '2022-06-11 12:10:03', '2022-06-11 12:10:03'),
(81, 40, 'Add', 'coupons.store', 1, 1, '2022-06-13 13:17:19', '2022-06-13 13:17:19'),
(82, 40, 'Update', 'coupons.update', 1, 1, '2022-06-13 13:17:44', '2022-06-13 13:17:44'),
(83, 40, 'Delete', 'coupons.destroy', 1, 1, '2022-06-13 13:17:59', '2022-06-13 13:17:59'),
(84, 43, 'Delete', 'products.destroy', 1, 1, '2022-06-13 13:22:59', '2022-06-13 13:22:59'),
(85, 43, 'Update', 'products.update', 1, 1, '2022-06-13 13:23:19', '2022-06-13 13:23:19'),
(86, 45, 'Save Change', 'sms.twilio', 1, 1, '2022-07-12 03:14:56', '2022-07-12 03:14:56'),
(87, 46, 'Save Change', 'sms.otp.update', 1, 1, '2022-07-12 03:15:14', '2022-07-12 03:15:14'),
(88, 48, 'create-cards', 'create-cards', 1, 1, NULL, NULL),
(89, 48, 'getcards', 'getcards', 1, 1, NULL, NULL),
(90, 48, 'cards.pdf', 'cards.pdf', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sec_user_branches`
--

CREATE TABLE `sec_user_branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cmn_branch_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_user_branches`
--

INSERT INTO `sec_user_branches` (`id`, `user_id`, `cmn_branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(17, 37, 1, 1, NULL, NULL, NULL),
(18, 58, 6, 1, NULL, NULL, NULL),
(19, 62, 7, 1, NULL, NULL, NULL),
(21, 64, 8, 1, NULL, NULL, NULL),
(22, 65, 9, 1, NULL, NULL, NULL),
(29, 77, 11, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sec_user_roles`
--

CREATE TABLE `sec_user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sec_user_id` bigint(20) UNSIGNED NOT NULL,
  `sec_role_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sec_user_roles`
--

INSERT INTO `sec_user_roles` (`id`, `sec_user_id`, `sec_role_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, NULL, NULL, '2024-09-16 08:03:32'),
(18, 37, 3, 1, 1, NULL, '2024-12-04 09:16:03', '2024-12-04 09:16:03'),
(19, 58, 3, 1, 1, NULL, '2024-12-15 20:10:55', '2024-12-15 20:10:55'),
(20, 62, 3, 1, 1, NULL, '2025-01-02 19:32:35', '2025-01-02 19:32:35'),
(22, 64, 3, 1, 1, NULL, '2025-01-03 17:15:55', '2025-01-03 17:15:55'),
(23, 65, 3, 1, 1, NULL, '2025-01-03 17:40:16', '2025-01-03 17:40:16'),
(26, 77, 3, 1, 1, NULL, '2025-01-15 15:39:45', '2025-01-15 15:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `site_about_us`
--

CREATE TABLE `site_about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` varchar(3000) NOT NULL,
  `image_url` varchar(1500) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_about_us`
--

INSERT INTO `site_about_us` (`id`, `title`, `details`, `image_url`, `status`, `order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'جول ماستر - goal masters', 'جول ماستر - goal masters\r\n هي منصة رائدة على الإنترنت لحجز الملاعب الرياضية في ليبيا وبالتحديد في مصراته، تقدم تجربة مريحة وسهلة لعشاق الرياضة واللاعبين من جميع المستويات. تهدف المنصة إلى تعزيز تجربة الحجز واللعب من خلال تقديم مجموعة من الخدمات التكميلية التي تعمل على تحسين راحة وسلامة اللاعبين.\r\n\r\nتقدم ملاعب الجدار الرياضي خيارات حجز متعددة، سواء كنت تبحث عن ملعب كرة قدم أو ملعب كرة سلة أو أي مكان رياضي آخر، كل ذلك من خلال عملية بسيطة على الموقع. بالإضافة إلى ذلك، توفر المنصة خدمات حصرية مثل الإسعافات الأولية لضمان سلامة اللاعبين أثناء المباريات ومساحات خصوصية مخصصة لتأمين راحة الفرق واللاعبين.\r\n\r\nكما يقدم الموقع مجموعة متنوعة من المعدات والإكسسوارات الرياضية لتلبية الاحتياجات المتنوعة للاعبين، من الكرات ومجموعات الفريق إلى المستلزمات الطبية الأساسية، مما يضمن تجربة رياضية شاملة وكاملة.\r\n\r\nملاعب الجدار الرياضي ليست مجرد منصة حجز؛ بل هي شريك لكل محبي الرياضة، تسعى دائمًا لتقديم الأفضل للحفاظ على اللعبة أكثر أمانًا ومتعة!', 'uploadfiles/oGi8LEgBU3VGoqhEchtnxu5R5FB6TVD6ewO1fQu3.jpg', 1, 0, NULL, 1, NULL, '2025-01-09 00:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `site_appearances`
--

CREATE TABLE `site_appearances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `app_name` varchar(50) NOT NULL,
  `logo` varchar(1000) NOT NULL,
  `icon` varchar(1000) DEFAULT NULL,
  `motto` varchar(1000) DEFAULT NULL,
  `theam_color` varchar(10) NOT NULL,
  `theam_menu_color2` varchar(10) NOT NULL,
  `theam_hover_color` varchar(10) NOT NULL,
  `theam_active_color` varchar(10) NOT NULL,
  `facebook_link` varchar(500) DEFAULT NULL,
  `youtube_link` varchar(500) DEFAULT NULL,
  `twitter_link` varchar(500) DEFAULT NULL,
  `instagram_link` varchar(500) DEFAULT NULL,
  `about_service` varchar(300) DEFAULT NULL,
  `contact_email` varchar(150) NOT NULL,
  `contact_phone` varchar(25) NOT NULL,
  `contact_web` varchar(50) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `background_image` varchar(1000) NOT NULL,
  `login_background_image` varchar(1000) DEFAULT NULL,
  `meta_title` varchar(200) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_appearances`
--

INSERT INTO `site_appearances` (`id`, `app_name`, `logo`, `icon`, `motto`, `theam_color`, `theam_menu_color2`, `theam_hover_color`, `theam_active_color`, `facebook_link`, `youtube_link`, `twitter_link`, `instagram_link`, `about_service`, `contact_email`, `contact_phone`, `contact_web`, `address`, `background_image`, `login_background_image`, `meta_title`, `meta_description`, `meta_keywords`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'جوول ماستر | goal masters', 'uploadfiles/yFrlFAge8BYG7t5A1ATYDmj3zmck3BomF89cM6MU.jpg', 'uploadfiles/bLqtL30XFGOi6WFGT26K06WC7SFKpV3jCCOPK7rZ.ico', '', '#87d531', '#ffffff', '#d8f2bb', '#87d531', 'https://www.facebook.com/share/9RFXyxnQL8m81bnV/?mibextid=LQQJ4d', '#', '#', '#', '', 'support@goalmasters.online', '+218916771600', 'www.goalmasters.online', 'ليبيا -  مدينة مصراتة -', 'uploadfiles/KcXrsPZtvqjv0TIbClVWPgfKPW2gIIODDs1wNsfw.jpg', 'uploadfiles/YdqBnoBFoyUqRxb3jRsA2bExgOo42vjFGJFt69ga.jpg', 'جوول ماستر | goal masters', 'جوول ماستر | goal masters\r\n هو موقع إلكتروني رائد في مجال حجز الملاعب في ليبيا، يقدم تجربة سهلة ومريحة لعشاق الرياضة والممارسين على اختلاف مستوياتهم. يسعى الموقع إلى تحسين تجربة الحجز واللعب من خلال توفير مجموعة من الخدمات التكميلية التي تعزز من راحة وسلامة اللاعبين.', 'حجز ملاعب ليبيا، Copy of جوول ماستر | goal masters،  حجز ملاعب كرة القدم، حجز ملاعب السلة، خدمات رياضية ليبيا، أدوات رياضية للاعبين، ملاعب خاصة، إسعافات أولية رياضية، ملاعب مجهزة ليبيا، حجز ملعب أونلاين، ملاعب رياضية طرابلس، حجز ملاعب بسهولة، خدمات رياضية، ملاعب خاصة بالفرق.', NULL, 1, NULL, '2024-09-30 09:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `site_client_testimonials`
--

CREATE TABLE `site_client_testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `rating` int(11) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `contact_email` varchar(150) DEFAULT NULL,
  `client_ref` varchar(150) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_client_testimonials`
--

INSERT INTO `site_client_testimonials` (`id`, `name`, `description`, `rating`, `image`, `contact_phone`, `contact_email`, `client_ref`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'محمد الفيتوري', 'صراحة موقع ملاعب الجدار الرياضي سهل عليا حياتي. قبل كنت نتعب باش نلقى ملعب فاضي، توه بكل سهولة نحجز في دقيقة. خدمة ممتازة ومرات حتى الإسعافات الأولية تساعدتني في موقف صعب', 5, 'uploadfiles/30dwQ0LB90kZ4yKm6DFGJG1lFBT1DB4h9D2rabSF.png', '', '', NULL, 1, NULL, 1, NULL, '2024-09-16 09:34:57'),
(2, 'أحمد الدرسي', 'دايماً نحجز من الموقع لما نبي نلعب مع الشباب. حتى الأسعار كويسة والملعب نظيف وفيه كل شي نحتاجه. حوشنا وقت ومجهود كبير', 5, 'uploadfiles/yCK6rF6nHf0NqSOQruQRhosAYQ7fjeFyarYGmhEp.png', '', '', NULL, 1, 1, NULL, '2024-09-16 09:36:35', '2024-09-16 09:36:35'),
(3, 'علي الزنتوتي', 'أكثر حاجة تعجبني في ملاعب الجدار هي الخصوصية، المكان يخلينا نلعب براحتنا. الموقع سهل والاختيارات واجدة ومناسبة لأي نوع رياضة نبي نلعبها', 5, 'uploadfiles/wB9BBKcmNRyitaRfmZnX3KKEOdGh2PMvCCeltIMD.png', '', '', NULL, 1, 1, NULL, '2024-09-16 09:37:12', '2024-09-16 09:37:12'),
(4, 'سالم النعاس', 'جربت الموقع كم مرة والحق ما خيبنيش، الترتيب والاهتمام بالتفاصيل واضحين من أول ما توصل للملعب. غير الخدامة الي في الموقع نفسهم يساعدوك لأي حاجة تحتاجها', 5, 'uploadfiles/9iDQpv173Igmr8IF4C2J3G87p4LA20Jb1JzjuK0r.png', '', '', NULL, 1, 1, NULL, '2024-09-16 09:37:51', '2024-09-16 09:37:51'),
(5, 'مصطفى الشويهدي', 'ملاعب الجدار الرياضي من أفضل المواقع في ليبيا. خدمات إضافية زي الأدوات الطبية والخصوصية خلتنا نفضل نحجز من عندهم دايماً، حتى الكابتن تاع الفريق عاجبته', 5, 'uploadfiles/Z4AOujW3JdzEflG25QPfitqUprMDJG06nSqaYbY8.png', '', '', NULL, 1, 1, NULL, '2024-09-16 09:38:27', '2024-09-16 09:38:27'),
(6, 'يوسف الشركسي', 'خدمتهم سريعة ومضمونة، وما ننساش ان الموقع يوفر كل المستلزمات الي نحتاجها كلاعبين. الحق يستاهلوا كل الدعم، موقع احترافي لأبعد الحدود', 5, 'uploadfiles/IcI9lTO4qLBRK2d0osVWFdpy6NNBez1HpeHPgBJq.png', '', '', NULL, 1, 1, NULL, '2024-09-16 09:38:53', '2024-09-16 09:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `site_frequently_asked_questions`
--

CREATE TABLE `site_frequently_asked_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(200) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_frequently_asked_questions`
--

INSERT INTO `site_frequently_asked_questions` (`id`, `question`, `answer`, `status`, `order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'أين يقع ملاعب الجدار الرياضي؟', 'ملاعب الجدار الرياضي يقع في ليبيا، مدينة مصراتة، منطقة قزير، بالقرب من جزيرة الثومي.', 1, 1, NULL, 1, NULL, '2024-09-16 09:49:05'),
(2, 'كيف يمكنني حجز ملعب عبر موقع ملاعب الجدار الرياضي؟', 'يمكنك حجز الملعب بسهولة عبر الموقع الإلكتروني. كل ما عليك فعله هو اختيار نوع الرياضة والملعب المناسب لك، ثم تحديد الوقت والتاريخ المطلوبين وإتمام عملية الحجز بخطوات بسيطة.', 1, 0, 1, NULL, '2024-09-16 09:49:23', '2024-09-16 09:49:23'),
(3, 'هل يوفر الموقع خدمات تكميلية عند الحجز؟', 'نعم، يوفر الموقع خدمات تكميلية مثل الإسعافات الأولية لضمان سلامة اللاعبين ومساحات مخصصة للخصوصية، بالإضافة إلى توفير بعض الأدوات والمستلزمات الرياضية التي يحتاجها اللاعبون.', 1, 0, 1, NULL, '2024-09-16 09:49:43', '2024-09-16 09:49:43'),
(4, 'ما هي أنواع الملاعب المتاحة للحجز؟', 'يمكنك حجز ملاعب لكرة القدم، السلة، وغيرها من الرياضات المختلفة عبر الموقع.', 1, 0, 1, NULL, '2024-09-16 09:50:06', '2024-09-16 09:50:06'),
(5, 'هل تتوفر معدات رياضية عند الحجز؟', 'نعم، الموقع يوفر مجموعة من الأدوات والمستلزمات الرياضية مثل الكرات، أطقم الفرق، وبعض المستلزمات الطبية البسيطة لضمان تجربة رياضية متكاملة.', 1, 0, 1, NULL, '2024-09-16 09:50:26', '2024-09-16 09:50:26'),
(6, 'هل أسعار الحجز مناسبة؟', 'الموقع يوفر خيارات متعددة بأسعار تنافسية تناسب الجميع، مما يسهل عليك إيجاد الملعب المناسب ضمن ميزانيتك.', 1, 0, 1, NULL, '2024-09-16 09:50:46', '2024-09-16 09:50:46'),
(7, 'هل هناك خدمة دعم في حال واجهت مشكلة أثناء الحجز؟', 'نعم، فريق الدعم متواجد لمساعدتك في أي وقت، سواء في عملية الحجز أو أثناء وجودك في الملعب لضمان تجربة سلسة وممتعة.', 1, 0, 1, NULL, '2024-09-16 09:51:04', '2024-09-16 09:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `site_google_maps`
--

CREATE TABLE `site_google_maps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lat` decimal(18,6) NOT NULL,
  `long` decimal(18,6) NOT NULL,
  `map_key` varchar(500) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_google_maps`
--

INSERT INTO `site_google_maps` (`id`, `lat`, `long`, `map_key`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 32.337066, 15.077570, 'AIzaSyDwRZb6VdsCVE5gFMtR3X6Dik1Tx9bxhq0', 1, 1, '2021-12-21 23:50:08', '2024-09-16 09:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `site_menus`
--

CREATE TABLE `site_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `site_menu_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `route` varchar(200) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_menus`
--

INSERT INTO `site_menus` (`id`, `name`, `site_menu_id`, `order`, `route`, `remarks`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'خدماتنا', 0, 1, 'site.menu.services', '', 1, NULL, 1, NULL, '2024-09-21 07:16:30'),
(2, 'فريقنا', 0, 2, 'site.menu.team', '', 0, NULL, 1, NULL, '2024-09-21 07:16:43'),
(3, 'الرئيسية', 0, 0, 'site.home', '', 1, NULL, 1, NULL, '2024-09-21 07:16:59'),
(4, 'من نحن', 0, 5, 'site.about.us', '', 1, NULL, 1, NULL, '2024-09-21 07:17:55'),
(5, 'تواصل معنا', 0, 6, 'site.contact', '', 1, NULL, 1, NULL, '2024-09-21 07:18:08'),
(7, 'معرض الصور', 0, 3, 'site.photo.gallery', '', 1, NULL, 1, NULL, '2024-09-21 07:18:21'),
(8, 'الاسئلة الشائعة', 0, 4, 'site.faq', '', 1, NULL, 1, NULL, '2024-09-21 07:15:59'),
(9, 'قسائم', 0, 4, 'site.vouchers', '', 0, 1, 1, '2022-06-11 12:00:06', '2024-09-21 07:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `site_photo_galleries`
--

CREATE TABLE `site_photo_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `image_url` varchar(2000) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `description` varchar(500) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_photo_galleries`
--

INSERT INTO `site_photo_galleries` (`id`, `name`, `image_url`, `order`, `status`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, '', 'uploadfiles/YWPGFTg6R2jm8RIdu9De7eWGLiCgjiXTt77uTJVL.jpg', 0, 1, NULL, 1, 1, '2024-09-16 10:36:38', '2024-09-16 10:37:01'),
(4, '', 'uploadfiles/YRYqwhDWNTlzyCMYLHd1TcIDkmKctkUMyjoyoVYE.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:36:52', '2024-09-16 10:36:52'),
(5, '', 'uploadfiles/N1RUcjTnETvsppSss6quE66mxH8GerolcuNo6xqp.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:37:29', '2024-09-16 10:37:29'),
(6, '', 'uploadfiles/yjOshtxLdJIWsmlGuorN890ty5ZXEuK9uu1OgL5I.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:37:40', '2024-09-16 10:37:40'),
(7, '', 'uploadfiles/qmLyCQRYZXiWStAWbGl399XscUM8ideux1t0Lz6l.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:37:49', '2024-09-16 10:37:49'),
(8, '', 'uploadfiles/Ez0H5XxZ3dTTvwaCfR123nlmrUqpfk9tqAJNTkbp.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:38:02', '2024-09-16 10:38:02'),
(9, '', 'uploadfiles/ruQniOXsRF5sirJHce0EZY7tK9qAVkFQBtmoQM0n.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:38:11', '2024-09-16 10:38:11'),
(10, '', 'uploadfiles/B9kclLKpByo91o2T6PsloE6OdoQ6q4FsYxYr5Epl.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:38:20', '2024-09-16 10:38:20'),
(11, '', 'uploadfiles/VZfqaF5Kq7O4dBPu3ccXT6cBEG2I88uzuT68jzFs.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:38:29', '2024-09-16 10:38:29'),
(12, '', 'uploadfiles/7tnaTsPvy0tU7L0hR9efhxKKg5w2pWbiHzDUKNn7.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:48:55', '2024-09-16 10:48:55'),
(13, '', 'uploadfiles/ohO3uo5027Nch2qwehuFHkb2OtJyqFUy3beR6buv.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:49:05', '2024-09-16 10:49:05'),
(14, '', 'uploadfiles/MxqM9Vj2D0LtB0Ktxgv8Qlz51fW9PseMeJnlIomu.jpg', 0, 1, NULL, 1, NULL, '2024-09-16 10:49:17', '2024-09-16 10:49:17'),
(15, '', 'uploadfiles/sTXQTkkDXbCmeF9YwJXwzFca411fptONJY3EW9uJ.jpg', 0, 0, NULL, 1, 1, '2024-09-16 10:49:30', '2024-09-16 10:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `site_terms_and_conditions`
--

CREATE TABLE `site_terms_and_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_terms_and_conditions`
--

INSERT INTO `site_terms_and_conditions` (`id`, `details`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '<h4>مرحباً بكم في موقع ملاعب الجدار الرياضي</h4>\r\n<p><br data-tomark-pass=\"\"></p>\r\n<ol>\r\n<li><strong>قبول الشروط</strong><br>\r\nباستخدام هذا الموقع، فإنك توافق على الالتزام بكافة الشروط والأحكام المذكورة أدناه. إذا كنت لا توافق على هذه الشروط، يُرجى عدم استخدام الموقع.</li>\r\n<li><strong>حجز الملاعب</strong>\r\n<ul>\r\n<li>يتيح لك الموقع حجز الملاعب الرياضية في الأوقات المتاحة فقط.</li>\r\n<li>يجب تأكيد الحجز والدفع المسبق لضمان الحجز النهائي.</li>\r\n<li>يحق للموقع تعديل أو إلغاء أي حجز في حال حدوث ظروف خارجة عن الإرادة.</li>\r\n</ul>\r\n</li>\r\n<li><strong>الخصوصية والأمان</strong>\r\n<ul>\r\n<li>يلتزم الموقع بحماية بيانات المستخدمين ولن يتم مشاركة أي معلومات شخصية مع أطراف ثالثة إلا عند الضرورة القصوى أو بموافقة المستخدم.</li>\r\n<li>يُرجى الحفاظ على معلومات الدخول الخاصة بك وعدم مشاركتها مع أي شخص آخر.</li>\r\n</ul>\r\n</li>\r\n<li><strong>الالتزامات والمسؤوليات</strong>\r\n<ul>\r\n<li>يتحمل المستخدم مسؤولية استخدام الملعب بطريقة آمنة ومسؤولة.</li>\r\n<li>الموقع غير مسؤول عن أي إصابات أو أضرار قد تحدث أثناء استخدام الملاعب.</li>\r\n<li>يجب اتباع التعليمات والإرشادات المتاحة في الموقع والملاعب لضمان السلامة.</li>\r\n</ul>\r\n</li>\r\n<li><strong>خدمات الإسعافات الأولية</strong>\r\n<ul>\r\n<li>يوفر الموقع خدمات الإسعافات الأولية ولكن لا يتحمل أي مسؤولية عن الأضرار الناتجة عن الإصابات.</li>\r\n<li>لا تُعد خدمات الإسعافات الأولية بديلاً عن الرعاية الطبية المتخصصة.</li>\r\n</ul>\r\n</li>\r\n<li><strong>التعديلات والإلغاءات</strong>\r\n<ul>\r\n<li>يحق للموقع إجراء تعديلات على الشروط والأحكام في أي وقت دون إشعار مسبق.</li>\r\n<li>يُنصح بمراجعة هذه الصفحة بانتظام للاطلاع على أي تحديثات.</li>\r\n</ul>\r\n</li>\r\n<li><strong>سياسة الإلغاء والاسترجاع</strong>\r\n<ul>\r\n<li>يمكن إلغاء الحجز قبل موعد اللعب بـ 24 ساعة على الأقل للحصول على استرداد كامل للمبلغ المدفوع.</li>\r\n<li>لن يتم رد أي مبالغ للحجوزات الملغاة بعد هذه الفترة الزمنية.</li>\r\n</ul>\r\n</li>\r\n<li><strong>السلوك المحظور</strong>\r\n<ul>\r\n<li>يُحظر القيام بأي نشاط غير قانوني، أو يُسبب إزعاجاً للآخرين، أو يُلحق الضرر بالملاعب أو الأدوات الرياضية.</li>\r\n</ul>\r\n</li>\r\n<li><strong>التواصل معنا</strong>\r\n<ul>\r\n<li>لأي استفسارات أو شكاوى، يمكنكم التواصل مع فريق الدعم الفني من خلال بيانات الاتصال المتاحة على الموقع.</li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<p>باستخدامك لموقع ملاعب الجدار الرياضي، فإنك توافق على الالتزام بهذه الشروط والأحكام لضمان تجربة آمنة وممتعة لك ولجميع المستخدمين.</p>', 1, NULL, 1, NULL, '2024-09-16 10:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `st_otp_configurations`
--

CREATE TABLE `st_otp_configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sms_gateway` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `st_otp_configurations`
--

INSERT INTO `st_otp_configurations` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `sms_gateway`) VALUES
(1, 'Twilio', 0, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `st_otp_messages`
--

CREATE TABLE `st_otp_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_type` int(11) NOT NULL,
  `message_for` varchar(150) NOT NULL,
  `tags` varchar(250) DEFAULT NULL,
  `message` varchar(500) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `is_sys_adm` int(11) NOT NULL DEFAULT 0,
  `user_type` tinyint(4) NOT NULL DEFAULT 2,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` varchar(1000) DEFAULT NULL,
  `sch_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email` varchar(190) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `phone_number`, `is_sys_adm`, `user_type`, `created_by`, `photo`, `sch_employee_id`, `status`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin User', 'admin', NULL, 1, 1, NULL, 'uploadfiles/hx4F5JBHzUmfFEGrjxetjih9Lbw5mfmBpEU9uQGJ.png', NULL, 1, 'admin@goalmasters.top', '2021-10-11 10:59:29', '$2y$10$FAsKF34hB8V0JcDAvIfGGu/LrG4nUYKmDeYAaJ8JY3Vyj7cLMdrq.', 'UtAAfJe8wnDAPULsUUBWqCKQr9B6FAmvXpXcZTgy1qfC9sdvQ7sf0uX0t4Zf', NULL, '2024-12-19 02:47:55'),
(24, 'التجريب', 'Ta1', NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$gTIDAfBWiymbSLZE2H0dUe1YG6Scsek4l5YyEZIzTdSxPsgxKP3eG', NULL, '2024-11-29 19:05:52', '2024-12-01 17:33:37'),
(37, 'DIAA ABABNEH', 'DIAA01', NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$lTEm/h2/B42W01ZMxL8XWu/Wkvt6LKfjuB1AnO2i/5oqS5zXZ9Glu', NULL, '2024-12-04 09:16:03', '2024-12-04 09:16:03'),
(38, 'abdo', 'abdo', '01112474982', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$Npg8N.b5pqQo1uj7es5LuO/qB7.szpdY/M5LoL/PV5DRlqyqO2d8O', NULL, '2024-12-04 12:30:07', '2024-12-04 12:30:07'),
(39, 'ايوب بالحاج', 'Ayoubbelhaj663@gmail.com', '0916776600', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$pakqj9O3hACMKBerK.q3/.XPMDlC6562wHqd8oKMvqxgBHIjEX83W', NULL, '2024-12-05 16:12:26', '2024-12-05 16:12:26'),
(46, 'Mohammed Abbas', 'Mohammed', '0917307185', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$8a3eP5Ut.HjOMHuYpMDPqu258jPziba4BZEbGGi10hxqQlzHvpKBi', NULL, '2024-12-06 18:56:39', '2024-12-06 18:56:39'),
(47, 'JKPJKsNkewZZmq', 'wqbjrajompusj@yahoo.com', '9901319652', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$OUMwpoYOlAxsDQuhObqCKu0293i9Q2Rn4BMHMDbrxLiz0YLytHE6m', NULL, '2024-12-06 20:32:12', '2024-12-06 20:32:12'),
(48, 'KFJcrqDjHg', 'dylsmarksz74@gmail.com', '8320190350', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$tZGC87Wotq3WMTJmJQRZGeOLbXZf2Od/YlzNv6fl9soz/9ABvHdBO', NULL, '2024-12-07 07:03:00', '2024-12-07 07:03:00'),
(49, 'hVVatjkQQFfLppH', 'whisper71glyph@gmail.com', '9675662501', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$Sk5NDNzPcSpyq6ya5kUw3.MMkKYI76NRrS0vZMm5Yqx8P0ixsCmoa', NULL, '2024-12-07 11:20:05', '2024-12-07 11:20:05'),
(50, 'JkmxbpHxJmkYNl', 'dprincevv1989@gmail.com', '3624580030', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$1tHK/YcP/XYUkdtfYbfOD.K.qyRiQXA2inGD9Uo3XI6pXWAHAoEoq', NULL, '2024-12-07 21:45:30', '2024-12-07 21:45:30'),
(51, 'RRXdhNhy', 'thorntonrobbike@gmail.com', '9039824336', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$pWdsQKNxy25nk4fe4LbkouYCBczQO5PNF6Y6TJ7Ooz2h131T6Q9fO', NULL, '2024-12-08 00:21:43', '2024-12-08 00:21:43'),
(52, 'FVbfwrpONq', 'tressataves3@gmail.com', '3955412812', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$Q.KKZ1rMswWBVHbFNAREYupFcFeLAvJ3Rw49OGTLtJJOTziWnCq1C', NULL, '2024-12-08 06:20:43', '2024-12-08 06:20:43'),
(54, 'PcyvTDhbFbdPWf', 'ndfhywyokxbugfo@yahoo.com', '6441947037', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$tqGjuPmo7gmfUDBQlYN5KeJq8q8BWIbT.js2ENUu8PPdUkUgbXYU2', NULL, '2024-12-10 19:57:41', '2024-12-10 19:57:41'),
(55, 'tqeUPrmHEN', 'angeldunlapdy76@gmail.com', '4768431856', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$xLxm0nbhqJWkc8fyCimqKOovvA9xr4TzYJZaW6BRPaay6TkNqsMYy', NULL, '2024-12-11 18:58:03', '2024-12-11 18:58:03'),
(56, 'xAEkHWDg', 'qqqhydypcayil@yahoo.com', '5732508390', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$ZsZHEiPQ.FFC50BiumUFLO4yA2J53jnD55Uy4Bm7SXTD/TJZ5UnPe', NULL, '2024-12-11 20:06:25', '2024-12-11 20:06:25'),
(57, 'DuoLrWZhaPWB', 'klagrosla@gmail.com', '2748284153', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$z4ISo1SMxIcN6lMxpHBzyObRpdK2VRs.m3g./b.rY/V5hYr9COuG2', NULL, '2024-12-11 20:58:04', '2024-12-11 20:58:04'),
(58, 'admin ahli', 'mohamed', NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$MDINidckL0XgXSq6GAcRn.JSEF01FFKsptPnI/5YuYorYEFI96jxC', 'nvI2XVsAF1oOhcaMqvW6qWUQzOfUP0rGLvu8JZa8bXtTwFRVSc0hZCRzC5YF', '2024-12-15 20:10:55', '2024-12-15 20:10:55'),
(59, 'HnPDHHDdGrBPsKx', 'uwiguyi012@gmail.com', '4132396098', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$eqMFHBKnuPU6oFRcm9db9eVoch5fcwchz1z4VtPufNqrYItkg5Uii', NULL, '2024-12-20 12:01:06', '2024-12-20 12:01:06'),
(60, 'itikbBPNy', 'oqupewa909@gmail.com', '2481758202', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$Uz3HdffuII0KttFnx/0R/eVTEkv9fd65eo6vDOHDd1LjnQRhZcMNe', NULL, '2024-12-26 10:44:38', '2024-12-26 10:44:38'),
(61, 'tkepziEqUOo', 'obayubiwoye45@gmail.com', '8826899571', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$WjZyOB3IMkJTNjIiCbwBg.Edzd3g9r4FyD/vEkBSi68Dp.xwJaizq', NULL, '2024-12-30 20:43:37', '2024-12-30 20:43:37'),
(62, 'ali', '123asd', NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$gDjZ7lA3w/DMAragyMQNyu6/lqkjgFVq5YQ/y.V1HFOj0IGf/jOs.', NULL, '2025-01-02 19:32:35', '2025-01-02 19:32:35'),
(64, 'عبدو علي', 'abdo12', NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$PQ59CsbT/BgCa4hyrhFbRO8AsXdg2LkU4e5q.JqeXzEBWat.WI3mm', NULL, '2025-01-03 17:15:55', '2025-01-03 17:15:55'),
(65, 'مدير القوشي', 'goshe', NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$VPEn10jXn3k7a3k6WDWOouupASogHsNpliYoNSqPLpq7m3I7mzlJC', NULL, '2025-01-03 17:40:16', '2025-01-03 17:40:16'),
(66, 'hXApxCIB', 'aqabddslfcq18@yahoo.com', '4308245634', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$grxnjDdgtTQ3egSXyZVu9uP4MnYXniYZ5Bp/V1IYsWTeuhqkLXW/i', NULL, '2025-01-05 23:59:48', '2025-01-05 23:59:48'),
(67, 'HbslAwdfrOKX', 'kenikububequ06@gmail.com', '2066975986', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$dPtdUXjqi8JrqlOykpwmfeFAXa94d.jljci.Ie0OhHXP7NaJavd5S', NULL, '2025-01-08 09:33:12', '2025-01-08 09:33:12'),
(68, 'ZutiTxIAfYPWPL', 'q0xchsyamzht7w4@yahoo.com', '2260308088', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$GPZVLn7lIVR/h3lq8ScvKepWAUiZnz29x/GX9QavNib8DuqnZpp9u', NULL, '2025-01-11 02:01:11', '2025-01-11 02:01:11'),
(70, 'IhShptZnrjWnCU', 'everittlaerman@yahoo.com', '9198120240', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$NmKg64NjQf5Yb84o67ph1eVALxOHnqV27H0e.GCx6efwP0zpkq4aO', NULL, '2025-01-11 18:06:35', '2025-01-11 18:06:35'),
(73, 'ZsQoyamtKdZoTKw', 'onebezode21@gmail.com', '9259267464', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$9xliDPZlAFH169W47UaD7unEHw/z8MLVksAuHvXpJeHIJcF9cJkDW', NULL, '2025-01-13 05:47:49', '2025-01-13 05:47:49'),
(74, 'RuHlesrJuypIJ', 'allensolomonbo@gmail.com', '8054610036', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$mIJ3qj7opEaXqc6zMOwSA..W7qL9LChFb/CXVrQvM3Bu.s7YntzAO', NULL, '2025-01-14 21:00:10', '2025-01-14 21:00:10'),
(75, 'DdpLEKTjpo', 'auborealoe60oracle4ue@gmail.com', '5981618041', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$DOcRBBqhCLYQ5g2tSQSE6Ofa49U7Dor5cn699PbMYLpi9OjsBmcbC', NULL, '2025-01-15 06:38:06', '2025-01-15 06:38:06'),
(76, 'tAEcYnDwwL', 'otonelsncervena@yahoo.com', '2276626418', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$7BNprv4XzOvvq9oneBwJZeOTc..2J9jh0tgazxKOcLak8LRlMIfZG', NULL, '2025-01-15 07:48:19', '2025-01-15 07:48:19'),
(77, 'ملعب الهدف', 'hadf', NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$iLGtTfKN.YWMcsR1nzjO/uTI3UAVgzHlFyI91zA8UpgnKNaAPuPc.', NULL, '2025-01-15 15:39:45', '2025-01-15 15:43:41'),
(78, 'ftlHfwNhsr', 'kozaniraquh996@gmail.com', '7417716909', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$rOXVUdtTh5VudxGolc6yRuFL9Ytj.Hkuc26JWrpW/b7i/cU2069Em', NULL, '2025-01-16 19:05:03', '2025-01-16 19:05:03'),
(79, 'fPjMWMZWQYyoP', 'illuminateouikaleidoscope21oo@gmail.com', '8764458817', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$I9ehChswAqRAECZ2cycei.1cJBxJhSLq63kIe6t0tQjUo5FqPowCS', NULL, '2025-01-16 19:53:03', '2025-01-16 19:53:03'),
(80, 'evyiupPmNCXFF', 'abraxasoyverge@gmail.com', '6610382297', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$hs0ramEH7wBTVQaXIMk/G.OMeHAXmjwaPJ2KxM9sBlMQUphk99svu', NULL, '2025-01-16 23:48:06', '2025-01-16 23:48:06'),
(81, 'AqMPVteN', 'alederrer@yahoo.com', '2619342177', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$pCbErDfUywUS9WqhUPgn5uvdLeom5maI07Tyn4018mn0QDe3LdgVy', NULL, '2025-01-17 14:46:08', '2025-01-17 14:46:08'),
(82, 'nRjbVQiL', 'expanseuo2legacy72@gmail.com', '9505032870', 0, 2, NULL, NULL, NULL, 1, NULL, NULL, '$2y$10$O.alruck4GwELa6Lp5.NuOhM1zu9zwjmyTvD9EClLepu1U0YpetQq', NULL, '2025-01-18 01:13:30', '2025-01-18 01:13:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cards_code_unique` (`code`),
  ADD KEY `cards_group_id_foreign` (`group_id`);

--
-- Indexes for table `card_groups`
--
ALTER TABLE `card_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmn_branches`
--
ALTER TABLE `cmn_branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmn_branches_name_unique` (`name`),
  ADD UNIQUE KEY `cmn_branches_phone_unique` (`phone`),
  ADD UNIQUE KEY `cmn_branches_email_unique` (`email`);

--
-- Indexes for table `cmn_business_holidays`
--
ALTER TABLE `cmn_business_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmn_business_holidays_cmn_branch_id_foreign` (`cmn_branch_id`);

--
-- Indexes for table `cmn_business_hours`
--
ALTER TABLE `cmn_business_hours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cmn_business_hours_day_cmn_branch_id` (`day`,`cmn_branch_id`),
  ADD KEY `cmn_business_hours_cmn_branch_id_foreign` (`cmn_branch_id`);

--
-- Indexes for table `cmn_categories`
--
ALTER TABLE `cmn_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmn_categories_slug_unique` (`slug`),
  ADD KEY `cmn_categories_cmn_category_id_foreign` (`cmn_category_id`);

--
-- Indexes for table `cmn_companies`
--
ALTER TABLE `cmn_companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmn_companies_name_unique` (`name`);

--
-- Indexes for table `cmn_coupons`
--
ALTER TABLE `cmn_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmn_currency_setups`
--
ALTER TABLE `cmn_currency_setups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmn_currency_setups_name_unique` (`name`);

--
-- Indexes for table `cmn_customers`
--
ALTER TABLE `cmn_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmn_customers_phone_no_unique` (`phone_no`),
  ADD UNIQUE KEY `cmn_customers_email_unique` (`email`),
  ADD KEY `cmn_customers_user_id_foreign` (`user_id`),
  ADD KEY `cmn_customers_created_by_foreign` (`created_by`);

--
-- Indexes for table `cmn_languages`
--
ALTER TABLE `cmn_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmn_languages_code_unique` (`code`);

--
-- Indexes for table `cmn_orders`
--
ALTER TABLE `cmn_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmn_orders_user_id_foreign` (`user_id`),
  ADD KEY `cmn_orders_cmn_coupon_id_foreign` (`cmn_coupon_id`);

--
-- Indexes for table `cmn_order_details`
--
ALTER TABLE `cmn_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmn_order_details_cmn_order_id_foreign` (`cmn_order_id`),
  ADD KEY `cmn_order_details_cmn_product_id_foreign` (`cmn_product_id`);

--
-- Indexes for table `cmn_payment_infos`
--
ALTER TABLE `cmn_payment_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmn_payment_types`
--
ALTER TABLE `cmn_payment_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmn_payment_types_name_unique` (`name`);

--
-- Indexes for table `cmn_paypal_api_configs`
--
ALTER TABLE `cmn_paypal_api_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmn_paypal_api_configs_cmn_payment_type_id_foreign` (`cmn_payment_type_id`);

--
-- Indexes for table `cmn_products`
--
ALTER TABLE `cmn_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmn_products_cmn_type_id_foreign` (`cmn_type_id`),
  ADD KEY `cmn_products_cmn_category_id_foreign` (`cmn_category_id`);

--
-- Indexes for table `cmn_stripe_api_configs`
--
ALTER TABLE `cmn_stripe_api_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmn_stripe_api_configs_cmn_payment_type_id_foreign` (`cmn_payment_type_id`);

--
-- Indexes for table `cmn_translations`
--
ALTER TABLE `cmn_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmn_translations_cmn_language_id_foreign` (`cmn_language_id`);

--
-- Indexes for table `cmn_twilio_configs`
--
ALTER TABLE `cmn_twilio_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmn_types`
--
ALTER TABLE `cmn_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmn_types_slug_unique` (`slug`);

--
-- Indexes for table `cmn_user_balances`
--
ALTER TABLE `cmn_user_balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmn_user_balances_balanceable_type_balanceable_id_index` (`balanceable_type`,`balanceable_id`),
  ADD KEY `cmn_user_balances_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hrm_departments`
--
ALTER TABLE `hrm_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hrm_departments_name_unique` (`name`);

--
-- Indexes for table `hrm_designations`
--
ALTER TABLE `hrm_designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hrm_designations_name_unique` (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sch_employees`
--
ALTER TABLE `sch_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sch_employees_employee_id_unique` (`employee_id`),
  ADD KEY `sch_employees_user_id_foreign` (`user_id`),
  ADD KEY `sch_employees_cmn_branch_id_foreign` (`cmn_branch_id`),
  ADD KEY `sch_employees_hrm_department_id_foreign` (`hrm_department_id`),
  ADD KEY `sch_employees_hrm_designation_id_foreign` (`hrm_designation_id`);

--
-- Indexes for table `sch_employee_offdays`
--
ALTER TABLE `sch_employee_offdays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sch_employee_offdays_sch_employee_id_foreign` (`sch_employee_id`);

--
-- Indexes for table `sch_employee_schedules`
--
ALTER TABLE `sch_employee_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sch_employee_schedules_sch_employee_id_foreign` (`sch_employee_id`);

--
-- Indexes for table `sch_employee_services`
--
ALTER TABLE `sch_employee_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sch_employee_services_sch_employee_id_sch_service_id_unique` (`sch_employee_id`,`sch_service_id`),
  ADD KEY `sch_employee_services_sch_service_id_foreign` (`sch_service_id`);

--
-- Indexes for table `sch_salaries`
--
ALTER TABLE `sch_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sch_services`
--
ALTER TABLE `sch_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sch_services_sch_service_category_id_foreign` (`sch_service_category_id`);

--
-- Indexes for table `sch_service_bookings`
--
ALTER TABLE `sch_service_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sch_service_bookings_cmn_branch_id_foreign` (`cmn_branch_id`),
  ADD KEY `sch_service_bookings_cmn_customer_id_foreign` (`cmn_customer_id`),
  ADD KEY `sch_service_bookings_sch_employee_id_foreign` (`sch_employee_id`),
  ADD KEY `sch_service_bookings_sch_service_id_foreign` (`sch_service_id`),
  ADD KEY `sch_service_bookings_cmn_payment_type_id_foreign` (`cmn_payment_type_id`),
  ADD KEY `sch_service_bookings_cancel_cmn_payment_type_id_foreign` (`cancel_cmn_payment_type_id`),
  ADD KEY `fk_sch_service_booking_sch_service_booking_info_id` (`sch_service_booking_info_id`);

--
-- Indexes for table `sch_service_booking_feedback`
--
ALTER TABLE `sch_service_booking_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sch_sb_id` (`sch_service_booking_id`),
  ADD KEY `sch_service_booking_feedback_user_id_foreign` (`user_id`);

--
-- Indexes for table `sch_service_booking_infos`
--
ALTER TABLE `sch_service_booking_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sch_service_booking_infos_cmn_customer_id_foreign` (`cmn_customer_id`);

--
-- Indexes for table `sch_service_categories`
--
ALTER TABLE `sch_service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sch_service_categories_cmn_branch_id_foreign` (`cmn_branch_id`);

--
-- Indexes for table `sec_resources`
--
ALTER TABLE `sec_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sec_resource_permissions`
--
ALTER TABLE `sec_resource_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sec_resource_permissions_sec_role_id_foreign` (`sec_role_id`),
  ADD KEY `sec_resource_permissions_sec_resource_id_foreign` (`sec_resource_id`);

--
-- Indexes for table `sec_roles`
--
ALTER TABLE `sec_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sec_role_permissions`
--
ALTER TABLE `sec_role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sec_role_permissions_sec_role_permission_info_id_foreign` (`sec_role_permission_info_id`),
  ADD KEY `sec_role_permissions_sec_role_id_foreign` (`sec_role_id`);

--
-- Indexes for table `sec_role_permission_infos`
--
ALTER TABLE `sec_role_permission_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sec_role_permission_infos_sec_resource_id_foreign` (`sec_resource_id`);

--
-- Indexes for table `sec_user_branches`
--
ALTER TABLE `sec_user_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sec_user_branches_user_id_foreign` (`user_id`),
  ADD KEY `sec_user_branches_cmn_branch_id_foreign` (`cmn_branch_id`);

--
-- Indexes for table `sec_user_roles`
--
ALTER TABLE `sec_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sec_user_roles_sec_user_id_foreign` (`sec_user_id`),
  ADD KEY `sec_user_roles_sec_role_id_foreign` (`sec_role_id`);

--
-- Indexes for table `site_about_us`
--
ALTER TABLE `site_about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_appearances`
--
ALTER TABLE `site_appearances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_client_testimonials`
--
ALTER TABLE `site_client_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_frequently_asked_questions`
--
ALTER TABLE `site_frequently_asked_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_google_maps`
--
ALTER TABLE `site_google_maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_menus`
--
ALTER TABLE `site_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_photo_galleries`
--
ALTER TABLE `site_photo_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_terms_and_conditions`
--
ALTER TABLE `site_terms_and_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `st_otp_configurations`
--
ALTER TABLE `st_otp_configurations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `st_otp_configurations_name_unique` (`name`);

--
-- Indexes for table `st_otp_messages`
--
ALTER TABLE `st_otp_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD KEY `users_sch_employee_id_foreign` (`sch_employee_id`),
  ADD KEY `users_created_by_foreign` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card_groups`
--
ALTER TABLE `card_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cmn_branches`
--
ALTER TABLE `cmn_branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cmn_business_holidays`
--
ALTER TABLE `cmn_business_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmn_business_hours`
--
ALTER TABLE `cmn_business_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cmn_categories`
--
ALTER TABLE `cmn_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmn_companies`
--
ALTER TABLE `cmn_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cmn_coupons`
--
ALTER TABLE `cmn_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmn_currency_setups`
--
ALTER TABLE `cmn_currency_setups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cmn_customers`
--
ALTER TABLE `cmn_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `cmn_languages`
--
ALTER TABLE `cmn_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cmn_orders`
--
ALTER TABLE `cmn_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmn_order_details`
--
ALTER TABLE `cmn_order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmn_payment_infos`
--
ALTER TABLE `cmn_payment_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cmn_payment_types`
--
ALTER TABLE `cmn_payment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cmn_paypal_api_configs`
--
ALTER TABLE `cmn_paypal_api_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cmn_products`
--
ALTER TABLE `cmn_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmn_stripe_api_configs`
--
ALTER TABLE `cmn_stripe_api_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmn_translations`
--
ALTER TABLE `cmn_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=807;

--
-- AUTO_INCREMENT for table `cmn_twilio_configs`
--
ALTER TABLE `cmn_twilio_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmn_types`
--
ALTER TABLE `cmn_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cmn_user_balances`
--
ALTER TABLE `cmn_user_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrm_departments`
--
ALTER TABLE `hrm_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrm_designations`
--
ALTER TABLE `hrm_designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `sch_employees`
--
ALTER TABLE `sch_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sch_employee_offdays`
--
ALTER TABLE `sch_employee_offdays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_employee_schedules`
--
ALTER TABLE `sch_employee_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `sch_employee_services`
--
ALTER TABLE `sch_employee_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `sch_salaries`
--
ALTER TABLE `sch_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_services`
--
ALTER TABLE `sch_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sch_service_bookings`
--
ALTER TABLE `sch_service_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `sch_service_booking_feedback`
--
ALTER TABLE `sch_service_booking_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_service_booking_infos`
--
ALTER TABLE `sch_service_booking_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `sch_service_categories`
--
ALTER TABLE `sch_service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sec_resources`
--
ALTER TABLE `sec_resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `sec_resource_permissions`
--
ALTER TABLE `sec_resource_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `sec_roles`
--
ALTER TABLE `sec_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sec_role_permissions`
--
ALTER TABLE `sec_role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- AUTO_INCREMENT for table `sec_role_permission_infos`
--
ALTER TABLE `sec_role_permission_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `sec_user_branches`
--
ALTER TABLE `sec_user_branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sec_user_roles`
--
ALTER TABLE `sec_user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `site_about_us`
--
ALTER TABLE `site_about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_appearances`
--
ALTER TABLE `site_appearances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_client_testimonials`
--
ALTER TABLE `site_client_testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `site_frequently_asked_questions`
--
ALTER TABLE `site_frequently_asked_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `site_google_maps`
--
ALTER TABLE `site_google_maps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_menus`
--
ALTER TABLE `site_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `site_photo_galleries`
--
ALTER TABLE `site_photo_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `site_terms_and_conditions`
--
ALTER TABLE `site_terms_and_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `st_otp_configurations`
--
ALTER TABLE `st_otp_configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `st_otp_messages`
--
ALTER TABLE `st_otp_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `card_groups` (`id`);

--
-- Constraints for table `cmn_business_holidays`
--
ALTER TABLE `cmn_business_holidays`
  ADD CONSTRAINT `cmn_business_holidays_cmn_branch_id_foreign` FOREIGN KEY (`cmn_branch_id`) REFERENCES `cmn_branches` (`id`);

--
-- Constraints for table `cmn_business_hours`
--
ALTER TABLE `cmn_business_hours`
  ADD CONSTRAINT `cmn_business_hours_cmn_branch_id_foreign` FOREIGN KEY (`cmn_branch_id`) REFERENCES `cmn_branches` (`id`);

--
-- Constraints for table `cmn_categories`
--
ALTER TABLE `cmn_categories`
  ADD CONSTRAINT `cmn_categories_cmn_category_id_foreign` FOREIGN KEY (`cmn_category_id`) REFERENCES `cmn_categories` (`id`);

--
-- Constraints for table `cmn_customers`
--
ALTER TABLE `cmn_customers`
  ADD CONSTRAINT `cmn_customers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cmn_customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cmn_orders`
--
ALTER TABLE `cmn_orders`
  ADD CONSTRAINT `cmn_orders_cmn_coupon_id_foreign` FOREIGN KEY (`cmn_coupon_id`) REFERENCES `cmn_coupons` (`id`),
  ADD CONSTRAINT `cmn_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cmn_order_details`
--
ALTER TABLE `cmn_order_details`
  ADD CONSTRAINT `cmn_order_details_cmn_order_id_foreign` FOREIGN KEY (`cmn_order_id`) REFERENCES `cmn_orders` (`id`),
  ADD CONSTRAINT `cmn_order_details_cmn_product_id_foreign` FOREIGN KEY (`cmn_product_id`) REFERENCES `cmn_products` (`id`);

--
-- Constraints for table `cmn_paypal_api_configs`
--
ALTER TABLE `cmn_paypal_api_configs`
  ADD CONSTRAINT `cmn_paypal_api_configs_cmn_payment_type_id_foreign` FOREIGN KEY (`cmn_payment_type_id`) REFERENCES `cmn_payment_types` (`id`);

--
-- Constraints for table `cmn_products`
--
ALTER TABLE `cmn_products`
  ADD CONSTRAINT `cmn_products_cmn_category_id_foreign` FOREIGN KEY (`cmn_category_id`) REFERENCES `cmn_categories` (`id`),
  ADD CONSTRAINT `cmn_products_cmn_type_id_foreign` FOREIGN KEY (`cmn_type_id`) REFERENCES `cmn_types` (`id`);

--
-- Constraints for table `cmn_stripe_api_configs`
--
ALTER TABLE `cmn_stripe_api_configs`
  ADD CONSTRAINT `cmn_stripe_api_configs_cmn_payment_type_id_foreign` FOREIGN KEY (`cmn_payment_type_id`) REFERENCES `cmn_payment_types` (`id`);

--
-- Constraints for table `cmn_translations`
--
ALTER TABLE `cmn_translations`
  ADD CONSTRAINT `cmn_translations_cmn_language_id_foreign` FOREIGN KEY (`cmn_language_id`) REFERENCES `cmn_languages` (`id`);

--
-- Constraints for table `cmn_user_balances`
--
ALTER TABLE `cmn_user_balances`
  ADD CONSTRAINT `cmn_user_balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sch_employees`
--
ALTER TABLE `sch_employees`
  ADD CONSTRAINT `sch_employees_cmn_branch_id_foreign` FOREIGN KEY (`cmn_branch_id`) REFERENCES `cmn_branches` (`id`),
  ADD CONSTRAINT `sch_employees_hrm_department_id_foreign` FOREIGN KEY (`hrm_department_id`) REFERENCES `hrm_departments` (`id`),
  ADD CONSTRAINT `sch_employees_hrm_designation_id_foreign` FOREIGN KEY (`hrm_designation_id`) REFERENCES `hrm_designations` (`id`),
  ADD CONSTRAINT `sch_employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sch_employee_offdays`
--
ALTER TABLE `sch_employee_offdays`
  ADD CONSTRAINT `sch_employee_offdays_sch_employee_id_foreign` FOREIGN KEY (`sch_employee_id`) REFERENCES `sch_employees` (`id`);

--
-- Constraints for table `sch_employee_schedules`
--
ALTER TABLE `sch_employee_schedules`
  ADD CONSTRAINT `sch_employee_schedules_sch_employee_id_foreign` FOREIGN KEY (`sch_employee_id`) REFERENCES `sch_employees` (`id`);

--
-- Constraints for table `sch_employee_services`
--
ALTER TABLE `sch_employee_services`
  ADD CONSTRAINT `sch_employee_services_sch_employee_id_foreign` FOREIGN KEY (`sch_employee_id`) REFERENCES `sch_employees` (`id`),
  ADD CONSTRAINT `sch_employee_services_sch_service_id_foreign` FOREIGN KEY (`sch_service_id`) REFERENCES `sch_services` (`id`);

--
-- Constraints for table `sch_services`
--
ALTER TABLE `sch_services`
  ADD CONSTRAINT `sch_services_sch_service_category_id_foreign` FOREIGN KEY (`sch_service_category_id`) REFERENCES `sch_service_categories` (`id`);

--
-- Constraints for table `sch_service_bookings`
--
ALTER TABLE `sch_service_bookings`
  ADD CONSTRAINT `fk_sch_service_booking_sch_service_booking_info_id` FOREIGN KEY (`sch_service_booking_info_id`) REFERENCES `sch_service_booking_infos` (`id`),
  ADD CONSTRAINT `sch_service_bookings_cancel_cmn_payment_type_id_foreign` FOREIGN KEY (`cancel_cmn_payment_type_id`) REFERENCES `cmn_payment_types` (`id`),
  ADD CONSTRAINT `sch_service_bookings_cmn_branch_id_foreign` FOREIGN KEY (`cmn_branch_id`) REFERENCES `cmn_branches` (`id`),
  ADD CONSTRAINT `sch_service_bookings_cmn_customer_id_foreign` FOREIGN KEY (`cmn_customer_id`) REFERENCES `cmn_customers` (`id`),
  ADD CONSTRAINT `sch_service_bookings_cmn_payment_type_id_foreign` FOREIGN KEY (`cmn_payment_type_id`) REFERENCES `cmn_payment_types` (`id`),
  ADD CONSTRAINT `sch_service_bookings_sch_employee_id_foreign` FOREIGN KEY (`sch_employee_id`) REFERENCES `sch_employees` (`id`),
  ADD CONSTRAINT `sch_service_bookings_sch_service_id_foreign` FOREIGN KEY (`sch_service_id`) REFERENCES `sch_services` (`id`);

--
-- Constraints for table `sch_service_booking_feedback`
--
ALTER TABLE `sch_service_booking_feedback`
  ADD CONSTRAINT `sch_sb_id` FOREIGN KEY (`sch_service_booking_id`) REFERENCES `sch_service_bookings` (`id`),
  ADD CONSTRAINT `sch_service_booking_feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sch_service_booking_infos`
--
ALTER TABLE `sch_service_booking_infos`
  ADD CONSTRAINT `sch_service_booking_infos_cmn_customer_id_foreign` FOREIGN KEY (`cmn_customer_id`) REFERENCES `cmn_customers` (`id`);

--
-- Constraints for table `sch_service_categories`
--
ALTER TABLE `sch_service_categories`
  ADD CONSTRAINT `sch_service_categories_cmn_branch_id_foreign` FOREIGN KEY (`cmn_branch_id`) REFERENCES `cmn_branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sec_resource_permissions`
--
ALTER TABLE `sec_resource_permissions`
  ADD CONSTRAINT `sec_resource_permissions_sec_resource_id_foreign` FOREIGN KEY (`sec_resource_id`) REFERENCES `sec_resources` (`id`),
  ADD CONSTRAINT `sec_resource_permissions_sec_role_id_foreign` FOREIGN KEY (`sec_role_id`) REFERENCES `sec_roles` (`id`);

--
-- Constraints for table `sec_role_permissions`
--
ALTER TABLE `sec_role_permissions`
  ADD CONSTRAINT `sec_role_permissions_sec_role_id_foreign` FOREIGN KEY (`sec_role_id`) REFERENCES `sec_roles` (`id`),
  ADD CONSTRAINT `sec_role_permissions_sec_role_permission_info_id_foreign` FOREIGN KEY (`sec_role_permission_info_id`) REFERENCES `sec_role_permission_infos` (`id`);

--
-- Constraints for table `sec_role_permission_infos`
--
ALTER TABLE `sec_role_permission_infos`
  ADD CONSTRAINT `sec_role_permission_infos_sec_resource_id_foreign` FOREIGN KEY (`sec_resource_id`) REFERENCES `sec_resources` (`id`);

--
-- Constraints for table `sec_user_branches`
--
ALTER TABLE `sec_user_branches`
  ADD CONSTRAINT `sec_user_branches_cmn_branch_id_foreign` FOREIGN KEY (`cmn_branch_id`) REFERENCES `cmn_branches` (`id`),
  ADD CONSTRAINT `sec_user_branches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sec_user_roles`
--
ALTER TABLE `sec_user_roles`
  ADD CONSTRAINT `sec_user_roles_sec_role_id_foreign` FOREIGN KEY (`sec_role_id`) REFERENCES `sec_roles` (`id`),
  ADD CONSTRAINT `sec_user_roles_sec_user_id_foreign` FOREIGN KEY (`sec_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_sch_employee_id_foreign` FOREIGN KEY (`sch_employee_id`) REFERENCES `sch_employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
