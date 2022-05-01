-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 10:33 PM
-- Server version: 8.0.27
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dsr_module`
--

-- --------------------------------------------------------

--
-- Table structure for table `cs_distribution`
--

CREATE TABLE `cs_distribution` (
  `Product_ID` int NOT NULL,
  `qty_distributed` int NOT NULL,
  `qty_remaining` int NOT NULL,
  `date_distributed` date NOT NULL,
  `head_initials` char(30) NOT NULL,
  `stamp_of_initials` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cs_distribution`
--

INSERT INTO `cs_distribution` (`Product_ID`, `qty_distributed`, `qty_remaining`, `date_distributed`, `head_initials`, `stamp_of_initials`) VALUES
(3, 3, 2, '2022-03-16', 'CM', 0x6162632e6a7067),
(3, 2, 1, '2022-04-13', 'Computer', 0x64676479642e6a7067),
(6, 2, 3, '2022-04-12', 'IT', 0x444647484a4b4c2e6a7067),
(6, 12, 13, '2022-04-07', 'boys_hostel', 0x31302e322e6a7067),
(6, 12, 13, '2022-04-20', 'boys_hostel', 0x31302e322e6a7067),
(6, 12, 13, '2022-04-20', 'boys_hostel', 0x31302e322e6a7067),
(6, 12, 13, '2022-04-20', 'boys_hostel', 0x31302e322e6a7067),
(6, 12, 13, '2022-04-13', 'computer', 0x31302e312e6a7067),
(6, 12, 13, '2022-04-07', 'boys_hostel', 0x31302e322e6a7067),
(3, 12, 13, '2022-03-31', 'office', 0x31302e322e6a7067),
(3, 12, 13, '2022-04-07', 'computer', 0x31302e322e6a7067);

-- --------------------------------------------------------

--
-- Table structure for table `master_cs`
--

CREATE TABLE `master_cs` (
  `Oraganization_ID` varchar(20) NOT NULL,
  `DSR_no` int NOT NULL,
  `Product_ID` int NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_authority` char(50) NOT NULL,
  `supplier_name` char(100) NOT NULL,
  `Supplier_Address` char(255) NOT NULL,
  `product_name` char(100) NOT NULL,
  `product_desc` char(255) NOT NULL,
  `qty` int NOT NULL,
  `Price_Per_Quantity` double NOT NULL,
  `price` double NOT NULL,
  `initial_HOD` char(30) NOT NULL,
  `Quantity_Distributed` int NOT NULL,
  `stamp_sign_cs` char(255) NOT NULL,
  `qty_remaining` int NOT NULL,
  `remarks` char(150) DEFAULT NULL,
  `bill_pic` char(50) NOT NULL,
  `dsr_pic` char(50) NOT NULL,
  `last_edited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_cs`
--

INSERT INTO `master_cs` (`Oraganization_ID`, `DSR_no`, `Product_ID`, `purchase_date`, `purchase_authority`, `supplier_name`, `Supplier_Address`, `product_name`, `product_desc`, `qty`, `Price_Per_Quantity`, `price`, `initial_HOD`, `Quantity_Distributed`, `stamp_sign_cs`, `qty_remaining`, `remarks`, `bill_pic`, `dsr_pic`, `last_edited`) VALUES
('1001', 1, 3, '2022-03-02', 'DTE', 'Samay Sharma', 'Govind Nagar, Amravati', 'hp Laptop', 'Windows 10, intel i core', 5, 50000, 250000, 'CM', 3, 'abc.jpg', 2, 'None', 'pqr.jpg', 'lmn.jpg', '2022-03-05 08:16:49'),
('1002', 1, 6, '2022-03-08', 'Prnciple', 'Ashish Waghe', 'Amravati', 'HP Laptop', 'HP Laptop intel i5 Windows 11', 5, 10000, 50000, 'CM', 2, 'ved.jpg', 3, 'no', 'pragati.jpg', 'ra.jpg', '2022-03-24 19:51:54'),
('54', 1, 10, '0000-00-00', 'DTE', 'jethalal', 'gokuldham', 'moblile', 'redmi', 2, 1000, 10000, 'electrical', 1, 'coder wallpaper.jpg', 0, 'no', 'photo-1534665482403-a909d0d97c67.jfif', 'Screenshot (119).png', '2022-04-30 20:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `notification_table`
--

CREATE TABLE `notification_table` (
  `sr_no` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `msg_from` varchar(70) NOT NULL,
  `msg_to` varchar(70) NOT NULL,
  `view_details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_distribution`
--
ALTER TABLE `cs_distribution`
  ADD KEY `fk_csdistribution` (`Product_ID`);

--
-- Indexes for table `master_cs`
--
ALTER TABLE `master_cs`
  ADD PRIMARY KEY (`Product_ID`),
  ADD UNIQUE KEY `unique_stamp_sign_cs` (`stamp_sign_cs`),
  ADD UNIQUE KEY `unique_dsr_pic` (`dsr_pic`),
  ADD UNIQUE KEY `unique_bill_pic` (`bill_pic`);

--
-- Indexes for table `notification_table`
--
ALTER TABLE `notification_table`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_cs`
--
ALTER TABLE `master_cs`
  MODIFY `Product_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification_table`
--
ALTER TABLE `notification_table`
  MODIFY `sr_no` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cs_distribution`
--
ALTER TABLE `cs_distribution`
  ADD CONSTRAINT `fk_csdistribution` FOREIGN KEY (`Product_ID`) REFERENCES `master_cs` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
