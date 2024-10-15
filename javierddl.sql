-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 02:39 PM
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
-- Database: `javierddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(10) NOT NULL,
  `Employee_ID` int(10) DEFAULT NULL,
  `Customer_ID` int(10) DEFAULT NULL,
  `Customer` varchar(100) DEFAULT NULL,
  `Order_date` date DEFAULT NULL,
  `Shipped_date` date DEFAULT NULL,
  `Shipper_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `Employee_ID`, `Customer_ID`, `Customer`, `Order_date`, `Shipped_date`, `Shipper_ID`) VALUES
(1, 1, 101, 'James', '2023-10-15', '2023-10-18', 1),
(2, 2, 102, 'loue', '2023-10-16', '2023-10-20', 2),
(3, 3, 103, 'Magan', '2023-10-17', '2023-10-21', 3),
(4, 4, 104, 'vince', '2023-10-18', '2023-10-22', 4),
(5, 5, 105, 'Jane', '2023-10-19', '2023-10-23', 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_ID` int(10) NOT NULL,
  `Product_ID` int(10) NOT NULL,
  `Quantity` int(15) DEFAULT NULL,
  `Unit_price` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `Status_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Order_ID`, `Product_ID`, `Quantity`, `Unit_price`, `Discount`, `Status_ID`) VALUES
(1, 1, 2, 15.00, 0.10, 1),
(2, 1, 3, 18.00, 0.20, 1),
(3, 2, 1, 12.00, 0.00, 1),
(4, 2, 2, 20.00, 0.50, 1),
(5, 3, 4, 14.00, 0.20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Product_ID` int(10) NOT NULL,
  `Product_code` varchar(50) DEFAULT NULL,
  `Product_name` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Standard_cost` decimal(10,2) DEFAULT NULL,
  `List_price` decimal(10,2) DEFAULT NULL,
  `Reorder_level` int(10) DEFAULT NULL,
  `Target_level` int(10) DEFAULT NULL,
  `Quality_per_unit` int(10) DEFAULT NULL,
  `Discontinued` tinyint(1) DEFAULT NULL,
  `Minimum_reorder_quality` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Product_ID`, `Product_code`, `Product_name`, `Description`, `Standard_cost`, `List_price`, `Reorder_level`, `Target_level`, `Quality_per_unit`, `Discontinued`, `Minimum_reorder_quality`) VALUES
(1, 'P001', 'saging', 'saasss', 10.00, 15.00, 50, 100, 1, 0, 20),
(2, 'P002', 'turon', 'giiiiing', 12.00, 18.00, 60, 100, 1, 0, 30),
(3, 'P003', 'pancake ', 'busoggg', 8.00, 12.00, 40, 80, 1, 0, 15),
(4, 'P004', 'loya', 'pait', 15.00, 20.00, 70, 100, 1, 0, 10),
(5, 'P005', 'kamatis', 'tamis', 9.00, 14.00, 55, 100, 1, 0, 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Product_ID`,`Order_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
