-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2018 at 05:04 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `basic`
--

CREATE TABLE IF NOT EXISTS `basic` (
  `Name` varchar(20) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Gst` varchar(15) NOT NULL,
  `HsnCode` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic`
--

INSERT INTO `basic` (`Name`, `Address`, `Phone`, `Gst`, `HsnCode`) VALUES
('MP Aerotic India Pvt', 'Bhopal Madhya Pradesh', '07554250317', '12DPFPC3456B7Z8', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1009 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`) VALUES
(1000),
(1001),
(1002),
(1003),
(1004),
(1005),
(1006),
(1007),
(1008);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dei` varchar(200) NOT NULL,
  `value` decimal(11,3) NOT NULL,
  `quantity` decimal(11,3) NOT NULL,
  `total` decimal(11,3) NOT NULL,
  `fk_id_Invoice` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id1` (`fk_id_Invoice`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `invoice_item`
--

INSERT INTO `invoice_item` (`id`, `name`, `dei`, `value`, `quantity`, `total`, `fk_id_Invoice`) VALUES
(4, 'SLD', 'Fuel Type', '100.000', '1.000', '100.000', 1000),
(5, 'SLD', 'Electronic Type', '110.000', '1.000', '110.000', 1000),
(6, 'Roter Seal', 'Seal', '20.000', '2.000', '40.000', 1000),
(7, 'SLD', 'Fuel Type', '120.000', '2.000', '240.000', 1001),
(8, 'SLD', 'Electronic Type', '200.000', '2.000', '400.000', 1001),
(9, 'Roter Seal', 'Seal', '30.000', '2.000', '60.000', 1001),
(10, 'SLD', 'Fuel Type', '1600.000', '50.000', '80000.000', 1002),
(11, 'SLD', 'Electronic Type', '1800.000', '10.000', '18000.000', 1002),
(12, 'Roter Seal', 'Seal', '0.000', '0.000', '0.000', 1002),
(13, 'SLD', 'Fuel Type', '150.000', '2.000', '300.000', 1003),
(14, 'SLD', 'Electronic Type', '100.000', '2.000', '200.000', 1003),
(15, 'Roter Seal', 'Seal', '50.000', '4.000', '200.000', 1003),
(16, 'SLD', 'Fuel Type', '125.000', '1.000', '0.000', 1004),
(17, 'SLD', 'Electronic Type', '175.000', '1.000', '0.000', 1004),
(18, 'Roter Seal', 'Seal', '100.000', '2.000', '0.000', 1004),
(19, 'SLD', 'Fuel Type', '125.000', '1.000', '0.000', 1004),
(20, 'SLD', 'Electronic Type', '175.000', '1.000', '0.000', 1004),
(21, 'Roter Seal', 'Seal', '100.000', '2.000', '0.000', 1004),
(22, 'SLD', 'Fuel Type', '125.000', '1.000', '0.000', 1004),
(23, 'SLD', 'Electronic Type', '175.000', '1.000', '0.000', 1004),
(24, 'Roter Seal', 'Seal', '100.000', '2.000', '0.000', 1004),
(25, 'SLD', 'Fuel Type', '125.000', '1.000', '0.000', 1007),
(26, 'SLD', 'Electronic Type', '175.000', '1.000', '0.000', 1007),
(27, 'Roter Seal', 'Seal', '100.000', '2.000', '0.000', 1007),
(28, 'SLD', 'Fuel Type', '20000.000', '2.000', '40000.000', 1008),
(29, 'SLD', 'Electronic Type', '5000.000', '1.000', '5000.000', 1008),
(30, 'Roter Seal', 'Seal', '1000.000', '5.000', '5000.000', 1008);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_more`
--

CREATE TABLE IF NOT EXISTS `invoice_more` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_date` varchar(30) NOT NULL,
  `subtotal` decimal(11,3) NOT NULL,
  `gst` decimal(11,3) NOT NULL,
  `total` decimal(11,3) NOT NULL,
  `paid` decimal(11,3) NOT NULL,
  `due` decimal(11,3) NOT NULL,
  `fk_ID_Invoice` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ID_Invoice` (`fk_ID_Invoice`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `invoice_more`
--

INSERT INTO `invoice_more` (`id`, `invoice_date`, `subtotal`, `gst`, `total`, `paid`, `due`, `fk_ID_Invoice`) VALUES
(1, 'May 08, 2018', '250.000', '45.000', '295.000', '100.000', '195.000', 1000),
(2, 'May 08, 2018', '700.000', '126.000', '826.000', '500.000', '326.000', 1001),
(3, 'May 08, 2018', '98000.000', '17640.000', '115640.000', '50000.000', '65640.000', 1002),
(4, 'May 08, 2018', '700.000', '126.000', '826.000', '526.000', '300.000', 1003),
(5, 'May 10, 2018', '50000.000', '9000.000', '59000.000', '9000.000', '50000.000', 1008);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `Name`, `Type`) VALUES
(1, 'SLD', 'Fuel Type'),
(2, 'SLD', 'Electronic Type'),
(3, 'Roter Seal', 'Seal');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_item`
--
ALTER TABLE `invoice_item`
  ADD CONSTRAINT `id1` FOREIGN KEY (`fk_id_Invoice`) REFERENCES `invoice` (`id`);

--
-- Constraints for table `invoice_more`
--
ALTER TABLE `invoice_more`
  ADD CONSTRAINT `id_more` FOREIGN KEY (`fk_ID_Invoice`) REFERENCES `invoice` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
