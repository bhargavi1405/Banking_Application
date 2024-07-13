-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2022 at 07:04 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebanking`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `id` int(11) NOT NULL,
  `accountno` bigint(50) NOT NULL,
  `balance` bigint(50) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`id`, `accountno`, `balance`, `lastupdate`) VALUES
(18, 1304600342969783, 5500, '2022-11-02 18:02:53'),
(21, 1046387422247615, 0, '2022-11-01 18:30:00'),
(22, 1337276538163606, 1000, '2022-11-02 18:02:53'),
(23, 1200307129783523, 0, '2022-11-01 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `bankaccount`
--

CREATE TABLE `bankaccount` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `accountno` bigint(50) NOT NULL,
  `oaccountno` bigint(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `status` int(10) NOT NULL,
  `nid` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `openingdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `balancedetails` varchar(200) NOT NULL DEFAULT '1',
  `carddetails` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankaccount`
--

INSERT INTO `bankaccount` (`id`, `name`, `accountno`, `oaccountno`, `phone`, `birthdate`, `status`, `nid`, `address`, `openingdate`, `balancedetails`, `carddetails`) VALUES
(2, 'gajen', 1304600342969783, 1689437919650663, '62630567799', '2022-11-01', 1, '1234567890', 'bhilai', '2022-10-31 18:30:00', '18', '3'),
(5, 'admin', 1046387422247615, 1157935439135173, '91650637411', '2022-11-02', 1, '2121211221', 'testing', '2022-11-01 18:30:00', '21', NULL),
(6, 'yugesh', 1337276538163606, 1100392434352509, '91650637422', '2022-11-02', 1, '123123123123', 'testing', '2022-11-01 18:30:00', '22', NULL),
(7, 'anil', 1200307129783523, 1881497856399032, '91650637423', '2022-11-02', 1, '123412341234', 'testing', '2022-11-01 18:30:00', '23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bankwithdraw`
--

CREATE TABLE `bankwithdraw` (
  `id` int(11) NOT NULL,
  `accountno` bigint(50) NOT NULL,
  `receivername` varchar(200) NOT NULL,
  `receivernid` varchar(200) NOT NULL,
  `receivermobile` varchar(100) NOT NULL,
  `amount` bigint(50) NOT NULL,
  `type` varchar(100) NOT NULL,
  `withdrawdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankwithdraw`
--

INSERT INTO `bankwithdraw` (`id`, `accountno`, `receivername`, `receivernid`, `receivermobile`, `amount`, `type`, `withdrawdate`, `status`) VALUES
(1, 1304600342969783, 'gajen', '1231231230', '62630567799', 1000, 'Bank Cash', '2022-11-02 17:57:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cardaccount`
--

CREATE TABLE `cardaccount` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `accountno` varchar(100) NOT NULL,
  `nid` varchar(100) NOT NULL,
  `cardno` varchar(100) NOT NULL,
  `carddate` varchar(100) NOT NULL,
  `cardpin` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `status` int(10) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cardaccount`
--

INSERT INTO `cardaccount` (`id`, `name`, `accountno`, `nid`, `cardno`, `carddate`, `cardpin`, `type`, `status`, `datetime`) VALUES
(1, 'yugesh', '1111111111111111', '11111', '1234123412341234', '2034-08-08', '1111', 'debit', 1, '2022-11-01 17:21:48'),
(2, 'Gajen Pradhan', '1304600342969783', '1234567892', '2404854086309009', '2025-01-09', '559', 'Shopping Card', 0, '2022-11-01 00:00:00'),
(3, 'Gajen Pradhan', '1304600342969783', '1234567892', '4532506901848217', '2025-01-09', '179', 'Shopping Card', 0, '2022-11-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `accountno` bigint(50) DEFAULT NULL,
  `saccountno` bigint(50) DEFAULT NULL,
  `raccountno` bigint(50) DEFAULT NULL,
  `amount` bigint(50) DEFAULT NULL,
  `receivedate` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `accountno`, `saccountno`, `raccountno`, `amount`, `receivedate`, `status`) VALUES
(2, 1304600342969783, NULL, NULL, 1000, '2022-11-02', 1),
(3, 1304600342969783, NULL, NULL, 1000, '2022-11-02', 1),
(4, 1304600342969783, NULL, NULL, 500, '2022-11-02', 1),
(5, 1304600342969783, NULL, NULL, 5000, '2022-11-02', 1),
(6, 1337276538163606, 1304600342969783, 1337276538163606, 1000, '2022-11-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mobilewithdraw`
--

CREATE TABLE `mobilewithdraw` (
  `id` int(11) NOT NULL,
  `accountno` bigint(50) NOT NULL,
  `type` varchar(100) NOT NULL,
  `withdrawtype` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `amount` bigint(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `send`
--

CREATE TABLE `send` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `accountno` bigint(50) NOT NULL,
  `saccountno` bigint(50) NOT NULL,
  `raccountno` bigint(50) NOT NULL,
  `amount` bigint(50) NOT NULL,
  `sendingdate` date NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `send`
--

INSERT INTO `send` (`id`, `name`, `accountno`, `saccountno`, `raccountno`, `amount`, `sendingdate`, `status`) VALUES
(4, 'gajen', 1304600342969783, 1304600342969783, 1337276538163606, 1000, '2022-11-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `accountno` bigint(50) NOT NULL,
  `amount` bigint(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` int(10) NOT NULL,
  `type` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `transactiontype` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `accountno`, `amount`, `description`, `status`, `type`, `date`, `transactiontype`) VALUES
(2, 1304600342969783, 1000, 'Bank Cash Deposit', 1, 'deposit', '2022-11-01 18:30:00', 'credit'),
(3, 1304600342969783, 1000, 'Bank Cash Deposit', 1, 'deposit', '2022-11-01 18:30:00', 'credit'),
(4, 1304600342969783, 500, 'Bank Cash Deposit', 1, 'deposit', '2022-11-01 18:30:00', 'credit'),
(5, 1304600342969783, 1000, 'Bank Cash Withdraw', 1, 'withdraw', '2022-11-01 18:30:00', 'debit'),
(6, 1304600342969783, 5000, 'Bank Cash Deposit', 1, 'deposit', '2022-11-01 18:30:00', 'credit'),
(7, 1304600342969783, 1000, 'Send money to yugesh', 1, 'Send Money', '2022-11-01 18:30:00', 'debit'),
(8, 1337276538163606, 1000, 'Receive money from gajen', 1, 'Receive Money', '2022-11-01 18:30:00', 'credit');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `accountno` bigint(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `role` enum('USER','ADMIN') NOT NULL,
  `status` int(10) NOT NULL DEFAULT 1,
  `createdate` date NOT NULL,
  `resetpasswordtoken` varchar(200) DEFAULT NULL,
  `otp` varchar(200) NOT NULL,
  `userdetails` int(11) NOT NULL,
  `token` varchar(100) NOT NULL DEFAULT '1testing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `accountno`, `email`, `password`, `role`, `status`, `createdate`, `resetpasswordtoken`, `otp`, `userdetails`, `token`) VALUES
(4, 'admin', 2222222222222222, 'admin@admin.com', '$2a$10$Dlc3Kc3.b30WO/FhorhEBuUp6F0Y7HpJVtpbhzxvjtLG2k6ChPWPq', 'ADMIN', 1, '2022-11-01', 'testing', '', 5, 'testing'),
(6, 'gajen', 1304600342969783, 'gajen@gmail.com', '$2a$10$rd.PplqWcMVpk01.KOWPEOPk6Qp2aoIu8.lR7qUys63GFAAQsK6S6', 'USER', 1, '2022-11-01', NULL, '', 2, '1testing'),
(10, 'yugesh', 1337276538163606, 'yugesh@gmail.com', '$2a$10$i1yIcq34TLQHuTOiyGt0serK86JJTdKoglQLWNN0l1KDh84GeBFoO', 'USER', 1, '2022-11-02', NULL, 'OKprc5', 6, '1testing'),
(11, 'anil123', 1200307129783523, 'anil@gmail.com', '$2a$10$kOPw9scLFB7JgTD50.Yz..RJrGV7HGynr9TrkUzKAIPHLQ10FuMIC', 'USER', 1, '2022-11-02', NULL, 'LPNwRd', 7, '1testing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bankaccount`
--
ALTER TABLE `bankaccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bankwithdraw`
--
ALTER TABLE `bankwithdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardaccount`
--
ALTER TABLE `cardaccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobilewithdraw`
--
ALTER TABLE `mobilewithdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send`
--
ALTER TABLE `send`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
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
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bankaccount`
--
ALTER TABLE `bankaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bankwithdraw`
--
ALTER TABLE `bankwithdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cardaccount`
--
ALTER TABLE `cardaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mobilewithdraw`
--
ALTER TABLE `mobilewithdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `send`
--
ALTER TABLE `send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
