-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql113.epizy.com
-- Generation Time: Feb 15, 2022 at 11:53 PM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epiz_25108002_invoice_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `basic`
--

CREATE TABLE `basic` (
  `Name` varchar(20) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Gst` varchar(15) NOT NULL,
  `HsnCode` varchar(15) NOT NULL,
  `YearCode` varchar(15) NOT NULL,
  `InvoiceCount` int(11) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(3) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic`
--

INSERT INTO `basic` (`Name`, `Address`, `Phone`, `Gst`, `HsnCode`, `YearCode`, `InvoiceCount`, `updated_at`, `updated_by`) VALUES
('Saniya Enterprises', 'Bhopal Madhya Pradesh', '8770557511', '23CPFPD6088B1Z8', 'MP04TA0123', '2018-19', 552, '2022-01-11 06:55:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `rtoCode` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `ownerName` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `technicianName` varchar(255) NOT NULL,
  `vehicleNo` varchar(255) NOT NULL,
  `engineNo` varchar(255) NOT NULL,
  `chassisNo` varchar(255) NOT NULL,
  `vehicleClass` varchar(255) NOT NULL,
  `vehicleModel` varchar(255) NOT NULL,
  `fuelType` varchar(255) NOT NULL,
  `vehicleNorms` varchar(255) NOT NULL,
  `testFees` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `makerClassification` varchar(255) NOT NULL,
  `registrationDate` date NOT NULL,
  `speed` varchar(255) NOT NULL,
  `installationDate` date NOT NULL,
  `validity` varchar(255) NOT NULL,
  `roto` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `invoiceNo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `state`, `rtoCode`, `district`, `ownerName`, `mobile`, `address`, `technicianName`, `vehicleNo`, `engineNo`, `chassisNo`, `vehicleClass`, `vehicleModel`, `fuelType`, `vehicleNorms`, `testFees`, `manufacturer`, `makerClassification`, `registrationDate`, `speed`, `installationDate`, `validity`, `roto`, `image`, `invoiceNo`) VALUES
(1, 'Madhya Pradesh', 'MP-04', 'Bhopal', 'ambuj dubey', '9753750955', '20 a sachchidanand nagar bhopal', 'harshuj', 'mp 04 cg 3355', '123456', '123dxju', 'LGV', 'tata indica', 'Diesel', 'BS IV', '100', 'tata', 'vista', '2021-12-29', '110', '2022-01-24', '12', '23534536', 'uploads/ambuj_dubey/jpeg/ambuj.jpeg', '554785867');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `subtotal` decimal(11,3) DEFAULT 0.000,
  `gst` decimal(11,3) DEFAULT 0.000,
  `total` decimal(11,3) DEFAULT 0.000,
  `paid` decimal(11,3) DEFAULT 0.000,
  `due` decimal(11,3) DEFAULT 0.000,
  `address` longtext DEFAULT NULL,
  `customer_address` longtext DEFAULT NULL,
  `product_details` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `invoice_date`, `subtotal`, `gst`, `total`, `paid`, `due`, `address`, `customer_address`, `product_details`, `created_at`, `updated_at`, `updated_by`) VALUES
(24, '501/2018-19', '2021-02-12', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"B P FOOD\",\"PartyAddress\":\"HAA5  DEENDAYAL\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP07GA5278\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-12 10:14:15', '2021-02-12 10:14:15', 'gouravdubey'),
(20, '498/2018-19', '2021-01-29', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"RAHUL RAI\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LR1747\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"\",\"productQuantity\":\"\",\"productPrize\":\"0.00\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-01-29 11:36:40', '2021-01-29 11:36:40', 'gouravdubey'),
(21, '498/2018-19', '2021-02-09', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SUMIT KUMAR\",\"PartyAddress\":\"329 F SECTOR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04GB9684\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-09 08:45:33', '2021-02-09 08:45:33', 'gouravdubey'),
(22, '499/2018-19', '2021-02-11', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SURENDRA VERMA\",\"PartyAddress\":\"E4 VILL BAIRAGARH\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04LC5903\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-11 09:40:16', '2021-02-11 09:40:16', 'gouravdubey'),
(23, '500/2018-19', '2021-02-11', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"KIM CONTAINIR LINE\",\"PartyAddress\":\"CHINAR FORTUNE CITY\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MH12CT4483\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-11 09:45:25', '2021-02-11 09:45:25', 'gouravdubey'),
(25, '502/2018-19', '2021-02-12', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"B P FOOD\",\"PartyAddress\":\"HAA5  DEENDAYAL\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP07GA5276\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-12 10:16:49', '2021-02-12 10:16:49', 'gouravdubey'),
(26, '503/2018-19', '2021-02-16', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"KAILASH SINGH\",\"PartyAddress\":\"H NO 231SHEKPURA\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LP2391\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-16 08:58:01', '2021-02-16 08:58:01', 'gouravdubey'),
(27, '504/2018-19', '2021-02-17', '220339.000', '39661.020', '260000.020', '260000.020', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"OM SAI RAM\",\"PartyAddress\":\"HP PETROL PUMP OPP GOVT HOSPITAL KESHLI\",\"PartyPhone\":\"9993778240\",\"PartyGst\":\"23ARTPR1104J1ZQ\",\"Registration\":\"\",\"header\":\"INVOICE\"}', '[{\"productName\":\"POLLUTION UNDER CONTROL MACHINE\",\"productDesc\":\"Multi Gas Analyzer(Petrol/LPG/CNG) Model:PSP18 Sr No.02\",\"productCost\":\"120000\",\"productQuantity\":\"1\",\"productPrize\":\"120000.00\"}]', '2021-02-17 08:23:54', '2021-03-12 11:46:44', 'gouravdubey'),
(28, '505/2018-19', '2021-02-22', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"DHIRENDRA SINGH\",\"PartyAddress\":\"3121045 BHIM NAGAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04GA4121\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-22 09:21:11', '2021-02-22 09:21:11', 'gouravdubey'),
(29, '506/2018-19', '2021-02-22', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"LEELA KISHAN LODHI\",\"PartyAddress\":\"17 CHANDBAD VILL\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04GA7511\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-22 10:59:42', '2021-02-22 10:59:42', 'gouravdubey'),
(30, '507/2018-19', '2021-02-24', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"KIM CONTAINIR LINE\",\"PartyAddress\":\"CHINAR FORTUNE CITY\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MH12CT4483\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-24 11:24:14', '2021-02-24 11:24:14', 'gouravdubey'),
(31, '508/2018-19', '2021-02-26', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"ANIL KUMAR DUBEY\",\"PartyAddress\":\"HANUMAN NAGAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP19L0719\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-26 08:37:15', '2021-02-26 08:37:15', 'gouravdubey'),
(32, '509/2018-19', '2021-02-26', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"GOPAL  SINGH\",\"PartyAddress\":\"150 M P NAGAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04HE2329\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-26 08:46:44', '2021-02-26 08:46:44', 'gouravdubey'),
(33, '510/2018-19', '2021-02-26', '3500.000', '630.000', '4130.000', '4130.000', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"ARISTO PHARMA\",\"PartyAddress\":\"E770 ARERA COLONY\",\"PartyPhone\":\"\",\"PartyGst\":\"23AAACA4495N1ZG\",\"Registration\":\"MP04BA5405\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"\",\"productQuantity\":\"\",\"productPrize\":\"0.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"3500\",\"productQuantity\":\"1\",\"productPrize\":\"3500.00\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-26 08:52:10', '2021-02-26 08:52:10', 'gouravdubey'),
(34, '511/2018-19', '2021-02-26', '3500.000', '630.000', '4130.000', '4130.000', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"ARISTO PHARME\",\"PartyAddress\":\"E770 SBI SOCIETY\",\"PartyPhone\":\"\",\"PartyGst\":\"23AAACA4495N1ZG\",\"Registration\":\"MP04BA9052\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"0.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"3500\",\"productQuantity\":\"1\",\"productPrize\":\"3500.00\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-02-26 08:56:37', '2021-02-26 08:56:37', 'gouravdubey'),
(35, '512/2018-19', '2021-03-12', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"MANZOOR ULLAH\",\"PartyAddress\":\"12 SARAI M H K\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1VC0785\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-12 09:05:09', '2021-03-12 09:05:09', 'gouravdubey'),
(36, '513/2018-19', '2021-03-15', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"MS SANDEEP SALES\",\"PartyAddress\":\"02 RAMAN APPT\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04GA3666\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-15 07:21:32', '2021-03-15 07:21:32', 'gouravdubey'),
(37, '514/2018-19', '2021-03-16', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SMT PANNA MEHTO\",\"PartyAddress\":\"75 GOPAL NAGAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04GA0732\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-16 07:44:42', '2021-03-16 07:44:42', 'gouravdubey'),
(38, '515/2018-19', '2021-03-16', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"NAHAR SPINNING MILLS\",\"PartyAddress\":\"17 SHREE GOLDEN\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04GA3678\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-16 11:43:59', '2021-03-16 11:43:59', 'gouravdubey'),
(39, '516/2018-19', '2021-03-18', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"MALKHAN SINGH MEENA\",\"PartyAddress\":\"17 WARD NO 3 CHIKLOD\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LR6619\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-18 07:42:20', '2021-03-18 07:42:20', 'gouravdubey'),
(40, '517/2018-19', '2021-03-22', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-22 10:51:47', '2021-03-22 10:51:47', 'gouravdubey'),
(41, '518/2018-19', '2021-03-23', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"AMIT RAJPUT\",\"PartyAddress\":\"EWS J 277 KAMLA NAGAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-23 08:24:29', '2021-03-23 08:24:29', 'gouravdubey'),
(42, '519/2018-19', '2021-03-24', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"KAPIL SAHU\",\"PartyAddress\":\"H NO 31 NEW BASTI\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04PA6999\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-24 06:40:15', '2021-03-24 06:40:15', 'gouravdubey'),
(43, '520/2018-19', '2021-03-24', '600.000', '108.000', '708.000', '708.000', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"I H M PRINCIPAL\",\"PartyAddress\":\"IHM BHOPAL\",\"PartyPhone\":\"9770222300\",\"PartyGst\":\"23AABAI1517J1Z2\",\"Registration\":\"MP04CX6872\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"600\",\"productQuantity\":\"1\",\"productPrize\":\"600 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-24 10:51:35', '2021-03-24 10:51:35', 'gouravdubey'),
(44, '521/2018-19', '2021-03-30', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"OM PRAKASH SEN\",\"PartyAddress\":\"192 GRAM KULHOR TEH\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04GA7712\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-30 08:31:08', '2021-03-30 08:31:08', 'gouravdubey'),
(45, '522/2018-19', '2021-03-30', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"A V CONSTRUCTIONS\",\"PartyAddress\":\"GONDERMAU\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"HR63A6765\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-30 11:41:59', '2021-03-30 11:41:59', 'gouravdubey'),
(46, '523/2018-19', '2021-03-30', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"A V CONSTRUCTIONS\",\"PartyAddress\":\"GONDER MAU\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"HR63A6764\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-30 11:44:39', '2021-03-30 11:44:39', 'gouravdubey'),
(47, '524/2018-19', '2021-06-30', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"KABRA H P GAS\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MH04GC5028\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-06-30 06:25:31', '2021-06-30 06:25:31', 'gouravdubey'),
(48, '525/2018-19', '2021-07-02', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"M S BLUE FLAME\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MH43Y4530\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-07-02 07:56:44', '2021-07-02 07:56:44', 'gouravdubey'),
(49, '526/2018-19', '2021-07-06', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"MR KAMLESH UBNARE\",\"PartyAddress\":\"PATEL WARD SADAR BETUL\",\"PartyPhone\":\"9691765900\",\"PartyGst\":\"\",\"Registration\":\"MP48H0497\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"0 00\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-07-06 10:05:12', '2021-07-06 10:05:12', 'gouravdubey'),
(50, '527/2018-19', '2021-07-09', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"ASHISH JAIN\",\"PartyAddress\":\"H NO 18 RAMNIWAS KAYASTHPURA\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP09HF8523\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-07-09 12:16:05', '2021-07-09 12:16:05', 'gouravdubey'),
(51, '528/2018-19', '2021-07-14', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SHALOM SPECIAL SCHOOL\",\"PartyAddress\":\"NIRMALA MATA OCIETY JNCT\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04PA1419\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-07-14 10:05:26', '2021-07-14 10:05:26', 'gouravdubey'),
(52, '529/2018-19', '2021-07-15', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"M S BLUE FLAME\",\"PartyAddress\":\"GRB COMPLEX TTNAGAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MH43Y4530\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-07-15 07:01:19', '2021-07-15 07:01:19', 'gouravdubey'),
(53, '530/2018-19', '2021-07-16', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"TABREZ KHAN\",\"PartyAddress\":\"1667 VILAL MASZID\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-07-16 10:21:21', '2021-07-16 10:21:21', 'gouravdubey'),
(54, '531/2018-19', '2021-07-30', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SHAHZAD KHAN\",\"PartyAddress\":\"H NO 314 BUS STOP GANDHI NAGAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LR4004\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-07-30 07:48:50', '2021-07-30 07:48:50', 'gouravdubey'),
(55, '532/2018-19', '2021-08-03', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"ASHOK KU CHOUDHARY\",\"PartyAddress\":\"15 2 COSTUM COLONY\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04HE2233\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-08-03 08:32:50', '2021-08-03 08:32:50', 'gouravdubey'),
(56, '533/2018-19', '2021-08-03', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"MANOJ SINGH\",\"PartyAddress\":\"66 AADAMPUR CHAWNI\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LT8103\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-08-03 09:25:29', '2021-08-03 09:25:29', 'gouravdubey'),
(57, '534/2018-19', '2021-08-25', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SABNAM PARVEEN\",\"PartyAddress\":\"2 SHAKTI NAGAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04CN6781\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-08-25 06:12:21', '2021-08-25 06:12:21', 'gouravdubey'),
(58, '535/2018-19', '2021-08-25', '19200.000', '3456.000', '22656.000', '22656.000', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"WAHEGURU INFRATECTURE\",\"PartyAddress\":\"RO 2ND FLOOR JABALPUR\",\"PartyPhone\":\"7000369649\",\"PartyGst\":\"23ALWPA5934E1Z5\",\"Registration\":\"\",\"header\":\"INVOICE\"}', '[{\"productName\":\"GPS\",\"productDesc\":\"VEHICLE TRACKING SYSTEM\",\"productCost\":\"3200\",\"productQuantity\":\"6\",\"productPrize\":\"19200 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-08-25 11:51:01', '2021-08-25 11:51:01', 'gouravdubey'),
(59, '536/2018-19', '2021-08-27', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"RAHUL RAGHUWANSHI\",\"PartyAddress\":\"H NO460 WARD NO 9\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LR5811\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-08-27 08:09:34', '2021-08-27 08:09:34', 'gouravdubey'),
(60, '537/2018-19', '2021-09-07', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"ABDUL RASHID KHAN\",\"PartyAddress\":\"17 AKABARPUR KOLAR\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04LC7609\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-09-07 06:22:49', '2021-09-07 06:22:49', 'gouravdubey');
INSERT INTO `invoices` (`id`, `invoice_id`, `invoice_date`, `subtotal`, `gst`, `total`, `paid`, `due`, `address`, `customer_address`, `product_details`, `created_at`, `updated_at`, `updated_by`) VALUES
(61, '538/2018-19', '2021-09-29', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"RAHUL KARANJIYA\",\"PartyAddress\":\"HNO 685 PURUSOTTAM SEMRA HNO 685 PURUSO\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04LC5248\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720 000\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"0 00\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-09-29 06:51:52', '2021-09-29 06:51:52', 'gouravdubey'),
(62, '539/2018-19', '2021-11-01', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"DHAN SINGH\",\"PartyAddress\":\"HNO 20BAIRGARH CHICHLI\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04LC5741\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-11-01 11:35:36', '2021-11-01 11:35:36', 'gouravdubey'),
(63, '540/2018-19', '2021-11-10', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"PRAKASH BANJARA\",\"PartyAddress\":\"22 HARIPURA KOLUA\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LT8847\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720 000\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-11-10 09:16:17', '2021-11-10 09:16:17', 'gouravdubey'),
(64, '541/2018-19', '2021-11-17', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"MOHD SAJID KHAN\",\"PartyAddress\":\"H NO 1754 KOLAR ROAD\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"RJ11GA7691\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720 000\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-11-17 10:43:52', '2021-11-17 10:43:52', 'gouravdubey'),
(65, '542/2018-19', '2021-11-22', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"FAIZAN KHAN\",\"PartyAddress\":\"1 PHQ POLICE LINE\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04HE9805\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-11-22 07:53:53', '2021-11-22 07:53:53', 'gouravdubey'),
(66, '543/2018-19', '2021-11-22', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SADIK KHAN\",\"PartyAddress\":\"GRAM LALARIYA\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"UP75M6697\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-11-22 08:20:26', '2021-11-22 08:20:26', 'gouravdubey'),
(67, '544/2018-19', '2021-11-23', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"RAMNATH\",\"PartyAddress\":\"NAFEES 124 EKTA\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LT0210\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-11-23 07:42:59', '2021-11-23 07:42:59', 'gouravdubey'),
(68, '545/2018-19', '2021-11-23', '5000.000', '900.000', '5900.000', '5900.000', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SHRI ANANDPUR TRUST\",\"PartyAddress\":\"ASHOK NAGAR\",\"PartyPhone\":\"9907441100\",\"PartyGst\":\"AAATS2629F\",\"Registration\":\"\",\"header\":\"INVOICE\"}', '[{\"productName\":\"MP08F0322\",\"productDesc\":\"Fuel Type\",\"productCost\":\"2500\",\"productQuantity\":\"1\",\"productPrize\":\"2500 00\"},{\"productName\":\"MP08D2278\",\"productDesc\":\"Fuel Type\",\"productCost\":\"2500\",\"productQuantity\":\"1\",\"productPrize\":\"2500 00\"}]', '2021-11-23 12:30:34', '2021-11-23 12:30:34', 'gouravdubey'),
(69, '546/2018-19', '2021-12-02', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"PRADEEP SAXENA\",\"PartyAddress\":\"J L 893 W N 27 KOTRA\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04CP4090\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-12-02 07:34:00', '2021-12-02 07:34:00', 'gouravdubey'),
(70, '547/2018-19', '2021-12-14', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"RAKESH\",\"PartyAddress\":\"216 GRAM BILKHIRIYA\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LT4181\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-12-14 10:21:27', '2021-12-14 10:21:27', 'gouravdubey'),
(71, '548/2018-19', '2021-12-15', '186441.000', '33559.380', '220000.380', '220000.380', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"Swati Sengar\",\"PartyAddress\":\"Bhagwat Nagar 480661\",\"PartyPhone\":\"7000386619\",\"PartyGst\":\"\",\"Registration\":\"\",\"header\":\"INVOICE\"}', '[{\"productName\":\"Component  PUC Equipment Model   Serial No  \",\"productDesc\":\"Semzy Smoke Meter NAS 04 Sem 162\",\"productCost\":\"88440\",\"productQuantity\":\"1\",\"productPrize\":\"88440 00\"},{\"productName\":\"Component   PUC Equipment Model   Serial No  \",\"productDesc\":\"4 5 Gas Analyser NAG 06 Sem 067\",\"productCost\":\"98001\",\"productQuantity\":\"1\",\"productPrize\":\"98001 00\"}]', '2021-12-15 07:19:58', '2021-12-15 07:19:58', 'gouravdubey'),
(72, '549/2018-19', '2021-12-16', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"MUBARIQ KHAN\",\"PartyAddress\":\"H NO 830 GALI NO 16 SHARDA NAGAR NARIYAL KHEDA\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1LW3741\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-12-16 07:36:49', '2021-12-16 07:36:49', 'gouravdubey'),
(73, '550/2018-19', '2022-01-05', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"BHUPENDRA SINGH\",\"PartyAddress\":\"ECHAKPURA KHUSHI\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04LC5374\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720 00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera\",\"productDesc\":\"GPS camera details\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0 000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2022-01-05 12:24:29', '2022-01-05 12:24:29', 'gouravdubey'),
(74, '551/2018-19', '2022-01-11', '10500.000', '1890.000', '12390.000', '12390.000', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"SATKIRAT HIGHWAYS PRIVATE LIMITED\",\"PartyAddress\":\"102 ABHILASH ADARSH NAGAR NARMADA ROAD\",\"PartyPhone\":\"9669234225\",\"PartyGst\":\"23ABECS0718D1ZV\",\"Registration\":\"\",\"header\":\"INVOICE\"}', '[{\"productName\":\"GPS  Vehicle Tracking Device \",\"productDesc\":\"MP13DA1510 IMEI No  862292050386762\",\"productCost\":\"3200\",\"productQuantity\":\"1\",\"productPrize\":\"3200 00\"},{\"productName\":\"GPS  Vehicle Tracking Device \",\"productDesc\":\"MP21 9644 IMEI No  862292050386960\",\"productCost\":\"3200\",\"productQuantity\":\"1\",\"productPrize\":\"3200 00\"},{\"productName\":\"GPS  Vehicle Tracking Device \",\"productDesc\":\"MP09GH9572 IMEI No  862292050387596\",\"productCost\":\"3200\",\"productQuantity\":\"1\",\"productPrize\":\"3200 00\"},{\"productName\":\"GPS  Vehicle Tracking Device \",\"productDesc\":\"INSTALLATION\",\"productCost\":\"300\",\"productQuantity\":\"3\",\"productPrize\":\"900 00\"}]', '2022-01-11 06:55:21', '2022-01-11 06:55:21', 'gouravdubey');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(6) NOT NULL,
  `map_id` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `map_id`, `created_at`, `type`, `info`, `table_name`, `details`) VALUES
(1, 1, '2020-10-02 17:50:56', 'login', 'gouravdubey', 'users', NULL),
(2, 1, '2020-10-03 04:09:56', 'login', 'gouravdubey', 'users', NULL),
(3, 1, '2020-10-03 04:59:36', 'login', 'gouravdubey', 'users', NULL),
(4, 1, '2020-10-03 05:09:25', 'login', 'gouravdubey', 'users', NULL),
(5, 1, '2020-10-03 06:26:45', 'logout', 'gouravdubey', 'users', NULL),
(6, 1, '2020-10-03 06:26:58', 'login', 'gouravdubey', 'users', NULL),
(7, 1, '2020-10-03 06:58:05', 'logout', 'gouravdubey', 'users', NULL),
(8, 1, '2020-10-03 06:58:05', 'logout', 'gouravdubey', 'users', NULL),
(9, 1, '2020-10-03 06:58:05', 'logout', 'gouravdubey', 'users', NULL),
(10, 1, '2020-10-03 06:58:05', 'logout', 'gouravdubey', 'users', NULL),
(11, 1, '2020-10-03 06:58:25', 'login', 'gouravdubey', 'users', NULL),
(12, 1, '2020-10-03 06:59:25', 'logout', 'gouravdubey', 'users', NULL),
(13, 1, '2020-10-03 06:59:25', 'logout', 'gouravdubey', 'users', NULL),
(14, 1, '2020-10-03 06:59:26', 'logout', 'gouravdubey', 'users', NULL),
(15, 1, '2020-10-03 06:59:26', 'logout', 'gouravdubey', 'users', NULL),
(16, 1, '2020-10-03 07:00:00', 'login', 'gouravdubey', 'users', NULL),
(17, 1, '2020-10-03 22:14:39', 'login', 'gouravdubey', 'users', NULL),
(18, 1, '2020-10-04 02:53:27', 'login', 'gouravdubey', 'users', NULL),
(19, 1, '2020-10-04 07:46:19', 'login', 'gouravdubey', 'users', NULL),
(20, 1, '2020-10-04 07:59:35', 'login', 'gouravdubey', 'users', NULL),
(21, 1, '2020-10-05 12:44:19', 'login', 'gouravdubey', 'users', NULL),
(22, 1, '2020-10-06 18:45:14', 'login', 'gouravdubey', 'users', NULL),
(23, 1, '2020-10-07 07:42:52', 'login', 'gouravdubey', 'users', NULL),
(24, 1, '2020-10-07 07:48:16', 'logout', 'gouravdubey', 'users', NULL),
(25, 1, '2020-10-07 07:48:37', 'login', 'gouravdubey', 'users', NULL),
(26, 1, '2020-10-07 08:02:02', 'login', 'gouravdubey', 'users', NULL),
(27, 1, '2020-10-08 08:32:07', 'login', 'gouravdubey', 'users', NULL),
(28, 1, '2020-10-10 13:42:04', 'login', 'gouravdubey', 'users', NULL),
(29, 1, '2020-10-10 14:10:27', 'login', 'gouravdubey', 'users', NULL),
(30, 1, '2020-10-10 14:20:17', 'login', 'gouravdubey', 'users', NULL),
(31, 1, '2020-10-11 03:26:04', 'login', 'gouravdubey', 'users', NULL),
(32, 1, '2020-10-11 03:26:04', 'login', 'gouravdubey', 'users', NULL),
(33, 1, '2020-10-12 08:04:28', 'login', 'gouravdubey', 'users', NULL),
(34, 1, '2020-10-12 08:24:54', 'login', 'gouravdubey', 'users', NULL),
(35, 1, '2020-10-12 18:18:09', 'logout', 'gouravdubey', 'users', NULL),
(36, 1, '2020-10-12 18:18:09', 'logout', 'gouravdubey', 'users', NULL),
(37, 1, '2020-10-12 18:18:09', 'logout', 'gouravdubey', 'users', NULL),
(38, 1, '2020-10-12 18:18:09', 'logout', 'gouravdubey', 'users', NULL),
(39, 1, '2020-10-13 09:14:51', 'login', 'gouravdubey', 'users', NULL),
(40, 1, '2020-10-13 09:14:53', 'login', 'gouravdubey', 'users', NULL),
(41, 1, '2020-10-13 09:15:00', 'logout', 'gouravdubey', 'users', NULL),
(42, 1, '2020-10-13 09:15:00', 'logout', 'gouravdubey', 'users', NULL),
(43, 1, '2020-10-13 09:15:00', 'logout', 'gouravdubey', 'users', NULL),
(44, 1, '2020-10-13 09:15:01', 'logout', 'gouravdubey', 'users', NULL),
(45, 1, '2020-10-13 09:15:12', 'login', 'gouravdubey', 'users', NULL),
(46, 1, '2020-10-17 02:44:14', 'login', 'gouravdubey', 'users', NULL),
(47, 1, '2020-10-17 11:11:16', 'logout', 'gouravdubey', 'users', NULL),
(48, 1, '2020-10-17 11:11:16', 'logout', 'gouravdubey', 'users', NULL),
(49, 1, '2020-10-17 11:11:16', 'logout', 'gouravdubey', 'users', NULL),
(50, 1, '2020-10-17 11:11:16', 'logout', 'gouravdubey', 'users', NULL),
(51, 1, '2020-10-17 11:11:37', 'login', 'gouravdubey', 'users', NULL),
(52, 1, '2020-10-17 12:31:12', 'login', 'gouravdubey', 'users', NULL),
(53, 1, '2020-10-23 11:33:24', 'login', 'gouravdubey', 'users', NULL),
(54, 1, '2020-10-25 23:06:19', 'login', 'gouravdubey', 'users', NULL),
(55, 1, '2020-10-28 23:41:42', 'login', 'gouravdubey', 'users', NULL),
(56, 1, '2020-10-28 23:43:47', 'logout', 'gouravdubey', 'users', NULL),
(57, 1, '2021-01-04 02:53:57', 'login', 'gouravdubey', 'users', NULL),
(58, 1, '2021-01-22 11:06:36', 'login', 'gouravdubey', 'users', NULL),
(59, 1, '2021-01-27 05:28:40', 'login', 'gouravdubey', 'users', NULL),
(60, 1, '2021-01-27 12:30:53', 'login', 'gouravdubey', 'users', NULL),
(61, 1, '2021-01-27 14:20:01', 'login', 'gouravdubey', 'users', NULL),
(62, 1, '2021-01-29 09:19:42', 'login', 'gouravdubey', 'users', NULL),
(63, 1, '2021-01-29 09:25:14', 'login', 'gouravdubey', 'users', NULL),
(64, 1, '2021-01-29 11:09:46', 'login', 'gouravdubey', 'users', NULL),
(65, 1, '2021-01-29 11:16:22', 'login', 'gouravdubey', 'users', NULL),
(66, 1, '2021-01-29 11:23:24', 'login', 'gouravdubey', 'users', NULL),
(67, 1, '2021-01-29 11:27:06', 'login', 'gouravdubey', 'users', NULL),
(68, 1, '2021-01-29 11:29:08', 'login', 'gouravdubey', 'users', NULL),
(69, 1, '2021-01-29 11:29:08', 'login', 'gouravdubey', 'users', NULL),
(70, 1, '2021-01-29 12:10:32', 'login', 'gouravdubey', 'users', NULL),
(71, 1, '2021-01-29 12:11:26', 'login', 'gouravdubey', 'users', NULL),
(72, 1, '2021-01-31 01:21:19', 'login', 'gouravdubey', 'users', NULL),
(73, 1, '2021-02-04 11:52:15', 'login', 'gouravdubey', 'users', NULL),
(74, 1, '2021-02-09 07:16:51', 'login', 'gouravdubey', 'users', NULL),
(75, 1, '2021-02-09 08:44:10', 'login', 'gouravdubey', 'users', NULL),
(76, 1, '2021-02-09 08:45:51', 'login', 'gouravdubey', 'users', NULL),
(77, 1, '2021-02-09 08:48:27', 'logout', 'gouravdubey', 'users', NULL),
(78, 1, '2021-02-09 08:48:32', 'login', 'gouravdubey', 'users', NULL),
(79, 1, '2021-02-11 09:35:30', 'login', 'gouravdubey', 'users', NULL),
(80, 1, '2021-02-11 09:39:21', 'login', 'gouravdubey', 'users', NULL),
(81, 1, '2021-02-11 09:40:41', 'login', 'gouravdubey', 'users', NULL),
(82, 1, '2021-02-11 09:44:39', 'login', 'gouravdubey', 'users', NULL),
(83, 1, '2021-02-11 10:45:54', 'login', 'gouravdubey', 'users', NULL),
(84, 1, '2021-02-12 10:09:30', 'login', 'gouravdubey', 'users', NULL),
(85, 1, '2021-02-12 10:12:50', 'login', 'gouravdubey', 'users', NULL),
(86, 1, '2021-02-12 10:14:51', 'login', 'gouravdubey', 'users', NULL),
(87, 1, '2021-02-12 10:14:51', 'login', 'gouravdubey', 'users', NULL),
(88, 1, '2021-02-16 07:46:23', 'login', 'gouravdubey', 'users', NULL),
(89, 1, '2021-02-16 08:57:08', 'login', 'gouravdubey', 'users', NULL),
(90, 1, '2021-02-17 07:24:03', 'login', 'gouravdubey', 'users', NULL),
(91, 1, '2021-02-17 10:08:46', 'login', 'gouravdubey', 'users', NULL),
(92, 1, '2021-02-17 10:08:47', 'login', 'gouravdubey', 'users', NULL),
(93, 1, '2021-02-17 10:08:51', 'logout', 'gouravdubey', 'users', NULL),
(94, 1, '2021-02-17 10:08:52', 'logout', 'gouravdubey', 'users', NULL),
(95, 1, '2021-02-17 10:08:52', 'logout', 'gouravdubey', 'users', NULL),
(96, 1, '2021-02-17 10:08:53', 'logout', 'gouravdubey', 'users', NULL),
(97, 1, '2021-02-17 10:09:06', 'login', 'gouravdubey', 'users', NULL),
(98, 1, '2021-02-18 10:14:42', 'login', 'gouravdubey', 'users', NULL),
(99, 1, '2021-02-22 09:20:23', 'login', 'gouravdubey', 'users', NULL),
(100, 1, '2021-02-22 10:59:01', 'login', 'gouravdubey', 'users', NULL),
(101, 1, '2021-02-24 11:23:02', 'login', 'gouravdubey', 'users', NULL),
(102, 1, '2021-02-26 08:36:05', 'login', 'gouravdubey', 'users', NULL),
(103, 1, '2021-02-26 08:44:13', 'login', 'gouravdubey', 'users', NULL),
(104, 1, '2021-02-26 08:48:29', 'login', 'gouravdubey', 'users', NULL),
(105, 1, '2021-02-26 08:49:27', 'login', 'gouravdubey', 'users', NULL),
(106, 1, '2021-02-26 08:52:42', 'login', 'gouravdubey', 'users', NULL),
(107, 1, '2021-02-28 08:26:50', 'login', 'gouravdubey', 'users', NULL),
(108, 1, '2021-03-12 09:03:25', 'login', 'gouravdubey', 'users', NULL),
(109, 1, '2021-03-12 09:06:36', 'login', 'gouravdubey', 'users', NULL),
(110, 1, '2021-03-12 09:08:32', 'login', 'gouravdubey', 'users', NULL),
(111, 1, '2021-03-12 09:10:13', 'login', 'gouravdubey', 'users', NULL),
(112, 1, '2021-03-12 09:10:53', 'login', 'gouravdubey', 'users', NULL),
(113, 1, '2021-03-12 09:12:10', 'login', 'gouravdubey', 'users', NULL),
(114, 1, '2021-03-12 09:36:22', 'login', 'gouravdubey', 'users', NULL),
(115, 1, '2021-03-12 09:52:37', 'login', 'gouravdubey', 'users', NULL),
(116, 1, '2021-03-12 11:51:06', 'login', 'gouravdubey', 'users', NULL),
(117, 1, '2021-03-15 07:20:22', 'login', 'gouravdubey', 'users', NULL),
(118, 1, '2021-03-15 07:26:11', 'login', 'gouravdubey', 'users', NULL),
(119, 1, '2021-03-16 07:43:37', 'login', 'gouravdubey', 'users', NULL),
(120, 1, '2021-03-16 11:40:23', 'login', 'gouravdubey', 'users', NULL),
(121, 1, '2021-03-18 07:41:17', 'login', 'gouravdubey', 'users', NULL),
(122, 1, '2021-03-19 10:45:39', 'login', 'gouravdubey', 'users', NULL),
(123, 1, '2021-03-22 08:21:40', 'login', 'gouravdubey', 'users', NULL),
(124, 1, '2021-03-22 10:49:37', 'login', 'gouravdubey', 'users', NULL),
(125, 1, '2021-03-23 08:15:56', 'login', 'gouravdubey', 'users', NULL),
(126, 1, '2021-03-24 06:39:08', 'login', 'gouravdubey', 'users', NULL),
(127, 1, '2021-03-24 10:36:42', 'login', 'gouravdubey', 'users', NULL),
(128, 1, '2021-03-24 10:45:32', 'login', 'gouravdubey', 'users', NULL),
(129, 1, '2021-03-30 08:30:22', 'login', 'gouravdubey', 'users', NULL),
(130, 1, '2021-03-30 11:40:52', 'login', 'gouravdubey', 'users', NULL),
(131, 1, '2021-03-30 11:43:29', 'login', 'gouravdubey', 'users', NULL),
(132, 1, '2021-04-01 09:16:23', 'login', 'gouravdubey', 'users', NULL),
(133, 1, '2021-04-09 11:01:56', 'login', 'gouravdubey', 'users', NULL),
(134, 1, '2021-04-09 11:06:35', 'login', 'gouravdubey', 'users', NULL),
(135, 1, '2021-04-09 16:29:33', 'login', 'gouravdubey', 'users', NULL),
(136, 1, '2021-04-13 09:24:22', 'login', 'gouravdubey', 'users', NULL),
(137, 1, '2021-04-13 09:27:50', 'logout', 'gouravdubey', 'users', NULL),
(138, 1, '2021-06-14 05:00:45', 'login', 'gouravdubey', 'users', NULL),
(139, 1, '2021-06-30 06:24:47', 'login', 'gouravdubey', 'users', NULL),
(140, 1, '2021-07-02 07:55:21', 'login', 'gouravdubey', 'users', NULL),
(141, 1, '2021-07-06 10:02:59', 'login', 'gouravdubey', 'users', NULL),
(142, 1, '2021-07-09 12:12:38', 'login', 'gouravdubey', 'users', NULL),
(143, 1, '2021-07-14 09:58:58', 'login', 'gouravdubey', 'users', NULL),
(144, 1, '2021-07-14 10:03:26', 'login', 'gouravdubey', 'users', NULL),
(145, 1, '2021-07-14 10:03:33', 'login', 'gouravdubey', 'users', NULL),
(146, 1, '2021-07-15 07:00:18', 'login', 'gouravdubey', 'users', NULL),
(147, 1, '2021-07-16 10:20:28', 'login', 'gouravdubey', 'users', NULL),
(148, 1, '2021-07-23 12:10:11', 'login', 'gouravdubey', 'users', NULL),
(149, 1, '2021-07-30 07:40:20', 'login', 'gouravdubey', 'users', NULL),
(150, 1, '2021-07-30 07:46:51', 'login', 'gouravdubey', 'users', NULL),
(151, 1, '2021-08-02 07:58:47', 'login', 'gouravdubey', 'users', NULL),
(152, 1, '2021-08-03 08:31:31', 'login', 'gouravdubey', 'users', NULL),
(153, 1, '2021-08-03 09:24:30', 'login', 'gouravdubey', 'users', NULL),
(154, 1, '2021-08-14 09:49:50', 'login', 'gouravdubey', 'users', NULL),
(155, 1, '2021-08-17 11:07:58', 'login', 'gouravdubey', 'users', NULL),
(156, 1, '2021-08-17 11:10:17', 'login', 'gouravdubey', 'users', NULL),
(157, 1, '2021-08-17 11:11:07', 'login', 'gouravdubey', 'users', NULL),
(158, 1, '2021-08-17 11:12:10', 'login', 'gouravdubey', 'users', NULL),
(159, 1, '2021-08-17 11:12:46', 'login', 'gouravdubey', 'users', NULL),
(160, 1, '2021-08-17 11:13:28', 'login', 'gouravdubey', 'users', NULL),
(161, 1, '2021-08-17 11:14:11', 'login', 'gouravdubey', 'users', NULL),
(162, 1, '2021-08-17 11:15:08', 'login', 'gouravdubey', 'users', NULL),
(163, 1, '2021-08-17 11:15:42', 'login', 'gouravdubey', 'users', NULL),
(164, 1, '2021-08-17 11:16:26', 'login', 'gouravdubey', 'users', NULL),
(165, 1, '2021-08-23 10:46:16', 'login', 'gouravdubey', 'users', NULL),
(166, 1, '2021-08-25 06:09:54', 'login', 'gouravdubey', 'users', NULL),
(167, 1, '2021-08-25 07:13:35', 'login', 'gouravdubey', 'users', NULL),
(168, 1, '2021-08-25 11:42:22', 'login', 'gouravdubey', 'users', NULL),
(169, 1, '2021-08-25 11:52:16', 'login', 'gouravdubey', 'users', NULL),
(170, 1, '2021-08-27 08:07:54', 'login', 'gouravdubey', 'users', NULL),
(171, 1, '2021-09-07 06:19:26', 'login', 'gouravdubey', 'users', NULL),
(172, 1, '2021-09-07 06:21:12', 'login', 'gouravdubey', 'users', NULL),
(173, 1, '2021-09-21 06:14:37', 'login', 'gouravdubey', 'users', NULL),
(174, 1, '2021-09-21 06:17:04', 'login', 'gouravdubey', 'users', NULL),
(175, 1, '2021-09-29 06:50:51', 'login', 'gouravdubey', 'users', NULL),
(176, 1, '2021-10-04 09:27:31', 'login', 'gouravdubey', 'users', NULL),
(177, 1, '2021-10-06 12:17:57', 'login', 'gouravdubey', 'users', NULL),
(178, 1, '2021-10-08 09:42:03', 'login', 'gouravdubey', 'users', NULL),
(179, 1, '2021-10-12 07:54:46', 'login', 'gouravdubey', 'users', NULL),
(180, 1, '2021-10-12 07:56:19', 'login', 'gouravdubey', 'users', NULL),
(181, 1, '2021-10-30 13:23:32', 'login', 'gouravdubey', 'users', NULL),
(182, 1, '2021-11-01 07:09:42', 'login', 'gouravdubey', 'users', NULL),
(183, 1, '2021-11-01 11:33:47', 'login', 'gouravdubey', 'users', NULL),
(184, 1, '2021-11-08 06:19:28', 'login', 'gouravdubey', 'users', NULL),
(185, 1, '2021-11-08 09:35:46', 'login', 'gouravdubey', 'users', NULL),
(186, 1, '2021-11-09 06:47:47', 'login', 'gouravdubey', 'users', NULL),
(187, 1, '2021-11-10 09:14:57', 'login', 'gouravdubey', 'users', NULL),
(188, 1, '2021-11-10 12:07:29', 'login', 'gouravdubey', 'users', NULL),
(189, 1, '2021-11-11 08:25:22', 'login', 'gouravdubey', 'users', NULL),
(190, 1, '2021-11-17 10:42:37', 'login', 'gouravdubey', 'users', NULL),
(191, 1, '2021-11-18 07:22:55', 'login', 'gouravdubey', 'users', NULL),
(192, 1, '2021-11-22 07:53:03', 'login', 'gouravdubey', 'users', NULL),
(193, 1, '2021-11-22 07:54:44', 'login', 'gouravdubey', 'users', NULL),
(194, 1, '2021-11-22 07:56:21', 'logout', 'gouravdubey', 'users', NULL),
(195, 1, '2021-11-22 07:56:27', 'login', 'gouravdubey', 'users', NULL),
(196, 1, '2021-11-22 08:12:23', 'login', 'gouravdubey', 'users', NULL),
(197, 1, '2021-11-23 07:41:38', 'login', 'gouravdubey', 'users', NULL),
(198, 1, '2021-11-23 07:45:07', 'login', 'gouravdubey', 'users', NULL),
(199, 1, '2021-11-23 12:25:10', 'login', 'gouravdubey', 'users', NULL),
(200, 1, '2021-11-29 12:04:05', 'login', 'gouravdubey', 'users', NULL),
(201, 1, '2021-12-02 07:32:48', 'login', 'gouravdubey', 'users', NULL),
(202, 1, '2021-12-10 14:07:58', 'login', 'gouravdubey', 'users', NULL),
(203, 1, '2021-12-14 10:20:31', 'login', 'gouravdubey', 'users', NULL),
(204, 1, '2021-12-15 06:29:22', 'login', 'gouravdubey', 'users', NULL),
(205, 1, '2021-12-15 13:09:21', 'login', 'gouravdubey', 'users', NULL),
(206, 1, '2021-12-15 13:12:01', 'login', 'gouravdubey', 'users', NULL),
(207, 1, '2021-12-15 13:12:57', 'login', 'gouravdubey', 'users', NULL),
(208, 1, '2021-12-15 13:13:58', 'login', 'gouravdubey', 'users', NULL),
(209, 1, '2021-12-15 13:15:01', 'login', 'gouravdubey', 'users', NULL),
(210, 1, '2021-12-15 13:16:37', 'login', 'gouravdubey', 'users', NULL),
(211, 1, '2021-12-15 13:17:25', 'login', 'gouravdubey', 'users', NULL),
(212, 1, '2021-12-15 13:18:41', 'login', 'gouravdubey', 'users', NULL),
(213, 1, '2021-12-15 13:19:29', 'login', 'gouravdubey', 'users', NULL),
(214, 1, '2021-12-15 13:20:07', 'login', 'gouravdubey', 'users', NULL),
(215, 1, '2021-12-15 13:20:39', 'login', 'gouravdubey', 'users', NULL),
(216, 1, '2021-12-15 13:50:14', 'login', 'gouravdubey', 'users', NULL),
(217, 1, '2021-12-15 13:51:54', 'login', 'gouravdubey', 'users', NULL),
(218, 1, '2021-12-15 13:53:01', 'login', 'gouravdubey', 'users', NULL),
(219, 1, '2021-12-15 13:54:17', 'login', 'gouravdubey', 'users', NULL),
(220, 1, '2021-12-15 13:54:51', 'login', 'gouravdubey', 'users', NULL),
(221, 1, '2021-12-15 13:56:54', 'login', 'gouravdubey', 'users', NULL),
(222, 1, '2021-12-16 07:35:02', 'login', 'gouravdubey', 'users', NULL),
(223, 1, '2022-01-05 12:22:53', 'login', 'gouravdubey', 'users', NULL),
(224, 1, '2022-01-11 06:30:37', 'login', 'gouravdubey', 'users', NULL),
(225, 1, '2022-01-11 06:55:31', 'login', 'gouravdubey', 'users', NULL),
(226, 1, '2022-01-20 06:57:53', 'login', 'gouravdubey', 'users', NULL),
(227, 1, '2022-01-21 06:05:07', 'login', 'gouravdubey', 'users', NULL),
(228, 1, '2022-01-21 06:06:29', 'login', 'gouravdubey', 'users', NULL),
(229, 1, '2022-01-21 09:54:19', 'login', 'gouravdubey', 'users', NULL),
(230, 1, '2022-01-24 08:51:54', 'login', 'gouravdubey', 'users', NULL),
(231, 1, '2022-01-24 08:53:22', 'login', 'gouravdubey', 'users', NULL),
(232, 1, '2022-01-24 08:53:58', 'login', 'gouravdubey', 'users', NULL),
(233, 1, '2022-01-24 08:55:02', 'login', 'gouravdubey', 'users', NULL),
(234, 1, '2022-01-24 08:55:22', 'login', 'gouravdubey', 'users', NULL),
(235, 1, '2022-01-24 08:55:44', 'login', 'gouravdubey', 'users', NULL),
(236, 1, '2022-01-24 10:04:47', 'logout', 'gouravdubey', 'users', NULL),
(237, 1, '2022-01-24 10:05:08', 'login', 'gouravdubey', 'users', NULL),
(238, 1, '2022-01-24 10:05:10', 'login', 'gouravdubey', 'users', NULL),
(239, 1, '2022-01-24 10:05:14', 'logout', 'gouravdubey', 'users', NULL),
(240, 1, '2022-01-24 10:05:14', 'logout', 'gouravdubey', 'users', NULL),
(241, 1, '2022-01-24 10:05:14', 'logout', 'gouravdubey', 'users', NULL),
(242, 1, '2022-01-24 10:05:14', 'logout', 'gouravdubey', 'users', NULL),
(243, 1, '2022-01-24 10:05:31', 'login', 'gouravdubey', 'users', NULL),
(244, 1, '2022-01-24 10:24:05', 'login', 'gouravdubey', 'users', NULL),
(245, 1, '2022-01-24 10:29:59', 'logout', 'gouravdubey', 'users', NULL),
(246, 1, '2022-01-25 16:28:35', 'login', 'gouravdubey', 'users', NULL),
(247, 1, '2022-01-26 07:59:54', 'login', 'gouravdubey', 'users', NULL),
(248, 1, '2022-01-26 12:04:51', 'login', 'gouravdubey', 'users', NULL),
(249, 1, '2022-01-30 08:45:27', 'login', 'gouravdubey', 'users', NULL),
(250, 1, '2022-01-30 08:45:27', 'login', 'gouravdubey', 'users', NULL),
(251, 1, '2022-01-30 08:45:27', 'login', 'gouravdubey', 'users', NULL),
(252, 1, '2022-01-30 08:46:24', 'login', 'gouravdubey', 'users', NULL),
(253, 1, '2022-01-30 08:46:25', 'login', 'gouravdubey', 'users', NULL),
(254, 1, '2022-01-30 08:46:25', 'login', 'gouravdubey', 'users', NULL),
(255, 1, '2022-01-30 08:46:31', 'logout', 'gouravdubey', 'users', NULL),
(256, 1, '2022-01-30 08:46:32', 'logout', 'gouravdubey', 'users', NULL),
(257, 1, '2022-01-30 08:46:32', 'logout', 'gouravdubey', 'users', NULL),
(258, 1, '2022-01-30 08:46:33', 'logout', 'gouravdubey', 'users', NULL),
(259, 1, '2022-01-30 08:46:41', 'login', 'gouravdubey', 'users', NULL),
(260, 1, '2022-01-30 08:46:42', 'login', 'gouravdubey', 'users', NULL),
(261, 1, '2022-01-30 08:46:42', 'login', 'gouravdubey', 'users', NULL),
(262, 1, '2022-01-30 08:46:45', 'logout', 'gouravdubey', 'users', NULL),
(263, 1, '2022-01-30 08:46:45', 'logout', 'gouravdubey', 'users', NULL),
(264, 1, '2022-01-30 08:46:45', 'logout', 'gouravdubey', 'users', NULL),
(265, 1, '2022-01-30 08:46:45', 'logout', 'gouravdubey', 'users', NULL),
(266, 1, '2022-01-30 08:46:56', 'login', 'gouravdubey', 'users', NULL),
(267, 1, '2022-01-30 08:46:57', 'login', 'gouravdubey', 'users', NULL),
(268, 1, '2022-01-30 08:47:00', 'logout', 'gouravdubey', 'users', NULL),
(269, 1, '2022-01-30 08:47:00', 'logout', 'gouravdubey', 'users', NULL),
(270, 1, '2022-01-30 08:47:00', 'logout', 'gouravdubey', 'users', NULL),
(271, 1, '2022-01-30 08:47:00', 'logout', 'gouravdubey', 'users', NULL),
(272, 1, '2022-01-30 08:47:20', 'login', 'gouravdubey', 'users', NULL),
(273, 1, '2022-01-30 08:47:21', 'login', 'gouravdubey', 'users', NULL),
(274, 1, '2022-01-30 08:47:21', 'login', 'gouravdubey', 'users', NULL),
(275, 1, '2022-01-30 08:47:24', 'logout', 'gouravdubey', 'users', NULL),
(276, 1, '2022-01-30 08:47:24', 'logout', 'gouravdubey', 'users', NULL),
(277, 1, '2022-01-30 08:47:24', 'logout', 'gouravdubey', 'users', NULL),
(278, 1, '2022-01-30 08:47:24', 'logout', 'gouravdubey', 'users', NULL),
(279, 1, '2022-02-01 10:00:58', 'login', 'gouravdubey', 'users', NULL),
(280, 1, '2022-02-01 10:00:58', 'login', 'gouravdubey', 'users', NULL),
(281, 1, '2022-02-03 10:13:40', 'login', 'gouravdubey', 'users', NULL),
(282, 1, '2022-02-03 10:14:24', 'login', 'gouravdubey', 'users', NULL),
(283, 1, '2022-02-03 10:14:45', 'login', 'gouravdubey', 'users', NULL),
(284, 1, '2022-02-03 13:10:49', 'logout', 'gouravdubey', 'users', NULL),
(285, 1, '2022-02-03 13:10:49', 'logout', 'gouravdubey', 'users', NULL),
(286, 1, '2022-02-03 13:10:49', 'logout', 'gouravdubey', 'users', NULL),
(287, 1, '2022-02-03 13:10:49', 'logout', 'gouravdubey', 'users', NULL),
(288, 1, '2022-02-09 15:34:27', 'login', 'gouravdubey', 'users', NULL),
(289, 1, '2022-02-13 05:39:52', 'login', 'gouravdubey', 'users', NULL),
(290, 1, '2022-02-15 14:28:27', 'login', 'gouravdubey', 'users', NULL),
(291, 1, '2022-02-15 14:41:22', 'login', 'gouravdubey', 'users', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `rate` decimal(11,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `detail`, `rate`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, 'SLD', 'Fuel Type', '0.000', '2020-03-07 23:42:02', '2020-10-10 14:43:47', 1),
(2, 'SLD', 'Electronic', '0.000', '2020-03-07 23:42:02', '2020-10-10 14:44:06', 1),
(3, 'GPS Camera ', 'GPS camera details', '0.000', '2020-03-07 23:42:02', '2020-10-10 14:44:57', 1),
(4, 'CCTV Camera', 'HOME OFFICES AND VEHICLES', '0.000', '2020-10-10 15:36:14', '2021-01-27 14:36:14', 1),
(6, 'Radium', 'Using in Vehicles for Road Safety', '0.000', '2020-10-11 03:26:55', '2021-01-27 15:33:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `reminder_type` varchar(255) NOT NULL,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `reminder_date` date NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `updated_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `name`, `reminder_type`, `start_at`, `end_at`, `reminder_date`, `status`, `updated_by`) VALUES
(4, 'Ambuj Dubey', 'paid', '15:59:00', '17:00:00', '2022-01-14', 0, '1'),
(5, 'Puc Ambuj', 'Puc', '11:32:00', '00:33:00', '2022-02-14', 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `userid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(15) DEFAULT NULL,
  `center_code` varchar(15) DEFAULT NULL,
  `center_name` varchar(40) DEFAULT NULL,
  `center_address` varchar(255) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'VIEWER',
  `profile_file_name` varchar(255) DEFAULT NULL,
  `notification` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `userid`, `password`, `email`, `mobile`, `created_at`, `updated_at`, `updated_by`, `center_code`, `center_name`,`center_address`, `role`, `profile_file_name`, `notification`) VALUES
(1, 'Gourav', 'Dubey', 'gouravdubey', 'mpbhopal', 'gouravdubey03@gmail.com', '8770557511', '2020-10-01 23:55:04', '2021-01-29 12:11:12', 'gouravdubey', '123','bhel','bhel bhopal', 'ADMIN', 'bittu.jpeg', 0),
(2, 'Ambuj', 'Dubey', 'ambuj', 'dubey', 'ambuj.ideata@gmail.com', '9753750955', '2020-10-02 07:54:56', '2020-10-02 07:54:56', NULL, '321','harshu','anand nagar', 'VIEWER', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
