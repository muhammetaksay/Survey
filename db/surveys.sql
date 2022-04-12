-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                5.7.33 - MySQL Community Server (GPL)
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- surveys için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `surveys` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `surveys`;

-- tablo yapısı dökülüyor surveys.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) unsigned NOT NULL,
  `customer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.answers: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
REPLACE INTO `answers` (`id`, `survey_id`, `customer_id`, `question_id`, `answer`) VALUES
	(1, 1, 1, 1, '1'),
	(2, 1, 1, 2, '8'),
	(3, 1, 1, 3, '6'),
	(4, 1, 1, 4, '1'),
	(5, 1, 1, 5, 'İçere2222n'),
	(6, 1, 3, 1, '5'),
	(7, 1, 3, 2, '6'),
	(8, 1, 3, 3, '1'),
	(9, 1, 3, 4, '5'),
	(10, 1, 3, 5, '8'),
	(11, 1, 3, 6, 'Testter');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.customers: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
REPLACE INTO `customers` (`id`, `email`, `name`, `status`) VALUES
	(1, 'aksay84@gmail.com', 'Muhammet Aksay', 1),
	(3, 'muhammet.aksay@eltturkey.com', 'Muhammet Aksay2', 1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.failed_jobs: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.migrations: ~10 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(10, '2014_10_12_000000_create_users_table', 1),
	(11, '2014_10_12_100000_create_password_resets_table', 1),
	(12, '2019_08_19_000000_create_failed_jobs_table', 1),
	(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(14, '2022_04_09_111706_create_surveys_table', 1),
	(15, '2022_04_09_111724_create_sections_table', 1),
	(16, '2022_04_09_111743_create_questions_table', 1),
	(17, '2022_04_09_111754_create_customers_table', 1),
	(18, '2022_04_09_111806_create_answers_table', 1),
	(19, '2022_04_12_124810_create_survey_customers_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.password_resets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.personal_access_tokens: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` bigint(20) unsigned NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.questions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
REPLACE INTO `questions` (`id`, `section_id`, `question`, `type`, `orderby`, `status`) VALUES
	(1, 1, 'Soru Rastgele 1', 'range', '1', 1),
	(2, 1, 'Soru Rastgele 2', 'range', '1', 1),
	(3, 1, 'Soru Rastgele 3', 'range', '1', 1),
	(4, 2, 'Soru Rastgele 4', 'range', '1', 1),
	(5, 2, 'Soru Rastgele 5', 'range', '1', 1),
	(6, 3, 'Öneriler', 'text', '1', 1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.sections
CREATE TABLE IF NOT EXISTS `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) unsigned NOT NULL,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.sections: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
REPLACE INTO `sections` (`id`, `survey_id`, `section`, `orderby`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Bölüm 1', '1', 1, '2022-04-12 13:11:10', '2022-04-12 13:11:10'),
	(2, 1, 'Bölüm 2', '1', 1, '2022-04-12 13:11:16', '2022-04-12 13:11:16'),
	(3, 1, 'Bölüm 3', '1', 1, '2022-04-12 13:11:33', '2022-04-12 13:11:33');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.surveys
CREATE TABLE IF NOT EXISTS `surveys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.surveys: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
REPLACE INTO `surveys` (`id`, `title`, `description`, `last_time`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Test Anket', 'Test Anketim', '2022-07-30 00:00:00', 1, '2022-04-12 13:10:42', '2022-04-12 13:10:42');
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.survey_customers
CREATE TABLE IF NOT EXISTS `survey_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.survey_customers: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `survey_customers` DISABLE KEYS */;
REPLACE INTO `survey_customers` (`id`, `customer_id`, `survey_id`, `status`) VALUES
	(1, 1, 1, 1);
/*!40000 ALTER TABLE `survey_customers` ENABLE KEYS */;

-- tablo yapısı dökülüyor surveys.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- surveys.users: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Prof. June Schiller DDS', 'davion39@example.org', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7Kz1BXWjBX', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(2, 'Prof. Ronny Bergstrom', 'aubrey61@example.com', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CcgQ1ZoPgK', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(3, 'Sincere Cartwright', 'herzog.sydni@example.org', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uOxrJ41n6s', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(4, 'Dr. Jana Ondricka DVM', 'botsford.mia@example.com', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0KdyhKgZfS', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(5, 'Geovany Jenkins', 'yparker@example.com', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9HVqW8eLCt', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(6, 'Eileen Kassulke Sr.', 'gbecker@example.com', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QJs32YTz5V', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(7, 'Raina Quigley', 'eulah84@example.com', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8fpDjLZIvG', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(8, 'Jevon Schultz', 'emard.filomena@example.net', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hCvXxpY6zu', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(9, 'Isidro Hickle', 'christian.kris@example.org', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Bnq6hqTuKC', '2022-04-12 12:50:08', '2022-04-12 12:50:08'),
	(10, 'Abigayle Kohler', 'qemmerich@example.net', '2022-04-12 12:50:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7Q12JPce0H', '2022-04-12 12:50:08', '2022-04-12 12:50:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
