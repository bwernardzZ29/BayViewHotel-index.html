-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2023 at 03:24 AM
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
-- Database: `book`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `room_type` varchar(15) NOT NULL,
  `room_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_price` decimal(65,2) NOT NULL DEFAULT 0.00,
  `checkin` date DEFAULT NULL,
  `checkout` date DEFAULT NULL,
  `status` enum('pending','accept','reject') NOT NULL DEFAULT 'accept',
  `userid` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `email`, `phone`, `room_type`, `room_price`, `total_price`, `checkin`, `checkout`, `status`, `userid`, `room_id`) VALUES
(163, 'evev', 'evevkitz@gmail.com', '09876543212', 'suite', 1200.00, 1200.00, '2023-05-17', '2023-05-18', 'accept', 41, 263),
(164, 'evev', 'evevkitz@gmail.com', '09876543212', 'suite', 1200.00, 1200.00, '2023-05-19', '2023-05-20', 'accept', 41, 264);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `availability` enum('available','not available') NOT NULL DEFAULT 'available',
  `room_slot` int(11) NOT NULL DEFAULT 5,
  `last_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `room_type`, `availability`, `room_slot`, `last_update`) VALUES
(1, 101, 'suite', 'available', 3, '2023-05-09'),
(2, 102, 'family', 'available', 5, '2023-05-09'),
(3, 201, 'deluxe', 'available', 5, '2023-05-09'),
(4, 202, 'classic', 'available', 5, '2023-05-09'),
(5, 301, 'superior', 'available', 5, '2023-05-09'),
(6, 302, 'luxury', 'available', 5, '2023-05-09');

-- --------------------------------------------------------

--
-- Table structure for table `user_form`
--

CREATE TABLE `user_form` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `usertype` varchar(10) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_form`
--

INSERT INTO `user_form` (`id`, `name`, `email`, `password`, `image`, `usertype`) VALUES
(0, 'admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', 'admin'),
(41, 'evev', 'evevkitz@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'macaca_nigra_self-portrait-3e0070aa19a7fe36e802253048411a38f14a79f8-s1100-c50.jpg', 'user'),
(42, 'test', 'test@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_number` (`room_number`);

--
-- Indexes for table `user_form`
--
ALTER TABLE `user_form`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=607;

--
-- AUTO_INCREMENT for table `user_form`
--
ALTER TABLE `user_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user_form` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
