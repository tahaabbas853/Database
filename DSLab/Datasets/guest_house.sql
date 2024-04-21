-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 24, 2022 at 12:46 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

# 
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guest_house`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `hotelno` varchar(10) NOT NULL,
  `guestno` decimal(5,0) NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date DEFAULT NULL,
  `roomno` decimal(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`hotelno`, `guestno`, `datefrom`, `dateto`, `roomno`) VALUES
('ch01', '10006', '2004-04-21', NULL, '1101'),
('ch02', '10002', '2004-04-25', '2004-05-06', '801'),
('dc01', '10003', '2004-05-20', NULL, '1001'),
('dc01', '10007', '2006-05-13', '2011-05-15', '1001'),
('fb01', '10001', '2004-04-01', '2004-04-08', '501'),
('fb01', '10001', '2004-05-01', NULL, '701'),
('fb01', '10004', '2004-04-15', '2004-05-15', '601'),
('fb01', '10005', '2004-05-02', '2004-05-07', '501'),
('fb02', '10001', '2004-04-05', '2022-02-03', '1001'),
('fb02', '10003', '2004-04-05', '2010-04-04', '1001');

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guestno` decimal(5,0) NOT NULL,
  `guestname` varchar(20) DEFAULT NULL,
  `guestaddress` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guestno`, `guestname`, `guestaddress`) VALUES
('10001', 'John Kay', '56 High St, London'),
('10002', 'Mike Ritchie', '18 Tain St, London'),
('10003', 'Mary Tregear', '5 Tarbot Rd, Aberdeen'),
('10004', 'Joe Keogh', '2 Fergus Dr, Aberdeen'),
('10005', 'Carol Farrel', '6 Achray St, Glasgow'),
('10006', 'Tina Murphy', '63 Well St, Glasgow'),
('10007', 'Tony Shaw', '12 Park Pl, Glasgow');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotelno` varchar(10) NOT NULL,
  `hotelname` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotelno`, `hotelname`, `city`) VALUES
('ch01', 'Omni Shoreham', 'London'),
('ch02', 'Phoenix Park', 'London'),
('dc01', 'Latham', 'Berlin'),
('fb01', 'Grosvenor', 'London'),
('fb02', 'Watergate', 'Paris');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomno` decimal(5,0) NOT NULL,
  `hotelno` varchar(10) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomno`, `hotelno`, `type`, `price`) VALUES
('501', 'fb01', 'single', '19.00'),
('601', 'fb01', 'double', '29.00'),
('701', 'ch02', 'single', '10.00'),
('701', 'fb01', 'family', '39.00'),
('801', 'ch02', 'double', '15.00'),
('901', 'dc01', 'single', '18.00'),
('1001', 'ch01', 'single', '29.99'),
('1001', 'dc01', 'double', '30.00'),
('1001', 'fb02', 'single', '58.00'),
('1101', 'ch01', 'family', '59.99'),
('1101', 'dc01', 'family', '35.00'),
('1101', 'fb02', 'double', '86.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`hotelno`,`guestno`,`datefrom`),
  ADD KEY `roomno` (`roomno`,`hotelno`),
  ADD KEY `guestno` (`guestno`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guestno`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotelno`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomno`,`hotelno`),
  ADD KEY `hotelno` (`hotelno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`roomno`,`hotelno`) REFERENCES `room` (`roomno`, `hotelno`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`guestno`) REFERENCES `guest` (`guestno`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotelno`) REFERENCES `hotel` (`hotelno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
