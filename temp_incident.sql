-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2021 at 02:17 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev-templete-local`
--

-- --------------------------------------------------------

--
-- Table structure for table `temp_incident`
--

CREATE TABLE `temp_incident` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `fk_category_id` int(11) DEFAULT NULL COMMENT 'primary key of master category',
  `comments` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `incidentDate` time DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp(),
  `modifyDate` datetime DEFAULT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '''2''-inactive,''1''-active,''2''-deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_incident`
--

INSERT INTO `temp_incident` (`id`, `title`, `fk_category_id`, `comments`, `latitude`, `longitude`, `incidentDate`, `createdDate`, `modifyDate`, `status`) VALUES
(1, 'pawar rupali', 1, 'Lorem comment 1', '27.2046', '27.2046', '00:00:00', '2021-04-26 14:31:03', '2021-05-01 17:31:29', '1'),
(2, 'Testing title 2', 1, 'Lorem comment 2', '27.2046', '77.4977', '14:15:00', '2021-04-26 14:31:03', NULL, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `temp_incident`
--
ALTER TABLE `temp_incident`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `temp_incident`
--
ALTER TABLE `temp_incident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
