-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2020 at 04:12 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taks4`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` varchar(24) NOT NULL,
  `isActive` varchar(6) NOT NULL,
  `age` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `company` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `isActive`, `age`, `name`, `gender`, `company`, `email`, `phone`, `street`, `city`, `state`, `zip`) VALUES
('59761c23b30d971669fb42ff', 'true', 36, 'Dunlap Hubbard', 'male', 'CEDWARD', 'dunlaphubbard@cedward.com', '+1 (890) 543-2508', '6649 N Blue Gum St', 'New Orleans', 'LA', '70116'),
('66761c23b30d971669fb42gg', 'true', 36, 'iklil jaya', 'male', 'CEDWARD', 'dunlaphubbard@cedward.com', '+1 (890) 543-2508', '6649 N Blue Gum St', 'New Orleans', 'LA', '70116');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `imageurl` varchar(50) NOT NULL,
  `imagewidth` int(20) NOT NULL,
  `imageheight` int(20) NOT NULL,
  `thumbnailurl` varchar(50) NOT NULL,
  `thumbnailwidth` int(20) NOT NULL,
  `thumbnailheight` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `type`, `name`, `imageurl`, `imagewidth`, `imageheight`, `thumbnailurl`, `thumbnailwidth`, `thumbnailheight`) VALUES
('0001', 'donut', 'Cake', 'images/0001.jpg', 200, 200, 'images/thumbnails/0001.jpg', 32, 32);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
