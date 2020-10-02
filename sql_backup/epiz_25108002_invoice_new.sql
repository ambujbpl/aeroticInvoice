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


INSERT INTO `basic` (`Name`, `Address`, `Phone`, `Gst`, `HsnCode`, `YearCode`, `InvoiceCount`, `updated_at`, `updated_by`) VALUES
('Saniya Enterprises', 'Bhopal Madhya Pradesh', '9584444161', '23CPFPD6088B1Z8', 'MP04TA0123', '-2020', 1, '2020-10-02 05:31:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subtotal` decimal(11,3) NOT NULL,
  `gst` decimal(11,3) NOT NULL,
  `total` decimal(11,3) NOT NULL,
  `paid` decimal(11,3) NOT NULL,
  `due` decimal(11,3) NOT NULL,
  `address` longtext,
  `customer_address` longtext,
  `product_details` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(1, 1, '2020-10-02 01:25:17', 'login', 'gouravdubey', 'users', NULL),
(2, 1, '2020-10-02 02:54:34', 'login', 'gouravdubey', 'users', NULL);

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

-- --------------------------------------------------------
--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'SLD','Fuel Type',1005.500,'2020-03-08 00:12:02','2020-04-19 07:24:03',1),(2,'SLD','Electronic',1207.700,'2020-03-08 00:12:02','2020-03-12 16:23:08',1),(3,'Roter Seal','Seal for SLD device',13.100,'2020-03-08 00:12:02','2020-03-12 16:16:51',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
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
(1, 'Gourav', 'Dubey', 'gouravdubey', 'mpbhopal', 'gouravdubey03@gmail.com', '8770557511', '2020-10-02 01:25:04', '2020-10-02 01:25:04', NULL, 'ADMIN', NULL, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

