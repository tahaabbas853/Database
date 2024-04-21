-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 24, 2022 at 12:49 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `P200119_Tahaaa`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `my_procedure_Local_Variables` ()  BEGIN 
DECLARE a INT DEFAULT 10;
DECLARE b, c INT; 
SET a = a + 100;
SET b = 2;
SET c = a + b;
BEGIN 
DECLARE c INT;
SET c = 5;

SELECT a, b, c;
END;
SELECT a, b, c;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ATTRACTION`
--

CREATE TABLE `ATTRACTION` (
  `ATTRACT_NO` decimal(10,0) NOT NULL,
  `ATTRACT_NAME` varchar(35) DEFAULT NULL,
  `ATTRACT_AGE` decimal(3,0) NOT NULL DEFAULT 0,
  `ATTRACT_CAPACITY` decimal(3,0) NOT NULL,
  `PARK_CODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ATTRACTION`
--

INSERT INTO `ATTRACTION` (`ATTRACT_NO`, `ATTRACT_NAME`, `ATTRACT_AGE`, `ATTRACT_CAPACITY`, `PARK_CODE`) VALUES
('10034', 'ThunderCoaster', '11', '34', 'FR1001'),
('10056', 'SpinningTeacups', '4', '62', 'FR1001'),
('10067', 'FlightToStars', '11', '24', 'FR1001'),
('10078', 'Ant-Trap', '23', '30', 'FR1001'),
('10082', NULL, '10', '40', 'ZA1342'),
('10098', 'Carnival', '3', '120', 'FR1001'),
('20056', '3D-Lego_Show', '3', '200', 'UK3452'),
('30011', 'BlackHole2', '12', '34', 'UK3452'),
('30012', 'Pirates', '10', '42', 'UK3452'),
('30044', 'UnderSeaWord', '4', '80', 'UK3452'),
('98764', 'GoldRush', '5', '80', 'ZA1342');

-- --------------------------------------------------------

--
-- Stand-in structure for view `EMPFR`
-- (See below for the actual view)
--
CREATE TABLE `EMPFR` (
`EMP_NUM` decimal(4,0)
,`EMP_TITLE` varchar(4)
,`EMP_LNAME` varchar(15)
,`EMP_FNAME` varchar(15)
,`EMP_DOB` date
,`EMP_HIRE_DATE` date
,`EMP_AREA_CODE` varchar(4)
,`EMP_PHONE` varchar(12)
,`PARK_CODE` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `EMP_NUM` decimal(4,0) NOT NULL,
  `EMP_TITLE` varchar(4) DEFAULT NULL,
  `EMP_LNAME` varchar(15) NOT NULL,
  `EMP_FNAME` varchar(15) NOT NULL,
  `EMP_DOB` date NOT NULL,
  `EMP_HIRE_DATE` date DEFAULT NULL,
  `EMP_AREA_CODE` varchar(4) NOT NULL,
  `EMP_PHONE` varchar(12) NOT NULL,
  `PARK_CODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`EMP_NUM`, `EMP_TITLE`, `EMP_LNAME`, `EMP_FNAME`, `EMP_DOB`, `EMP_HIRE_DATE`, `EMP_AREA_CODE`, `EMP_PHONE`, `PARK_CODE`) VALUES
('100', 'Ms', 'Calderdale', 'Emma', '1972-06-15', '1992-03-15', '0181', '324-9652', 'FR1001'),
('101', 'Ms', 'Ricardo', 'Marshel', '1978-03-19', '1996-04-25', '0181', '324-4472', 'UK3452'),
('102', 'Mr', 'Arshad', 'Arif', '1969-11-14', '1990-12-20', '7253', '675-8993', 'FR1001'),
('103', 'Ms', 'Roberts', 'Anne', '1974-10-16', '1994-08-16', '0181', '898-3456', 'UK3452'),
('104', 'Mr', 'Denver', 'Enrica', '1980-11-08', '2001-10-20', '7253', '504-4434', 'ZA1342'),
('105', 'Ms', 'Namowa', 'Mirrelle', '1990-03-14', '2006-11-08', '0181', '890-3243', 'FR1001'),
('106', 'Mrs', 'Smith', 'Gemma', '1968-02-12', '1989-01-05', '0181', '324-7845', 'ZA1342');

-- --------------------------------------------------------

--
-- Stand-in structure for view `EMP_DETAILS`
-- (See below for the actual view)
--
CREATE TABLE `EMP_DETAILS` (
`EMP_NUM` decimal(4,0)
,`PARK_CODE` varchar(10)
,`PARK_NAME` varchar(35)
,`EMP_LNAME` varchar(15)
,`EMP_FNAME` varchar(15)
,`EMP_HIRE_DATE` date
,`EMP_DOB` date
);

-- --------------------------------------------------------

--
-- Table structure for table `HOURS`
--

CREATE TABLE `HOURS` (
  `EMP_NUM` decimal(4,0) NOT NULL,
  `ATTRACT_NO` decimal(10,0) NOT NULL,
  `HOURS_PER_ATTRACT` decimal(2,0) NOT NULL,
  `HOUR_RATE` decimal(4,2) NOT NULL,
  `DATE_WORKED` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `HOURS`
--

INSERT INTO `HOURS` (`EMP_NUM`, `ATTRACT_NO`, `HOURS_PER_ATTRACT`, `HOUR_RATE`, `DATE_WORKED`) VALUES
('100', '10034', '6', '6.50', '2007-05-18'),
('100', '10034', '6', '6.50', '2007-05-20'),
('101', '10034', '6', '6.50', '2007-05-18'),
('102', '30012', '3', '5.99', '2007-05-23'),
('102', '30044', '6', '5.99', '2007-05-21'),
('102', '30044', '3', '5.99', '2007-05-22'),
('104', '30011', '6', '7.20', '2007-05-21'),
('104', '30012', '6', '7.20', '2007-05-22'),
('105', '10078', '3', '8.50', '2007-05-18'),
('105', '10098', '3', '8.50', '2007-05-18'),
('105', '10098', '6', '8.50', '2007-05-19');

-- --------------------------------------------------------

--
-- Stand-in structure for view `PARK_UK`
-- (See below for the actual view)
--
CREATE TABLE `PARK_UK` (
`PARK_CODE` varchar(10)
,`PARK_NAME` varchar(35)
,`PARK_CITY` varchar(50)
,`PARK_COUNTRY` char(2)
);

-- --------------------------------------------------------

--
-- Table structure for table `SALES`
--

CREATE TABLE `SALES` (
  `TRANSACTION_NO` decimal(10,0) NOT NULL,
  `PARK_CODE` varchar(10) DEFAULT NULL,
  `SALE_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SALES`
--

INSERT INTO `SALES` (`TRANSACTION_NO`, `PARK_CODE`, `SALE_DATE`) VALUES
('12781', 'FR1001', '2007-05-18'),
('12782', 'FR1001', '2007-05-18'),
('12783', 'FR1001', '2007-05-18'),
('12784', 'FR1001', '2007-05-18'),
('12785', 'FR1001', '2007-05-18'),
('12786', 'FR1001', '2007-05-18'),
('34534', 'UK3452', '2007-05-18'),
('34535', 'UK3452', '2007-05-18'),
('34536', 'UK3452', '2007-05-18'),
('34537', 'UK3452', '2007-05-18'),
('34538', 'UK3452', '2007-05-18'),
('34539', 'UK3452', '2007-05-18'),
('34540', 'UK3452', '2007-05-18'),
('34541', 'UK3452', '2007-05-18'),
('67589', 'ZA1342', '2007-05-18'),
('67590', 'ZA1342', '2007-05-18'),
('67591', 'ZA1342', '2007-05-18'),
('67592', 'ZA1342', '2007-05-18'),
('67593', 'ZA1342', '2007-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `SALES_LINE`
--

CREATE TABLE `SALES_LINE` (
  `TRANSACTION_NO` decimal(10,0) NOT NULL,
  `LINE_NO` decimal(2,0) NOT NULL,
  `TICKET_NO` decimal(10,0) NOT NULL,
  `LINE_QTY` decimal(4,0) NOT NULL DEFAULT 0,
  `LINE_PRICE` decimal(9,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SALES_LINE`
--

INSERT INTO `SALES_LINE` (`TRANSACTION_NO`, `LINE_NO`, `TICKET_NO`, `LINE_QTY`, `LINE_PRICE`) VALUES
('12781', '1', '13002', '2', '69.98'),
('12781', '2', '13001', '1', '14.99'),
('12782', '1', '13002', '2', '69.98'),
('12783', '1', '13003', '2', '41.98'),
('12784', '2', '13001', '1', '14.99'),
('12785', '1', '13001', '1', '14.99'),
('12785', '2', '13002', '1', '34.99'),
('12785', '3', '13002', '4', '139.96'),
('34534', '1', '88568', '4', '168.40'),
('34534', '2', '88567', '1', '22.50'),
('34534', '3', '89720', '2', '21.98'),
('34535', '1', '88568', '2', '84.20'),
('34536', '1', '89720', '2', '21.98'),
('34537', '1', '88568', '2', '84.20'),
('34537', '2', '88567', '1', '22.50'),
('34538', '1', '89720', '2', '21.98'),
('34539', '1', '89720', '2', '21.98'),
('34539', '2', '88568', '2', '84.20'),
('34540', '1', '88568', '4', '168.40'),
('34540', '2', '88567', '1', '22.50'),
('34540', '3', '89720', '2', '21.98'),
('34541', '1', '88568', '2', '84.20'),
('67589', '1', '67833', '2', '57.34'),
('67589', '2', '67832', '2', '37.12'),
('67590', '1', '67833', '2', '57.34'),
('67590', '2', '67832', '2', '37.12'),
('67591', '1', '67832', '1', '18.56'),
('67591', '2', '67855', '1', '12.12'),
('67592', '1', '67833', '4', '114.68'),
('67593', '1', '67833', '2', '57.34'),
('67593', '2', '67832', '2', '37.12');

-- --------------------------------------------------------

--
-- Table structure for table `THEMEPARK`
--

CREATE TABLE `THEMEPARK` (
  `PARK_CODE` varchar(10) NOT NULL,
  `PARK_NAME` varchar(35) NOT NULL,
  `PARK_CITY` varchar(50) DEFAULT NULL,
  `PARK_COUNTRY` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `THEMEPARK`
--

INSERT INTO `THEMEPARK` (`PARK_CODE`, `PARK_NAME`, `PARK_CITY`, `PARK_COUNTRY`) VALUES
('FR1001', 'FairyLand', 'PARIS', 'FR'),
('KP5678', 'Central Park', 'New York', 'US'),
('NL1202', 'Efling', 'NOORD', 'NL'),
('SP4533', 'AdventurePort', 'BARCELONA', 'SP'),
('SW2323', 'Labyrinthe', 'LAUSANNE', 'SW'),
('UK2622', 'MiniLand', 'WINDSOR', 'UK'),
('UK3452', 'PleasureLand', 'STOKE', 'UK'),
('WC5675', 'TOWN PARK', 'KARACHI', 'PK'),
('WC5676', 'NISHTAR PARK', 'KARACHI', 'PK'),
('WC5677', 'SOCIETY VEILS', 'KARACHI', 'PK'),
('ZA1342', 'GoldTown', 'JOHANNESBURG', 'ZA');

-- --------------------------------------------------------

--
-- Table structure for table `TICKET`
--

CREATE TABLE `TICKET` (
  `TICKET_NO` decimal(10,0) NOT NULL,
  `TICKET_PRICE` decimal(4,2) NOT NULL DEFAULT 0.00,
  `TICKET_TYPE` varchar(10) DEFAULT NULL,
  `PARK_CODE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TICKET`
--

INSERT INTO `TICKET` (`TICKET_NO`, `TICKET_PRICE`, `TICKET_TYPE`, `PARK_CODE`) VALUES
('11001', '24.99', 'Adult', 'SP4533'),
('11002', '14.99', 'Child', 'SP4533'),
('11003', '10.99', 'Senior', 'SP4533'),
('13001', '18.99', 'Child', 'FR1001'),
('13002', '34.99', 'Adult', 'FR1001'),
('13003', '20.99', 'Senior', 'FR1001'),
('67832', '18.56', 'Child', 'ZA1342'),
('67833', '28.67', 'Adult', 'ZA1342'),
('67855', '12.12', 'Senior', 'ZA1342'),
('88567', '22.50', 'Child', 'UK3452'),
('88568', '42.10', 'Adult', 'UK3452'),
('89720', '10.99', 'Senior', 'UK3452');

-- --------------------------------------------------------

--
-- Stand-in structure for view `TICKET_SALES`
-- (See below for the actual view)
--
CREATE TABLE `TICKET_SALES` (
`PARK_NAME` varchar(35)
,`MIN(LINE_PRICE)` decimal(9,2)
,`MAX(LINE_PRICE)` decimal(9,2)
,`AVG(LINE_PRICE)` decimal(13,6)
);

-- --------------------------------------------------------

--
-- Structure for view `EMPFR`
--
DROP TABLE IF EXISTS `EMPFR`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EMPFR`  AS SELECT `EMPLOYEE`.`EMP_NUM` AS `EMP_NUM`, `EMPLOYEE`.`EMP_TITLE` AS `EMP_TITLE`, `EMPLOYEE`.`EMP_LNAME` AS `EMP_LNAME`, `EMPLOYEE`.`EMP_FNAME` AS `EMP_FNAME`, `EMPLOYEE`.`EMP_DOB` AS `EMP_DOB`, `EMPLOYEE`.`EMP_HIRE_DATE` AS `EMP_HIRE_DATE`, `EMPLOYEE`.`EMP_AREA_CODE` AS `EMP_AREA_CODE`, `EMPLOYEE`.`EMP_PHONE` AS `EMP_PHONE`, `EMPLOYEE`.`PARK_CODE` AS `PARK_CODE` FROM `EMPLOYEE` WHERE `EMPLOYEE`.`PARK_CODE` = 'FR1001' ;

-- --------------------------------------------------------

--
-- Structure for view `EMP_DETAILS`
--
DROP TABLE IF EXISTS `EMP_DETAILS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EMP_DETAILS`  AS SELECT `E`.`EMP_NUM` AS `EMP_NUM`, `T`.`PARK_CODE` AS `PARK_CODE`, `T`.`PARK_NAME` AS `PARK_NAME`, `E`.`EMP_LNAME` AS `EMP_LNAME`, `E`.`EMP_FNAME` AS `EMP_FNAME`, `E`.`EMP_HIRE_DATE` AS `EMP_HIRE_DATE`, `E`.`EMP_DOB` AS `EMP_DOB` FROM (`EMPLOYEE` `E` join `THEMEPARK` `T` on(`E`.`PARK_CODE` = `T`.`PARK_CODE`)) ;

-- --------------------------------------------------------

--
-- Structure for view `PARK_UK`
--
DROP TABLE IF EXISTS `PARK_UK`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `PARK_UK`  AS SELECT `THEMEPARK`.`PARK_CODE` AS `PARK_CODE`, `THEMEPARK`.`PARK_NAME` AS `PARK_NAME`, `THEMEPARK`.`PARK_CITY` AS `PARK_CITY`, `THEMEPARK`.`PARK_COUNTRY` AS `PARK_COUNTRY` FROM `THEMEPARK` WHERE `THEMEPARK`.`PARK_COUNTRY` = 'UK' ;

-- --------------------------------------------------------

--
-- Structure for view `TICKET_SALES`
--
DROP TABLE IF EXISTS `TICKET_SALES`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `TICKET_SALES`  AS SELECT `T`.`PARK_NAME` AS `PARK_NAME`, min(`SL`.`LINE_PRICE`) AS `MIN(LINE_PRICE)`, max(`SL`.`LINE_PRICE`) AS `MAX(LINE_PRICE)`, avg(`SL`.`LINE_PRICE`) AS `AVG(LINE_PRICE)` FROM ((`THEMEPARK` `T` join `SALES` `S` on(`T`.`PARK_CODE` = `S`.`PARK_CODE`)) join `SALES_LINE` `SL` on(`S`.`TRANSACTION_NO` = `SL`.`TRANSACTION_NO`)) GROUP BY `T`.`PARK_NAME` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ATTRACTION`
--
ALTER TABLE `ATTRACTION`
  ADD PRIMARY KEY (`ATTRACT_NO`),
  ADD KEY `PARK_CODE` (`PARK_CODE`);

--
-- Indexes for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`EMP_NUM`),
  ADD KEY `PARK_CODE` (`PARK_CODE`),
  ADD KEY `EMP_LNAME_INDEX` (`EMP_LNAME`(8));

--
-- Indexes for table `HOURS`
--
ALTER TABLE `HOURS`
  ADD PRIMARY KEY (`EMP_NUM`,`ATTRACT_NO`,`DATE_WORKED`),
  ADD KEY `EMP_NUM` (`EMP_NUM`),
  ADD KEY `ATTRACT_NO` (`ATTRACT_NO`);

--
-- Indexes for table `SALES`
--
ALTER TABLE `SALES`
  ADD PRIMARY KEY (`TRANSACTION_NO`),
  ADD KEY `PARK_CODE` (`PARK_CODE`);

--
-- Indexes for table `SALES_LINE`
--
ALTER TABLE `SALES_LINE`
  ADD PRIMARY KEY (`TRANSACTION_NO`,`LINE_NO`),
  ADD KEY `TRANSACTION_NO` (`TRANSACTION_NO`),
  ADD KEY `TICKET_NO` (`TICKET_NO`);

--
-- Indexes for table `THEMEPARK`
--
ALTER TABLE `THEMEPARK`
  ADD PRIMARY KEY (`PARK_CODE`);

--
-- Indexes for table `TICKET`
--
ALTER TABLE `TICKET`
  ADD PRIMARY KEY (`TICKET_NO`),
  ADD KEY `PARK_CODE` (`PARK_CODE`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ATTRACTION`
--
ALTER TABLE `ATTRACTION`
  ADD CONSTRAINT `FK_ATTRACT_PARK` FOREIGN KEY (`PARK_CODE`) REFERENCES `THEMEPARK` (`PARK_CODE`);

--
-- Constraints for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `FK_EMP_PARK` FOREIGN KEY (`PARK_CODE`) REFERENCES `THEMEPARK` (`PARK_CODE`);

--
-- Constraints for table `HOURS`
--
ALTER TABLE `HOURS`
  ADD CONSTRAINT `FK_HOURS_ATTRACT` FOREIGN KEY (`ATTRACT_NO`) REFERENCES `ATTRACTION` (`ATTRACT_NO`),
  ADD CONSTRAINT `FK_HOURS_EMP` FOREIGN KEY (`EMP_NUM`) REFERENCES `EMPLOYEE` (`EMP_NUM`);

--
-- Constraints for table `SALES`
--
ALTER TABLE `SALES`
  ADD CONSTRAINT `FK_SALES_PARK` FOREIGN KEY (`PARK_CODE`) REFERENCES `THEMEPARK` (`PARK_CODE`);

--
-- Constraints for table `SALES_LINE`
--
ALTER TABLE `SALES_LINE`
  ADD CONSTRAINT `FK_SALES_LINE_SALES` FOREIGN KEY (`TRANSACTION_NO`) REFERENCES `SALES` (`TRANSACTION_NO`),
  ADD CONSTRAINT `FK_SALES_LINE_TICKET` FOREIGN KEY (`TICKET_NO`) REFERENCES `TICKET` (`TICKET_NO`);

--
-- Constraints for table `TICKET`
--
ALTER TABLE `TICKET`
  ADD CONSTRAINT `FK_TICKET_PARK` FOREIGN KEY (`PARK_CODE`) REFERENCES `THEMEPARK` (`PARK_CODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
