-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 01, 2022 at 02:34 PM
-- Server version: 5.7.36
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_library_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories` json NOT NULL,
  `pages` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('AVAILABLE','BORROWED','LOST') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_title_unique` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `publisher`, `categories`, `pages`, `image`, `status`) VALUES
(1, 'MAC Flöoding: Ultimate Guide', 'Mehran Hematyar', 'Unknown', '[\"Unknown\"]', 64, 'https://iq.opengenus.org/content/images/2019/01/mac1.PNG', 'AVAILABLE'),
(2, 'Harry Potter and the Cursed Child', 'J. K. Rowling', 'Sphere', '[\"Fiction\"]', 352, 'https://m.media-amazon.com/images/I/61ZQn1RwJ2L.jpg', 'AVAILABLE'),
(3, 'Harry Potter and the Sorcerer\'s Stone', 'J. K. Rowling', 'Scholastic', '[\"Juvenile Fiction\"]', 320, 'http://books.google.com/books/content?id=mvmGPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'BORROWED'),
(4, 'The Psychology of Harry Potter', 'Neil Mulholland', 'BenBella Books', '[\"Literary Criticism\"]', 326, 'http://books.google.com/books/content?id=L18VBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'AVAILABLE'),
(5, 'The Ultimate Harry Potter and Philosophy', 'William Irwin', 'John Wiley & Sons', '[\"Philosophy\"]', 304, 'http://books.google.com/books/content?id=lJB5DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'AVAILABLE'),
(6, 'Harry Potter and the Half-Blood Prince', 'J. K. Rowling', 'Unknown', '[\"England\"]', 672, 'http://books.google.com/books/content?id=L2EQuwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'AVAILABLE'),
(7, 'Harry Potter Coloring Book', 'Inc. Scholastic', 'Scholastic Incorporated', '[\"Juvenile Fiction\"]', 96, 'http://books.google.com/books/content?id=lMM4jgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'AVAILABLE'),
(8, 'Harry Potter: Exploring Hogwarts', 'Jody Revenson', 'Insight Kids', '[\"Juvenile Nonfiction\"]', 48, 'http://books.google.com/books/content?id=vnbgDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api', 'AVAILABLE'),
(9, 'Harry Potter and the Deathly Hallows', 'J. K. Rowling', 'Arthur a Levine', '[\"Juvenile Fiction\"]', 759, 'http://books.google.com/books/content?id=GZAoAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api', 'AVAILABLE');

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

DROP TABLE IF EXISTS `borrows`;
CREATE TABLE IF NOT EXISTS `borrows` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrows_book_id_foreign` (`book_id`),
  KEY `borrows_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`id`, `book_id`, `user_id`, `borrow_date`, `return_date`) VALUES
(3, 29, 2, '2022-04-14', NULL),
(2, 29, 2, '2022-04-14', NULL),
(6, 4, 1, '2022-04-15', '2022-04-22'),
(7, 3, 3, '2022-04-15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_04_09_130914_create_user_table', 1),
(3, '2022_04_09_131302_create_book_table', 1),
(4, '2022_04_09_135208_create_borrow_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('STUDENT','LECTURER','ADMIN') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metafield` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `telephone`, `password`, `metafield`) VALUES
(1, 'Lean Wei Liang', 'ADMIN', 'lwleo2000@gmail.com', '0124228523', '$2y$10$jhiDloeT8FYecLZKubIMIOF/mdhMSmYcT4gs8zrEsXdEUZk6G97IK', NULL),
(3, 'Tan Yuan Jie', 'LECTURER', 'yuanjie2000@gmail.com', '0129224545', '$2y$10$T/U6eUfLrKkQBdyeZv4ikujnKqf0NoVjHOinykWpGBcIMHeWz0hFO', NULL),
(4, 'Seow Kai Sheng', 'STUDENT', 'kai411@gmail.com', '0129222929', '$2y$10$nSJDumlki0wyuDeg0s.Ds.nUlSA7E17os3AvvcDoeKQu7Z9iYmQFa', NULL),
(5, 'Chong Chit Siang', 'STUDENT', 'edison@gmail.com', '0129222929', '$2y$10$jEm8EVK37BgSHz2a5TQHz.tW6w7mM.qZls/CVvy49g8h3mYO955Li', NULL),
(7, 'Ali Abu Akao', 'STUDENT', 'aliabuakao@gmail.com', '0123456789', '$2y$10$WbcZmavlpzjTCINsxZAtme9Ei0fm.FYEbjegsN1Vt6BnLjCbkVNNu', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
