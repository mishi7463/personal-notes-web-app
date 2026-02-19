-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2025 at 08:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_notepad`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT '#ccc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category` varchar(100) DEFAULT NULL,
  `pinned` tinyint(1) DEFAULT 0,
  `favorite` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`, `category`, `pinned`, `favorite`, `deleted_at`) VALUES
(1, 3, 'My first note', 'Hi , lets hope this not work', '2025-11-03 21:01:58', '2025-11-04 21:46:34', NULL, 1, 0, NULL),
(3, 3, '2', '63890', '2025-11-03 21:25:05', '2025-11-04 21:46:31', NULL, 0, 1, NULL),
(4, 3, '2', '2nd tryy', '2025-11-03 21:25:36', '2025-11-04 11:35:55', NULL, 0, 1, NULL),
(5, 3, 'This is personal ', 'Personal Note', '2025-11-04 10:44:35', '2025-11-04 13:10:46', 'Work', 1, 1, NULL),
(6, 5, 'Title A', 'its a pewew\r\n', '2025-12-04 14:44:30', '2025-12-09 16:54:16', 'Personal', 0, 0, '2025-12-09 16:54:16'),
(7, 5, '68', 'sdddd', '2025-12-09 17:46:03', '2025-12-10 16:46:11', 'Study', 0, 1, NULL),
(8, 5, '78', '67689p', '2025-12-10 16:02:31', '2025-12-15 11:02:00', 'Personal', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `created_at`) VALUES
(3, 'Mishi', '8899mishi00@gmail.com', 'scrypt:32768:8:1$XJ09cxBYl7gqzYS6$6743ad326caaf9f9fada96d1c00b0fe06b90a8589829db3555d5ddeace8485b6c06c9e9fda16fba6d1ed5a7ede5425ed24a6be4c6681178d0def5ccc93c96654', '2025-11-03 20:19:27'),
(5, 'tabia', 'tania@gmail.com', 'scrypt:32768:8:1$FEhEIou2nQiacsoB$521e3f1dfa31d2a78111675b38b958da81198cc53bf5594eb7dc6f3525b0e4c04807cc9a47c5e599a09ea657918fbaa8329cf660046145332fbd6f6058cc71f4', '2025-12-04 14:42:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
