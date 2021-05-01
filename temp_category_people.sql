-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2021 at 02:16 PM
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
-- Table structure for table `temp_category_people`
--

CREATE TABLE `temp_category_people` (
  `id` int(11) NOT NULL,
  `fk_incident_id` int(11) DEFAULT NULL COMMENT 'pk_id of incident table',
  `name` varchar(200) DEFAULT NULL,
  `type` enum('Staff','Witness') DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp(),
  `modifyDate` datetime DEFAULT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '''2''-inactive,''1''-active,''2''-deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_category_people`
--

INSERT INTO `temp_category_people` (`id`, `fk_incident_id`, `name`, `type`, `createdDate`, `modifyDate`, `status`) VALUES
(5, 2, 'nayank', 'Witness', '2021-04-26 14:31:03', NULL, '1'),
(6, 2, 'manisha', 'Witness', '2021-04-26 14:31:03', NULL, '1'),
(7, 1, 'rupali pawar', 'Staff', '2021-05-01 17:31:29', '2021-05-01 17:31:29', '1'),
(8, 1, 'vishal', 'Witness', '2021-05-01 17:31:29', '2021-05-01 17:31:29', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `temp_category_people`
--
ALTER TABLE `temp_category_people`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `temp_category_people`
--
ALTER TABLE `temp_category_people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
