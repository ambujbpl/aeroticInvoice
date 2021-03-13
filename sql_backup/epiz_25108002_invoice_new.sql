-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql113.epizy.com
-- Generation Time: Mar 12, 2021 at 11:09 PM
-- Server version: 5.6.48-88.0
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
  `InvoiceCount` int(11) NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(3) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic`
--

INSERT INTO `basic` (`Name`, `Address`, `Phone`, `Gst`, `HsnCode`, `YearCode`, `InvoiceCount`, `updated_at`, `updated_by`) VALUES
('Saniya Enterprises', 'Bhopal Madhya Pradesh', '8770557511', '23CPFPD6088B1Z8', 'MP04TA0123', '2018-19', 513, '2021-03-12 09:05:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `subtotal` decimal(11,3) DEFAULT '0.000',
  `gst` decimal(11,3) DEFAULT '0.000',
  `total` decimal(11,3) DEFAULT '0.000',
  `paid` decimal(11,3) DEFAULT '0.000',
  `due` decimal(11,3) DEFAULT '0.000',
  `address` longtext,
  `customer_address` longtext,
  `product_details` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
(35, '512/2018-19', '2021-03-12', '720.000', '129.600', '849.600', '849.600', '0.000', '{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"8770557511\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}', '{\"PartyName\":\"MANZOOR ULLAH\",\"PartyAddress\":\"12 SARAI M H K\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"DL1VC0785\",\"header\":\"INVOICE\"}', '[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"720\",\"productQuantity\":\"1\",\"productPrize\":\"720.00\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"GPS Camera \",\"productDesc\":\"GPS camera details\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"CCTV Camera\",\"productDesc\":\"HOME OFFICES AND VEHICLES\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Radium\",\"productDesc\":\"Using in Vehicles for Road Safety\",\"productCost\":\"0.000\",\"productQuantity\":\"\",\"productPrize\":\"\"}]', '2021-03-12 09:05:09', '2021-03-12 09:05:09', 'gouravdubey');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(6) NOT NULL,
  `map_id` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
(116, 1, '2021-03-12 11:51:06', 'login', 'gouravdubey', 'users', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `rate` decimal(11,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `reminder_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  `updated_by` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `name`, `reminder_type`, `start_at`, `end_at`, `reminder_date`, `status`, `updated_by`) VALUES
(1, 'Ambuj ', 'test', '12:50:00', '01:30:00', '2020-12-25 00:00:00', 1, '1'),
(2, 'Ambuj Dubey', 'test', '11:35:00', '11:50:00', '0000-00-00 00:00:00', 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `userid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(15) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'VIEWER',
  `profile_file_name` varchar(255) DEFAULT NULL,
  `notification` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `userid`, `password`, `email`, `mobile`, `created_at`, `updated_at`, `updated_by`, `role`, `profile_file_name`, `notification`) VALUES
(1, 'Gourav', 'Dubey', 'gouravdubey', '!@#$%^#Z&Z*', 'gouravdubey03@gmail.com', '8770557511', '2020-10-01 23:55:04', '2021-01-29 12:11:12', 'gouravdubey', 'ADMIN', 'bittu.jpeg', 0),
(2, 'Ambuj', 'Dubey', 'ambuj', '!#^U&&^%#', 'ambuj.ideata@gmail.com', '9753750955', '2020-10-02 07:54:56', '2020-10-02 07:54:56', NULL, 'VIEWER', NULL, 0);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
