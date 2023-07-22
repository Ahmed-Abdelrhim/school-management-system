-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 08:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school-managemet-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_employee_salaries`
--

CREATE TABLE `account_employee_salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `date` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_other_costs`
--

CREATE TABLE `account_other_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_student_fees`
--

CREATE TABLE `account_student_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_students`
--

CREATE TABLE `assign_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL COMMENT 'user_id=student_id',
  `roll` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_students`
--

INSERT INTO `assign_students` (`id`, `student_id`, `roll`, `class_id`, `year_id`, `group_id`, `shift_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2023-01-29 15:01:03', '2023-01-29 15:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `assign_subjects`
--

CREATE TABLE `assign_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `full_mark` double NOT NULL,
  `pass_mark` double NOT NULL,
  `subjective_mark` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_type` varchar(255) NOT NULL,
  `commentable_id` bigint(20) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Front-End Developer', '2023-02-03 16:40:30', NULL),
(2, 'Back-End Developer', '2023-02-03 16:40:30', NULL),
(3, 'Mobile Developer', '2023-02-03 16:40:30', NULL),
(4, 'Security', '2023-02-03 16:40:30', NULL),
(5, 'Software Tester', '2023-02-03 16:40:30', NULL),
(6, 'Ui/Ux', '2023-02-03 16:40:30', NULL),
(7, 'Graphic Designer', '2023-02-03 16:40:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discount_students`
--

CREATE TABLE `discount_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_student_id` int(11) NOT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendances`
--

CREATE TABLE `employee_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `date` date NOT NULL,
  `attend_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_leaves`
--

CREATE TABLE `employee_leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `leave_purpose_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_sallary_logs`
--

CREATE TABLE `employee_sallary_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=User_id',
  `previous_salary` int(11) DEFAULT NULL,
  `present_salary` int(11) DEFAULT NULL,
  `increment_salary` int(11) DEFAULT NULL,
  `effected_salary` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_types`
--

CREATE TABLE `exam_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_types`
--

INSERT INTO `exam_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'First Name Exam', '2023-01-29 10:25:10', '2023-01-29 10:25:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_categories`
--

CREATE TABLE `fee_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_category_amounts`
--

CREATE TABLE `fee_category_amounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fee_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `src` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `leave_purposes`
--

CREATE TABLE `leave_purposes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) NOT NULL,
  `last_login_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marks_grades`
--

CREATE TABLE `marks_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grade_name` varchar(255) NOT NULL,
  `grade_point` varchar(255) NOT NULL,
  `start_marks` varchar(255) NOT NULL,
  `end_marks` varchar(255) NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_11_23_192918_create_sessions_table', 1),
(7, '2020_11_27_191622_create_student_classes_table', 1),
(8, '2020_11_27_201955_create_student_years_table', 1),
(9, '2020_11_27_205317_create_student_groups_table', 1),
(10, '2020_11_27_212648_create_student_shifts_table', 1),
(11, '2020_11_28_184513_create_fee_categories_table', 1),
(12, '2020_11_28_193421_create_fee_category_amounts_table', 1),
(13, '2020_11_29_190907_create_exam_types_table', 1),
(14, '2020_11_29_193820_create_school_subjects_table', 1),
(15, '2020_11_30_192807_create_assign_subjects_table', 1),
(16, '2020_11_30_211919_create_designations_table', 1),
(17, '2020_12_02_191137_create_assign_students_table', 1),
(18, '2020_12_02_191735_create_discount_students_table', 1),
(19, '2020_12_09_192120_create_employee_sallary_logs_table', 1),
(20, '2020_12_11_205416_create_leave_purposes_table', 1),
(21, '2020_12_11_210033_create_employee_leaves_table', 1),
(22, '2020_12_13_192045_create_employee_attendances_table', 1),
(23, '2020_12_15_214223_create_student_marks_table', 1),
(24, '2020_12_16_202402_create_marks_grades_table', 1),
(25, '2020_12_18_191232_create_account_student_fees_table', 1),
(26, '2020_12_18_212912_create_account_employee_salaries_table', 1),
(27, '2020_12_20_192742_create_account_other_costs_table', 1),
(28, '2023_02_04_180251_create_table_verifications', 2),
(29, '2023_02_06_130727_create_images_table', 3),
(30, '2023_05_24_141108_create_jobs_table', 3),
(31, '2023_05_24_142319_create_jobs_table', 4),
(32, '2023_05_24_150646_create_notifications_table', 4),
(33, '2023_05_25_184919_create_posts_table', 5),
(34, '2023_05_25_203815_create_posts_table', 6),
(35, '2023_05_26_170911_add_column_to_post', 7),
(36, '2023_05_29_132712_add_soft_deletes_to_posts_table', 8),
(37, '2023_05_30_112205_create_tags_table', 9),
(38, '2023_05_30_112338_create_post_tag_table', 9),
(39, '2023_06_07_124144_add_soft_delete_to_tags_table', 10),
(40, '2023_06_20_143244_create_logins_table', 11),
(41, '2023_07_22_174502_create_comments_table', 11),
(42, '2023_07_22_174921_create_videos_table', 12),
(43, '2023_07_22_202630_create_media_table', 13);

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
('f9de3774-5f2e-4acc-ba98-90c8d851b2ce', 'App\\Notifications\\PostNotification', 'App\\Models\\User', 1, '{\"id\":1,\"title\":\"Title Is Here\",\"date\":\"2023-05-24T13:28:51.464076Z\"}', NULL, '2023-05-24 13:28:51', '2023-05-24 13:28:51');

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
('aabdelrhim974@gmail.com', '$2y$10$Ms6QGI4ex/fusywCLxRcBOft.ripvo.Cu5ZXRHKs.dphdWtmgrXty', '2023-01-29 09:22:41'),
('abdelrhim.admin@gmail.com', '$2y$10$EN1ny73P/HlfKe6m5ekKE.nGd4zuZTKceHNnZtGIQXku47Plp.RBu', '2023-02-03 14:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `expires_at`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 8, 'Api Token Of Test Student', 'f043d9f29f55413cb80db8f96909334ada6481a55fcb61be0200a9db2bb042f6', '[\"*\"]', NULL, NULL, '2023-07-22 16:41:52', '2023-07-22 16:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `min_to_read` int(10) UNSIGNED NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `description`, `min_to_read`, `is_published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Laravel is very powerful framework to create full stack applications', 'Laravel-is-very-powerful-framework-to-create-full-stack-application', 'Laravel', 'Laravel is a web application framework with expressive, elegant syntax. A web framework provides a structure and starting point for creating your application,\n                        allowing you to focus on creating something amazing while we sweat the details.\n                Laravel strives to provide an amazing developer experience while providing powerful features such as thorough dependency injection, an expressive database\n                abstraction layer, queues and scheduled jobs, unit and integration testing, and more.\n                Whether you are new to PHP web frameworks or have years of experience, Laravel is a framework\n                that can grow with you. We\\\'ll help you take your first steps as a web developer or give you a boost\n                as you take your expertise to the next level. We can\\\'t wait to see what you build.', 5, 0, '2023-05-26 15:15:05', '2023-05-29 08:53:33', NULL),
(2, 1, 'Eloquent is awesome', 'eloquent-is-awesome', 'Awesome', 'Laravel Features are very easy  and powerful', 2, 0, '2023-05-29 09:02:13', '2023-05-29 09:02:13', NULL),
(3, 1, 'Test Slug', 'Slug', 'Slug', 'test description', 10, 1, '2023-05-29 11:42:09', '2023-05-29 11:42:49', NULL),
(37, 57, 'Nihil deserunt accusantium rerum qui natus.', 'Nihil-deserunt-accusantium-rerum-qui-natus.', 'adipisci', 'Et ut aliquid qui reprehenderit nihil. Libero laborum fugit illo et repellat. Velit exercitationem provident saepe repudiandae minus. Iusto laboriosam adipisci quia ratione at amet id. Asperiores id quisquam modi cumque nesciunt ut.', 9, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(38, 97, 'Similique fugiat non molestiae ipsum nisi impedit delectus pariatur.', 'Similique-fugiat-non-molestiae-ipsum-nisi-impedit-delectus-pariatur.', 'excepturi', 'Omnis ipsum incidunt in et omnis sunt. Et beatae repudiandae ut error esse sint ipsum. Quia quis illo non voluptatem dolorem corrupti rerum.', 10, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(39, 48, 'Aut aut quis voluptatibus eligendi at omnis corporis.', 'Aut-aut-quis-voluptatibus-eligendi-at-omnis-corporis.', 'unde', 'Facilis sunt illo aut aut sit dignissimos et. Facere aliquam ea laborum aliquid odio sunt ullam. Accusantium sed exercitationem ut et.', 8, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(40, 72, 'Quasi quia dignissimos at sapiente quos est et.', 'Quasi-quia-dignissimos-at-sapiente-quos-est-et.', 'quisquam', 'Eligendi dolor voluptatem impedit cumque corrupti. Alias molestias consequuntur atque iusto nostrum sunt est. Provident accusantium voluptas consequuntur commodi vitae occaecati unde aspernatur.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(41, 21, 'Et aperiam adipisci et alias cumque dolore.', 'Et-aperiam-adipisci-et-alias-cumque-dolore.', 'fugit', 'Rem laborum molestias corporis. Exercitationem neque est expedita ut sed. Quia asperiores tempora cupiditate sed. Commodi voluptas doloremque qui doloremque ea.', 4, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(42, 114, 'Mollitia autem nostrum iusto odit quis.', 'Mollitia-autem-nostrum-iusto-odit-quis.', 'voluptates', 'Rem dolorem praesentium numquam blanditiis quia architecto ut. Eligendi soluta magni minima. Accusamus alias recusandae facilis soluta eligendi.', 3, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(43, 79, 'Saepe recusandae est minus.', 'Saepe-recusandae-est-minus.', 'enim', 'Consequatur quos temporibus provident similique iure voluptatum molestias. Totam suscipit minus ex quo occaecati. Est omnis vero officia illo. Dolores nemo nobis quod culpa quia.', 7, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(44, 1, 'Expedita consequatur laudantium sed et.', 'Expedita-consequatur-laudantium-sed-et.', 'laudantium', 'Nostrum ipsam ipsam similique molestiae atque. Ut corporis et est. Qui ut illum nihil id ut architecto quia. Autem sapiente soluta occaecati repellendus.', 10, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(45, 46, 'Nihil eligendi accusamus eligendi et.', 'Nihil-eligendi-accusamus-eligendi-et.', 'corporis', 'Ducimus perspiciatis nihil eos omnis. Labore qui incidunt est sed dolores recusandae dolor fugiat. Consequatur soluta nisi eius facilis enim. Dicta facere iste esse odio neque.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(46, 69, 'Doloremque ut iste laboriosam aut fugit tempore.', 'Doloremque-ut-iste-laboriosam-aut-fugit-tempore.', 'consectetur', 'Sapiente at sint blanditiis voluptas aut cum. Et et hic laudantium porro sit explicabo. Dolorem sed suscipit sunt doloremque quis deserunt sed ipsum. Eaque ipsa recusandae fugiat quo.', 7, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(47, 69, 'Quis occaecati quia hic quod.', 'Quis-occaecati-quia-hic-quod.', 'porro', 'Ut quia consequatur dolorum officiis consectetur. Molestiae officiis aliquid dolor dolorum.', 7, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(48, 58, 'Quia sit et dolorem ut ut.', 'Quia-sit-et-dolorem-ut-ut.', 'cum', 'Velit molestias dolores mollitia ipsum quia et minus. Qui enim placeat modi harum ad repudiandae facilis maxime. Suscipit quo vitae quia sunt temporibus quos sed.', 7, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(49, 65, 'Aliquid similique qui fugiat.', 'Aliquid-similique-qui-fugiat.', 'suscipit', 'Quis est dolor reiciendis hic. Aliquam necessitatibus aut dolorem. Tenetur deleniti ab omnis unde tempore rerum consequatur. Dolore aliquid ex hic et.', 4, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(50, 37, 'Mollitia eum tempora numquam eum quasi.', 'Mollitia-eum-tempora-numquam-eum-quasi.', 'ut', 'Rerum reprehenderit rerum adipisci inventore officiis consequatur. Reprehenderit dolore sint autem praesentium dolor. Quidem voluptas qui veritatis dolorem quaerat.', 7, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(51, 114, 'In dolore nobis modi autem.', 'In-dolore-nobis-modi-autem.', 'commodi', 'Qui assumenda suscipit harum quas nobis beatae. Autem omnis ut odio rerum eligendi aut repudiandae est. Optio aut itaque labore impedit. Autem totam eos exercitationem dolores eius.', 8, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(52, 67, 'Maiores sed fugit ut dolorem molestiae dolores.', 'Maiores-sed-fugit-ut-dolorem-molestiae-dolores.', 'aliquam', 'Est vitae quas excepturi id non eveniet. Iusto autem commodi ut sunt. Corporis nam et sed vel repudiandae molestiae consectetur.', 1, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(53, 70, 'Excepturi aut fugit voluptatem molestiae.', 'Excepturi-aut-fugit-voluptatem-molestiae.', 'numquam', 'Aut qui tempora culpa tempora eaque alias. Ea tempore cupiditate facere quidem. Placeat corrupti sed eligendi voluptatem omnis suscipit. Voluptatem veniam quasi animi nobis ut praesentium. Minima enim quis nihil.', 2, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(54, 76, 'Aliquam error sunt quas corrupti dolorem reiciendis.', 'Aliquam-error-sunt-quas-corrupti-dolorem-reiciendis.', 'fuga', 'Est tenetur ex quia quia temporibus nulla quia. Nihil id quo explicabo rerum et. Molestiae sed molestiae culpa nemo voluptas maxime amet.', 1, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(55, 103, 'Qui fugit totam est nisi qui ad.', 'Qui-fugit-totam-est-nisi-qui-ad.', 'sit', 'Maiores ad atque impedit quaerat illum. Cumque odit modi vel provident quasi voluptas. Rerum rerum nemo recusandae. Itaque qui eos sunt magnam tenetur.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(56, 29, 'Molestias quos facilis et quas voluptatem autem ipsa.', 'Molestias-quos-facilis-et-quas-voluptatem-autem-ipsa.', 'maiores', 'In sed maxime sed. Omnis provident dignissimos illo vitae. Autem voluptatem architecto error est.', 1, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(57, 19, 'Praesentium dolorem sint nam hic eos nihil.', 'Praesentium-dolorem-sint-nam-hic-eos-nihil.', 'sint', 'Quis minima tempora facilis aliquam ipsam nihil qui. Vel quia sunt eum tempora. Reiciendis ab blanditiis assumenda deserunt quia a porro.', 7, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(58, 50, 'In vel quam aperiam animi.', 'In-vel-quam-aperiam-animi.', 'eos', 'Ut natus quos nam voluptatem. Culpa cupiditate harum ad voluptatem sed excepturi. Aliquid officia eum id aut nemo.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(59, 53, 'Dolorem eius laboriosam dicta adipisci.', 'Dolorem-eius-laboriosam-dicta-adipisci.', 'repudiandae', 'Nihil maiores nesciunt voluptatum officiis architecto. Nisi et ut non suscipit sint.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(60, 86, 'Corporis omnis voluptatem nobis natus.', 'Corporis-omnis-voluptatem-nobis-natus.', 'voluptas', 'Ipsum doloremque omnis mollitia eaque commodi. Quos ut non ut asperiores voluptas cupiditate. Beatae saepe perferendis nobis non quaerat modi voluptatem.', 8, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(61, 18, 'Ullam id rerum eaque.', 'Ullam-id-rerum-eaque.', 'similique', 'Unde accusantium magni ratione sed. Dolor doloremque vitae odio tenetur et. Laudantium suscipit dolore consequatur voluptatem excepturi officia laboriosam.', 9, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(62, 109, 'Aut tempora atque iste hic fuga et deleniti.', 'Aut-tempora-atque-iste-hic-fuga-et-deleniti.', 'et', 'Aut corporis exercitationem enim reprehenderit. Rerum non voluptatem temporibus maxime ipsum commodi voluptatem. Omnis quia soluta unde modi quasi. Magni voluptatum aspernatur enim hic nobis. Optio laudantium enim cumque delectus dicta sed tenetur incidunt.', 10, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(63, 17, 'Praesentium eum quia et reiciendis adipisci.', 'Praesentium-eum-quia-et-reiciendis-adipisci.', 'quo', 'Sit aspernatur impedit labore ea. Consectetur sed reiciendis ipsa. Et sint nostrum exercitationem illo.', 5, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(64, 45, 'Exercitationem quidem eius assumenda labore eligendi minima.', 'Exercitationem-quidem-eius-assumenda-labore-eligendi-minima.', 'consectetur', 'Placeat quo voluptas harum qui. Quia facilis eum itaque est et et eum. Et et veniam sint quidem sequi quidem in.', 3, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(65, 8, 'Autem est qui ea nisi dolorem eos iusto.', 'Autem-est-qui-ea-nisi-dolorem-eos-iusto.', 'earum', 'Nam corporis ut fugit sequi ut dolore iure ab. Corrupti veniam reprehenderit necessitatibus omnis doloribus animi sed. Temporibus ducimus distinctio consequatur exercitationem voluptatibus quae quisquam. Enim quo non quos exercitationem.', 5, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(66, 109, 'Fugiat consequatur numquam est necessitatibus nobis quia.', 'Fugiat-consequatur-numquam-est-necessitatibus-nobis-quia.', 'quia', 'Consequatur eaque omnis porro hic qui velit. Temporibus quasi in et aut delectus minima. Possimus rerum soluta sapiente nesciunt. Harum aut alias ducimus voluptatibus corrupti debitis.', 3, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(67, 28, 'Aperiam unde voluptas nihil qui nisi ullam.', 'Aperiam-unde-voluptas-nihil-qui-nisi-ullam.', 'asperiores', 'Exercitationem molestiae aut et nobis magnam natus. Tempora quis at et aut culpa nulla. Voluptatum qui rerum dolorum et modi ducimus. Animi magni eum ad ratione modi.', 3, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(68, 24, 'Saepe dicta sequi inventore.', 'Saepe-dicta-sequi-inventore.', 'in', 'Eveniet quam ut sunt molestiae eos. Eum magnam veniam unde ex.', 4, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(69, 64, 'Distinctio neque quas ut.', 'Distinctio-neque-quas-ut.', 'blanditiis', 'A illum quam qui quidem. Eos consequatur quo voluptas et facere eos dolor. Soluta qui omnis beatae vel repellendus officia ea. Beatae blanditiis ut iure et ratione nihil soluta voluptates.', 2, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(70, 96, 'Dolore quae repellat consequatur.', 'Dolore-quae-repellat-consequatur.', 'quaerat', 'Sint non quo necessitatibus et pariatur aut. Quasi cum perferendis magni dignissimos. Dolor ut quis consectetur explicabo aut nihil eligendi.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(71, 104, 'Quo quaerat natus odio repudiandae repellat velit voluptatum.', 'Quo-quaerat-natus-odio-repudiandae-repellat-velit-voluptatum.', 'sit', 'Voluptas natus illum id totam deserunt nulla libero. Aspernatur eius porro id a similique et maxime. Suscipit aut et et dolor aliquam maiores voluptas numquam. Odit exercitationem necessitatibus dolorem sint deserunt impedit non.', 10, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(72, 52, 'Et commodi nisi sint vitae unde quod provident tenetur.', 'Et-commodi-nisi-sint-vitae-unde-quod-provident-tenetur.', 'facilis', 'Non iure vel error et nemo aut facere. Distinctio veniam et aut alias et aut. Maiores delectus excepturi nostrum necessitatibus placeat. Delectus beatae id asperiores distinctio corrupti. Vel libero rerum ab.', 5, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(73, 98, 'Cumque numquam nobis impedit eum dolor nihil.', 'Cumque-numquam-nobis-impedit-eum-dolor-nihil.', 'magni', 'Unde autem deserunt et voluptas dolore. Veritatis nulla porro nemo. Accusantium facere atque laudantium consequatur aspernatur sint voluptatum deserunt.', 9, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(74, 90, 'Dolorem vel ipsa aliquam est.', 'Dolorem-vel-ipsa-aliquam-est.', 'sed', 'Nesciunt deleniti quae laboriosam et. Sed nesciunt pariatur et ut aut aut. Ipsam natus et rerum libero qui consectetur quia.', 4, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(75, 93, 'Est et molestias quia et modi labore voluptatem.', 'Est-et-molestias-quia-et-modi-labore-voluptatem.', 'dolores', 'Iste voluptas nemo dolorem sed. Omnis doloribus animi aspernatur et dignissimos laudantium et excepturi.', 2, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(76, 103, 'Iusto numquam est dicta ratione repudiandae molestiae natus.', 'Iusto-numquam-est-dicta-ratione-repudiandae-molestiae-natus.', 'molestiae', 'Unde minima iste est veritatis necessitatibus nesciunt. Itaque vel laboriosam aut enim laborum magnam assumenda. Unde amet fugit est modi fugit ut earum.', 2, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(77, 71, 'Qui iure ratione sint consequatur saepe.', 'Qui-iure-ratione-sint-consequatur-saepe.', 'dolores', 'Cum voluptate voluptate quibusdam non quo non nulla ut. Ex doloribus omnis minima nihil exercitationem nulla. Repudiandae praesentium voluptates dolores ut ullam aperiam. Est eum cumque modi et non praesentium et.', 2, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(78, 80, 'Quia sunt placeat illum asperiores cupiditate possimus sit.', 'Quia-sunt-placeat-illum-asperiores-cupiditate-possimus-sit.', 'qui', 'Natus deleniti exercitationem fugiat vitae. Voluptatibus corporis similique quia iure dolorum consectetur. Voluptatum libero provident veritatis impedit laborum adipisci id. Occaecati qui neque vitae omnis autem.', 3, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(79, 87, 'Officiis qui recusandae quis distinctio ut ea.', 'Officiis-qui-recusandae-quis-distinctio-ut-ea.', 'aut', 'Consectetur expedita dignissimos deserunt quasi. Facilis eum sed quod praesentium praesentium dolorem. Eos odit odit qui temporibus. In ut dolorem ipsa nulla doloremque ea.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(80, 24, 'Eaque eligendi quod velit.', 'Eaque-eligendi-quod-velit.', 'amet', 'Alias non deserunt sunt. Autem est qui recusandae nesciunt. Omnis atque omnis quae. Id libero reprehenderit quaerat ipsam expedita.', 10, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(81, 106, 'Dicta et architecto voluptatem facere culpa quas quo.', 'Dicta-et-architecto-voluptatem-facere-culpa-quas-quo.', 'non', 'Autem iste voluptate explicabo. Sit doloribus voluptatem illum atque repellendus.', 10, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(82, 38, 'Laudantium non eum dolorum.', 'Laudantium-non-eum-dolorum.', 'id', 'Sunt necessitatibus et id. Voluptatem quasi aspernatur exercitationem quibusdam cumque aut delectus. Et eius et quisquam veritatis quis ipsam eligendi cum. Non nam temporibus voluptatem sint.', 1, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(83, 56, 'Eaque dolor numquam magni similique soluta.', 'Eaque-dolor-numquam-magni-similique-soluta.', 'nisi', 'Ullam assumenda molestiae sit autem amet dolorem. Sint mollitia a totam doloremque eos debitis. Dolorum enim velit quidem maxime illum voluptatem.', 1, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(84, 69, 'Exercitationem error consectetur non eaque rerum vel.', 'Exercitationem-error-consectetur-non-eaque-rerum-vel.', 'repudiandae', 'Ducimus architecto facilis eaque. Dolor adipisci nam rerum at optio commodi. Pariatur deserunt aut eos sed voluptas necessitatibus laudantium. Quam dignissimos ab cum odit ipsam qui.', 10, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(85, 19, 'At qui temporibus id fugit dolorum.', 'At-qui-temporibus-id-fugit-dolorum.', 'quisquam', 'Fugit rem aspernatur dolorum. Repellendus voluptate nihil non assumenda omnis ipsam quis. Excepturi temporibus voluptates tenetur porro quo.', 3, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(86, 57, 'Aut totam est explicabo velit.', 'Aut-totam-est-explicabo-velit.', 'officiis', 'Magnam sit expedita deleniti nulla itaque. Non ad necessitatibus dolores est quidem.', 8, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(87, 56, 'Autem voluptatem id doloribus possimus.', 'Autem-voluptatem-id-doloribus-possimus.', 'qui', 'Et est quis ut facere in. Qui rerum praesentium libero est aut. Deleniti hic mollitia qui earum consectetur. Dolor corporis porro praesentium dolore.', 4, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(88, 56, 'Et cumque et incidunt est natus.', 'Et-cumque-et-incidunt-est-natus.', 'inventore', 'Magnam aliquid voluptates accusantium iste dolor fugit. Laborum alias ut et voluptatem labore. Accusamus quasi sed aut amet in nobis. Est ipsam quod est culpa omnis est.', 7, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(89, 20, 'Autem sed dolorum et perspiciatis id impedit.', 'Autem-sed-dolorum-et-perspiciatis-id-impedit.', 'enim', 'Dolor id et occaecati autem et quos eaque. Aut nostrum vitae officiis. Officia est esse illo reprehenderit totam. Molestiae ut nobis voluptas et. Iste vitae aut qui aut velit.', 7, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(90, 81, 'Et ex enim enim ab ex quis ut est.', 'Et-ex-enim-enim-ab-ex-quis-ut-est.', 'error', 'Illo repellat in modi. Fuga rerum quas qui corporis occaecati fuga porro. Nam in qui esse recusandae non nulla.', 4, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(91, 98, 'Asperiores eos alias placeat ut et eveniet.', 'Asperiores-eos-alias-placeat-ut-et-eveniet.', 'velit', 'Quis praesentium et quia possimus tempora similique consequatur. Esse pariatur sit molestiae veritatis laboriosam excepturi.', 10, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(92, 108, 'Nisi delectus vel accusantium id quia aut et.', 'Nisi-delectus-vel-accusantium-id-quia-aut-et.', 'sint', 'Impedit beatae cupiditate voluptas veniam earum cum et cumque. Corrupti voluptatem at vel voluptas assumenda beatae sed. Ipsam consequatur molestiae nesciunt sit esse.', 5, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(93, 20, 'Sequi rerum tempore veritatis eveniet corporis nobis.', 'Sequi-rerum-tempore-veritatis-eveniet-corporis-nobis.', 'nobis', 'Consequatur dignissimos ipsa labore nostrum quia ut. Recusandae nulla velit doloribus sit velit qui in. Nesciunt magni id assumenda corrupti asperiores.', 7, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(94, 79, 'Molestias esse voluptas in officiis dignissimos alias suscipit.', 'Molestias-esse-voluptas-in-officiis-dignissimos-alias-suscipit.', 'tempora', 'Et consequatur id tenetur vel neque aliquam rerum. Autem deleniti itaque libero saepe. Dolorem maiores omnis beatae ut aut dolor. Non ducimus excepturi quos sint reiciendis sint dolore.', 9, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(95, 13, 'Pariatur et temporibus beatae.', 'Pariatur-et-temporibus-beatae.', 'voluptas', 'Placeat ea inventore voluptatem deleniti eveniet adipisci. Praesentium vel dolorum nemo ex voluptatem suscipit maxime. Praesentium libero repellat ut ut blanditiis. Ea optio nam sapiente et eos nobis voluptatem.', 1, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(96, 93, 'Voluptatem et ullam voluptatem sint laudantium consequatur.', 'Voluptatem-et-ullam-voluptatem-sint-laudantium-consequatur.', 'sunt', 'Iure explicabo vel quia placeat vero itaque illo. Magnam voluptas suscipit perferendis asperiores rerum molestiae.', 9, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(97, 59, 'Quaerat enim consequatur est.', 'Quaerat-enim-consequatur-est.', 'occaecati', 'Ut est officia vel aliquid veritatis temporibus sed. Est veniam labore eaque rerum ut possimus occaecati. Rem consequatur voluptatem delectus temporibus.', 10, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(98, 66, 'Aperiam occaecati qui consequuntur necessitatibus asperiores quia sint necessitatibus.', 'Aperiam-occaecati-qui-consequuntur-necessitatibus-asperiores-quia-sint-necessitatibus.', 'molestiae', 'Quibusdam cupiditate aut provident aliquid tempore dolores. Incidunt hic reiciendis sint accusamus.', 5, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(99, 74, 'Et libero repellat modi et dolores rerum.', 'Et-libero-repellat-modi-et-dolores-rerum.', 'optio', 'Inventore blanditiis in placeat. Maxime unde autem error error voluptates voluptates. Iusto tempore necessitatibus voluptatum fuga sed omnis. Officia et voluptas recusandae sapiente.', 9, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(100, 50, 'Vero recusandae tempore et dicta totam consequatur culpa.', 'Vero-recusandae-tempore-et-dicta-totam-consequatur-culpa.', 'suscipit', 'Perspiciatis tempora porro similique eligendi dolores rerum. Et suscipit quaerat rerum non ad et dicta.', 10, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(101, 30, 'Ratione maiores aliquam quos repudiandae eum dolorem saepe vel.', 'Ratione-maiores-aliquam-quos-repudiandae-eum-dolorem-saepe-vel.', 'quidem', 'Quod sequi ut quia sit. Nam recusandae distinctio et provident illum. Laudantium quo dolore enim sint vel quos unde. Excepturi sequi voluptatem adipisci ipsam expedita corrupti et.', 7, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(102, 88, 'Ut unde sapiente molestiae nam.', 'Ut-unde-sapiente-molestiae-nam.', 'facere', 'Sint minus distinctio doloremque ad commodi sit. Aut fugit qui similique adipisci explicabo officiis explicabo. Aperiam odio quo officiis occaecati sit neque. Sapiente enim mollitia facilis.', 4, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(103, 24, 'Reiciendis ratione beatae est omnis voluptatibus vel.', 'Reiciendis-ratione-beatae-est-omnis-voluptatibus-vel.', 'dolore', 'Numquam nam corrupti fugiat et veritatis non ex. Ea eos omnis repellendus ipsa. Qui minima nulla totam similique quo similique.', 5, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(104, 15, 'Blanditiis mollitia et deleniti veniam.', 'Blanditiis-mollitia-et-deleniti-veniam.', 'non', 'Dolores assumenda aliquam deleniti numquam doloribus vel ipsum. Ex ipsam sed autem cum. Voluptate et necessitatibus itaque non. Eveniet laborum odit et quis nobis pariatur voluptatem.', 4, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(105, 18, 'Voluptas odio sed iure voluptas.', 'Voluptas-odio-sed-iure-voluptas.', 'laboriosam', 'Eum aut doloremque odio velit. Excepturi exercitationem minima molestiae est. Non dolores qui et nemo esse et. Pariatur sint accusantium reiciendis nihil omnis.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(106, 21, 'Sapiente debitis magnam soluta.', 'Sapiente-debitis-magnam-soluta.', 'magni', 'Et libero recusandae ipsum iste beatae et. Quisquam dolorem esse dolorem illo aspernatur libero. Deserunt aut ut quis error aliquid.', 5, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(107, 12, 'Velit quis ipsa hic reprehenderit.', 'Velit-quis-ipsa-hic-reprehenderit.', 'praesentium', 'Consequatur et consequuntur aliquam a nulla enim. Quis incidunt assumenda rerum tenetur aliquid. Qui eos consequatur perferendis.', 2, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(108, 67, 'Quibusdam porro est et eius omnis dolores at.', 'Quibusdam-porro-est-et-eius-omnis-dolores-at.', 'quisquam', 'Repellendus eius amet nam. Expedita facere quos omnis et. At delectus autem omnis aut. Quaerat dolore ut ut neque consectetur.', 3, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(109, 75, 'Facilis dolorum dolore beatae rerum consequatur possimus temporibus.', 'Facilis-dolorum-dolore-beatae-rerum-consequatur-possimus-temporibus.', 'enim', 'Possimus quaerat nemo sint facilis quo et. Eveniet atque non nesciunt. Quae voluptatem perspiciatis voluptatem possimus.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(110, 66, 'Rerum aspernatur tenetur labore est.', 'Rerum-aspernatur-tenetur-labore-est.', 'repudiandae', 'Dolorem id expedita aliquam et fuga. Ut vero rem et. Repellendus sed adipisci enim aut dolore ducimus. Nobis aperiam quod non et et.', 1, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(111, 69, 'Rem qui ad veniam nihil dolores officia.', 'Rem-qui-ad-veniam-nihil-dolores-officia.', 'velit', 'Quia ut eveniet neque rerum optio. Repellat explicabo eum dolores minima hic. Dolorem iure explicabo rerum eum ad reprehenderit. Soluta ut dolores omnis aut tempora quo.', 2, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(112, 28, 'Est sed dolorem voluptatem perspiciatis aliquid debitis laudantium.', 'Est-sed-dolorem-voluptatem-perspiciatis-aliquid-debitis-laudantium.', 'laboriosam', 'Aliquam sapiente sit reprehenderit et perferendis. Aspernatur nam et pariatur praesentium sed. Amet vitae voluptatum deserunt id qui.', 9, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(113, 66, 'Qui ad amet dicta dicta.', 'Qui-ad-amet-dicta-dicta.', 'sint', 'Odit ea quo at quo cum laudantium. Nihil ut ea a. Animi mollitia voluptatem nostrum.', 8, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(114, 87, 'Exercitationem reprehenderit eum quo minus deleniti.', 'Exercitationem-reprehenderit-eum-quo-minus-deleniti.', 'enim', 'Alias aut non dolor est et omnis. Facilis maxime voluptatibus quam dolor ea et vitae. Voluptas facere ut consequuntur consequatur enim omnis.', 5, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(115, 105, 'Deleniti voluptate iusto molestiae porro voluptatibus voluptatum ut.', 'Deleniti-voluptate-iusto-molestiae-porro-voluptatibus-voluptatum-ut.', 'numquam', 'Nesciunt consequatur ea quia eveniet sit. Et iure reprehenderit et non odit dolorem expedita accusantium. Ea omnis consectetur velit atque. Delectus autem amet veniam nobis.', 3, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(116, 85, 'Iusto corrupti incidunt expedita quam quis.', 'Iusto-corrupti-incidunt-expedita-quam-quis.', 'occaecati', 'Voluptas placeat ut qui omnis perferendis qui nesciunt ut. Ea consequuntur commodi omnis tempora consectetur magnam. Provident quod sed error nam suscipit. A distinctio autem dolores saepe.', 7, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(117, 2, 'Vitae quidem quia autem quia illum.', 'Vitae-quidem-quia-autem-quia-illum.', 'labore', 'Tenetur beatae quia cum unde. Laudantium ut non consequatur adipisci et exercitationem ut sit. Nihil inventore qui reprehenderit voluptate odio. Voluptatum dolor iste ipsam aut.', 10, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(118, 33, 'Temporibus et ut id reprehenderit ipsam omnis.', 'Temporibus-et-ut-id-reprehenderit-ipsam-omnis.', 'vitae', 'Quas voluptates consectetur officiis in. Veniam eius omnis ex odit sequi sed necessitatibus. Voluptatem quos consequuntur porro et nihil et. Omnis et tempora tenetur laborum nihil.', 8, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(119, 18, 'Earum velit perspiciatis aut consequuntur quis nihil quod.', 'Earum-velit-perspiciatis-aut-consequuntur-quis-nihil-quod.', 'et', 'Quaerat et et aut explicabo consequatur. Temporibus veniam in odio sint recusandae fugiat est quia. In ut ut temporibus qui corrupti aut dolores. Vitae amet nihil aut rerum. Voluptatem error rem rerum cupiditate.', 6, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(120, 20, 'Nesciunt et aliquam animi illum ab.', 'Nesciunt-et-aliquam-animi-illum-ab.', 'qui', 'Eaque praesentium quibusdam velit alias magnam aut tenetur. Deserunt ipsa eligendi dolorum perferendis. Omnis quam impedit facilis maiores a. Natus aliquid omnis dolorem adipisci pariatur id voluptatem.', 9, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(121, 92, 'Optio aut praesentium magnam sed impedit reiciendis dolore.', 'Optio-aut-praesentium-magnam-sed-impedit-reiciendis-dolore.', 'sit', 'Fugit porro laborum enim aliquam qui velit. Nulla autem rerum nesciunt iusto aut maxime sit tempora. Corporis voluptas itaque velit optio voluptate expedita facere.', 8, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(122, 115, 'Quas vitae aliquid doloremque quaerat laboriosam hic.', 'Quas-vitae-aliquid-doloremque-quaerat-laboriosam-hic.', 'optio', 'A ratione aut est assumenda dignissimos. Perferendis et sit inventore est voluptate facilis non tempora. Id placeat neque fugiat quas ipsum ea voluptatum perspiciatis. Ad illo veritatis tenetur reiciendis aut.', 1, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(123, 109, 'Facilis iusto inventore molestiae veritatis modi nesciunt dolorum.', 'Facilis-iusto-inventore-molestiae-veritatis-modi-nesciunt-dolorum.', 'rerum', 'Reprehenderit odit quia magnam. Atque vero voluptatem eos saepe hic. In rem ut vel aperiam quia fugit.', 3, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(124, 93, 'Cumque veniam velit nisi quia velit sit occaecati.', 'Cumque-veniam-velit-nisi-quia-velit-sit-occaecati.', 'cumque', 'Quia molestiae sit ut dolorem sed sed voluptas. Recusandae recusandae eos molestiae. Quidem eum soluta fugit. Reiciendis voluptatum unde in dolorem in.', 10, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(125, 106, 'Ratione id et possimus qui.', 'Ratione-id-et-possimus-qui.', 'culpa', 'Corrupti ratione dolor debitis unde. Hic ut dolores nemo voluptatem quo dolores voluptas. Ad provident velit minus perspiciatis nesciunt deserunt sapiente. Aut nihil corporis et aliquam atque cum fuga.', 2, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(126, 115, 'Deserunt voluptas ratione atque rerum sint consequatur id.', 'Deserunt-voluptas-ratione-atque-rerum-sint-consequatur-id.', 'rerum', 'Est atque quia labore debitis molestiae beatae quo. Ducimus quisquam est non voluptatibus sapiente porro. Nihil porro libero doloremque ab id dolorem.', 6, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(127, 102, 'Voluptate amet error qui nihil ratione asperiores distinctio maiores.', 'Voluptate-amet-error-qui-nihil-ratione-asperiores-distinctio-maiores.', 'aliquid', 'Non culpa sit consequatur iure. Neque et odio soluta nihil aut incidunt. Facere numquam corrupti reprehenderit possimus eveniet corrupti enim.', 9, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(128, 42, 'Dolor at eligendi error ut quae unde.', 'Dolor-at-eligendi-error-ut-quae-unde.', 'et', 'Aut corrupti aut et debitis iusto harum. Eos eaque id nihil. Id odio error soluta voluptas blanditiis dignissimos.', 2, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(129, 115, 'Eos et qui aspernatur hic et.', 'Eos-et-qui-aspernatur-hic-et.', 'rerum', 'Vel placeat quod nam. Aspernatur id eligendi quisquam veniam odio et similique ullam. Quod et et maxime similique odit. Voluptatem quisquam ex in optio soluta fugit.', 5, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(130, 19, 'Odio sapiente quasi non et ipsa repudiandae.', 'Odio-sapiente-quasi-non-et-ipsa-repudiandae.', 'et', 'Eos minima amet expedita eos porro id. Deleniti veniam non sed placeat vitae tempora. Dolorem ut qui sunt voluptatem molestiae ipsum nam. Et odio odio soluta nobis tempora.', 7, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(131, 93, 'Consequatur ipsa eveniet omnis velit quia exercitationem.', 'Consequatur-ipsa-eveniet-omnis-velit-quia-exercitationem.', 'ut', 'Quia commodi et voluptatibus sit. Perferendis sed quaerat tenetur nemo.', 5, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(132, 82, 'Et beatae similique neque nostrum quos.', 'Et-beatae-similique-neque-nostrum-quos.', 'quo', 'Sit quia error natus est labore. Est quibusdam quia occaecati possimus recusandae. Accusantium est voluptas laboriosam et aperiam ullam. Culpa officia quia inventore amet debitis excepturi fugit. Dolores quis aut magnam soluta quisquam totam voluptas.', 6, 1, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(133, 43, 'Nam aut ad vel eius rerum aut repudiandae.', 'Nam-aut-ad-vel-eius-rerum-aut-repudiandae.', 'quos', 'Quis necessitatibus omnis ut est asperiores. Eveniet dolor repellendus aliquam. Et vero non laborum beatae facere aut. Beatae facere quaerat exercitationem aliquid sed.', 8, 0, '2023-06-06 13:20:53', '2023-06-06 13:20:53', NULL),
(134, 45, 'Qui asperiores soluta dolorem.', 'Qui-asperiores-soluta-dolorem.', 'est', 'Voluptas quisquam quibusdam libero nostrum. Dignissimos id qui ipsa commodi eveniet in. Quo reiciendis magni culpa sit aut.', 3, 0, '2023-06-06 13:20:54', '2023-06-06 13:20:54', NULL),
(135, 45, 'Consequatur qui sapiente hic rerum.', 'Consequatur-qui-sapiente-hic-rerum.', 'temporibus', 'Fuga recusandae impedit asperiores. Et sit quidem eligendi nesciunt. Ab nam architecto rem ipsam voluptatem.', 3, 1, '2023-06-06 13:20:54', '2023-06-06 13:20:54', NULL),
(136, 102, 'Numquam nihil omnis laborum dolorum nam quo dolores.', 'Numquam-nihil-omnis-laborum-dolorum-nam-quo-dolores.', 'corrupti', 'Deleniti doloremque repellendus est ut aut. Aut non soluta qui quod quis. Tenetur voluptates omnis rerum quibusdam rerum voluptatem.', 3, 0, '2023-06-06 13:20:54', '2023-06-06 13:20:54', NULL),
(137, 93, 'Rem molestias molestiae eum perferendis laborum mollitia.', 'Rem-molestias-molestiae-eum-perferendis-laborum-mollitia.', 'unde', 'Est eveniet tempora sit rem mollitia. Et beatae tenetur numquam voluptatem dolor. Consequatur beatae illo quibusdam nobis. Commodi consequatur pariatur numquam ab quia.', 6, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(138, 38, 'Et et vel deleniti sit fuga eius.', 'Et-et-vel-deleniti-sit-fuga-eius.', 'nostrum', 'Voluptatum aut voluptate qui est id. Voluptatum minima occaecati nemo omnis vitae quam velit. Sit ut voluptas est ut et incidunt officiis. Fuga quas quia odio iusto quae quaerat.', 2, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(139, 58, 'Totam fugiat eum quia iste.', 'Totam-fugiat-eum-quia-iste.', 'sapiente', 'Occaecati esse assumenda aperiam. Sunt minima et sint. Nam vero molestias repellat iste fugiat dolor rerum. Debitis vitae nemo voluptatem maiores et quaerat voluptatum maxime.', 7, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(140, 79, 'Recusandae eaque voluptates odit magnam quisquam.', 'Recusandae-eaque-voluptates-odit-magnam-quisquam.', 'sequi', 'Voluptas id aut quia autem. Aut in rerum molestiae. Quia reprehenderit officiis voluptas in. Similique omnis eos magni eos in distinctio autem.', 9, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(141, 112, 'Officiis assumenda inventore aut quia.', 'Officiis-assumenda-inventore-aut-quia.', 'velit', 'Quia recusandae soluta at officiis. Quia ea et dignissimos provident sed nihil. Consectetur officia explicabo asperiores sunt cupiditate reiciendis.', 1, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(142, 56, 'Recusandae laboriosam tenetur error laborum omnis ab.', 'Recusandae-laboriosam-tenetur-error-laborum-omnis-ab.', 'magni', 'In nihil explicabo et aspernatur exercitationem. Quia dolorem modi consequatur aliquid ut nisi et exercitationem. Voluptatem libero temporibus doloribus porro exercitationem.', 7, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(143, 42, 'Soluta voluptas velit et omnis maxime et.', 'Soluta-voluptas-velit-et-omnis-maxime-et.', 'facere', 'Quisquam ipsum quibusdam incidunt possimus. Ratione eius cupiditate molestiae optio architecto voluptate omnis. Dolorum nostrum alias dolores delectus perferendis. Aut sit distinctio rerum soluta esse quia minima. Qui debitis quaerat qui qui neque.', 9, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(144, 57, 'Nulla dolores dignissimos error omnis in fugiat.', 'Nulla-dolores-dignissimos-error-omnis-in-fugiat.', 'eius', 'Necessitatibus quam voluptatem quisquam et. Aut inventore tenetur dolor aut veniam quis. Dolorem in repellendus eveniet laboriosam corrupti distinctio dignissimos.', 10, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(145, 109, 'Nesciunt et tempore officiis eaque repellendus cumque alias.', 'Nesciunt-et-tempore-officiis-eaque-repellendus-cumque-alias.', 'et', 'Et architecto explicabo omnis cumque atque. Labore odio suscipit beatae.', 3, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(146, 80, 'Adipisci a doloremque numquam aut.', 'Adipisci-a-doloremque-numquam-aut.', 'cum', 'Architecto sequi ex nobis est. Aliquid porro unde cum sit vitae quas explicabo. Aut quis rerum maxime dolorem exercitationem molestiae voluptas.', 5, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(147, 13, 'Qui quibusdam quia sed id quae perspiciatis.', 'Qui-quibusdam-quia-sed-id-quae-perspiciatis.', 'et', 'Eum dolorem minus perspiciatis quibusdam sapiente deleniti maxime. Quis enim amet earum error id. Alias est dolores repellendus non amet. Quod consequatur est incidunt deleniti et.', 2, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(148, 77, 'Commodi dolorem est ea corrupti dolore veritatis in.', 'Commodi-dolorem-est-ea-corrupti-dolore-veritatis-in.', 'distinctio', 'Velit quis aut ut omnis. Nam quia sint sequi. Nisi fugiat nam autem et iure.', 1, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(149, 98, 'Rerum dolor id veritatis dolorem enim est vel.', 'Rerum-dolor-id-veritatis-dolorem-enim-est-vel.', 'itaque', 'Beatae quia nemo quibusdam doloremque neque nihil nihil. Nobis et laboriosam fugit distinctio commodi et. Dicta blanditiis quas culpa consequatur enim animi. Laborum assumenda ut amet.', 5, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(150, 45, 'Vero laudantium corporis excepturi non ea repellat.', 'Vero-laudantium-corporis-excepturi-non-ea-repellat.', 'beatae', 'Reiciendis quo non et nisi. Eum sit vitae enim. Nam maxime delectus ut fugit veritatis.', 2, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(151, 96, 'Ea consequatur perspiciatis consequatur omnis quisquam maxime quae.', 'Ea-consequatur-perspiciatis-consequatur-omnis-quisquam-maxime-quae.', 'quod', 'Cum explicabo eaque voluptas dolore deserunt et aperiam et. Ipsa ratione sit aut eligendi quo velit corrupti. Et qui libero aut ut exercitationem corrupti natus. Reprehenderit numquam consectetur dolorem fugit commodi.', 7, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(152, 42, 'Quod et pariatur enim quia et officiis.', 'Quod-et-pariatur-enim-quia-et-officiis.', 'corrupti', 'Laboriosam numquam officia facilis dolor. Quia nulla iusto necessitatibus nobis et. Necessitatibus sit ullam facere atque laboriosam est sit.', 7, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(153, 111, 'Cumque soluta necessitatibus est et ab odit rerum.', 'Cumque-soluta-necessitatibus-est-et-ab-odit-rerum.', 'quis', 'Saepe tempore dolorem corporis suscipit sed iure debitis ut. Nesciunt omnis molestiae atque ex et quisquam ab. Ex sed doloribus aut quibusdam rerum quidem eum.', 9, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(154, 41, 'Quis sunt nisi laborum debitis dolor.', 'Quis-sunt-nisi-laborum-debitis-dolor.', 'maiores', 'Vitae explicabo error tempora repudiandae consectetur unde. Et quia ut velit magni. Et aut molestiae ut recusandae quo tenetur id.', 3, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(155, 76, 'Maiores possimus tenetur doloribus vel sit.', 'Maiores-possimus-tenetur-doloribus-vel-sit.', 'et', 'Corporis reprehenderit inventore earum eos qui facere. Aut eum molestiae tenetur laborum ut architecto. Rerum velit veritatis qui ut dolores quos voluptates.', 8, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(156, 97, 'Ducimus et quibusdam excepturi delectus.', 'Ducimus-et-quibusdam-excepturi-delectus.', 'non', 'Eum ut eos et quia similique. Accusamus soluta qui eum consequuntur numquam perspiciatis modi quia. Voluptatibus nam dolorem et dolores autem quis.', 9, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(157, 55, 'Quam ipsa aut atque debitis.', 'Quam-ipsa-aut-atque-debitis.', 'dolor', 'Itaque ad laboriosam dicta corporis. Ut eligendi aut nemo laborum repellendus et dolorum error. Dolor reprehenderit odio nihil quos est nostrum.', 5, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(158, 2, 'Ea dolore praesentium ab beatae consectetur.', 'Ea-dolore-praesentium-ab-beatae-consectetur.', 'molestiae', 'Non voluptate vero ut aut nihil sed ducimus est. Perspiciatis cum corporis sunt voluptas temporibus sint. Voluptatem exercitationem excepturi ut et. Iusto sed reprehenderit deserunt impedit qui est iusto.', 3, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(159, 64, 'Ex tenetur nisi dicta qui cum aut.', 'Ex-tenetur-nisi-dicta-qui-cum-aut.', 'ut', 'Est sit hic quo officiis aut nam eos. Aliquid dolore officia minus rerum. Autem omnis officia quia.', 6, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(160, 45, 'Eos voluptatum perspiciatis corporis.', 'Eos-voluptatum-perspiciatis-corporis.', 'voluptatem', 'Esse dolorum amet earum qui. Voluptas rerum hic sequi rerum fugiat. Commodi eum cumque omnis esse. Ad laudantium perferendis placeat.', 8, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(161, 34, 'Excepturi dolor enim possimus hic possimus asperiores.', 'Excepturi-dolor-enim-possimus-hic-possimus-asperiores.', 'facere', 'Vel pariatur odit nulla et vitae. Doloribus eius incidunt quis exercitationem omnis cupiditate.', 3, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(162, 17, 'Voluptate adipisci soluta voluptatem et est a et.', 'Voluptate-adipisci-soluta-voluptatem-et-est-a-et.', 'molestiae', 'Amet omnis dolorem vitae tempore aperiam. Aspernatur occaecati quos minus qui temporibus.', 8, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(163, 93, 'Provident quo nihil dolorem.', 'Provident-quo-nihil-dolorem.', 'ad', 'Et eos ea sit ipsa libero ut aspernatur et. Nostrum fuga ut qui laudantium quos non reprehenderit. Rerum culpa vero eos cumque neque alias.', 8, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(164, 105, 'Voluptates aspernatur sit blanditiis.', 'Voluptates-aspernatur-sit-blanditiis.', 'ad', 'Non perspiciatis fugiat incidunt. Quia nesciunt omnis eum. Illo consequatur dolorum fugiat sed aut. Enim adipisci a quia quia quia fuga.', 9, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(165, 31, 'Est qui id alias ipsum omnis id.', 'Est-qui-id-alias-ipsum-omnis-id.', 'nam', 'Sapiente ea quam eaque nisi quam. Non omnis sed quia quia necessitatibus aliquam perspiciatis ullam.', 6, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(166, 8, 'Sunt dignissimos ipsa aut cum non.', 'Sunt-dignissimos-ipsa-aut-cum-non.', 'cupiditate', 'Est omnis qui consequatur ut. Ut non et ipsum consequatur deserunt omnis. Non et dolor inventore. Aut iste error saepe. Minus et aspernatur officia amet.', 10, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(167, 103, 'Placeat quos ut sequi.', 'Placeat-quos-ut-sequi.', 'commodi', 'Et fugiat consequatur est doloremque quos occaecati et. Veritatis exercitationem maxime architecto temporibus odio qui laborum quasi. Accusamus rem dolor vel architecto dolor.', 6, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(168, 111, 'Suscipit harum consequatur earum dolores.', 'Suscipit-harum-consequatur-earum-dolores.', 'perspiciatis', 'Quos et magni autem quaerat. Exercitationem aut quas in aspernatur doloribus aut alias. Eaque possimus voluptas quos fugiat aut vel maiores nihil. Ut non quae dolorem qui aliquid.', 2, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(169, 19, 'Ex et consequatur ducimus magni rem beatae.', 'Ex-et-consequatur-ducimus-magni-rem-beatae.', 'sapiente', 'Aut voluptatem qui velit deserunt quisquam esse tempore vel. Autem at minus eaque modi et rerum quo quas. Est perspiciatis repellat ex maxime voluptatem magnam.', 2, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(170, 42, 'Delectus sed libero tempore magni.', 'Delectus-sed-libero-tempore-magni.', 'ipsam', 'Laudantium rerum asperiores facilis. Doloremque cumque temporibus voluptatem vitae totam voluptatem nobis. Est quis eaque inventore quia. Aliquid cupiditate ut tempora omnis veniam voluptatem eos.', 4, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(171, 39, 'Occaecati qui magni quam amet in et.', 'Occaecati-qui-magni-quam-amet-in-et.', 'architecto', 'Nihil unde enim in est tenetur est. Veniam soluta et id accusamus error tenetur unde. Eos laboriosam sapiente unde dolores sit ducimus consequatur.', 4, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(172, 35, 'Odit aperiam eos omnis officiis vel sed natus.', 'Odit-aperiam-eos-omnis-officiis-vel-sed-natus.', 'aspernatur', 'Eos eligendi eum aliquid ut ex et. Architecto officiis dolores quae quia eaque nesciunt. Ut sapiente qui omnis.', 10, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(173, 39, 'Asperiores incidunt quia esse.', 'Asperiores-incidunt-quia-esse.', 'dignissimos', 'Sit consequatur sint quasi modi quidem officia. Earum quasi nobis recusandae occaecati in. Quis vitae labore et fugit unde. Perferendis deleniti pariatur dolor totam excepturi ullam.', 3, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(174, 76, 'Beatae ut dolores ad harum.', 'Beatae-ut-dolores-ad-harum.', 'modi', 'Atque at pariatur qui alias asperiores voluptatem similique. Dolor natus natus quia saepe. Fugit ut aliquam aut sed id dicta a.', 1, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(175, 36, 'Et nobis perferendis rerum laboriosam veritatis nihil laboriosam.', 'Et-nobis-perferendis-rerum-laboriosam-veritatis-nihil-laboriosam.', 'officia', 'Voluptas nisi repellendus numquam officia odio distinctio sint. Debitis fugit quo porro omnis dignissimos dignissimos. Provident quia consequuntur ut doloremque. Omnis placeat sed temporibus repellat deleniti id.', 6, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(176, 45, 'A quam non quas porro ut enim.', 'A-quam-non-quas-porro-ut-enim.', 'esse', 'Cum molestias minus aut nulla quisquam at. Esse officia dolorum nesciunt consequatur sed non. Aut amet sequi dicta nobis autem quis possimus. Quas aspernatur eius esse sequi corrupti nobis ut.', 6, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(177, 95, 'Officiis omnis aliquam neque id ea.', 'Officiis-omnis-aliquam-neque-id-ea.', 'esse', 'Id ducimus laborum soluta odit. Corporis eos dolorem et. Quia praesentium et asperiores esse quis tempora ad.', 4, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(178, 8, 'Est doloribus eaque nam dignissimos molestiae.', 'Est-doloribus-eaque-nam-dignissimos-molestiae.', 'velit', 'Illum laborum delectus eligendi animi voluptas illo repudiandae ratione. Voluptatem in nihil eum nam. Autem voluptates enim porro ipsam hic odit.', 9, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(179, 89, 'Reiciendis ducimus repellendus occaecati blanditiis minima id excepturi ut.', 'Reiciendis-ducimus-repellendus-occaecati-blanditiis-minima-id-excepturi-ut.', 'qui', 'Et ducimus aut voluptas. Minus et non velit ut itaque dolores et. Et eligendi officia rerum quia fuga. Eaque ut voluptatem est dolore laborum tempore itaque exercitationem.', 3, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(180, 54, 'Veniam expedita ipsam quaerat corrupti placeat.', 'Veniam-expedita-ipsam-quaerat-corrupti-placeat.', 'autem', 'Ratione est amet ut tempora occaecati vel qui. Sed possimus odit sit. Dolor sunt ipsa sunt recusandae voluptate.', 7, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(181, 2, 'Eos velit eligendi et sunt similique.', 'Eos-velit-eligendi-et-sunt-similique.', 'molestiae', 'Et libero rem qui non qui repellat. Aliquam vero qui vel eius. Molestiae laboriosam nulla et dolor magnam et sit. Facilis mollitia magni deserunt nemo non qui sint voluptatibus.', 5, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(182, 92, 'Ipsum officiis a voluptas esse iste aut.', 'Ipsum-officiis-a-voluptas-esse-iste-aut.', 'dolorem', 'At qui possimus id eum id cupiditate quia. Expedita commodi ipsa laudantium voluptate rerum. Excepturi id non vel et perferendis. Et beatae voluptatem a magnam temporibus veritatis asperiores.', 4, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(183, 21, 'Atque in ea neque quo.', 'Atque-in-ea-neque-quo.', 'incidunt', 'Consectetur velit commodi nisi. Aut laborum sed tempora dignissimos neque quibusdam consequatur. Autem rem qui est quam. Ut reiciendis aliquam perspiciatis quo.', 8, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL);
INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `description`, `min_to_read`, `is_published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(184, 54, 'Pariatur ad sunt quo enim reiciendis.', 'Pariatur-ad-sunt-quo-enim-reiciendis.', 'illum', 'Hic deleniti quia omnis consequatur. Numquam quia quis quae iste qui similique. Molestiae voluptatem et autem eaque voluptatem eum rem. Dicta quam earum ipsam repellendus odit consequatur. Sequi voluptas quis nisi qui.', 3, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(185, 94, 'Eos voluptatum dolor iusto rerum enim.', 'Eos-voluptatum-dolor-iusto-rerum-enim.', 'nemo', 'Sunt id dolores optio deleniti quia quas qui. Blanditiis ea reprehenderit nam deleniti earum consequatur voluptatum. Praesentium rem velit vitae laboriosam. Quis mollitia et officiis aut delectus pariatur. Mollitia deleniti voluptatem est consequuntur facilis autem vel.', 2, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(186, 71, 'Aliquid magnam iusto ipsum id rerum.', 'Aliquid-magnam-iusto-ipsum-id-rerum.', 'perspiciatis', 'Excepturi minima iste quae fugit. Exercitationem possimus est a ad perspiciatis. Totam temporibus iure fugiat aspernatur facere natus ratione. Animi magnam aut quasi.', 5, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(187, 99, 'Illum cum dignissimos fugit ea nobis dolorum vel.', 'Illum-cum-dignissimos-fugit-ea-nobis-dolorum-vel.', 'velit', 'Provident odio fuga ut repellendus aut enim. Harum animi aut modi enim dolorem. Nisi sed aspernatur sed labore illo natus autem.', 9, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(188, 89, 'Id velit dolor ut iusto nobis alias provident qui.', 'Id-velit-dolor-ut-iusto-nobis-alias-provident-qui.', 'ut', 'Quia esse vel illo molestiae possimus. Fugiat qui nobis quo dolor rerum minus vel. Ipsam nulla provident laudantium porro et. Voluptas aut atque quia sint sequi alias.', 1, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(189, 49, 'Quo ab possimus maxime qui.', 'Quo-ab-possimus-maxime-qui.', 'non', 'Reiciendis atque tempore modi aut accusamus porro qui. Cum officia optio rerum eligendi nam ipsum totam. Vel illum amet debitis et quasi. Qui corrupti et quo voluptatem consequatur recusandae molestiae.', 10, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(190, 56, 'Atque consequatur commodi sequi voluptatem illum.', 'Atque-consequatur-commodi-sequi-voluptatem-illum.', 'atque', 'Voluptas et et eaque et. Et voluptates aspernatur at omnis qui. Quae ipsa et mollitia. Aperiam et deleniti voluptas.', 3, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(191, 31, 'Et est laborum deleniti deserunt corrupti exercitationem.', 'Et-est-laborum-deleniti-deserunt-corrupti-exercitationem.', 'dolores', 'Deserunt porro nulla tempore. Ab maxime aut veniam. Non blanditiis consequuntur quia non.', 4, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(192, 66, 'Dicta id aperiam autem.', 'Dicta-id-aperiam-autem.', 'quo', 'Sit est voluptatum molestias aut aut rerum. Neque sit modi laborum sunt. Aut provident illo exercitationem nihil culpa. Iure sint libero consequatur in et facere ex sed.', 3, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(193, 8, 'Ut esse dignissimos illum qui distinctio neque.', 'Ut-esse-dignissimos-illum-qui-distinctio-neque.', 'mollitia', 'Nihil enim aut quas et consequuntur quia non. Saepe quisquam ea aliquid quia itaque deserunt sunt beatae. Quia necessitatibus repellendus omnis possimus.', 3, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(194, 1, 'Tenetur vel accusamus commodi sit dolore quidem.', 'Tenetur-vel-accusamus-commodi-sit-dolore-quidem.', 'porro', 'Ea odit dolores accusamus enim aperiam. Et et ea totam fugit porro.', 8, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(195, 46, 'Nesciunt nihil cum quia delectus dolorum repudiandae minima.', 'Nesciunt-nihil-cum-quia-delectus-dolorum-repudiandae-minima.', 'esse', 'Consequatur quam et accusantium magnam explicabo eum. Dolore fugit perferendis voluptatem nobis expedita ipsum quisquam iure. Ab illo recusandae eum sunt suscipit.', 9, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(196, 51, 'Unde voluptates harum aut autem pariatur repellat.', 'Unde-voluptates-harum-aut-autem-pariatur-repellat.', 'debitis', 'Id aperiam temporibus corrupti sit iure alias. Dignissimos consequatur nulla odio. Vel est accusantium accusantium omnis quibusdam omnis.', 2, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(197, 12, 'Qui magnam ullam omnis ipsum odit non in.', 'Qui-magnam-ullam-omnis-ipsum-odit-non-in.', 'nostrum', 'Eos minus rerum dicta voluptatem aut itaque corrupti. Maxime quasi vel unde dignissimos velit est officia. Ea vel unde repellat itaque quaerat officiis totam corporis. Soluta rerum quibusdam maxime qui quis.', 5, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(198, 64, 'Fugiat harum distinctio aliquam eaque aut deleniti iste.', 'Fugiat-harum-distinctio-aliquam-eaque-aut-deleniti-iste.', 'suscipit', 'Animi ab voluptas cumque vel incidunt vel. Quam ullam non qui magnam nobis. Adipisci dolorem magnam et fuga. Eveniet quia consequatur iure ad ut.', 1, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(199, 27, 'Deserunt nulla expedita sint laudantium.', 'Deserunt-nulla-expedita-sint-laudantium.', 'voluptatem', 'Minus rerum facilis sequi. Esse dolor sunt perspiciatis quam mollitia autem.', 6, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(200, 37, 'Et temporibus tempore unde illo.', 'Et-temporibus-tempore-unde-illo.', 'repellendus', 'Necessitatibus maiores corporis et eligendi adipisci et. Error quia magni dolores excepturi minus.', 2, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(201, 54, 'Ut possimus sapiente iure deserunt.', 'Ut-possimus-sapiente-iure-deserunt.', 'quas', 'Sit ea suscipit tenetur a. Commodi dolor dolor vel architecto accusantium minus nisi harum. Quibusdam provident libero odit dolorem nihil dignissimos ducimus quasi. Fuga molestias ipsa nihil sint voluptatem. Atque dolore ratione perferendis eligendi totam.', 7, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(202, 22, 'Voluptas aliquid quod ducimus.', 'Voluptas-aliquid-quod-ducimus.', 'id', 'Quam quia dolor voluptas deserunt et hic. At aliquam id odio cumque consequuntur.', 1, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(203, 73, 'Saepe suscipit placeat doloribus amet recusandae.', 'Saepe-suscipit-placeat-doloribus-amet-recusandae.', 'dolore', 'Perspiciatis velit itaque natus laudantium voluptates in. Placeat accusantium reiciendis quam est nobis ut. Id voluptatum autem dolor voluptas repellendus qui molestiae cupiditate. Maiores iusto cumque pariatur accusantium nostrum accusamus inventore.', 10, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(204, 52, 'Voluptas et iure et laboriosam totam temporibus.', 'Voluptas-et-iure-et-laboriosam-totam-temporibus.', 'tempora', 'Tenetur nobis quia vel aut impedit expedita. Ullam consequatur fuga quisquam aspernatur voluptatum sit voluptate.', 7, 1, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(205, 108, 'Dolor qui illo debitis.', 'Dolor-qui-illo-debitis.', 'aut', 'Est recusandae facilis quasi incidunt omnis delectus. Vel laudantium neque ullam neque qui ea. Nobis iure nesciunt doloremque laudantium voluptatibus blanditiis. Et veniam aut officia sit quia est quo earum.', 2, 0, '2023-06-06 13:22:11', '2023-06-06 13:22:11', NULL),
(206, 29, 'A voluptatibus eaque blanditiis sed quis possimus asperiores consequatur.', 'A-voluptatibus-eaque-blanditiis-sed-quis-possimus-asperiores-consequatur.', 'voluptatem', 'Autem odit suscipit est deserunt dicta earum et soluta. Dolore quidem enim eius et iure. Voluptas ut minus incidunt corrupti ullam accusantium. Aliquid ducimus est sed accusamus quis repellendus.', 7, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(207, 36, 'Pariatur repellendus cupiditate ipsa fuga occaecati hic rem quia.', 'Pariatur-repellendus-cupiditate-ipsa-fuga-occaecati-hic-rem-quia.', 'impedit', 'Tempore mollitia ullam dolor alias odio. Et unde temporibus commodi deserunt sunt delectus. Expedita eveniet sunt fuga corrupti perspiciatis eos.', 5, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(208, 97, 'Impedit et a in saepe rerum.', 'Impedit-et-a-in-saepe-rerum.', 'ut', 'Ratione dicta ab natus. Distinctio voluptas et perferendis ut saepe eum ratione ipsam. Blanditiis qui voluptates quae blanditiis ipsum a.', 9, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(209, 25, 'Blanditiis illum et impedit et quae est ullam.', 'Blanditiis-illum-et-impedit-et-quae-est-ullam.', 'totam', 'Sint est ipsa ut voluptates dignissimos. Ut in velit id porro assumenda. Nemo qui numquam quasi aut. Ducimus nisi quod cum molestiae modi ut sed.', 2, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(210, 104, 'Eligendi eum error excepturi labore veritatis quia perspiciatis itaque.', 'Eligendi-eum-error-excepturi-labore-veritatis-quia-perspiciatis-itaque.', 'id', 'Animi adipisci praesentium sit eum odio esse dignissimos. Qui debitis ut et accusamus itaque. Nisi atque non qui inventore.', 4, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(211, 64, 'Voluptas et soluta asperiores dolorem rem.', 'Voluptas-et-soluta-asperiores-dolorem-rem.', 'minus', 'Perferendis labore amet quas alias repellat impedit. Nemo consequatur adipisci autem asperiores accusantium similique in. Aut qui quod sit dolorem facere. Qui facere aut aut alias.', 2, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(212, 36, 'Assumenda quia reiciendis repellendus expedita.', 'Assumenda-quia-reiciendis-repellendus-expedita.', 'quae', 'Sed architecto quo sunt aut voluptatem cumque odit. Omnis quod aut cupiditate repellendus. A dolorem voluptatem ad qui distinctio ad. Vel molestiae occaecati est maiores.', 5, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(213, 97, 'Animi temporibus hic omnis laudantium vel minus sed culpa.', 'Animi-temporibus-hic-omnis-laudantium-vel-minus-sed-culpa.', 'nostrum', 'Expedita sint dicta aliquid modi. Et sint labore dicta et quia amet hic. Inventore in dignissimos omnis vel et consequatur et incidunt. Delectus modi et labore placeat.', 5, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(214, 101, 'Velit quod nihil voluptas necessitatibus quam voluptatum dolorem.', 'Velit-quod-nihil-voluptas-necessitatibus-quam-voluptatum-dolorem.', 'pariatur', 'Eaque occaecati at blanditiis. Aliquid ut reprehenderit delectus. Ipsam eveniet tempore est quas necessitatibus. Quae provident omnis modi quidem.', 5, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(215, 75, 'Et accusamus consectetur et maxime in sint hic.', 'Et-accusamus-consectetur-et-maxime-in-sint-hic.', 'tenetur', 'Impedit suscipit eligendi ut perspiciatis maxime corporis consequatur nobis. Neque magnam molestiae aut non quam ut consectetur. Alias harum numquam voluptas molestiae est et non quis.', 2, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(216, 29, 'Maiores sint aut voluptate non sapiente ut a.', 'Maiores-sint-aut-voluptate-non-sapiente-ut-a.', 'consequuntur', 'Quia et dolores tenetur animi. Consectetur sit vitae quibusdam nobis amet totam. Sint dolores voluptates consectetur labore quia qui.', 6, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(217, 100, 'Rerum et illo incidunt fugiat nihil.', 'Rerum-et-illo-incidunt-fugiat-nihil.', 'veritatis', 'Nemo ex blanditiis occaecati suscipit. Et ea unde quaerat aut aut perferendis. Esse nemo quia voluptatem nulla nobis laborum.', 5, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(218, 50, 'Alias et cupiditate et voluptatem.', 'Alias-et-cupiditate-et-voluptatem.', 'harum', 'Fugiat molestiae quis quia quia labore. Eum aut recusandae cupiditate et quia et ut. Deserunt cum fuga voluptatem eaque occaecati delectus. Nesciunt qui quo laboriosam.', 9, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(219, 39, 'Iusto inventore eum et.', 'Iusto-inventore-eum-et.', 'nulla', 'Occaecati ea qui veritatis explicabo quidem. Veniam possimus eum sed ex ab. Perspiciatis eum voluptatem cum molestiae commodi et. Optio quia libero dolorem nesciunt quasi. Ut nam aut omnis esse aliquid modi.', 7, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(220, 12, 'Recusandae ipsa alias dolorum iusto iste consequatur odit.', 'Recusandae-ipsa-alias-dolorum-iusto-iste-consequatur-odit.', 'dolorem', 'Aspernatur ut rerum tempora qui. Soluta enim laboriosam sed explicabo nostrum inventore qui. Mollitia quam omnis velit minima. Atque reiciendis architecto ut.', 8, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(221, 56, 'Omnis eos dicta maiores dolore repellat.', 'Omnis-eos-dicta-maiores-dolore-repellat.', 'nesciunt', 'Hic autem ea praesentium enim laborum animi. Pariatur pariatur placeat debitis et architecto non cumque nobis. Occaecati possimus molestiae repellendus et officiis similique. Quibusdam voluptatem ipsam aspernatur laboriosam non iusto.', 1, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(222, 83, 'Est officia sint iste non.', 'Est-officia-sint-iste-non.', 'minus', 'Voluptas vitae dolores qui dolorum aut. Ab voluptatem molestiae similique laudantium. Et rem consequatur ut voluptatem cupiditate maxime sed. Rerum voluptas reprehenderit neque blanditiis.', 6, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(223, 73, 'Provident quia non adipisci et voluptas quis laboriosam.', 'Provident-quia-non-adipisci-et-voluptas-quis-laboriosam.', 'quia', 'Velit alias tenetur ea omnis laboriosam ut consequatur vitae. Est numquam odit eum. Modi impedit architecto est veritatis. Minima aut est nulla.', 6, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(224, 70, 'Unde et enim occaecati reiciendis consectetur laborum cupiditate.', 'Unde-et-enim-occaecati-reiciendis-consectetur-laborum-cupiditate.', 'et', 'Quod laudantium nesciunt assumenda temporibus ab rerum deleniti. Qui quis omnis magnam. At eos earum ut. Itaque est est ut est iste debitis neque.', 7, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(225, 23, 'Dolor corporis aliquid neque quam ea.', 'Dolor-corporis-aliquid-neque-quam-ea.', 'voluptatem', 'Culpa ipsam ut est sint. Dolores deleniti reiciendis ut impedit ut veritatis ratione illo. Suscipit delectus illo sunt debitis optio dolores. Error est quaerat voluptatibus debitis ad aut.', 6, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(226, 61, 'Quam eveniet necessitatibus nemo ullam amet laboriosam sed.', 'Quam-eveniet-necessitatibus-nemo-ullam-amet-laboriosam-sed.', 'et', 'Ab deleniti et odio esse non tempore. Odit quo ad nemo quisquam impedit facere aperiam sit. Quae veniam autem eum et provident veniam repellendus. Error quia beatae quia omnis eum quam.', 5, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(227, 19, 'Eum vel odio et ad omnis.', 'Eum-vel-odio-et-ad-omnis.', 'nostrum', 'Ut eum et consequatur ut deserunt. Quas delectus enim ratione qui et quos ullam. Vel quis est qui quasi optio. Repellat est et voluptate sint rerum.', 1, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(228, 114, 'Magnam rem molestiae sed nihil.', 'Magnam-rem-molestiae-sed-nihil.', 'aperiam', 'Corrupti dolor at voluptatem voluptas nobis suscipit. Et commodi non ut voluptatibus. Non ratione dolores quia velit numquam. Maiores sunt dolores et quo sunt eos ut. Consequatur hic atque aut.', 6, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(229, 68, 'Hic eum quia id officiis quo enim repudiandae.', 'Hic-eum-quia-id-officiis-quo-enim-repudiandae.', 'dolorum', 'Officia quos odit ut provident suscipit repellat ab. Sunt eveniet qui neque animi quam est. Harum natus in nostrum voluptas aut molestias. Aut enim deserunt facere non nulla sint.', 7, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(230, 89, 'Maxime est voluptatem qui corporis officiis dignissimos.', 'Maxime-est-voluptatem-qui-corporis-officiis-dignissimos.', 'est', 'Laboriosam assumenda velit ut praesentium. Perspiciatis eos totam quia omnis ut eos deleniti. At fugiat voluptates unde impedit.', 9, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(231, 8, 'Eos aliquid quia sapiente aut nisi.', 'Eos-aliquid-quia-sapiente-aut-nisi.', 'ullam', 'Itaque natus inventore non odio. Et quia ut sit autem tenetur. Consequuntur hic velit officiis vero exercitationem saepe. Culpa quo voluptates optio deserunt et dolorem.', 10, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(232, 84, 'Et maxime earum dignissimos velit.', 'Et-maxime-earum-dignissimos-velit.', 'est', 'Esse omnis omnis temporibus consequatur unde voluptatem sint. Eaque sed asperiores nulla natus consequatur ex sed. Dolorem consequatur sunt iste tempore itaque blanditiis. Eius aut aut quia mollitia incidunt ut aut.', 10, 1, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(233, 40, 'Ea similique quae et sed qui sapiente veniam.', 'Ea-similique-quae-et-sed-qui-sapiente-veniam.', 'quia', 'Qui necessitatibus incidunt et eligendi sapiente quas. Rem dicta voluptas perspiciatis corporis repellendus eum odio. Quam cumque tenetur veritatis non sed odit minima esse.', 6, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(234, 65, 'Libero commodi culpa tempora voluptate.', 'Libero-commodi-culpa-tempora-voluptate.', 'unde', 'Facere qui fuga voluptatem voluptatem sapiente enim. Aut voluptatum expedita aut provident distinctio et. Et quas eos omnis. Sint aliquam est quaerat quia eos sed.', 8, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(235, 39, 'Eum ratione asperiores praesentium consequuntur.', 'Eum-ratione-asperiores-praesentium-consequuntur.', 'itaque', 'Corporis atque laboriosam similique et labore ut. Ad quibusdam nihil distinctio velit dolore ullam dolor. Consequatur sunt autem ad error dolor voluptatem.', 7, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL),
(236, 29, 'Dolorem laborum quas et omnis amet ut veritatis.', 'Dolorem-laborum-quas-et-omnis-amet-ut-veritatis.', 'ipsam', 'Qui quisquam porro voluptas tempore exercitationem fuga amet. Sit est qui et qui veniam provident sunt officia. Cumque exercitationem at corporis consequatur quo est. Laudantium unde laborum quod itaque. Velit doloribus nulla dolorem facilis ut occaecati magni.', 1, 0, '2023-06-06 13:22:12', '2023-06-06 13:22:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-06-05 08:44:23', '2023-06-05 08:46:53'),
(2, 1, 2, '2023-06-05 08:44:25', '2023-06-05 08:46:55'),
(3, 1, 3, '2023-06-05 08:44:26', '2023-06-05 08:46:56'),
(4, 1, 4, '2023-06-05 08:44:27', '2023-06-05 08:46:57'),
(5, 2, 5, '2023-06-05 08:46:48', '2023-06-05 08:46:58'),
(6, 2, 6, '2023-06-05 08:46:49', '2023-06-05 08:46:59'),
(7, 2, 7, '2023-06-05 08:46:50', '2023-06-05 08:47:02'),
(8, 2, 8, '2023-06-05 08:46:51', '2023-06-05 08:47:03'),
(9, 3, 1, '2023-06-05 08:56:38', NULL),
(10, 3, 2, '2023-06-05 08:56:39', NULL),
(11, 3, 7, '2023-06-05 08:56:40', NULL),
(12, 3, 8, '2023-06-05 08:56:42', NULL),
(13, 51, 6, '2023-06-06 13:32:19', NULL),
(14, 115, 3, '2023-06-06 13:32:19', NULL),
(15, 228, 5, '2023-06-06 13:32:19', NULL),
(16, 162, 1, '2023-06-06 13:32:19', NULL),
(17, 124, 8, '2023-06-06 13:32:19', NULL),
(18, 98, 3, '2023-06-06 13:32:19', NULL),
(19, 228, 7, '2023-06-06 13:32:19', NULL),
(20, 131, 9, '2023-06-06 13:32:19', NULL),
(22, 52, 8, '2023-06-06 13:32:19', NULL),
(23, 55, 1, '2023-06-06 13:32:19', NULL),
(26, 70, 9, '2023-06-06 13:32:19', NULL),
(27, 78, 7, '2023-06-06 13:32:19', NULL),
(28, 123, 9, '2023-06-06 13:32:19', NULL),
(29, 193, 7, '2023-06-06 13:32:19', NULL),
(30, 204, 7, '2023-06-06 13:32:19', NULL),
(31, 103, 8, '2023-06-06 13:32:19', NULL),
(32, 57, 6, '2023-06-06 13:32:19', NULL),
(33, 177, 8, '2023-06-06 13:32:19', NULL),
(34, 105, 3, '2023-06-06 13:32:19', NULL),
(35, 39, 2, '2023-06-06 13:32:19', NULL),
(37, 41, 9, '2023-06-06 13:32:19', NULL),
(38, 225, 2, '2023-06-06 13:32:19', NULL),
(39, 112, 9, '2023-06-06 13:32:19', NULL),
(40, 183, 6, '2023-06-06 13:32:19', NULL),
(41, 151, 9, '2023-06-06 13:32:19', NULL),
(42, 220, 1, '2023-06-06 13:32:19', NULL),
(43, 50, 1, '2023-06-06 13:32:19', NULL),
(44, 64, 2, '2023-06-06 13:32:19', NULL),
(45, 220, 3, '2023-06-06 13:32:19', NULL),
(47, 167, 8, '2023-06-06 13:32:19', NULL),
(49, 221, 1, '2023-06-06 13:32:19', NULL),
(50, 56, 6, '2023-06-06 13:32:19', NULL),
(51, 147, 8, '2023-06-06 13:32:19', NULL),
(52, 68, 3, '2023-06-06 13:32:19', NULL),
(53, 152, 1, '2023-06-06 13:32:19', NULL),
(54, 70, 9, '2023-06-06 13:32:19', NULL),
(55, 45, 5, '2023-06-06 13:32:19', NULL),
(56, 116, 9, '2023-06-06 13:32:19', NULL),
(57, 108, 9, '2023-06-06 13:32:19', NULL),
(58, 73, 3, '2023-06-06 13:32:19', NULL),
(59, 198, 4, '2023-06-06 13:32:19', NULL),
(61, 102, 5, '2023-06-06 13:32:19', NULL),
(63, 121, 5, '2023-06-06 13:32:19', NULL),
(64, 79, 5, '2023-06-06 13:32:19', NULL),
(65, 138, 5, '2023-06-06 13:32:19', NULL),
(66, 149, 7, '2023-06-06 13:32:19', NULL),
(67, 180, 6, '2023-06-06 13:32:19', NULL),
(68, 98, 1, '2023-06-06 13:32:19', NULL),
(69, 62, 5, '2023-06-06 13:32:19', NULL),
(70, 223, 8, '2023-06-06 13:32:19', NULL),
(71, 224, 1, '2023-06-06 13:32:19', NULL),
(72, 148, 7, '2023-06-06 13:32:19', NULL),
(73, 234, 4, '2023-06-06 13:32:19', NULL),
(74, 209, 6, '2023-06-06 13:32:19', NULL),
(75, 198, 3, '2023-06-06 13:32:19', NULL),
(76, 77, 3, '2023-06-06 13:32:19', NULL),
(78, 185, 7, '2023-06-06 13:32:19', NULL),
(80, 173, 7, '2023-06-06 13:32:19', NULL),
(81, 39, 6, '2023-06-06 13:32:19', NULL),
(82, 104, 7, '2023-06-06 13:32:19', NULL),
(83, 130, 2, '2023-06-06 13:32:19', NULL),
(84, 110, 1, '2023-06-06 13:32:19', NULL),
(85, 233, 3, '2023-06-06 13:32:19', NULL),
(86, 119, 2, '2023-06-06 13:32:19', NULL),
(87, 190, 2, '2023-06-06 13:32:19', NULL),
(88, 62, 7, '2023-06-06 13:32:19', NULL),
(89, 153, 7, '2023-06-06 13:32:19', NULL),
(90, 87, 8, '2023-06-06 13:32:19', NULL),
(91, 59, 3, '2023-06-06 13:32:19', NULL),
(92, 222, 8, '2023-06-06 13:32:19', NULL),
(93, 177, 4, '2023-06-06 13:32:19', NULL),
(94, 79, 4, '2023-06-06 13:32:19', NULL),
(95, 159, 5, '2023-06-06 13:32:19', NULL),
(97, 183, 1, '2023-06-06 13:32:19', NULL),
(98, 176, 1, '2023-06-06 13:32:19', NULL),
(99, 74, 6, '2023-06-06 13:32:19', NULL),
(100, 56, 2, '2023-06-06 13:32:19', NULL),
(101, 148, 5, '2023-06-06 13:32:19', NULL),
(102, 195, 8, '2023-06-06 13:32:19', NULL),
(103, 127, 9, '2023-06-06 13:32:19', NULL),
(104, 139, 7, '2023-06-06 13:32:19', NULL),
(105, 143, 3, '2023-06-06 13:32:19', NULL),
(106, 90, 1, '2023-06-06 13:32:19', NULL),
(107, 202, 5, '2023-06-06 13:32:19', NULL),
(108, 105, 4, '2023-06-06 13:32:19', NULL),
(109, 203, 4, '2023-06-06 13:32:19', NULL),
(110, 120, 8, '2023-06-06 13:32:19', NULL),
(111, 200, 9, '2023-06-06 13:32:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `school_subjects`
--

CREATE TABLE `school_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('edagGYnRevLP8IsT8BR7a6CG0L8dmw4ow08zs6Ki', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDZXTTF6Y2xFYUxNWHJPMUZzRjBQaDl3T0o0WFZGUDhGaHkwaG9zVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6MTAxMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1690040541),
('urEtzM0Xx3H4Q37ik5u38xUpJmFIyGnhItlV3zYU', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUHdkRzI1QVJlN1M0SlJ3bWNQaFQwY2c2akVGc05Gc24yUjhVckZzSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6MTAxMC91bml4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRHemlDOC4yTnp5Yk9INUNmRlZ4Q0RPTXlnOWl1aGN1bmY2OGh2WFlRZjBDc3RMSzZHR3NBVyI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRHemlDOC4yTnp5Yk9INUNmRlZ4Q0RPTXlnOWl1aGN1bmY2OGh2WFlRZjBDc3RMSzZHR3NBVyI7fQ==', 1686926650);

-- --------------------------------------------------------

--
-- Table structure for table `student_classes`
--

CREATE TABLE `student_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_classes`
--

INSERT INTO `student_classes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed Abdelrhim', '2023-01-29 14:44:36', '2023-01-29 14:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `student_groups`
--

CREATE TABLE `student_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_marks`
--

CREATE TABLE `student_marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL COMMENT 'student_id=user_id',
  `id_no` varchar(255) DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `assign_subject_id` int(11) DEFAULT NULL,
  `exam_type_id` int(11) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_shifts`
--

CREATE TABLE `student_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_years`
--

CREATE TABLE `student_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_years`
--

INSERT INTO `student_years` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed Abdelrhim', '2023-01-29 14:44:08', '2023-01-29 14:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Apple', 'Apple', '2023-06-05 08:42:23', '2023-06-05 08:42:45', NULL),
(2, 'Samsung', 'Samsung', '2023-06-05 08:42:24', '2023-06-05 08:42:46', NULL),
(3, 'Sony', 'Sony', '2023-06-05 08:42:25', '2023-06-05 08:42:47', '2023-06-07 10:46:40'),
(4, 'Oppo', 'Oppo', '2023-06-05 08:42:26', '2023-06-05 08:42:48', '2023-06-07 10:46:39'),
(5, 'Mi', 'Mi', '2023-06-05 08:46:08', '2023-06-05 08:46:16', '2023-06-07 10:46:38'),
(6, 'Xiaomi', 'Xiaomi', '2023-06-05 08:46:11', '2023-06-05 08:46:18', '2023-06-07 10:46:33'),
(7, 'Amazon', 'Amazon', '2023-06-05 08:46:12', '2023-06-05 08:46:19', '2023-06-07 10:46:42'),
(8, 'Noon', 'noon', '2023-06-05 08:46:13', '2023-06-07 10:56:04', NULL),
(9, 'Slug', 'Slug', '2023-06-06 12:17:41', '2023-06-06 12:29:42', '2023-06-07 10:56:36'),
(13, 'Tag', 'Tag', '2023-06-07 10:45:49', '2023-06-07 10:46:01', '2023-06-07 10:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usertype` varchar(255) DEFAULT NULL COMMENT 'Student,Employee,Admin',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL COMMENT 'admin=head of sotware,operator=computer operator,user=employee',
  `join_date` date DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=inactive,1=active',
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `mobile`, `address`, `gender`, `image`, `fname`, `mname`, `religion`, `id_no`, `dob`, `code`, `role`, `join_date`, `designation_id`, `salary`, `status`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Ahmed Abdelrhim', 'ahmedabdelrhim92@gmail.com', '2023-02-03 15:49:28', '$2y$10$GziC8.2NzybOH5CfFVxCDOMyg9iuhcunf68hvXYQf0CstLK6GGsAW', NULL, NULL, '01152067271', 'Egypt , Cairo , Helwan , Elamassara 12-st', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1999-11-10', NULL, 'Admin', NULL, 1, NULL, 1, 'gU6OfOcMTlO7NmrEmBsEzrB1j1M2sU4z8KvQFAn7ctB0PbH1lWosJDX2qFxr', NULL, NULL, '2023-01-29 08:41:43', '2023-02-04 18:01:07'),
(2, 'Admin', 'Ahmed Abdelrhim', 'aabdelrhim974@gmail.com', '2023-02-03 15:49:28', '$2y$10$GziC8.2NzybOH5CfFVxCDOMyg9iuhcunf68hvXYQf0CstLK6GGsAW', NULL, NULL, '01152067271', 'Helwan Elmassara Cairo Egypt', 'Male', '202306161421my-pic-5.jpeg', NULL, NULL, NULL, NULL, NULL, '2951', 'Operator', NULL, 5, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-01-29 10:45:53', '2023-06-16 12:21:53'),
(8, 'Admin', 'Test Student', 'test.student@gmail.com', '2023-02-03 15:49:28', '$2y$10$GziC8.2NzybOH5CfFVxCDOMyg9iuhcunf68hvXYQf0CstLK6GGsAW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6718', 'Operator', NULL, 1, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-02-03 00:26:27', '2023-02-03 16:50:35'),
(12, 'Admin', 'Yolanda Lucas', 'syhogehori@mailinator.com', '2023-02-03 15:49:28', '$2y$10$MedG/z.hRAk17oeISjz1T.rOWmUu.t.FDY8kU2BJnR0VrWrGE3ZtG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Operator', NULL, 7, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-02-03 00:52:00', '2023-02-03 16:50:35'),
(13, 'Admin', 'Lane Wong', 'cahemyt@mailinator.com', '2023-02-03 15:49:28', '$2y$10$B3xG6GO3w90X3GJHFOM.cuLq4wlgCdoFDHGxVO5xON9XW1zMn6WD.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Operator', NULL, 2, NULL, 1, 'jtv6dcQER0', NULL, NULL, '2023-02-03 00:52:59', '2023-02-03 16:50:35'),
(14, 'Admin', 'Simone Finley', 'mahamaseky@mailinator.com', '2023-02-03 15:49:28', '$2y$10$.fQUR6.y3Nr3SbA77q2kpeXf0DATHAvwhNYMJocowAW1/ZbXzDQOO', NULL, NULL, NULL, NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, '', 'Admin', NULL, 3, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-02-03 00:53:55', '2023-02-03 16:50:35'),
(15, 'Admin', 'Celeste James', 'pesunek@mailinator.com', '2023-02-03 15:49:28', '$2y$10$wqj.DDmBb6MWbOfdgjHPjuNErsSLgoX6zW4E5YcN3LxshUuVLD17e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Operator', NULL, 3, NULL, 1, 'YxkOVW414W', NULL, NULL, '2023-02-03 00:54:19', '2023-02-03 16:50:35'),
(16, 'Admin', 'Dr. Korbin Kunde', 'ken.grimes@example.net', '2023-02-03 15:49:28', '$2y$10$B1xPtHEOlya/kibx3JfM9u1tAVXWOr9fGTEC0FJ5yZROwRIUmvDgO', NULL, NULL, '0102343323', '32308 Wendell Trail\nLake Dallasside, NV 42921', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1982-11-14', NULL, 'Operator', NULL, 3, NULL, 1, '3Vtlyatxie', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(17, 'Admin', 'Lavon Cummings', 'kenneth34@example.com', '2023-02-03 15:49:28', '$2y$10$p4fzBncYj0Z9fI2Ofyo2DOo3xIuzcKytFizrXGLYlWShuAMSm1D.S', NULL, NULL, '0122756239', '242 McGlynn Lock\nEthelland, WA 68253', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1972-11-27', NULL, 'Operator', NULL, 3, NULL, 1, 'linhvDbMqX', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(18, 'Admin', 'Dr. Ferne Kuhlman', 'jordan.huels@example.net', '2023-02-03 15:49:28', '$2y$10$gTfhdkkld3cL1L6.bhQnku05N8IxhqWvUC.W/R2sNNVcNTIFPY2J2', NULL, NULL, '0125081317', '716 Paolo Unions\nPort Rethatown, OK 55471-4030', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1987-03-15', NULL, 'Operator', NULL, 2, NULL, 1, 'ji4BifuhjL', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(19, 'Admin', 'Marie Steuber', 'cartwright.alexzander@example.org', '2023-02-03 15:49:28', '$2y$10$UQL4H1D0BeJv1Z5B2nFY0OocSFc191BBQnSahE/7/8LmCWHPPNUE2', NULL, NULL, '0121693041', '24298 Eula Stream\nPredovicstad, MO 13538', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1979-03-15', NULL, 'Operator', NULL, 5, NULL, 1, 'YxkOVW414W', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(20, 'Admin', 'Mariano Zemlak', 'marilie82@example.com', '2023-02-03 15:49:28', '$2y$10$dUTKnS62loa/zpCzcCF9I.3f8LP7pGF5nL7gReunGIHShImVta7iC', NULL, NULL, '0119165654', '7593 Price Avenue Apt. 297\nWest Kendraside, DE 45309', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1990-05-31', NULL, 'Operator', NULL, 1, NULL, 1, '7Yy0CNJwOk', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(21, 'Admin', 'Benton Spinka', 'wmcclure@example.com', '2023-02-03 15:49:28', '$2y$10$plfdLaJAMVtiwICvYEoBRe9bx/ZPXchCSGucdCSClaaDW.AbX6iti', NULL, NULL, '0108466439', '603 Jakubowski Corners\nPort Alfonzo, IN 52790-5877', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1996-10-13', NULL, 'Operator', NULL, 6, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(22, 'Admin', 'Miss Abigayle Ryan IV', 'hbergstrom@example.com', '2023-02-03 15:49:28', '$2y$10$vMgjQGbJAevy7M9Ek.m6OeKo6wfE7GmACf0QGaIX5O6W5Va03Kye.', NULL, NULL, '0112789151', '62124 Jakob Corner Apt. 382\nHalvorsonstad, WV 85823-4491', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1984-02-16', NULL, 'Operator', NULL, 7, NULL, 1, 'h7NP9vbDIL', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(23, 'Admin', 'Garrison Hermann', 'tmoen@example.net', '2023-02-03 15:49:28', '$2y$10$IySxYPdTovT5tGlKHbAsi.F604RUV2O2nOueASoO6SLCroR3K7TqG', NULL, NULL, '0124303759', '8727 Littel Port Suite 201\nSouth Annabel, CO 25089', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1987-12-01', NULL, 'Operator', NULL, 2, NULL, 1, 'vBYzKmv5LL', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(24, 'Admin', 'Junior Rice', 'avery51@example.org', '2023-02-03 15:49:28', '$2y$10$kZx8LlsXpqlgHWYo2G8DJufyHl4zbqJyXvLOY6aVPrwAcJZEv8qV2', NULL, NULL, '0101220265', '83642 Connelly Springs Apt. 615\nSouth Enosmouth, CA 43446', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2002-03-21', NULL, 'Operator', NULL, 5, NULL, 1, 'NuiZxTXpli', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(25, 'Admin', 'Rylan Ernser', 'ajohnson@example.com', '2023-02-03 15:49:28', '$2y$10$VRrfC1Gsp.Kyplj0PAj3K.MJNMKzE40j97FfKHYJ3LWFEXfKFujUm', NULL, NULL, '0123028886', '82288 Baby Tunnel Apt. 992\nWisozktown, IL 00425', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1993-09-18', NULL, 'Operator', NULL, 4, NULL, 1, 'XUwroyJELk', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(26, 'Admin', 'Napoleon Schaefer', 'jarret62@example.net', '2023-02-03 15:49:28', '$2y$10$8qPMNZNAqXCfQgLE7g3m4eStqTHIms5hQxUYCmOZ8fvUJfyIHygNi', NULL, NULL, '0102920574', '93450 Gaston Vista\nSengermouth, OK 96590', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1994-08-25', NULL, 'Operator', NULL, 7, NULL, 1, 'jtv6dcQER0', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(27, 'Admin', 'Lucas Kris', 'bjohnston@example.com', '2023-02-03 15:49:28', '$2y$10$/FnJhzSUyfztHdvAq5Ybv./5Q8iX3ixB7tMY3K1UO0Z81ISmwpxwO', NULL, NULL, '0111810493', '539 Okuneva Vista\nWest Nehaville, GA 34092-7958', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2006-08-18', NULL, 'Operator', NULL, 1, NULL, 1, 'oomxhXHeVv', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(28, 'Admin', 'Kaden Zulauf', 'hillary.goodwin@example.net', '2023-02-03 15:49:28', '$2y$10$ZdUWRpGXPXjIOBktzoaSpu2uUsIoKBM6QClf49WeUEEe.x5WDHefe', NULL, NULL, '0108270845', '70106 April Landing\nNew Filomenaborough, UT 17872-0535', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2003-04-25', NULL, 'Operator', NULL, 6, NULL, 1, 'sTLQsORwe4', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(29, 'Admin', 'Cordia Boyer', 'corene05@example.net', '2023-02-03 15:49:28', '$2y$10$Vjy.KO6sfOsKPF.w7VsKHuL5wiKxUTbS4JRAUZAgCJ9VrEzqSvp4i', NULL, NULL, '0109400999', '16135 Barton Island Apt. 870\nGislasonfort, WI 30087-5408', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1997-12-21', NULL, 'Operator', NULL, 6, NULL, 1, 'nsTvUl1Fro', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(30, 'Admin', 'Prof. Nina McGlynn PhD', 'lura47@example.org', '2023-02-03 15:49:28', '$2y$10$OnjuF6hgEv782JRHpWubzuqACvdYLwRPs9AAnv7MBJXwEK.ai4Yba', NULL, NULL, '0104808428', '77778 Blanda Brooks Suite 385\nNew Hazel, HI 44059-1534', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1983-06-05', NULL, 'Operator', NULL, 2, NULL, 1, 'mdgIOoeXK9', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(31, 'Admin', 'Diamond Carroll', 'lockman.ova@example.net', '2023-02-03 15:49:29', '$2y$10$y1G7JLkIZRfFy2RffKcRM.WbtWHLxzn/Dk.wTv3oVg0/BIYxU4ocO', NULL, NULL, '0116155942', '536 D\'Amore Station Apt. 473\nOberbrunnerchester, MI 11323-6273', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1974-07-04', NULL, 'Operator', NULL, 4, NULL, 1, 'DjVg0nWTry', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(32, 'Admin', 'Grace Bernier', 'rachael58@example.com', '2023-02-03 15:49:29', '$2y$10$jwnWz7Yzny5RSfDjFR9Ge.5ZV2SaPDxAirLimNnG5YJ6T32NFy0JS', NULL, NULL, '0118946460', '604 Nichole Lake\nLake Dixieshire, UT 93402-8277', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1994-04-03', NULL, 'Operator', NULL, 1, NULL, 1, 'N0PHMfI5Lc', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(33, 'Admin', 'Scarlett Hyatt', 'vernie.considine@example.com', '2023-02-03 15:49:29', '$2y$10$HZf1iPNiJ5PioYVIpgjnP.i32E7lbMSsvLwmfPDZXKP1R0DVJvhpq', NULL, NULL, '011798413', '4400 Dallas Rue\nLake Jaylin, AL 27364-3357', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1985-09-26', NULL, 'Operator', NULL, 3, NULL, 1, '0kbSppHsGH', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(34, 'Admin', 'Mr. Muhammad Torp', 'bmclaughlin@example.org', '2023-02-03 15:49:29', '$2y$10$uUDoyCqOQ25sVpS/C4G55O4o8H3vQrz0E5xBe20NQZs0PvcbBH4o6', NULL, NULL, '0114691652', '2826 Oliver Bypass\nLake Gaetano, DE 40573', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2004-11-24', NULL, 'Operator', NULL, 2, NULL, 1, '9zoVL1PZyw', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(35, 'Admin', 'Barrett Pouros', 'kuhlman.okey@example.com', '2023-02-03 15:49:29', '$2y$10$2Kjm5RaVl54px0hCDKqrVusaP.IBcJQCYrMVSTjsKGnc8ru.rapZe', NULL, NULL, '0125342301', '64056 Lesch Stravenue\nPort Magnusview, TN 51836', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1982-04-22', NULL, 'Operator', NULL, 3, NULL, 1, 'VjG94BGnyu', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(36, 'Admin', 'Nettie Cole', 'klocko.earnest@example.net', '2023-02-03 15:49:29', '$2y$10$9PJRXpnssrFHvDEskyFR6.jrG8bUXL4.IRWg8lKdT2ErtmSTN89ai', NULL, NULL, '0128207555', '360 Alexandra Highway Apt. 674\nMikaylamouth, IA 99105', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2012-12-24', NULL, 'Operator', NULL, 1, NULL, 1, 'VPTfTpv0dh', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(37, 'Admin', 'Kirk Fisher', 'wallace09@example.net', '2023-02-03 15:49:29', '$2y$10$PG99HYtygRkPoIDR6GIKTOQO4lybhT7SPuoyxuPebbdbrY00StLvq', NULL, NULL, '0105097254', '749 Okey Summit Suite 364\nQuigleyfort, DE 44084', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1980-10-26', NULL, 'Operator', NULL, 6, NULL, 1, '1OESrZrGnr', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(38, 'Admin', 'Madyson O\'Keefe', 'larkin.rickey@example.org', '2023-02-03 15:49:29', '$2y$10$NSk41871R5Ybc5X65KSVEePYRN9Gon5SlhPb3mL9BxNfHQa/JbQAO', NULL, NULL, '0121541400', '171 Hayden Neck Apt. 578\nPort Lydiaville, MA 62362-4784', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1988-05-07', NULL, 'Operator', NULL, 5, NULL, 1, 'zuFICNvA0s', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(39, 'Admin', 'Prof. Leon Haag', 'jessika75@example.org', '2023-02-03 15:49:29', '$2y$10$seiA5CEXk1jbYXxxOG4fJemGp9Yu5E/3zeQ.vr.6LGesQSdUYROaG', NULL, NULL, '0117631316', '88321 Cesar Road\nMorarside, AR 66763', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2005-05-22', NULL, 'Operator', NULL, 3, NULL, 1, 'wh14vS4tlT', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(40, 'Admin', 'Piper McClure', 'kevin94@example.org', '2023-02-03 15:49:29', '$2y$10$gDvo6p2wkyaplJeCXkhMhOL3blvfHXMQA0Gy7qcztYTeeKxU3WdMq', NULL, NULL, '01040956', '42707 McLaughlin Islands\nJoanymouth, NY 79639-9411', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2008-10-24', NULL, 'Operator', NULL, 2, NULL, 1, 'qL0U394ilj', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(41, 'Admin', 'Dr. Leopoldo McGlynn', 'eugene.hoeger@example.net', '2023-02-03 15:49:29', '$2y$10$jCvseXBkQqVChZCK/WgiHu/aHpouenvIMaJMIEr6pGIK/BS.X0JCG', NULL, NULL, '0126827647', '10339 Randall Extensions Apt. 624\nSauerborough, NJ 30136-0226', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1998-08-03', NULL, 'Operator', NULL, 3, NULL, 1, 'NdEskC0oP5', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(42, 'Admin', 'Chelsie Tillman', 'nspencer@example.com', '2023-02-03 15:49:29', '$2y$10$w6j.MCIpEqQHiyzpXatqSeeH9ayKvWlUHU2/mHP.vaQPLOFGEdY4y', NULL, NULL, '0105097064', '9372 Von Street\nNigelfurt, MO 65152-6362', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2009-05-30', NULL, 'Operator', NULL, 2, NULL, 1, 'OHNWuXcY29', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(43, 'Admin', 'Cyrus Marvin', 'ohill@example.net', '2023-02-03 15:49:29', '$2y$10$qGG6wB9..bT0fiteqoyi0uFIZ4atgCaU2VuvJhe5cRz/d0YTbH0xS', NULL, NULL, '0105387909', '666 Daisha Village Suite 867\nLake Jeromestad, MT 76363-5745', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2002-12-23', NULL, 'Operator', NULL, 3, NULL, 1, 'HC6sHqZWHH', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(44, 'Admin', 'Everett Williamson', 'kory.stiedemann@example.net', '2023-02-03 15:49:29', '$2y$10$/q0IoMMmrfuS.1bDikeYJu3Jcb.5nbSzas6fOY7dhQOXcHbI/HSQ6', NULL, NULL, '0121643471', '432 Cristal Inlet\nLake Francesshire, SC 95588', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2003-06-25', NULL, 'Operator', NULL, 3, NULL, 1, 'Kwux8RjOFm', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(45, 'Admin', 'Darron Cronin', 'otis00@example.net', '2023-02-03 15:49:29', '$2y$10$WuUsg.HuUl7NgNKNGwhXOOaz63M3h69utXKFyi8B3JhZy2srZMe.G', NULL, NULL, '0127072334', '9783 Rogahn Ridges Suite 459\nLake Prestonmouth, NH 77107-0696', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1987-12-11', NULL, 'Operator', NULL, 6, NULL, 1, 'KaoANKGUo3', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(46, 'Admin', 'Jamaal Wilderman', 'whitney82@example.net', '2023-02-03 15:49:29', '$2y$10$h1n1Rkq1UGn8O98RZHpy5OZYIWJ54U6THkawMaVUPMeazt3ORpGd.', NULL, NULL, '0111828343', '1618 Mueller Haven Suite 426\nWest Hester, MI 05693-5775', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2004-01-24', NULL, 'Operator', NULL, 2, NULL, 1, 'nqtTydhqn4', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(47, 'Admin', 'Kira Mitchell', 'pierce29@example.net', '2023-02-03 15:49:29', '$2y$10$E4acpkCYoQUxUZAbMUhT7OGtb96VNtzxGaFRp4tXHATYHoGuZ463W', NULL, NULL, '0102433699', '11657 Geovanny Spur\nNew Ericka, OR 37397-0365', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1995-08-07', NULL, 'Operator', NULL, 6, NULL, 1, 'MMkKgPUk7L', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(48, 'Admin', 'Katelyn Dickens', 'rkoelpin@example.net', '2023-02-03 15:49:30', '$2y$10$hQ/qmZmeb2FUNjJP5XKjUeu/MXqIVckkNjf1Cor3b7QAHBqaYB1PG', NULL, NULL, '0124017437', '158 Rosina Road Apt. 782\nMayerborough, CA 97627', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1982-01-23', NULL, 'Operator', NULL, 6, NULL, 1, '6GnfxfKNne', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(49, 'Admin', 'Maude Dibbert', 'emmerich.drake@example.com', '2023-02-03 15:49:30', '$2y$10$z4GcKgzhmdDuLfY.1ZiCQOxABZAZX9zkpCjm4LkzavdVJVqv8qYBS', NULL, NULL, '0103292195', '97142 Baumbach Mount\nEast Karine, OR 87208', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2011-09-30', NULL, 'Operator', NULL, 3, NULL, 1, 'F2tABOTZjZ', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(50, 'Admin', 'Deon Hammes', 'florine.murphy@example.net', '2023-02-03 15:49:30', '$2y$10$cm3Y9G88V4Kzvjbkau0Opu1fPbYhLyRDJYU8BMTMu2ReXsPWXhFjC', NULL, NULL, '0124479029', '288 Gerald Stream Suite 631\nMarianostad, AR 38205', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2007-05-18', NULL, 'Operator', NULL, 5, NULL, 1, 'ufbYwFzbuy', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(51, 'Admin', 'Lolita Turner V', 'janelle.kerluke@example.com', '2023-02-03 15:49:30', '$2y$10$Y/IH.qqNqU0ada3hmelo2eKNFvs4urEoN4OlCtlGmgQQf9Y5.6lBm', NULL, NULL, '0117313778', '134 Kerluke Crossing\nHuelsmouth, MS 06325', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1983-02-16', NULL, 'Operator', NULL, 3, NULL, 1, 'WFUir1JhsZ', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(52, 'Admin', 'Alva Luettgen', 'sister31@example.org', '2023-02-03 15:49:30', '$2y$10$ON4FoS/GsezxFLh3Y1t/9OZz/O50pBoqpO.3rjyFjB0ekVZc7LzOW', NULL, NULL, '0109513006', '430 Sadie Mountains\nCoybury, HI 44150-0060', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1977-04-28', NULL, 'Operator', NULL, 5, NULL, 1, 'gfALcC5k6S', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(53, 'Admin', 'Libby Davis Sr.', 'chad33@example.org', '2023-02-03 15:49:30', '$2y$10$iQBMmKwO08NzetKvbiS2v./7AKSD6YTNtG8hJzQybmIlEibSf/n1C', NULL, NULL, '0109287015', '47342 Cronin Harbor Apt. 346\nErnieland, OR 26415-2582', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1976-10-19', NULL, 'Operator', NULL, 5, NULL, 1, 'YfNSM2n0bF', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(54, 'Admin', 'Ms. Magnolia Rowe', 'chaya.kulas@example.com', '2023-02-03 15:49:30', '$2y$10$yt39ZJQIGrukFY0kh6/gSeRCpHAVi72mbmxTVMfzjGG2wtrlV5MzW', NULL, NULL, '0117206331', '380 Reinhold Ports Apt. 749\nWest Kiara, IA 19630', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1986-01-02', NULL, 'Operator', NULL, 2, NULL, 1, '4u38NOy2Fo', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(55, 'Admin', 'Merlin Murphy', 'rosella.corwin@example.com', '2023-02-03 15:49:30', '$2y$10$76VVkgmqTKm4v0Iwf.zMzuKALi0Uab.xkByGPiJfj2t.Lv7.9it7C', NULL, NULL, '0127175125', '80321 Sylvia Point Suite 066\nSouth Jamir, WI 07683-0833', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2009-03-10', NULL, 'Operator', NULL, 4, NULL, 1, 'nCIobGxukw', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(56, 'Admin', 'Dr. Christian Okuneva Jr.', 'ellen05@example.org', '2023-02-03 15:49:30', '$2y$10$JJmJ6gHOMHAaWb3W/w3oXeqbZ6fRqsx6hQRpxjoEwKQ4IxXwqKSli', NULL, NULL, '0126033779', '485 Lambert Grove Suite 211\nBeertown, ND 59017', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1989-06-10', NULL, 'Operator', NULL, 7, NULL, 1, '03IPUG1Klj', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(57, 'Admin', 'Susie Gaylord DDS', 'kertzmann.ebba@example.org', '2023-02-03 15:49:30', '$2y$10$ZccUq83iE65VkfvVlWKWZOZERaz4L6QC0f4GV.sYPgFtCxShvSUq6', NULL, NULL, '011960313', '88629 Wiza Grove Suite 645\nWest Minnieton, NC 73364-5630', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1994-10-27', NULL, 'Operator', NULL, 3, NULL, 1, 'GxlKMMvplD', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(58, 'Admin', 'Makayla Bergnaum PhD', 'abigale.goyette@example.com', '2023-02-03 15:49:30', '$2y$10$r3FAiAI2WipZqT0eIK5otughhCaEsSIxFop7bb493Pikt52TOMRx2', NULL, NULL, '0123413691', '97774 Reina Run Apt. 442\nJerodhaven, OH 91945-8195', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2009-05-13', NULL, 'Operator', NULL, 7, NULL, 1, 'gEeXzGkBLf', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(59, 'Admin', 'Brice Willms', 'mmcdermott@example.org', '2023-02-03 15:49:30', '$2y$10$lSwdXYcfVTyBMwRy4YCEzesseUDJnmL9VrrE4VsgszzPmNREt5Bna', NULL, NULL, '0115074587', '78431 Buckridge Green\nNorth Emeryfurt, MA 60367-3368', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1990-03-04', NULL, 'Operator', NULL, 3, NULL, 1, 'aXAEsva6V1', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(60, 'Admin', 'Constance Hickle', 'bgislason@example.net', '2023-02-03 15:49:30', '$2y$10$1ScGFcHjzdbeBr1q1UQMZ.UGezO1XAF30aT018BxXZYz8lbEfAnPq', NULL, NULL, '0115324504', '58701 Webster Ferry Suite 797\nHyatthaven, MA 55341', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1976-05-13', NULL, 'Operator', NULL, 1, NULL, 1, 'GM4FttZl6H', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(61, 'Admin', 'Cary Miller', 'michaela.goldner@example.com', '2023-02-03 15:49:30', '$2y$10$5zLzYqjSv.6gbXalCJ31VecDYy879QFiXW44yWeRUCa.pp5Cjtw1i', NULL, NULL, '0123218587', '2734 Mitchell Estates\nWest Clementinaville, VA 58431-6251', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1981-08-28', NULL, 'Operator', NULL, 2, NULL, 1, 'XTWS7Vz9Mz', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(62, 'Admin', 'Mckenzie Tromp PhD', 'otha.lind@example.com', '2023-02-03 15:49:30', '$2y$10$SGw018Z.rK38MA0ey1vYKOrYKI9jTuVpyksc7RN5ZAqyimW3FLKDG', NULL, NULL, '0115211858', '95108 Homenick Loaf\nWest Jeanchester, MS 57356-3346', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2011-09-11', NULL, 'Operator', NULL, 1, NULL, 1, 'ID89n5VJHn', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(63, 'Admin', 'Gregg Bechtelar', 'fkuvalis@example.org', '2023-02-03 15:49:30', '$2y$10$flSa.pj2pcIU9jrQIBdaIOTTC2kgIqU8PwJ9zKcjP00sVVmwPzMlW', NULL, NULL, '0125404599', '370 Boyer Ranch Apt. 082\nNorth Eleazarshire, UT 94527', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2007-10-24', NULL, 'Operator', NULL, 7, NULL, 1, 'scWOpFPyiv', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(64, 'Admin', 'Serenity Spencer', 'norwood24@example.net', '2023-02-03 15:49:30', '$2y$10$bSrNAAuzxnpQ.cLs21CkvesUfJmqwMTBl1Ojol9WCHUJvANDM..Nq', NULL, NULL, '0128427410', '5223 Luther Street Apt. 399\nSouth Constantin, ID 89891', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1972-08-26', NULL, 'Operator', NULL, 1, NULL, 1, '5YWICOQo4c', NULL, NULL, '2023-02-03 15:49:31', '2023-02-03 16:50:35'),
(65, 'Admin', 'Mittie Schuppe', 'arno04@example.org', '2023-02-03 15:49:31', '$2y$10$4/HGo5q/32bZzaaQZ2tJIuwqPFMGPFOqctnalgds4zvIdAUUDq1gC', NULL, NULL, '0121361362', '5303 Hilpert Ridges\nBahringerville, SC 06183', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1986-06-22', NULL, 'Operator', NULL, 6, NULL, 1, 'Gxqt4O4XGz', NULL, NULL, '2023-02-03 15:49:31', '2023-02-03 16:50:35'),
(66, 'Admin', 'Michael Barton V', 'ulises07@example.com', '2023-02-03 15:56:48', '$2y$10$trKOpfl6.cErEFG/ETQjXuYmHI4aJNjk6oYniDBpvfLN3zNAHMOoS', NULL, NULL, '0102931636', '405 Jaskolski Crossroad\nNew Cyrus, NM 85103-4361', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2002-11-28', NULL, 'Operator', NULL, 4, NULL, 1, 'fXomdSJkfr', NULL, NULL, '2023-02-03 15:56:48', '2023-02-03 16:50:35'),
(67, 'Admin', 'Miss Colleen Hintz', 'jonathan19@example.com', '2023-02-03 15:56:48', '$2y$10$9ZDDwA5g3ta8TYrKfwpmluxa1jbfIWdr0HvwawgmULFNho5BhbM8m', NULL, NULL, '0113551621', '109 Lucius Corner Suite 690\nEichmannbury, PA 20875-5188', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1998-09-17', NULL, 'Operator', NULL, 2, NULL, 1, 'lN4zY4yOHe', NULL, NULL, '2023-02-03 15:56:48', '2023-02-03 16:50:35'),
(68, 'Admin', 'Ashlynn Gutmann', 'yrutherford@example.com', '2023-02-03 15:56:48', '$2y$10$CWAarSeuXz2Ax0hTgXi4Jencb5x5tBHnLQb1hBEYQlHN8KsdhB1Oe', NULL, NULL, '0127230153', '189 Schuppe Drive\nSouth Jayceeville, MS 11940', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1980-01-08', NULL, 'Operator', NULL, 4, NULL, 1, 'ZCjDUQ21rJ', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(69, 'Admin', 'Zachariah Robel', 'johanna.paucek@example.org', '2023-02-03 15:56:49', '$2y$10$rfyir7ZpuR.eUyzANqjJvu1j7Hh006ikT8cUhLC.jeXOFdW6EIc12', NULL, NULL, '0112132363', '640 Addie Forest\nGriffinstad, WI 68320', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1995-08-13', NULL, 'Operator', NULL, 4, NULL, 1, '0mGry8Ye8k', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(70, 'Admin', 'Marianne Jacobs', 'esmeralda.ondricka@example.net', '2023-02-03 15:56:49', '$2y$10$ww/brNuC5j6MfviXS/UkA.22VKaX5GfHsKDu58oZKViHz2EvGZx/i', NULL, NULL, '0109080151', '780 Jamison Via\nWest Misael, OH 11084', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2004-06-01', NULL, 'Operator', NULL, 1, NULL, 1, 'cd4eY60zBb', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(71, 'Admin', 'Ms. Cleta Spinka III', 'ana23@example.org', '2023-02-03 15:56:49', '$2y$10$UXHMLfF.L.MPT37BuY2mN.Hul5ps.WqnrFIiLxQur3Un8f5O2pUzm', NULL, NULL, '0123717580', '3829 Dane Trafficway\nMcGlynnhaven, MD 15200-9203', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1977-09-26', NULL, 'Operator', NULL, 7, NULL, 1, 'UnJoWaSXTS', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(72, 'Admin', 'Bridie Cremin', 'aimee.schumm@example.com', '2023-02-03 15:56:49', '$2y$10$YdH0IOFnv9WoNPMIk7lAzO2zsXYkjCFYkYlEYQ9iKzYim6l9NH1Ne', NULL, NULL, '0111346807', '52486 Hartmann Pines Suite 401\nPort Ruthview, MD 13521-5601', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1998-02-02', NULL, 'Operator', NULL, 4, NULL, 1, 'bUY6dOqz38', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(73, 'Admin', 'Miss Maia Medhurst MD', 'vrosenbaum@example.org', '2023-02-03 15:56:49', '$2y$10$FObfZXGJRY1.5L07Su5G.ekzo8gzXtnTWXWaKHYIMi.zG1wwtt32S', NULL, NULL, '0109378055', '30188 Bashirian Tunnel Apt. 361\nNew Brookfurt, WY 42122-7361', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1975-06-30', NULL, 'Operator', NULL, 4, NULL, 1, 'X06wCdxEfv', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(74, 'Admin', 'Caesar Lind', 'derick.mcdermott@example.com', '2023-02-03 15:56:49', '$2y$10$L0vcBQA2iiA8uerle7j7H.joQHGqXwzJUG3HpQV6SHhUCIR7a26Q6', NULL, NULL, '012424533', '1537 Mckenna Roads Apt. 158\nWest Elisha, NH 29699-8539', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1981-08-30', NULL, 'Operator', NULL, 2, NULL, 1, 'wr3Ahvypdn', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(75, 'Admin', 'Jessie Carroll', 'abner.herzog@example.com', '2023-02-03 15:56:49', '$2y$10$QhXG5iA0Nu8CPT./hUuO2ur3XYNd/CiYt.yQ7ibf54a7jAgWwCFCK', NULL, NULL, '0122436192', '2498 Darron Square\nMetztown, MN 96185', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2008-10-26', NULL, 'Operator', NULL, 4, NULL, 1, '0Lr2vB4D9b', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(76, 'Admin', 'Rick Shields', 'mvandervort@example.com', '2023-02-03 15:57:10', '$2y$10$FS9tlp96wzw/LY4Tf2j/eeYVMJDeP8Oj6vjajjFJaUHaxYOFPq0Wu', NULL, NULL, '0109256293', '9210 Seth Corners Apt. 014\nLittelchester, GA 49710', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1984-05-28', NULL, 'Operator', NULL, 6, NULL, 1, 'Kxo2tQsZ7R', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(77, 'Admin', 'Thelma O\'Connell', 'brisa66@example.com', '2023-02-03 15:57:10', '$2y$10$N8/cRj4BvpOSY6ekwauyl.l.QG2A8rJclYAQswbWXtu.qFPz6LfQG', NULL, NULL, '0121270264', '53850 Renner Port Apt. 039\nSonnystad, WI 06829-7608', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1979-08-12', NULL, 'Operator', NULL, 5, NULL, 1, 'JOqtM9FDK4', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(78, 'Admin', 'Marley Jerde', 'marcel.robel@example.net', '2023-02-03 15:57:10', '$2y$10$/.Vba8H0xS0SJxBPHLWPG.dkKhVbgQ9AGM930O68QQx/FeZmQLdP2', NULL, NULL, '0121430016', '2898 Keshaun View Apt. 477\nLake Miller, NH 76316-8418', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1979-06-11', NULL, 'Operator', NULL, 2, NULL, 1, '5fSn807hLg', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(79, 'Admin', 'Natalie Botsford', 'goodwin.randi@example.net', '2023-02-03 15:57:10', '$2y$10$NLyX6HvCXl2CUcpVbvjPfuy5LrmOmcEucxgny3dgFMX39QVt.Dn7q', NULL, NULL, '011745774', '400 Jaylan Hollow Apt. 831\nNew Danetown, AZ 65758-1307', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1988-06-04', NULL, 'Operator', NULL, 2, NULL, 1, 'GY5MFnH2Oo', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(80, 'Admin', 'Eric Deckow', 'weimann.randy@example.org', '2023-02-03 15:57:10', '$2y$10$ht/Z1FmeXdfZY5RgY6Wiv.r/.fb6UjgemzHIx.zek35juQaIVRFM.', NULL, NULL, '0102687190', '302 Hammes Mountain Apt. 080\nSouth Israelberg, WY 13604', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1993-12-17', NULL, 'Operator', NULL, 4, NULL, 1, 'leQjSICx4J', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(81, 'Admin', 'Dr. Juanita Abshire IV', 'rhea15@example.org', '2023-02-03 15:57:10', '$2y$10$igQJxktIrRRzASOcHYs1I.GLcpMXQnnAk41Y1IRkPYITR6s3lIsbi', NULL, NULL, '0101663788', '5976 Ledner Trail Suite 176\nKristinstad, WV 48037-5806', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1998-10-19', NULL, 'Operator', NULL, 6, NULL, 1, 'FQWtqoJOcY', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(82, 'Admin', 'Tia Quigley', 'prodriguez@example.com', '2023-02-03 15:57:10', '$2y$10$ilevlVneQqM3I2m/1ldvXuGStX8Qb0EDNRTY2GLrTegU7.lBWQIau', NULL, NULL, '0104859641', '745 Brady Grove Suite 988\nElisabethview, TX 55821-2449', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2010-12-04', NULL, 'Operator', NULL, 1, NULL, 1, 'BPfrJQHcHF', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(83, 'Admin', 'Jarret Borer', 'grace29@example.org', '2023-02-03 15:57:11', '$2y$10$a/VHAllo7d/ioVS7lykXheCJ/z/2Wxns.5q05Rbg6X9QDKl7mBt8m', NULL, NULL, '0119929079', '7707 Klocko Prairie\nWilliamsonburgh, MT 47095-8321', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2011-05-22', NULL, 'Operator', NULL, 4, NULL, 1, '6E2mom62gG', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(84, 'Admin', 'Dr. Dante Beier DVM', 'caterina.parker@example.org', '2023-02-03 15:57:11', '$2y$10$3HUeuY6/OQdEuHin77E1QeArRP13lYLiRD/FheVfq.1Em9A0nz8k2', NULL, NULL, '0122881531', '115 Kelvin Vista\nLake Cade, CT 35050', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1972-07-20', NULL, 'Operator', NULL, 6, NULL, 1, '7xkR2p0Gyk', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(85, 'Admin', 'Ardith West', 'flavie07@example.net', '2023-02-03 15:57:11', '$2y$10$91cRfDfjTJsfwppXPp84quT36wLuWpsQAS0R/OWgYza0kpNC6XOWq', NULL, NULL, '0103549998', '5642 Bruen Rest Suite 470\nHelenafurt, CT 68267', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1970-10-08', NULL, 'Operator', NULL, 4, NULL, 1, 'LkT461PKuM', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(86, 'Admin', 'Veda Walter', 'ewilderman@example.net', '2023-02-03 15:57:11', '$2y$10$iTK/CL0V2a.nLtnixmWo1OkwL8RhNdOAJUf.1UsaQVZyqQW50rOo.', NULL, NULL, '0107089922', '76452 Montana Field Suite 211\nSimonisburgh, CA 46135-0249', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1979-07-04', NULL, 'Operator', NULL, 1, NULL, 1, 'K0Wo24Lc50', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(87, 'Admin', 'Ubaldo Pagac', 'erica81@example.com', '2023-02-03 15:57:11', '$2y$10$dbxbibDn/zyoZyIONpsgCu.kd/qJr.9z9ugFPr.1HXgIbOQq5o5su', NULL, NULL, '0116690363', '676 Rickey Spring Apt. 687\nNorth Dessie, MN 70974', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2010-10-26', NULL, 'Operator', NULL, 5, NULL, 1, 'qcNMSQtK7K', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(88, 'Admin', 'Garret Lynch', 'cristopher61@example.org', '2023-02-03 15:57:11', '$2y$10$VGEUuKsJHacOnRGQE3XAPeNvx7EZJU/kpOi4m1kw5mpwLMHWdtphu', NULL, NULL, '0109914348', '753 Halvorson Lake Apt. 096\nNew Amaya, DE 48118', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1992-05-22', NULL, 'Operator', NULL, 7, NULL, 1, '1uAIWtGiJM', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(89, 'Admin', 'Jaycee Altenwerth III', 'bertram60@example.org', '2023-02-03 15:57:11', '$2y$10$NMle6vBhSxDlJqZT9e1X1..DXZ4ToQal9fGOxcAH6LWlc7k.zl94C', NULL, NULL, '0112206002', '7137 Conroy Fall\nMelodyville, LA 78854-0380', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1994-02-03', NULL, 'Operator', NULL, 6, NULL, 1, 'wKBrilqSge', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(90, 'Admin', 'Dr. Gaylord Hyatt', 'frederic67@example.org', '2023-02-03 15:57:11', '$2y$10$PiRaBtzSxM/hLGrzH4fWOOBoKt7F1hL5LJdxnlioX25w53pGR7LCG', NULL, NULL, '0112486152', '83175 Jeffery Shore\nLehnerville, WY 47923-7183', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2004-10-16', NULL, 'Operator', NULL, 2, NULL, 1, 'wi6oJJwDpF', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(91, 'Admin', 'Bulah Bailey', 'gregg68@example.org', '2023-02-03 15:57:11', '$2y$10$tqtu2Ymlgj97w4cKkiRbNOkrloDdTakWaFh1qsnE3RKSCnluScGTe', NULL, NULL, '0118007755', '9813 Hegmann Ramp\nEast Liamfurt, AZ 72351', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1995-02-23', NULL, 'Operator', NULL, 7, NULL, 1, 'wjK4uNSEKQ', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(92, 'Admin', 'Karl Weber', 'wolff.orion@example.net', '2023-02-03 15:57:11', '$2y$10$S29qYmxi9LxJMLRXnr9WTOq/kuvIWT7xpSYOHFqWgA.sYFABhY/bO', NULL, NULL, '0115577666', '3569 Treutel Mountain\nHarmonchester, OK 34470-1198', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1979-10-24', NULL, 'Operator', NULL, 6, NULL, 1, 'TadJz7aJ2F', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(93, 'Admin', 'Ms. Elvie Watsica', 'rebeca53@example.org', '2023-02-03 15:57:11', '$2y$10$4WhGPJq8Zl.fOPwB6qeXge7QksYHrcRckdK8z/9Q77gyM0tNTYNfu', NULL, NULL, '0103198476', '477 Veronica Wall\nWest Keagan, AZ 66409-9518', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1996-04-10', NULL, 'Operator', NULL, 7, NULL, 1, 'mHeAVKTf81', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(94, 'Admin', 'Maximilian Quitzon IV', 'dzemlak@example.net', '2023-02-03 15:57:11', '$2y$10$b2IOrTjmxK56LwIO92FwRODBWQLlYn7j.SwgEj7LMQd9dimK1GSTG', NULL, NULL, '0119372246', '9741 Homenick Field Apt. 812\nHillhaven, KS 63365', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1974-09-25', NULL, 'Operator', NULL, 6, NULL, 1, 'rMmKcJeUhM', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(95, 'Admin', 'Mr. Gunner Grant', 'tstanton@example.net', '2023-02-03 15:57:11', '$2y$10$SKboQxPzd5RtnupP4dp.HOkTk7t5mxuEZP/hGJ6aqY1zKpZMnONpq', NULL, NULL, '0115443317', '92041 Thalia Mountain Apt. 289\nHagenesfurt, AL 24952', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1982-02-09', NULL, 'Operator', NULL, 3, NULL, 1, 'Y3qc4OVl9N', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(96, 'Admin', 'Aubrey Schowalter', 'sgerhold@example.com', '2023-02-03 15:57:11', '$2y$10$tv45KUINJQ8dFYLWRvBZ6OfWOCDQptDWi40PNgZdZd50rDNhLKZLK', NULL, NULL, '0101489743', '110 Mueller Groves Suite 727\nEast Gracietown, OH 95410', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2011-05-20', NULL, 'Operator', NULL, 3, NULL, 1, 'AJ3POKMDoG', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(97, 'Admin', 'Prof. Cristobal Lebsack', 'oceane.collier@example.org', '2023-02-03 15:57:11', '$2y$10$2Foywf8.0ctRr5K.SJwxuOHY519dHin2XNlglZ5VvwubAY3SPZDaK', NULL, NULL, '0101039676', '9427 Wilderman Rue\nSouth Modesta, MO 03559', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1990-10-27', NULL, 'Operator', NULL, 7, NULL, 1, 'eluLs2QKKz', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(98, 'Admin', 'Frank Watsica III', 'mose.ullrich@example.com', '2023-02-03 15:57:11', '$2y$10$3XYN/7Fa7tJh5pBlN0FsnujXFxOHshocX3SkuFJoJ1oBIW8TFaWs6', NULL, NULL, '0127803465', '57097 Adah Key Suite 653\nKarianefort, IN 42049', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1973-11-10', NULL, 'Operator', NULL, 1, NULL, 1, '9ZdTsxPQSq', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(99, 'Admin', 'Eleanora Corwin', 'patricia06@example.com', '2023-02-03 15:57:11', '$2y$10$UoQcAN.4krLkm3V6X4qo8.3OUT1Aym0y3lo7VruSe3wQQeutFpcGa', NULL, NULL, '0114404697', '4020 Abbott Canyon\nSouth Gladysfort, OH 95923-0776', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2012-11-17', NULL, 'Operator', NULL, 1, NULL, 1, 'kD7IJKXcaV', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(100, 'Admin', 'Madalyn Morissette', 'oran62@example.com', '2023-02-03 15:57:11', '$2y$10$sn9UGNm4ZDntQFtzqpVLIexogplJAds5VpOUP5B8M0qMgO9r/ExkO', NULL, NULL, '0108185033', '2503 Grady Crossing Apt. 422\nWest Muhammad, NH 21905', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2000-11-20', NULL, 'Operator', NULL, 1, NULL, 1, 'gqfhnF6bpj', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(101, 'Admin', 'Kadin Hahn', 'rboyer@example.net', '2023-02-03 15:57:12', '$2y$10$XdyHtfTevHm0CvHgxdHHh.gMKGcgfJQtDAcHRAnfjqBeZnXCbbiHm', NULL, NULL, '0107469023', '20576 Ova Island Suite 762\nNorth Sam, WI 80102', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1996-01-25', NULL, 'Operator', NULL, 5, NULL, 1, 'gCwo4byFQl', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(102, 'Admin', 'Buford Toy', 'janderson@example.net', '2023-02-03 15:57:12', '$2y$10$c0.OyVgfOS8Y9zp3ehr9eO6ckC5ZHEGVixvyNC27/p.6fYs5hwGH.', NULL, NULL, '0101281068', '152 O\'Connell Loaf Apt. 443\nEast Jailynport, RI 29298-4330', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1996-05-18', NULL, 'Operator', NULL, 5, NULL, 1, 'XPklASU00u', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(103, 'Admin', 'Adelia Blick III', 'bettie26@example.net', '2023-02-03 15:57:12', '$2y$10$x7eCUUqwSVTWh7y5J7VpNOkctZD5e3Obc..PBZFZfrMSHit6CQC/K', NULL, NULL, '0127433060', '8097 Alf Land Apt. 414\nNorth Quinn, MT 00208-5096', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1986-04-17', NULL, 'Operator', NULL, 7, NULL, 1, 'zXT960nbFU', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(104, 'Admin', 'Genevieve Prosacco', 'rubye90@example.com', '2023-02-03 15:57:12', '$2y$10$/o.isp5nQaziv0cJq7FuwuH9Hq4etOW8Rhb5Fqlihommz0IcUNsOi', NULL, NULL, '0114947976', '24080 Barton Streets Apt. 680\nNew Santaborough, AZ 32167', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2004-04-07', NULL, 'Operator', NULL, 7, NULL, 1, 'XgKw2ZuqSF', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(105, 'Admin', 'Jakob O\'Hara', 'padberg.jarrod@example.com', '2023-02-03 15:57:12', '$2y$10$1swNkwHwB8UkY3r2vXSO6uTbi8orIo5oTkOUvAuwCfgBmRLhJkzmK', NULL, NULL, '0112884650', '2310 Connelly Neck\nEast Aylin, ME 71102-2980', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2005-02-05', NULL, 'Operator', NULL, 4, NULL, 1, 'ooDLRlgLxv', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(106, 'Admin', 'Prof. Jeramie Stamm', 'juana.weissnat@example.org', '2023-02-03 15:57:12', '$2y$10$gb3y9fp43AYSzJoHAhKVuujmNJj3RV1aVlZ786cs3cIETpAxFQCCi', NULL, NULL, '0118120533', '8405 Ricardo Stream\nDelfinaton, MN 09360-6364', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1999-07-11', NULL, 'Operator', NULL, 2, NULL, 1, 'iqzM2H3vTA', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(107, 'Admin', 'Miss Justine Herzog', 'vandervort.kylee@example.com', '2023-02-03 15:57:12', '$2y$10$94ZEodPTqr2UbC/WafiNteIkNsHIou1XwFtN08pWpVLusKeMFz2UW', NULL, NULL, '0105552972', '8667 Westley Isle\nVandervortton, DE 33238', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2012-06-02', NULL, 'Operator', NULL, 7, NULL, 1, 'WgdsfBNtcf', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(108, 'Admin', 'Elna Leuschke III', 'jacobs.sadye@example.org', '2023-02-03 15:57:12', '$2y$10$ZlA7PwhUsRjo4s02bhQLMepVR/L5iIVF7USlfY.Y/HAbFOdmW0dny', NULL, NULL, '0106979008', '6119 DuBuque Viaduct Suite 659\nDarrinville, MA 40648', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1980-08-26', NULL, 'Operator', NULL, 5, NULL, 1, 'MteKsGR2Qb', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(109, 'Admin', 'Misty Trantow', 'johnson.lera@example.com', '2023-02-03 15:57:12', '$2y$10$RDLCy7b6x9LGnwQ1tajN.e7diwsvC2PbDcgz94QoZwaIgKqOVoDrW', NULL, NULL, '0105966065', '673 Mary Throughway Apt. 956\nDinoside, OH 10501-5961', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1978-08-13', NULL, 'Operator', NULL, 5, NULL, 1, 'fqYHLNlAki', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(110, 'Admin', 'Mr. Toni Boyle', 'giovanny.treutel@example.net', '2023-02-03 15:57:12', '$2y$10$SMyg8a61FtF4J8U8YlMrMeMxB44NsmmEA/6LRt/HsIjBXM/KWDeMS', NULL, NULL, '0127418896', '4745 Ofelia Pass\nWest Alessia, CO 33679-0149', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1984-06-14', NULL, 'Operator', NULL, 2, NULL, 1, 'HqndUYsiaW', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(111, 'Admin', 'Aric Mueller', 'bterry@example.com', '2023-02-03 15:57:12', '$2y$10$FCXi8cB3ZMr3zCRGuXYETuYkBZCZeEW7WuKqWxjMsBjnun719q5xu', NULL, NULL, '0106707130', '25562 Ernest Crossing Apt. 879\nNew Jaquanhaven, KY 11466-8664', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2002-09-19', NULL, 'Operator', NULL, 1, NULL, 1, 'FN3UMcAVf9', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(112, 'Admin', 'Claudine Wehner', 'dubuque.aiden@example.com', '2023-02-03 15:57:12', '$2y$10$ZG.mtPBQiYYtaz5TOPmAkeHa/CLbnD5m.yNz8ivF.W0Az4HWwVNQ6', NULL, NULL, '0112749508', '594 Huel Mount Suite 257\nLake Audreanne, ID 12886-0592', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2001-08-09', NULL, 'Operator', NULL, 4, NULL, 1, 't7Knx9ZPfe', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(113, 'Admin', 'Woodrow Nitzsche', 'annie66@example.com', '2023-02-03 15:57:12', '$2y$10$m8iBj7dSaE5pa0qJA7Qfj.rvKdpHFutfd7Ps7xQuoZx6RZVrUfRIC', NULL, NULL, '0107102188', '39566 Felix Passage\nKatlynnmouth, LA 86414', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1991-06-04', NULL, 'Operator', NULL, 4, NULL, 1, 'GFLkeYl5rX', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(114, 'Admin', 'Garth Nitzsche', 'inienow@example.com', '2023-02-03 15:57:12', '$2y$10$mVmqk16.gfwJyzg8T7kbTO2QNXtFY/6bsUfpEijTqrMwhh36ojQ9G', NULL, NULL, '0106682646', '640 Schmitt Squares\nNorth Kaela, DE 33690', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1993-02-24', NULL, 'Operator', NULL, 1, NULL, 1, 'DSXOqSgOkv', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(115, 'Admin', 'Gertrude Bernhard', 'caden15@example.net', '2023-02-03 15:57:12', '$2y$10$e3GWOZoRCOw4CIx4OSns9Omh0ulUwureORaIYLcrOAzOQtLGLD6Va', NULL, NULL, '0114973683', '7038 Dante Village\nDeckowmouth, DC 85809', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1983-08-18', NULL, 'Operator', NULL, 1, NULL, 1, 'jlXSzuF1Uy', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `expires_at` time NOT NULL,
  `is_valid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `code`, `expires_at`, `is_valid`, `created_at`, `updated_at`) VALUES
(22, 1, '4030', '20:02:02', 0, '2023-02-04 17:52:02', '2023-02-04 17:52:16'),
(23, 1, '8132', '20:03:10', 0, '2023-02-04 17:53:10', '2023-02-04 17:53:44'),
(24, 1, '2396', '20:10:47', 0, '2023-02-04 18:00:47', '2023-02-04 18:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'http://langosh.net/quia-officia-harum-animi-exercitationem-sunt-est.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(2, 'https://www.nitzsche.com/ut-aperiam-aut-est-alias-ut-mollitia-cum-dolorem', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(3, 'https://purdy.info/voluptatum-voluptas-aut-qui-nemo-dolorem.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(4, 'http://mante.org/rerum-sint-et-repudiandae-dolores-voluptatem-aut-deserunt', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(5, 'https://www.spinka.com/a-ipsam-et-laudantium-aut-quibusdam', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(6, 'http://www.carroll.com/', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(7, 'http://www.pfeffer.com/nihil-corporis-vitae-accusamus-rerum-quia.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(8, 'http://www.murazik.biz/dignissimos-aut-nemo-at-voluptas', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(9, 'https://grimes.info/ipsa-sit-et-illo-odio-omnis-hic.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(10, 'http://corwin.com/eius-earum-fuga-et-enim-est-ea-ut-quos', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(11, 'https://www.bayer.com/in-aut-non-eos-et-facere-quisquam-aut', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(12, 'http://www.rolfson.com/voluptatem-praesentium-at-porro-sequi.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(13, 'http://www.welch.com/fugit-exercitationem-sint-eum-voluptatem-nemo-consectetur', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(14, 'http://www.hane.com/sed-alias-est-reprehenderit-et-autem-et-repellendus-molestiae', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(15, 'http://www.mraz.com/autem-modi-voluptatum-maiores-eius', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(16, 'http://upton.com/rem-nobis-unde-quaerat', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(17, 'http://www.sipes.info/', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(18, 'http://www.ratke.com/vitae-a-quo-est-numquam-molestiae', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(19, 'https://collier.net/debitis-dolore-architecto-aut-id-aperiam-sunt-sequi-eos.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(20, 'http://ullrich.com/', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(21, 'https://braun.com/amet-eos-esse-maiores-quod.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(22, 'http://kunze.biz/eos-et-ad-quae-dolorem', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(23, 'http://marquardt.com/quae-quo-culpa-totam-magnam.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(24, 'http://www.harber.com/repellat-et-enim-fuga-nostrum-consequatur', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(25, 'http://carroll.com/at-nobis-rerum-et-voluptatem', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(26, 'http://towne.net/est-et-dolores-molestiae-odio-illo-id.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(27, 'https://www.hamill.com/et-animi-rem-ut-earum-ad-excepturi-veritatis', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(28, 'http://okeefe.net/est-nostrum-deleniti-aut-et-facilis-accusantium.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(29, 'http://oconner.biz/perspiciatis-eos-aut-quos-deleniti-laboriosam-culpa-hic.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(30, 'http://goyette.com/excepturi-omnis-sit-dicta-assumenda-amet-magnam', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(31, 'http://balistreri.com/', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(32, 'http://www.rau.org/harum-occaecati-commodi-quas-totam-similique-nihil-exercitationem', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(33, 'http://aufderhar.com/quia-veritatis-quaerat-explicabo-dolor-eius-quo-illo.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(34, 'http://www.boyer.info/', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(35, 'http://www.bradtke.com/', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(36, 'https://www.mcglynn.com/provident-ea-id-in-sint-deleniti', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(37, 'http://www.frami.info/expedita-magnam-facilis-et-et.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(38, 'http://www.schmitt.com/', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(39, 'http://www.koch.info/reiciendis-voluptatem-illo-occaecati-facere-qui-libero-in', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(40, 'http://www.jerde.com/quas-iusto-eum-ut-distinctio-nemo-reiciendis', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(41, 'http://www.rutherford.info/inventore-optio-voluptatem-aut-nemo', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(42, 'http://www.bartell.com/officiis-aut-accusantium-consequatur-voluptas-eos-aspernatur', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(43, 'http://www.goyette.com/consequuntur-molestias-nihil-itaque-ut-impedit-quis-quas', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(44, 'http://www.cruickshank.com/dignissimos-maxime-voluptates-qui-voluptas', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(45, 'http://damore.com/', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(46, 'https://lemke.com/dolor-repellendus-earum-assumenda-dolore-corporis-natus-ut-quam.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(47, 'https://www.crist.com/possimus-dolore-enim-dolores-atque-aut-rerum-ut-nihil', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(48, 'http://kirlin.com/officia-quaerat-cumque-nesciunt-quia-cumque.html', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(49, 'http://www.mitchell.org/minus-voluptatem-fugiat-ratione-est-ducimus-ad-tempora-dicta', '2023-07-22 16:01:17', '2023-07-22 16:01:17'),
(50, 'http://collins.com/', '2023-07-22 16:01:17', '2023-07-22 16:01:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_employee_salaries`
--
ALTER TABLE `account_employee_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_other_costs`
--
ALTER TABLE `account_other_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_student_fees`
--
ALTER TABLE `account_student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_students`
--
ALTER TABLE `assign_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_name_unique` (`name`);

--
-- Indexes for table `discount_students`
--
ALTER TABLE `discount_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_leaves`
--
ALTER TABLE `employee_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_sallary_logs`
--
ALTER TABLE `employee_sallary_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_types`
--
ALTER TABLE `exam_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_types_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fee_categories`
--
ALTER TABLE `fee_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_categories_name_unique` (`name`);

--
-- Indexes for table `fee_category_amounts`
--
ALTER TABLE `fee_category_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `leave_purposes`
--
ALTER TABLE `leave_purposes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_purposes_name_unique` (`name`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logins_user_id_foreign` (`user_id`);

--
-- Indexes for table `marks_grades`
--
ALTER TABLE `marks_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `school_subjects`
--
ALTER TABLE `school_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_subjects_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_classes_name_unique` (`name`);

--
-- Indexes for table `student_groups`
--
ALTER TABLE `student_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_groups_name_unique` (`name`);

--
-- Indexes for table `student_marks`
--
ALTER TABLE `student_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_shifts`
--
ALTER TABLE `student_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_shifts_name_unique` (`name`);

--
-- Indexes for table `student_years`
--
ALTER TABLE `student_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_years_name_unique` (`name`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_employee_salaries`
--
ALTER TABLE `account_employee_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_other_costs`
--
ALTER TABLE `account_other_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_student_fees`
--
ALTER TABLE `account_student_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_students`
--
ALTER TABLE `assign_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `discount_students`
--
ALTER TABLE `discount_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_leaves`
--
ALTER TABLE `employee_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_sallary_logs`
--
ALTER TABLE `employee_sallary_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_types`
--
ALTER TABLE `exam_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_categories`
--
ALTER TABLE `fee_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_category_amounts`
--
ALTER TABLE `fee_category_amounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leave_purposes`
--
ALTER TABLE `leave_purposes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks_grades`
--
ALTER TABLE `marks_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `school_subjects`
--
ALTER TABLE `school_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_classes`
--
ALTER TABLE `student_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_groups`
--
ALTER TABLE `student_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_marks`
--
ALTER TABLE `student_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_shifts`
--
ALTER TABLE `student_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_years`
--
ALTER TABLE `student_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verifications`
--
ALTER TABLE `verifications`
  ADD CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
