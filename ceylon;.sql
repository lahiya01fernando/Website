-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2024 at 08:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment`
--
CREATE DATABASE IF NOT EXISTS `assignment` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `assignment`;

-- --------------------------------------------------------

--
-- Table structure for table `chair`
--

CREATE TABLE `chair` (
  `ChairId` int(11) NOT NULL,
  `DName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chair`
--

INSERT INTO `chair` (`ChairId`, `DName`) VALUES
(1, 'Computer Science'),
(3, 'English'),
(2, 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `CName` varchar(100) NOT NULL,
  `COffice` varchar(100) DEFAULT NULL,
  `CPhone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`CName`, `COffice`, `CPhone`) VALUES
('Arts', 'Arts Building', '234-567-8901'),
('Engineering', 'Eng Building', '123-456-7890');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CoName` varchar(100) NOT NULL,
  `CCode` varchar(10) DEFAULT NULL,
  `Level` varchar(50) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `CDesc` text DEFAULT NULL,
  `DCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CoName`, `CCode`, `Level`, `Credits`, `CDesc`, `DCode`) VALUES
('Data Structures', 'CS101', 'Junior', 4, 'Introduction to Data Structures', 'CS'),
('Literature', 'ENG101', 'Freshman', 3, 'Introduction to Literature', 'ENG'),
('Thermodynamics', 'ME201', 'Sophomore', 3, 'Study of Thermodynamics', 'ME');

-- --------------------------------------------------------

--
-- Table structure for table `dean`
--

CREATE TABLE `dean` (
  `DeanId` int(11) NOT NULL,
  `CName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `DName` varchar(100) NOT NULL,
  `DCode` varchar(10) DEFAULT NULL,
  `DOffice` varchar(100) DEFAULT NULL,
  `DPhone` varchar(15) DEFAULT NULL,
  `CStartDate` date DEFAULT NULL,
  `CName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`DName`, `DCode`, `DOffice`, `DPhone`, `CStartDate`, `CName`) VALUES
('Computer Science', 'CS', 'CS Building', '678-901-2345', '2022-01-01', 'Engineering'),
('English', 'ENG', 'ENG Building', '890-123-4567', '2021-03-01', 'Arts'),
('Mechanical Engineering', 'ME', 'ME Building', '789-012-3456', '2023-02-01', 'Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `Sid` int(11) NOT NULL,
  `SecId` int(11) NOT NULL,
  `Grade` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`Sid`, `SecId`, `Grade`) VALUES
(101, 1, 'A'),
(101, 2, 'B'),
(102, 1, 'C'),
(102, 2, 'B'),
(103, 3, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `Id` int(11) NOT NULL,
  `IName` varchar(100) DEFAULT NULL,
  `IOffice` varchar(100) DEFAULT NULL,
  `IPhone` varchar(15) DEFAULT NULL,
  `Rank` varchar(50) DEFAULT NULL,
  `DCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`Id`, `IName`, `IOffice`, `IPhone`, `Rank`, `DCode`) VALUES
(1, 'John Smith', 'Office 101', '345-678-9012', 'Professor', 'CS'),
(2, 'Jane Doe', 'Office 102', '456-789-0123', 'Associate Professor', 'ME'),
(3, 'Emily White', 'Office 103', '567-890-1234', 'Assistant Professor', 'ENG');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `SecId` int(11) NOT NULL,
  `SecNo` int(11) DEFAULT NULL,
  `Sem` varchar(10) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `CRoom` varchar(100) DEFAULT NULL,
  `DaysTime` varchar(100) DEFAULT NULL,
  `CCode` varchar(10) DEFAULT NULL,
  `InstructorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`SecId`, `SecNo`, `Sem`, `Year`, `CRoom`, `DaysTime`, `CCode`, `InstructorId`) VALUES
(1, 1, 'Fall', 2023, 'Room 101', 'MWF 10-11', 'CS101', 1),
(2, 1, 'Spring', 2024, 'Room 202', 'TTh 2-3:30', 'ME201', 2),
(3, 1, 'Fall', 2023, 'Room 303', 'MWF 1-2', 'ENG101', 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Sid` int(11) NOT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `MName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `Addr` text DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Major` varchar(50) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `DCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Sid`, `FName`, `MName`, `LName`, `Addr`, `Phone`, `Major`, `DoB`, `DCode`) VALUES
(101, 'Alice', 'B.', 'Johnson', '123 Main St', '901-234-5678', 'Computer Science', '2000-01-01', 'CS'),
(102, 'Bob', 'C.', 'Brown', '456 Oak St', '012-345-6789', 'Mechanical Engineering', '1999-02-02', 'ME'),
(103, 'Charlie', 'D.', 'Davis', '789 Pine St', '123-456-7890', 'English', '2001-03-03', 'ENG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chair`
--
ALTER TABLE `chair`
  ADD PRIMARY KEY (`ChairId`),
  ADD KEY `DName` (`DName`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`CName`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CoName`),
  ADD UNIQUE KEY `CCode` (`CCode`),
  ADD KEY `DCode` (`DCode`);

--
-- Indexes for table `dean`
--
ALTER TABLE `dean`
  ADD PRIMARY KEY (`DeanId`),
  ADD KEY `CName` (`CName`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`DName`),
  ADD UNIQUE KEY `DCode` (`DCode`),
  ADD KEY `CName` (`CName`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`Sid`,`SecId`),
  ADD KEY `SecId` (`SecId`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DCode` (`DCode`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`SecId`),
  ADD KEY `CCode` (`CCode`),
  ADD KEY `InstructorId` (`InstructorId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Sid`),
  ADD KEY `DCode` (`DCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chair`
--
ALTER TABLE `chair`
  ADD CONSTRAINT `chair_ibfk_1` FOREIGN KEY (`ChairId`) REFERENCES `instructor` (`Id`),
  ADD CONSTRAINT `chair_ibfk_2` FOREIGN KEY (`DName`) REFERENCES `dept` (`DName`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`DCode`) REFERENCES `dept` (`DCode`);

--
-- Constraints for table `dean`
--
ALTER TABLE `dean`
  ADD CONSTRAINT `dean_ibfk_1` FOREIGN KEY (`DeanId`) REFERENCES `instructor` (`Id`),
  ADD CONSTRAINT `dean_ibfk_2` FOREIGN KEY (`CName`) REFERENCES `college` (`CName`);

--
-- Constraints for table `dept`
--
ALTER TABLE `dept`
  ADD CONSTRAINT `dept_ibfk_1` FOREIGN KEY (`CName`) REFERENCES `college` (`CName`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`SecId`) REFERENCES `section` (`SecId`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`DCode`) REFERENCES `dept` (`DCode`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`CCode`) REFERENCES `course` (`CCode`),
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`InstructorId`) REFERENCES `instructor` (`Id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`DCode`) REFERENCES `dept` (`DCode`);
--
-- Database: `ceylon`
--
CREATE DATABASE IF NOT EXISTS `ceylon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ceylon`;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `submitted_at`) VALUES
(2, 'hh', 'hh@gmail.com', 'hi!', '2024-09-03 18:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `hotdeals` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `role`) VALUES
(7, 'dd', 'dd@gmail.com', '$2y$10$RmDWH15tTFZ8cpU0dM4uMuj5qpJl2AYbxvhwo.DLgjzThIGiFbQjO', '1234', 'admin'),
(8, 'aa', 'aa@gmail.com', '$2y$10$Ef6fLSWHr3HFATvGx5oqGu1cwhKGjTUNATqp6zNHs5HuHea0yE7C.', '1234', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `ecomart`
--
CREATE DATABASE IF NOT EXISTS `ecomart` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecomart`;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `submitted_at`) VALUES
(1, 'dhanuka', 'dhanuka@gmail.com', 'helloooo', '2024-07-11 21:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `hotdeals` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `category`, `hotdeals`) VALUES
(3, 'ggg', 333.00, '', 'fruites', 0),
(4, 'fff', 15.00, 'C:xampphtdocsTeam_Web_Projectimagesadmin.PNG', 'vegi', 1),
(5, 'aaa', 1555.00, '', 'www', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`) VALUES
(6, 'admin', 'admin@gmail.com', '$2y$10$uyngQD4Dy7OjJMSgqy//VOxHWnfv2EwysRaSfL6hwXiqeUdYs3QMG', '12345678'),
(7, 'ddd', 'ddd@gmail.com', '$2y$10$M8WTRKUdQvPj/COqW6dfzOYfH.6hr421V4LlO/Y9pkncp56gDfNim', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `created_at`) VALUES
(2, 'aaa', 'aaa', 100.00, '2024-07-01 19:08:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
--
-- Database: `gill_art_gallery`
--
CREATE DATABASE IF NOT EXISTS `gill_art_gallery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gill_art_gallery`;

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_Id` int(11) NOT NULL,
  `frame_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `no_of_Paints` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

CREATE TABLE `buy` (
  `buy_Id` int(11) NOT NULL,
  `Payment_method` varchar(50) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Id` int(11) NOT NULL,
  `Ename` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `Phone_no` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `buy_id` int(11) DEFAULT NULL,
  `Paint_Id` int(11) DEFAULT NULL,
  `Sell_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_Id` int(11) NOT NULL,
  `time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `Painting_Id` int(11) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `painting`
--

CREATE TABLE `painting` (
  `Paint_Id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `buy_id` int(11) DEFAULT NULL,
  `Sell_Id` int(11) DEFAULT NULL,
  `artist_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `Sell_Id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_Id`);

--
-- Indexes for table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`buy_Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Id`),
  ADD KEY `buy_id` (`buy_id`),
  ADD KEY `Paint_Id` (`Paint_Id`),
  ADD KEY `Sell_Id` (`Sell_Id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_Id`),
  ADD KEY `Painting_Id` (`Painting_Id`),
  ADD KEY `Customer_Id` (`Customer_Id`);

--
-- Indexes for table `painting`
--
ALTER TABLE `painting`
  ADD PRIMARY KEY (`Paint_Id`),
  ADD KEY `buy_id` (`buy_id`),
  ADD KEY `Sell_Id` (`Sell_Id`),
  ADD KEY `artist_Id` (`artist_Id`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`Sell_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`buy_id`) REFERENCES `buy` (`buy_Id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`Paint_Id`) REFERENCES `painting` (`Paint_Id`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`Sell_Id`) REFERENCES `sell` (`Sell_Id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`Painting_Id`) REFERENCES `painting` (`Paint_Id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Customer_Id`);

--
-- Constraints for table `painting`
--
ALTER TABLE `painting`
  ADD CONSTRAINT `painting_ibfk_1` FOREIGN KEY (`buy_id`) REFERENCES `buy` (`buy_Id`),
  ADD CONSTRAINT `painting_ibfk_2` FOREIGN KEY (`Sell_Id`) REFERENCES `sell` (`Sell_Id`),
  ADD CONSTRAINT `painting_ibfk_3` FOREIGN KEY (`artist_Id`) REFERENCES `artist` (`artist_Id`);
--
-- Database: `greensparkevents_db`
--
CREATE DATABASE IF NOT EXISTS `greensparkevents_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `greensparkevents_db`;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `cid` varchar(50) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `message` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `tid` varchar(50) NOT NULL,
  `ticket_name` varchar(50) DEFAULT NULL,
  `ticket_email` varchar(20) DEFAULT NULL,
  `ticket_phone` varchar(20) DEFAULT NULL,
  `ticket_type` varchar(50) DEFAULT NULL,
  `ticket_number_of` int(10) DEFAULT NULL,
  `ticket_message` varchar(225) DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `faculty` varchar(20) DEFAULT NULL,
  `batch` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `type`, `full_name`, `faculty`, `batch`, `email`, `password`) VALUES
('UID655534759', 'students', 'chethika', 'faculty2', '22.1', 'chethika@gmail.com', '$2y$10$I1afPzDZIA1Uy9bFRRE13urcON5XwZYToOyILNc6bMaYvS21etzwy');

-- --------------------------------------------------------

--
-- Table structure for table `users_admin`
--

CREATE TABLE `users_admin` (
  `uid` varchar(50) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `faculty` varchar(20) DEFAULT NULL,
  `batch` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `users_admin`
--
DELIMITER $$
CREATE TRIGGER `trigger_users_admin` AFTER INSERT ON `users_admin` FOR EACH ROW BEGIN
INSERT INTO users VALUES(NEW.uid, "admin", NEW.full_name, NEW.faculty, NEW.batch, NEW.email, NEW.password);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_alumna`
--

CREATE TABLE `users_alumna` (
  `uid` varchar(50) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `faculty` varchar(20) DEFAULT NULL,
  `batch` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `users_alumna`
--
DELIMITER $$
CREATE TRIGGER `trigger_users_alumna` AFTER INSERT ON `users_alumna` FOR EACH ROW BEGIN
INSERT INTO users VALUES(NEW.uid, "alumna", NEW.full_name, NEW.faculty, NEW.batch, NEW.email, NEW.password);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_students`
--

CREATE TABLE `users_students` (
  `uid` varchar(50) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `faculty` varchar(20) DEFAULT NULL,
  `batch` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_students`
--

INSERT INTO `users_students` (`uid`, `full_name`, `faculty`, `batch`, `email`, `password`) VALUES
('UID655534759', 'chethika', 'faculty2', '22.1', 'chethika@gmail.com', '$2y$10$I1afPzDZIA1Uy9bFRRE13urcON5XwZYToOyILNc6bMaYvS21etzwy');

--
-- Triggers `users_students`
--
DELIMITER $$
CREATE TRIGGER `trigger_users_students` BEFORE INSERT ON `users_students` FOR EACH ROW BEGIN
INSERT INTO users VALUES(NEW.uid, "students", NEW.full_name, NEW.faculty, NEW.batch, NEW.email, NEW.password);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `users_admin`
--
ALTER TABLE `users_admin`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `users_alumna`
--
ALTER TABLE `users_alumna`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `users_students`
--
ALTER TABLE `users_students`
  ADD PRIMARY KEY (`uid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);
--
-- Database: `green_residence`
--
CREATE DATABASE IF NOT EXISTS `green_residence` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `green_residence`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sr_no`, `name`, `password`) VALUES
(1, 'dhanuka', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `image` blob NOT NULL,
  `price` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landlord`
--

CREATE TABLE `landlord` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL,
  `room_image` mediumblob NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_price` decimal(10,0) NOT NULL,
  `room_features` varchar(200) NOT NULL,
  `room_facilities` varchar(200) NOT NULL,
  `student_count` int(11) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `accepted` tinyint(4) NOT NULL,
  `booking_status` enum('booked','pending','available','') NOT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `room_image`, `room_name`, `room_price`, `room_features`, `room_facilities`, `student_count`, `latitude`, `longitude`, `accepted`, `booking_status`, `student_id`) VALUES
(1, '', '', 0, '', '', 0, '', '', 0, '', NULL);
INSERT INTO `property` (`property_id`, `room_image`, `room_name`, `room_price`, `room_features`, `room_facilities`, `student_count`, `latitude`, `longitude`, `accepted`, `booking_status`, `student_id`) VALUES
(2, 0xffd8ffe000104a46494600010100000100010000ffe201d84943435f50524f46494c45000101000001c800000000043000006d6e74725247422058595a2007e00001000100000000000061637370000000000000000000000000000000000000000000000000000000010000f6d6000100000000d32d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000964657363000000f0000000247258595a00000114000000146758595a00000128000000146258595a0000013c00000014777470740000015000000014725452430000016400000028675452430000016400000028625452430000016400000028637072740000018c0000003c6d6c756300000000000000010000000c656e5553000000080000001c007300520047004258595a200000000000006fa2000038f50000039058595a2000000000000062990000b785000018da58595a2000000000000024a000000f840000b6cf58595a20000000000000f6d6000100000000d32d706172610000000000040000000266660000f2a700000d59000013d000000a5b00000000000000006d6c756300000000000000010000000c656e5553000000200000001c0047006f006f0067006c006500200049006e0063002e00200032003000310036ffdb004300030202020202030202020303030304060404040404080606050609080a0a090809090a0c0f0c0a0b0e0b09090d110d0e0f101011100a0c12131210130f101010ffdb00430103030304030408040408100b090b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010ffc000110803be050003012200021101031101ffc4001e0000020203010101010000000000000000000302040506070108090affc400581000010204020703080705050507030109010004020305110621071213143141516181a1081522234262719124323334b1c1f01652d1e1f1092543445317546372a2263545647382921836557494278493467583a3b3ffc4001c0100020301010101000000000000000000000301020405060708ffc40030110002020104020201030500020301010000010203110412213105133241220614511523334261167124345281a1ffda000c03010002110311003f00f894fb50594a0cfb9449cf8715395d5656b0ce9c203139163d1476beef8abb791a2d4a6f2514290153fd9ef50a7f2f8a72ae86f0552c96b67dabdf50bc4292c0b23f7895fbb7ef58e573fcb2bec019264dafe974e499b2f7bc12d3257354c01660e0532149dbfbbe2891ed7726d31c8163edfddd5ef4bcb78de2fdcbdff2bdea723daee47af203f65ef78226f251b84a4f4b2009a949aa4a98ec6133d453bfff003afd05fecfe021d064eb9becab13fbed65f9eb8f4de9d49b732bef0fecda7c67e892b2d47a7bb5600d6ebc392db47e3138baa96d99f58a829a82627832649a6a8a92a2e080421084b20584e494e5000842100084292001084200108420010842901c8494e4cf980210852008421553c154f009a94ac2804b241038a1038a01135120df8292105dac82108410084210008421000842100575614367daa6a5bc802aeac286cfb509e009a108500084210008421000842100084210049450840021084002ae38ab0a1b3ed529e00128837e09a8544f033e641395720dd0af828d82108554b24021084c00421080040e28425a78024a241ba0137525096467cc8ab092850d64aa5822a4a284109e012508402590428a1040942721000a484200108420bfc810a284156490a2a48201084200108425ca5b401085002ca0625bc8a108414ce48214d081b28ee20853420a10429a100414d08400210840021084010421080042108004210800535042000f051503c1415a0f2009c84126fc543782cde0920f0420f0508aa2078856d293545a4a05817ded7c166a7701deb0d3efb459ac7860d8a1c5301ba908ae7827b6fbcc5f1095671c91d977e8bd13e57354d5c95cd24d0964c84ee03bd24f1529fecf7a89e2936fd10255f6ff00641505956df7697de9449f83735c0bdb56fdea5222d6d6cba2a9c54d6ae8ee2792e6dbddf149d5ed4adb96feddb5979b7f73c5497f6a2d270e2abecfb51b3ed415f6a11b5f77c57b2267d6cba28ce936b7a5d7928282a9e0b09a94ada754b240952dafbbe2931ff89dca49c3122c266d8feef8aa6a4a03183209d4ff00b23dcb17b5f77c55d936cec80f627d1923c52a57351dafbbe2bd56c905880456e76f823659e478ac8e18a0d7f17bf144a0b513dc65617b71fe8a9b8a6bfa3d4a7d32a4d43772d86722d6b7eaca3218252b9a624a15d142be39957a161c9badc44ecbe6bec9fecdcdbc8a162cb8b6b3c90be4f184f106911bd3f0550c372e244d713f6d3f3bf72fa6bfb3c36f48aa63fc32fa1027b612ac00b7eb82d30e12395ab87fb1f6ea10a232374e39e3e1054d2217b25bc99af5c64de409b36237e3b35a968b34b784b4c344715cc250cf8a4489e640273bfeac803744210aa9e0bfc8b09c9285050721250801ca4a2a4800421080051421004135290aff00227b1a9c928529e081c85053529e401084290056157561558021085000842100084210008421000842100084210008421000842100084210008421000842100084212dbc0021084c00421095f224108421b252042108004210824821085627e6410a6a08208a928a10553c124288e2a482d15b848164c41e2841424a6a0a682e0a0a6a08022849420a0214549000a2a484002108400210840021084002521081896f042108206a10840021084b4b258108428004a4d4201ac8a421082a08421000842100084210008421004108b8ea824754005c21575207b54c9600729a829a80208421000a6a0a680208b04210008421000a6a0a680229e842a25b8b25814ffea0582e4b2756e3177aa409bacf6bc3232079ab94ff00b53dcaa730add3fed4f7255a8845c26ead3202fe2aa2b120da1596cfa340f9a4988f62f0f00bc5002c976afb20f67fb3deb252f9ac5c4b28a6a59c81f82df46fff0067ff00aadf825fdbcaff0076bf8ab0ab8e29fd1df686fd87bdaddc94a773d5009bf1407ac6a129350508cffae7e092ac2f3926d6b918d648ef1b7e64eaa72aa411c5376f903a9c7b56862864f82fab9f55e6a9fdef04a33adcbc54ac3aa823dad763d2f50fef78256d7ddf14dd5ed407bbfe8e93cd5d93c0f72a526de966acb6fb50a14f6fd056d0cfa36ecbcdbfbbe2a13ede8dcf55106c6e80b6de3837fd12e90d968dab8f2bce68fbcc6e246eedc5f871e76f87c5612aaf5dd62aef2a0f3e91bc937bc56b5f92c0036b65c15992e8c000d5bf7a92b55b3da5ddafbbe2a04ec7b6e9326a1c6d1745eca9fc7d0f1529166cd86838f9ee8fe74daf3690da7f43c2df8aee5fd9d75f9f50d256338c9037aa66f16bf0bfe37fc97ccd881bcf3879cbad9fab16f4aff15dfbfb385d4a874b35b684da29f47f47bad7fc56b81cbd5d92c60fd1a5e442e2c908b03c7827671c9cf460b4853363a3dc4b3843adab4e9b95fb16b9e4dda3393a27d17d230d980871346f13c93c3a65de566749b26171a3dc4521b671ee9f3cd6570cd4654ea3d3e5c22c43394467d8872cf04f7233e850476a082c2611d89774d06f98541896f26842102c13925080268421033e64d084205904d4a42b80d421080042108004e421592c002b0abab0a1802108500084210008421000842100084210008421000842100084210008421000842100084212d3c802108505c10842001084200108420010842001084902ca52c904d08429241414d410008421004d0842008214d080042108020abab6a08022aba9210508a921080042139002509c92801c849420010842001454945004135084170421080042109458108420010842005210841504285c7545c75401342821004d0a0a6800503c14d0801484213404a1390801a84212808214d41000842100084210008421000ac2526a0940ac2aeac5c7550c1983a87de63f82ad62acbff6d2c701f0592cfc990c2c3a2c949fbb44b1a382cc2cc99296452bf221fad9f4556c3a2b4dbeef17c52acfa1e4544f153b1e8a052eee883d6f9b825642154d971ef5928893cb822a03f04a7fb3de94842d2acc9de1a14a5735e0fbca82af45c941cd10f12887e8f2ff007bc1555245bd161461fac14f6d7f67c54c83d53aa781591ad994fa84f85a36875a38b805b151f053170de7c55aaac96d137cc025567d573829896b31b889fb8038731f05429cebce342a9c3508b59c5ae1c45c4667e49a436646aacf094ba4ccdd5c972e05b552a873f0c3b6a1b3f6f16dc5b2bad6cc16e49661419df66fb3468fe0b03adf2579a5234753dc06c6716d145f639f15cda15d26bd4ec3d3b44d87ea8da43735092e377706fc321fc0a04c8c06e54c935789ab81ab241b5d6dce186020d8386cfdb91c8dd7348e3d51622e12e542d0ce171c542591b06fa3ad3ac29815c3289c36a9b79908e7c2fe2acc18070379937a354226dbeefb7fcacb91c518932badbc56570bb582b2e66c01f8953e448f44292eeb9337cafe19c28c28d26aad5cc262da8db37827d87c42cbd1f45d852b304c742a80588b643b78e6b8e4ca8088c3ba4f238eb5b9a8b4ab4526230da6cbd6e2785d593fa223c70768a868d305486a626f889b0737e24dd56a3e8ef0a3ea74ca938a9033a0be7f05c7e63e6ae1c13b71b73c4c456425c3a96cee55f297459be0e8189b08d3e9f82a706d5270246d86f526f7bf5f8ad9fc9ea7b1d0ce3bfdb8a56ace0e5a86c05ee2f7fe6b92415485bc8bc3170e4b25a11a552b49fa57a1612aeeddbd3ea133fcac56b75cbe4995b39fa859ecfbc879594884de7e163d96cff2596ffea96996026e1ab5ba15a77ff411a2b885ff006a313fcbf9af26790960e9d6ddf48789a1b7d6b8fe69e66c236dc4de5318467614a95a92f61de194e872b7a36cbbd57d17f944609abd1a9513998e5b4521a7d5c8df82d2247916e087f04ca6b5d2dd7a1d5b5b3eb7ed5ade883c939b399b5d72eb1dbf8b61519d4f89b888e7c3920a74cfa9a97a6bd1bd66e5be2c932756d7f4baadd193f6150921c535d09f279585acbe696fe47cc643a74f2958e6b320b9e26200ac631a4e9a3c9f2275537551159a0710e5b0bdfb2df35724fad0129b0476be4b96e8c74d346c7ed8b62e216f3c1b6adadac574d872c950888c4210800561575610501084e401053421000842920010842b80210a0059004d3925394a00561575610c01084280042108004210800421080042108004210800421095f2241575615752819610abab0a4804210aa58108420904210800421080042108004210801401ba92144937e2aff22df124842141504210800421410008421000a685040134210800421080208421005742108280ac2ae9c49bf140c4f61242108208a4a9a820a02108417f8821084002108400210840021084b94b69604210a001084200521084150425213406a52125000842106848b0a6a084a339342108042908504d3413424a720ce350a038212809a8210800429a5cde4803d422e3aa2e3aa001085340026a526a09439092bda8fdd8a4cd60198642aeac2a67240d6f236d06b6b5add8b260dd62d843aae213759458cb2056d54ff1d5b5435a26ab8425cde4916f1c017a97c4fc55e99c956a7fddc7c55999c92c982c9f818a6a085aceb82129476beef8a9c00f5481b1babaabcff67bd4d7f6551386259dc20df7fc40d3e890ceddad3f3e4b010adf74312378c48ee9cdd94fa8397124986c6d6fc53176564bed1a6d7dc4556c4aedd4e8354dc657bdb8f0f928c3eaed64d790982a2e77a876435b8f1b5d549b348b585d3d0bce47a59361755511399910b208e86c534426c579b687b1568893788949db140b697d994fa36ecab6dfddf155b6beef8af6445aa49b2092fc933e75f89ebd8aee1f74f682fe7bb9117de064785adfd5556b3c4309b42991cfda802fc103324a4351b4b6b8099153733ebe33f14b6e0c11eb66afc1108870410e3931c5819516b0801ed5759c4e35ef7e49c61e088666a8b6aa092bc32a399170bd96c9e4bd52f34e9c706022fad521cedd16004e2244f7445849e23aab7e4feea4c3a5ac3178bff1295f9a7572c9cfd527c9faee2bf24ff807ff0097f24c15c9073d58877aab0e1a9b04370e2227b52a3a1bd160003de9e64cb66b940afb165a45a9d0093ebd9eddb8bf0fd5c2f30016547d2263691b5316f13e4d46f6b5b32b03a42a057e86fa8fa44a4d3a2722897138b6cef2267e392461a9d0e23d28d7aa94205db1869ad6ee386b4fcaeae8a9daf7b6d1102198990c478c317c96a029f51956b3771f34d6efdc368844679f81cd00723d26e8cdb68beb537485842516f49700874dc8fbbf5b7cd760d14e33938bf0def304d114f900585f92956619589a82f30dd4cfde644e90403d4ae5ba337142c0156a3d3a4543789ee6cd9c5a3b99139007d0ca6a033e1d2e8413d8d4210820b684a4200b084210501494508024842100084210009c929c988015855d5843004902c9c850081084257c8904210a5325f208421081821084c2a08424816402591c8421000842825a25934210a12c92de010842090421080042108004902c9c8529e082ba15842324601084282c410a0a6ac008421000a0a6a08022842920aa5905350420b0214d080042108004210802084252008210841405615756105c1240b2721005742b08b8ea802ba108400212e14c400210840021084b94b69604210a001084200108420012935290432161d1161d1084104525392534d0084272001414d0aa9e0aa782485342a0920853420085874458745342001414d080208534200820f04281e0803d424a7272590243829a80e0a69203508420b0e542a9f762afac4553ef252583282b0abab0968a97e9ff0057b9594a65f77855a3092b21647adbef117c14ee6e972c6b5fb1339f7a559f434824a72549fbc9ee459f4499395cd385bb1040515986fc8fc0d4c852d325735b59d8133792924cff0067bd0802da825cae69a655bdaf04740c8eaf6addf42a61fdaa30ef1b19e6f6cf8ad222e042d9345c4fed64bebc5597655f1031d8d86c716d5a45f5b5675be57589845c5cad8f4894f714fc71506eedaec0db8db8ad74700b427c1979479b2f7bc14909b63d148c2a256c3dff00056d793a4dede975e48145099c96424c9bdfd2e9c9509ff6b12cbc8f6bb9037e01264defe974e48127e95f5b9f45690804896cbdef0514e4940d2c6c3dff000519526e22f4ba724f96466ac1cd00629e48d59318b7154346cfbcd9a43c38f7eaec2a2cf3f89fe4b30fe5de4444745ab53e1dc714b3b8d6d8cf93d97b04da7b39faa8f67edfc888ce6dabc14a1042a740067521a3cff78912b3592d53700e575a9239b923c02c60654ea7b8965b4893201b8016567faa97ae07724924ca1347352058862310e09739a4b71685c49862847005325116c826a00d61f53a7b7bdbd2b775d7cb357a4e226fa51a8d46110c8a7b5a9022288f695f66af8bfca0dc54a9f8db10b32e2cda4bb9195badbf82083ece62e219cca07045b5a55ed74d83317581c14f3ce185292eaf7d6652b3eb92cfc28257639094841382da125390416109284141c850534002928a9200108420013925390008421380b0842150010910a7a3a004248164e406010842001084257c801575610a512c10ab9c8d93a14741d9255d5855d081961084284b24b78055d08578bda43792c2108542c0842100084b861d5e6988205006ea485124dd5fe45fe2490850505414d414d0008421000a08534010429a100414d08400210840021084002108401055d5842008a1084140421080248420f041722bdcefcd19dd7893f32dd8942b0aba9ce413c821084d2a0842100084212d2c9604210a0010842001084200129352904304210820521084d00424a10191c9a949aaa390210854120a0a6a080042108042c0375e217a6fdaaff11e310842a09fb2201ba82b0aa2b6760f4b2390929cae67243829a80e0ac25025904214d2d3c16058c59399c96315180b9bc92d0855fa2a65e5734f424ac6682e49f6947da2bd4b2936f09325afc0af3792930fbc42a3379218fd925da54cacae69c00b70484d4a9723a27e03ab52b9a5a16e3b02a7724bb8eaaca4f1fbb5fde4609f59191ed772ba948460819abdab61d1a3c974ac6321cb91e80cc66b5d1c0acce053b5c6d4c91d4a942ec785832da69745f63e9ce41316b49b5fad96983805d0b4e54e934ec661bc8ca112573d03669b9c09c347a9a84207a3cd5ed4a9f22fabe975e49cbc7de94af81402af255b0e8b26dfea98baac1c8fbc9f8059991ed7720205842109a4b5825b5f77c512b9a5ab08207c8e1f2565550066984d85d48cf90d363c569150066d7a2ddce64837e9d16dc67d8e59ad32b9ea1ec472b452532979918354b393f6bb01cf85ce09a0cf805bfbb59922fc325b2ea8e4b42d06bedeb43f8322bdff00b8591f05bfad6719f05771f486c5af0d6f154fff000e0b2891e6ff00a4fd440259189a949a82c0be40f298a631998fb14552aaf3776bab24f0e3fab2fafd7c63e5544ffb55aadf9d39a7e082b23e98d13542439c194b96dceb490cee3e6b7916e0172bd03b82eb01d0ed15c9a72e9b0447e48207a1414d0353c8d4e5517bb5f77c5055ac171095b7f73c535050139255840115242100084210009c928400e4210802c2157428c1392c2aeac2ae840c15842135bc90253908504b7904212e187579a5a06315742b0840de4aeac210a1b252c15d0ac215a52dc46010848d5ed51159247aaeac2142618c8215742b4a3b48c9610842a962bab0aba133e6513c16108425be0b6482108562410842001084200829a821004d08420010a0a68004210800421080042141004508524154b2450842080422c5080042108024a247620137e2a48f90ce81575607055d250204210a49042108004210802c2108542a0abab08529e013c15d0851562c4929084156f2084210042c3a20816e0841e0802284213402e7aa6a144937e296de096c9210850402829a82001084201115053504c439134210a08042108003c5083c5049bf1556f051bc0d421354154b2084212adfa2584d36b2c7abd3f8c2aab816d5ef4a9adb80ff008534c95cd2d59647d28a1eb6503cbe84224fde4fc42ca05b3c15456f61eff82ad3b88ef4ab3e885c15a7f00b2ac726f08e8b104715976ff6612ad02e1217aa0bd4bce07a583f0197b2675afe8f4e6bc515b59d54f0584246d7ddf14d95cd05d31e948493c109100b21867ffb9e9ab0eaed03ff00b8e9dbd7ddf689e8a1b9696a274711c876e65673e501c7815a79f82e8ba627a5f5518832610de44ab48b777f25cf0f5b594488e192421082d1781a933792724cde482c215d91ed772aab2080248421000adc8f6bb9638016e0ae499dc7d1f151ec4bb02debf62af3bd9ef53b20820147b53218a101882d731048911c7049847a40124fc56cf28924dc2d7310583c93cbafcc27513fc8c9a9f89fae7e4c5384fd026071afadfddc175206eb87f914cf2e7c9c70cc24dc805771cc120f25d038cc14908400210a6825105f2a7952c8a449c7953add7a1bff007749cfbd7d5cbe44f2c3bc9c710dc7db505044da3b1f93fd45ad630350dcb46db01b99b1eaba9c3059715f263725c68d2871def7baed8059053b3c95cd31574206646a5213f65ef782082299f65db74e95cd13fed64ffce803ddbfb9e2a723daee448f6bb93500295a49d5ed52a7bddbc33a1b5f63e280189c929c8280929c840021084002109605900315855d08253c1610842b90084212be4482ae842bb8ed06f25842ae8b150d6413c1610aba146032584a504295c064b0855d58556b04a0421240b294b20455855d584321021085058aeac210a7b2bd104210a4bfc010842080421080042141000a6a0a68004210800421080050421004d414d080208421004508524154b245038a1082092891d8807b549033e6450823b108164870458744022dc5171d520b82aeac5c7555d4a250210852482108401610abab0aad60ab5804210a001084200ae949a8572cd645213529055ac0210840021084002108400210840021084010421080042108002abab171d524dbb14a780229d73d525581c159f04e410842a1008421004d35293504a04e494e49b5e300f9283d7130c9305f8aa0b30b173792a6482b2bd4ff006550921b6775906ff6a123e43f182e6a7fc13f356247b5dcb18afb2f6fbbf34a2196674dc87a3d79aa8870ea103878aa711b949b7e89227ef5deb3b2b8c4b0ec3ef50fc567a47d409098dac8a71e6929c38acf72c26684f71f80885e47f651772f5748dc7b66fd02f5450a720584a9dc077af10ac02c937453bfef765ffae7f24c430fbf3771ff001c649c8cd62c9d434c342d943876687f7b9e175cecdaf92dbf494e9dcf91499f3cfa47f25a689e0f01c144b9262db2484a5eed7ddf140fdec66dfdcf146dfdcf1421048a56b6fee78aa571d55891eba2d5e1e282e6425f3504adbfb9e29bfe590008429a500d5333efecf8a525c3c5085ffb16e5100f0e2b57c524cb7e2103eaad9e51006656b38acc25f198464536b78b302755f13f4d3fb3cde875e4fad213fe0d4678f8f05f4bc5c4e5cd7c91fd9b3101a14a9c232d9d76785f5beb5f3b2eaae4e21e2108401340c9414d05b3926be68f2b59f44a66246755a90b4ef33ced8771c97d2ebe5ef2c9924d7f0d400d84e66f33e99a054fa363f257ab38aae01a6b9756b93379aef00dd707f2566d0b7c0f4e6ee0709f37582ef4614057cf62158504c95cd05d3c0fd87bfe0a084e40048f6bb913fd9ef49420064986f7cf829816e4946fda9325bb86ee07d22ff137ba5ab304f65c9a6d6c955a00ddcbc83eb6de75afc2c9ae3320849622fb486f99891d07464d084260b04210801c8494200108420072108401610855d422cf827729aaba14be48c8215855c0ec42790c001d8a485124dd05fe0078a10840b0421038a0000ec4d505340cf81042108209a829a82009a108400210840021084002141080268421000842100414d414d0008505340021084010421080042108022842920aa592284210402108400201ed421004944837e0807b549033e6092059390a52c905742b0aba800421080042b038212724e4aeac2aeac2183055d5855d08102108524821084002529a820860842104021084002108400210840021084002829a1004107829a81e0802ba1084d0056145492d92c10842820108b8ea8b8ea8026842100352dc7d994c44ce49177d163173fed4a4cff67bd599bc952a873f8aa7641ec8f6bb95f93ed2c5acea4dbfc0e2bab0856d2892a21352e6f259adef007acbed8fc565e47d98588a7f18565dbfd409436bfc462f4f35e2f4f349bd766867f3f8842b0ba6de0da575291ed7728a6c8f6bb900350a2bc3c10981199c57b33ed20ef5e453bddf146df61cedac9c6672c1d674af566cff000951f756fab78ae32b5f82e5701e372bace3cc3721be8b595766d46ee21b119ae41226fa5c14e0ac67c97367daab826fc558499f636cfaa3033391b23da5ea4eb4238908da8e8a07a17aa558937ceeab4d8c5c01c912a75afe8f8a08f735c19845c7548933a286f6165625102e81fedcf47a17abdda9b7d42bc41425fe5c2f464bc413c51fee036126cb5fc570924440f1e6b3d71b0ed5af62a9d691272cf3fc9456b16e4cbaaf89f7dff667540cec178c29d7beed529511ec5f6b5acbe05fecc57b1818ea4c196b10095f7c888100f55d48338c454d414ef7562a9e09a109282a872f9b3cb165ea39c30e0f1d8ba1f8afa4615c1fca9d8b77b1e1a74edc43bbc9da8248b5ee10449e4d73c8f5c41370588a13ff00884efc57d30235f36f92c4129b506719035a4c352e3f35f46eb5fb105ab7ce0621290824ba97b5f77c52a6f24b40171b7b5dca4e278d91bc3e2a809d6f67c515084ce91b9b916ea8608f67d5db3683584cbdb8849188e9e48bc62eb5471a3da4cf835038703ff72c7ffb25a6447efcf42534893a2c3526ee85e4cebdb8e4a74f377b61c39ae6f2345b4f6ce4410bf7c6eb78c354218724895bc389f90ced652c0d85355304dd3d37e41d0d4210a0582108400e421584378252c95d5855d086b209e0b0abab08508195d0ac21190c15c0ec52428926fc5497f81242108208a108414042108024842720b95d5842155bc9096010842092084215801084200108420010a0a68004210800421080042141004508524154b2455855d5850c1105042149622842920aa5922842104021096059004539253900084210d81edcdd78a48488bc011494e495772da34108426150421097296d2c084214002108400210840021084002526a52086084210410421080042108005350534002108400210840021084002829a820115d09c92ae3d3c961171d55742851c896085607041e0a32192ba72109a40d421352412c960f058d3c55a554f149b38c03e04cefaddeb1845d641d9201b2a123ef04a58175849b3987d2f05948563257356e57358cd0594e453fd9f826a92054ff0067bd63e7fb3dead2a2e3ed4acb6fc87190a7f18565e9fc47c15061f7785645b7d44b1d8c97dcfd99f82a123daee53a8cefa345e8f8a5d3e4fd5f4bb38245bf203f00d0bcb8eabd5d23795d3647b5dca6853902c254ee03bd276fee78a91e0a580826e929c899c93d192daf8c9d6dd55f0ae24c0d43a6544b82fc9b8d516e9c5506ba17a7baa7cf8a07f35bcd6f3b3cff009ac69c1b4f938321ae4788e7c3518cef02d10216bdfb6b8c4121ad661b4f3ad7eb6feaad9333dd1e8da2a1a26ae53de474c8ea1109a388bff35819b82b115c5c483dcb1d3f16e2d9ee7793881c89df1ba8c5882b96cea50053c178bb19b0cfd1be2090dc4e8c363d80155460cc5066ec1bc1233e03555538bb12ee25b3aaa17120f13755ff006bb115ae2a9029cd6cbe6d431fe04c5ade6e74e2473b155e5619c4b2e217a44dbf6271d2262d0dac5c1b03fbcb214dd2de35602680644f973c75b59578fa2aed663e6d3eb2ce005dd3674009c890ac86355c88a7ce84fc159874915db5f60dc1e96bacb4dd2c5767b7972dc316f943607f4153191b5d92fb35c9b2dc378c42e253886fc2e38af04e196456c10e931e17121d3aa24871b1e607f25927fa5c695773138fd8e91267f4b946d1ce6d1a809b717b2809b72782d958692e94d6ae1dbbc210b98ba1cacb2156c79a39a8133dae1272d620af8fb16ee9234a2e0916b2c16278ef265e5d56f1231760b6f540e5cd1a7cf927b382c857eb3a1fab3f2e9ab79d0b5327985315c8ab26ec8f2772fecc29d7c718bd96adf79a5c8caebf45ee49b5f82fc9dd0ae96f07687abcf2b742c4515176f2757a5b3cf25d97ff00ae5af4a7b618ed8ce6c7af25b60731f07dff000af7bd7c5b873cb9055e901c478aa80279e76b5d78dfcba2a6270313ac3f15867617fc930a767dae3814a1c4af921bf970ed21867c2da904e796afe616798f95dbc7acc386d87690ea2ffd7b2083e9e857cffe57323ce54ac2ed8b8f44bb9bade8fc3b5269be548f6a92273969851afa8bd8dbf9ad531ae2da9e9db0d525e3695e6e8a44d9e7eb7eadc1490c7f926b714ca554a953cda7f9c4dc77afa821faa17cc7e4cb87a2c3122a14e766203ce24c3cadd7f15f4e43f54282d07c8c4210804b241084d416148426a0052361eff826a1549c8ad87bfe0ac21355b19252c0e4d4a4d4151a9c929c8280842100084210008421000842b08252c82129354358241575610a632da0d64ae84292084b25742139041053421000ac2aeac2864a208421592c8c88210a0a0a8e4210a3a2bd89429a149620853420010842001084200108504011421490552c91421082015855d086b24a7824a6a0a682c0a0842008a4a724a0a02108400e424a721bc00126fc5490859c048164e4214b791896f055d39254a0408421492084210008421000842100085610a32464ae842149208421000948420ab790421080042108004210800421080050534200829a108005042100574210ae5d72085002ca6820b0845c7545c75542a161d1161d10a68004d4a42013c0d554f14d99c95449b5f44f6294129c3885bdf585d352cb56b05e62c7796dc78f82b3b2f7bc12a438dde46b6b5ae9b2b9ac6351769fecaf27fb3de9723daf804c9fecf7a91c964a8b1eadcce0a848fb50b0daf12211b1cae6aca52ba8487278292cac8f6bb9521c164da7b7dc96de483f9ef5e03daa323daee4d5d0c1d3f91150dbfb9e29a87127d51f4bc14a5828450aba146007d87456368db76fb7e5fbaa821592c03e8ebac2826ada3572e621f47916cadf1fe0b91917cc0e0b7ba3d72a31610868d14f2641bfe0b429116b4b171984d46671593d4d4a4e6f16ded96adfbd04555e3248037e09db2f7bc13e47b5dc841a61031f3fd9ef5ec8937bfa5e09b3f977a4c8e252857aa0a7fc967623af8292b328f14c9d2b87a5e0819e987d15d2b65abed782b46e79a05c734d27d653926f756f6027f2beaaf767daa681de9455d84278fe0abe26900d38806ddcaf83b1edbaa7899bc71d20cd1f25653c996dab6419d7fc851b506b5a7296dab34f6cf64b8a6cdece8bf4866e87b44cfe28a275a3fc3ee6ff005be8dfcd7e68790bb8934ff280a23a7316ac3b39bf82fd55955fa647909b7ee5b6a795938d3e0d1e6f93c683618cb81a2cc3e47eeeedfcd5275e4b5a007e0edf4694437e16878782e962a2c661169e2df04fdbb4880d570093d89c2ce1d37c897c99a123fec1427b6eb193bc85bc9fe38755b53eacdedc3e9257d0dac22ce137088c5d0183e673e41da3e912cb9a363bc5d4487a08b385465688eb1a119ed22698a9c55e43a844277a1cbf457d32011c095cabca41a433f08346ee274f6d11743f251bfe8a3e3931ba37a837ab450d49b9bb79f3ae7b176f8220211f05f36e855ed24379b4ca59b41233b5d7d186fc94822e2157561004908534174b2414d084164b04d084205a59248421009e015855d0820bca4a2a480042108004210801c8494200721084002b0aba118253c021085327b8804210a00829a10802c2aeac21553c166b25703b135414d58b7c0108420804210802085342001084200108420010842001084200141084011421490552c9142108201084200929a829a0b90421171d500452539250501084257c40139084c604908424002108417055d584294f009e0ae842158aa590421081808421000ac2ae850d641ac961452508c11804210a49042108014a0a684152085342008214d08020a684200108420010842001084200821094a1bc0105002ca684c2c0842100390929cac5490e0840e0a6940083c1350827025cfb3dea827c5375bd9f148597190452a8ce8637048f82736f6bb9579f249722fc38a74294de471795f651dcc79700150594912beb7a5d39240169539bc9327fb3deaa25dbf11c569d7caea2cbed54d5ca47de567f882328b20aa26edbe8df57b38a81d826b20a8cae6af25107f3d73a75ede8f5e6bd913afade874e6aaed3b1376fee78ae91d16f2394b6df46beaf8aaa84258201092852039084268bb26a2b93ab60b34395809c6f369d3c6b7a3c3f8ae512a1d582fc89badcf0561caa56b0d54ea6dc6b306e38db8df2ee5aaba6d4f6f32636a58b48e30a05f7c9450ac4ff0067bd452ba210499d6bfa1e2af6d7ddf15564df3b27217269dc5570e266d4e6bddb7bbe298aa6c7e956d6f051d87c4c9c97d7cb5ac4abbb7f77c5536f4fb904c47e49e7791c8a0b8edb9fdcf148dafbbe2bd4a525bd9fc8ef387bc15c6ee25091ad7e0b1aaeec3dff0005046484433e2bcc4950fee43606d7eaa7c963b11674a213d7e22ae7883374f246733869e30e5a2f6acbf5461a4d44716fc3b57e52f9264e1234ef8389e752017ec841103636badb4f470ac345dd5cff00a5e2a2b7e4278b4f0689bc45dbf35381fbb1989c56f1e6d95fe8f8a54ca431b01b2f143782b146a42a8fe1194f360b9a7943efb56d1deb44e2d69c2d95ed75dc8d0299103791e2b98f944e1311e8d1ec34b80ed8ce9595bb1509b57e3c1c3bc95ea9479efab7446e0970dbe90e1c4595ee3aafb11b91bb4a3d8be39f270c331e1fc4f88228df3670e6c470b731dabec36fe937956161abc15d148f05956157561048d4210802684292005214d08024851524002b0abab0801ca4949a8004210800428a100490a2a48004210801c8494200721250801c8494c85004908420015855d08c129e02e55855d58449e4102108552c410a0a6ac008422e3aa001414d08020a6a0a6800421080042108014842920aa592284b853104021084002108b1e88024a685043782e9648af73bf35e212e51c9612842130502109ca13c0104d428926fc548cf8121c1454870424a78213c15d5855d58432582108552010abab0a5ac035804210a001575610a53c02782ba108562c084210008421000a00594d0802ba14d41054108420010842009a1410802685042009a141080268504200128917e29a520f12a547701e2108562c0842b0782802ba7210ae5490e0a68425001e0841e0bc7df643e29563c601141414d579fecf7a49a04edbddf14e91ed772a5238c4b2d2b9a5105a91ed772caac548f6bb9641241ac9e4fe216355c9bc95359ee2502b54efb75555fa3fd60979c0d46590897cd0a0d05d65083c7b15a73ecf7a4d3fec02f67c5f572ea9450fe79508ff35de85d336607213647b5dc948182508426899be700842102cdbb08d51fb662fe98dea0e1bc871c8f004f4f978ad6a50d9451c273b9e2b63d1ebea6b71576ce9b6dc09262902dc066b5e9f3817138186c44c88a09cf24c0ec5e58745191ed7726677e6819f116856d267fb3de95f11df2228524a9fecf7aae082d33e111eb657950633808acafa945c4c24f54c87895385421e2505ad5f89516476deef8aa69fac14a1714466f1850fe75d8cdf47a734db253d04b39b6ec4c4f1222ee6059f26f730b6d34e0d9d17b3579561d733fc17ed1c926117b2fc44d164fdd7497859deafddab2cf9feba2fdbd946f09242df5bc1c298d42109e289a1084154b2791702b96f94c09c742d5d2de29e1c1d88360ba9ded9ae6de51ae5c36d09e2676dceace6d244ef85ae8c12fa3e5ef25aa3d59a63dc4951a841f7965d382fb758430c2da5127d90be05f24ca83e7da54aa38aaba70e5cbaa6f1cbe0befa6e416724c3fba821175494508206a108401342829a001085e5ee802284210552c8d53504e412de06a1414d0549a10841720842105522684210589210840021084154b20842105815e545390d6494f00842104021084002b0abab0a19281084282c410a083c1580724677e69b737494af912890e0842134822842920aa590535515841626a08420010848400d424a720a021081c5007b9df9af10ac257c46a5b01084294b25412508546f205742b0a2acb928250ac2aea13c8162c3a28a1494fc46740970c3abcd310aa415d584210de41bc8210850057561574e5664b24aba1084b04a58042158437806f05742b084648c95d08429241084200108420052108415208421000845c7545c7540021084002108400214d0802085350400241e29e9078a944c4f10842b0f04210801c78a17b9df9af1427912350842a9503c12ea1c0a958f454dd8bcd4a9f380445567d110139557fc0fc12b182739232b9abeabc8f6bb95995cd64f90f3212b9ab4e7ea244ae6ae208e8444a9abaff00daf82c59e29770f4892cbb7fbbc4b192b812b32b2908b4dbdaee4e496ded77267f9aee40e2d2247b5dcbddde19ff005bd9ec5752883f9d944be6842e99d0f80e42948f6bb9394640a284e495225c57d8213926c0e453459b6e8b184dabd75e3510eb0322f6b7c561b12b26d4eae3b6ad5d6dcdcf62b980e7cd695e9d1c877b030cacbb562b10450c3882688e7eb5874b205b656db7bbe2afca36056395a22e81b5ada5c519bc979278c4bd9bc928d59dc2d0a5b5f77c52d46482524daf92c9b5ca57c562d8725906d09da0cd1d17aecff831085e457d53619a92c90a9908848b9e2a508205c1cd3e97369f2aa129cd6e3b3693637fd772ea0e69580b0a49a6bac4624815191bc3790473bff44ab2c7574565c1c9c171ad90c93e743acce688b8eaae8c6a1a2f7127d26e26dfb2f658ac4d3b00c8a74edd9b4475a4d8b76d99ec4bab53becc0b9acd6722c2afc37c4d4e75263b4f6af241f9febc17ee550a687147693ed6d6950e575f852c26b0a3cede639179e67e7e9597ee3e017dbfe0ba1d4afadb6a6349ff001baecd670ececd89574216a10964b08420648202d7ef5a269a654c75a2ec46d5d0fa3ec2c7e6b7e5ac69373d1ed76d9fd1ff003401f26680690d98e3dab6eadf772648ced6057d914f1761233e202f94b4578919ced2954a894b2df62249b1bf1e0beada69bb293dc80897d084701740026a5286f2d9b0bdedac802c58a911c9635c576448b6ae6b12e719c911c921d37b4ecbe1fc50464d991deb9fb9c7c481b39cdceed69f3be97c2405ec8c60fe6c7ab21eb61691b76ff48bda4f21c505771bfa16843175785b5ad06f127796f9ded23a76a737c793c35de1d5346436d208194f07b104291bdc39e413ae0712b53658fa82e5c96c2786f3c71111e7f05b2c873226fd74166d32c2126e841381c9a9484152c21250818e5b89a1084144b208421009e06a108402590421390581084200108420010840e280003b135414d033e00a0a771d54104021084000e0a2a43820f0494f009914214938aa592284210412421082e08422e3aa005289e29e9078a00f1084200b084210003827248e09c94964010842004a1085400421080055d5855d591281084292410ac214648c821085520108420010abab0a5ac03582ba158429c93904210aa402aeac2aeac8940842149208421000949a948218210841041249ed4e2aba951c8021084c02c0e0a6a03829a50021084002108401042108004210804574210ae6804210801c78a91e0bcb9baf1553c88ec6a88e2a10f12a638a893e4824a87db47d2eafac6255af3834129bc952740ce9e40c9599fecf7aa1fe622f804a339779abf23daee58f91ed772bab2f669acbf2164038ddfdab6b2a72729508e8a0ecc463e3905054aae2799d9036ba4a10b35bd925d93f5564d63187daac9a50daf93208421034bac7ec91509dc4eaf8a52ae824fe7a9352ae3aa6ad88e816247b5dc9ca8a729c10084bdafbbe2a2a40724a10a50a32b8577635d8454c7a93c4aad8943735f9a5a0fa3808a099f1556406d939ba31136322ae46ad93118fe332acae6ad720aa48f6bb93516a1b1582c29102dc1574251a7b1c842150b9091ed772bf2b9aa123daee566573571b597d569b26d6f4b8f62b2971286c8c60511aa02cd63ec775cd255629b50aec990de6535a48a737d88b6af2c961f57b5440b73518cf251995655475224de1d8669351ab6f3199c29adcdb92a80886102ca13b29452e1547d9907fe234c9f042e67ba6910cf88ed5fb67a149b039d0f60c00eade8eca1e37e017e29c2043587171c8afd93f26aaa34ade81b06bb6b17a229d7ebcd75293876a3a621085b0ca58421080259735a9697445168b3156edc4536698be5fd56dab5cd21c23f60f115bff00c6cf07e41007c2fe4d2c1cb6d2d3d70f22bd9a1cedc57def4e3765288e8be04f27fab075a70309366f134eabef5a413e68927b1008cc4241cc6690fdec96920c734dafc1629f55a2907776a6f38e42d9d96bcfebb3a1752629000352cbcedfe0c9bfe2803235fc58c28f696e1d86b7b9937fb6f8f6715af7ed46207edb79674ddd98179b09ce1ce53fe1c1576d43a7ef1babb0e4cf7e2f21f1cbd7cb23f5deb44c6ba6374d27cd6f86e47f78432246fde8fc2df9a319292783720ce7c99d2db57314df76793cb79c62f4b5735abc38974654e91bd89027fa89ed9f360336f38711e0b92bdac45529db7aa54e18644f9dbcc89d3e25868f159710c98a9b479f3779139839d687966af0af229cd9da1f636c2ed5ac2d2461e0ea7c867bb0e7bcc899fd7f574d35ec193f6b219e1e8db11686438bfd6912c03c3970f15c583ec48ea3a7b89f39b3721dcfa7b810b627eced967facd2a9ec278dcb6d58a8fdace603c72e29dea0ce4efec1ce1aa9bb9ed683881cb00ead519045b84bff00087cbc566219f895bc25d3698ddf97324d48c2dcfd848ff457ce147a55376d4e72ee538d68d9ce39b9bdf52ddbcd64e94e63a3b18b74acd5a47f76ce74e7e936bed38f04b75b4077f9550a2569c4e6621d8b99120dd8b81f64ca60bdbf0f9286f18a68c379a1ced5876fd173ba3d466e236f1b6aad7cb9a86e2d2459c1fb79c2f9adc21c5d5cc2939e41a4ca7356cddb3c6ed8d7db8f512070b5fb2e12e4894ce9741d21319d3e16f58fa34e8fec32fb63d0745bb4a1ac571870de9156a7c9754f9ede190e76c24cf0321a96f928e19c7b58d1fc7bb6273ab40889267b93eb9bf69503533b8186d99c916ed55253e6cf5b4976d5d0712277309e4c278456b20304d0929c806b009a9484105a428a920bfc81084200139250801c850534002109605909e40621250801d7284210de00f6e6ebc5242445e002c3a22c3a2108004210a002c3a22c3a210a402c3a20816e0841e08404508427802f4defcd17375e24fcc09587451524213c174c2c3a2aeac2aea63c928b161d145490a13c10982724a7222b200842148094210a8008421000abab0abab22502b0abab0860c10842a9008425c30eaf3520310aba14e09c021085249610aba14608c0210852482108400210840021084300421452ab21124a4213486f24128819a6af0c3971500210842701607053501c14d280108420010842008214d4100092484e2aba951c8204210ac680561575615589f98210850549a10840054beed12a12b9a73efb209093613d8a9b3787a3e2a8a64de4969608b723daee5905498cad5bfa5f56dc9669644f71a13c828befbb449bb3ed4b9bc9041412e6f24c55d62b5e2408bf49e5dcb38a8d27eee15f91f6a141a625f42821048c85263e488ef70bd9ff006512887e44a3f9eacfa78a76d074f155d585b9237bb1a14adaa83826a8400a33fd9ef52501c148ab161344d408be49763d17a32e284ca32c51e64732b32db348bd79be7d166315e1baa61ea8c30d5a46cb6d6239dbf5758bc1fbcc38b6966071bb4f0f4d85f8e4bb1f942d3e7b77125db8ad79c271bfe5db926ae8ccfe6718db7bbe298aa2b6a4d1f30421094311610855d552c8d059195cd63934f15236b32d238c4aa24a101d17871505e6dbe8f6d5f152933edade8f8a0268f4dac909b3dccbf473eaaaedfddf15296199ee7989ae4ff46ad3c8ed5fae3e46b11ffe9cf07dbfdc80f15f91cfcc32aad1eb70392fd49fecfeab4dab793cd38100eeaf2737e3faeab752722e583e97494e42d86405615740c9005988fa248e8b058de5173832b6dbfd6a6cecbb966e5c5c8858cc4c41c33561d18ce1f8a00f81741d406148d344127cefebcb2d602f65f6f53ea337cc725b3736ff00788799eabe21d0150abd8a34c7155a4005bd3650db4debdddcbec989c5e22db8488adf49e2279ea82a1327ef73fcdad5cc2ddc8876d21b4f36db8e8974f9cde688dcd0e19e1b4fcdc319e7ec27cbe3f3b78a4bd9ed9a4c93e778a1322287d43d03ee33ff0056539ee4b78a7cfae4d914ba8f074e2dea1c9ff5900683a51c5f2a8d43f313404cbac1de7782e40dc27cbe6be7da8d76a2d0eed4a907ceade68847a56cfe5d8ace93b175471fe2ca86216f2048a3b5fa3be91cc99596dbb389cd526edf70d78244c85c39900b86f3c709f232e09911735923324387621770eb380eb6350621c9e52ef7bf52b21af3dd6f6654dbef5224d42465c7677cfc7c5150881925e530822dbc53e1ff00fecab6f01ac50cd6905e4359bbc4817ff2f33edbf82745a29d0f9cf9f964e80ab7d1b5e5543eeffbfddc9781cd5627623d76c35aa72dc7c7689721c3390da7511c1b3773b69120ff00ea0b5d615dd769ed29326275519427890cbe8f7e5076772639157233f40ad86f1c971529130c6d64bb323e039ab86b125cc832a44114516e6d241072cf9ac07ed75224fdda61f49bbcd6cbe0b1ec2bb4f6d3039a6d6e43573b692362e73d6d9c8f8f6f8aa364266fac1e42daa25debeefbacf9b50e36ddf67cecbe8fa3bf70e2834f9f576cd5cfd0cb9864b8ce489d345ee4772f98f01d22a7a4bafca6b0c90da8b2363bff0029fe9f0f0cd7d3ec5c9972b5f286236730b7b67eb3d548cbb92265e29e793568b0bfec94f85d53aa73e9cd9dc229cc5fc594f867c7c39fd8e5e2b3536a4dc5b0fe256cde9ee5cdcc8de5c8bcfd99e17edfd5d6527b76eeb51b18ef21ccadd778b7af36fb6fc55089b329c27610a944246c64da54f39ce1212c72e8c2e08c6ce344f892561dc4aff7ac335bf458cee6ddc47c0782fa0ae792f9df12501c62260f701e2f6ee2ce254f0c5f396a21bc883adfb96c5e4efa44aa5619bdd1ee2f71bc628c25f47704666749e5faed41276a4250cf82104e4b684942030395a555082a5a428a105c9210840021084af800210853d002b040b7055d0a00721084c60490842400210920594a5901c84902c9c86b0008421400210840058744587442148021085000842105c10aba15b04e0b084215481c8494e564f2009284286f2008421400210840021084002145490008421000970c3abcd310a40ae842158b0210840021084002108400210840021084b4b200842109e0012935293086084210402829a10042c3a22c3a2108005342820010842010b00dd7885e9bf6abfc478c4210a82015753b1e8a0ac960b25804210a4702b0abab0aac4cb904210a0a93421080456a871895553a873f8aaf3fd9ef596de243c5264999c7d78e5cbf9aaaadc8f6bb9027182fb1ca13dcaf6b8ff5bc163e4fd556164ce47b78320a93987d61fa3ffd49a0dd50867df8cef05362ca2094ff0067bd51b0e89b37925ac041b2527ee002b0059218fdc65ab08366725b91ed77266dff00e2ff00d2a2a3bdff00c01ffc5049195cd49f7dda25ecae6aa3ff006be0990e01f67f3e2a4a285a8d44958555080248425cde4801889e2e211f15e6d7ddf15567426286c13445ac6b79fb172d21ff008c1745d29c338414eda9ff00045973584995341e816e38ba1733a8ed2a0ee271daa70677d9ae217971d57aa0d7b90d56d5533c036213010528643a2caf0f04adbfb9e29bac38dd53034f0937e2bc46b046b85619ed435052b5c24dec827dc8c8a4cff67bd56db1e9e28db1fddf1472c2cb371eaf471504295d992ce8c2d565edaa245ed71c57ea2ff67fdc793cd3797d2a77e2bf2eaa7785e83c3d15fa53fd9c8f8b9d0aba93c761529cb6d2736e593eb34e4942da621c842100360205ee551ac9229350ff00d12adf1ee5ace2c7e039dd2e096d69d6e88c81c7e54bc31a22a5b0c334b6cddc55eb5389bdf23972f8ad930dce81cb230d16f3e401a8e2853cde7b7ffd2e67e4be39afe37a9691bca469f557237690d26de548d5bdb8fc2dc17d814791b76ada1adc65bbe90444ddf403633edd72eee682a678386ade9f0d522741cd381f5fbce56ec9ab5d2d2563e6c617235f0d32fb0e7c154ae5467e25c4c30b4e710b66ed84b2fdff000dbffc29dd735f2469dfcacf13b5c6959c1d81879b6914f8b77371600f539761411936cc7af1861dc7588e9ba80bf933b58027ede45d6058624a6b59b29b9a9ddb44379a7cdb64deff00e0ae1adf1f7ed2bd99bfc53fd1bf0e7656e755e191abb739c57b66ae0d64dd9de307d062ff0037d0aa976ee666ddbc57bec4f4ece2b3bfb4b1ef124512025ab6b4f178bd4facfb6b8ecbae393ddc0e1c87022cf9adc68f8d6413019a7fc6f5de972e454e7229c726d13e5071671529dbc4f1c2f17a9f55fd3c55a6edd8b486393224c86846d6f3843ce671c9620d4e9f37d10ef7a30fd967fe9f0fc3c547ce422e334264258ec538f26c9227c41f44d5bc10b8733c4d1244595f5d74ec17a1b26a7e7ac6125b39ca6d9bf1d86d38fe1e0b07a1fa03892dff006aaa4ded39c82de48e59fe82eb2c0ef0403275afda89cf8e0642256a8604a4d4649ad6131e67abc5e8eddabab6f3d649b7eb82cc50716d79bb4975d90dfcf54d86d98fbc309e3875eb97c17ac1a99af6642d9cda50b5b2e2bd82779a2ba5d3a1f45a9fd19fe561b707f9f149ff00a3944de30fbf6351910b862f379913b8806f3b2e83bd63f11cf9adcc8ae5362fa4309979add81ca7e5f8958a99429f2a19d5ca118db3e0778109024c9716e97fe6b2f48ae49c514b8a735de04807633db372649903fd1e1f150192cd769322b946267db30376730b81b69d3be37f82e458b2b4ff0002e3cc3ba5e66da7b79f4e77e67c5c09fa3813321977705d3307388dbb2f35cf754e6d3e9d3a753082df6bc87cbf92d5b4b7841b56281546ed5acafef363b0712249d86ed3bfc19d373fe5c540651f4b487467c9933e41bc3345ff005f35647c5722f262c6b0e39d1152dc3873aee69e2753a71e37b7e1c575a1f140649a1414d00350a2a482e584e49420072928a10de00921084b4b200842140021084002b0aba1435902c2108550055d08564b0008421481610aba14600b0842154010842067c010aba15b0182c28a4a1180c02b0aba10d6496b2584210aa541084e5296404a10a2a009215742b609c02108524821084002b0abab0a190c10842a90290853554b259bc10505350529e00108426002108400210840021400b29a00108425a5900421400b26e409a5210a0ab79042108020842814013b842aea6382992da035084280042140587340214842133a3402108502bb0425210352c8d515242001085610437805350535410350948b8ea8272625c7da1509bc94caf564b7e4593dc84d8744c93cd2d3928aa592d49faab20b1f27eaab92b9a52591c3163d5c9bc963e6f254b3f202337925a9294ae6b206393651f77ee4d95cd2d4d06c4355842148379170aaae3ed4fc5591c563676ed965d569ac55ab0b27f3fc84a4d564b26d4b20842109e013c0a4210a0805e100f15bb50705d18d2fcf988df48245acdef92d961af68b9861885beeed5c4ef6b30168899ad964e3ce05acb77c5f557350c394f30cdfa337b77abccb13689222e37d603e91c782f7cefa339f20b7710382de1e222e0131145d9a08888374cd6246616fb5765a2313a1143ae1d8676b157a9584f43ae290e5e39c653cbe916b0d6f8f6a8686a7c1cc8c64c49f04d240165b6c381b09bb9d78b18c887e07f9ab51e8c69161b9627953efc333fc52dc0642c34c1305d335ee16e74ed0eb9a84d99ff681b43aa2f9ff00544cd11d79bb8ddb7b6f101cc5ca5e06c67934ada5cfd60bdb9eab763a1cc69e6df3a6eadc37fdecd63c68e711d8da4c2a09debecd66e546647ab9859aad68f31d51cc41dd1274221e39155bf64b12396e6636a34f309e64290de9f460f5475f04d201565cd02acdaf6a74f3f150f35559b4afa5d3e79d5ebc934856e7ec5a928a8edaf6f478f6a968897450adfde2023a2fd03fecd07e5ce8ff0011d341c9bd4c456e97bafcfeaa9bc32a2e84afb83fb331e6bb7c594dd9def175fac9b5b79e0e75af0cfbce14e4985396f33205eaf10862cf5c4fd84999389b2d0cc65cb69aec3170e2fc4dd6c38bdcec6945a8b889cd805aab11261d6744d41bb8737d84d6dcff00592a7d95e8fcefa755a5cfd39b4a63a6e5fc8f391f480cce7cd7dc50e2e9548c1a0b46c5c986edfcd2ff003bed0dbf59725f093169ba69ca56f10ec22f393bf5dd2e3c17d52daa10e38d21b3c34d5bb7a8b2c2520d427b8913b6236d333e0ae886ceb786f0f51e91861c3592409e7e92e5bb816f5c79afca0c5931c9c5956867036f384e361cec57eafcb898be941a6dace761c1c4264ce3f13cd7e58e98a8d3f0be92ab94b9f25c7a0e0d9046d66b0d67cb6eeb7a6840882dae5bd3301da9e1c16a3add4dd5b615b8253885ab81ea87d5464b9b04d7b0400df2f82c645509d7364f716980db82c7c52cc3736cae8201bd75f53dd6f4ca7da2e6b73c0b8d4d62bcd29b56716b4dd51cecb4277a9b13af1588e0b60c11a15d24e9235bf617093da8ea5f5b9590ec5129b727dc3879cc88644af4afc56d521e4a8648d4b95a860ad07f94236c2f4ff3f36a7c87c356fab9accd5308e90f06310e6bb45bb76e7a7d5bf1fc147ba2fec157836294f212df79105a6755ec89b0626c3303a80e4ded61c6eb98b4d37e0b3afbacf70e35a76592bcd34d34196263793469fb09f7e10f056ce792cf8476d63516d566f4e9cce6130ea858babce99855ec8c5108925838b377e1c3be3fc39ae4342d3b3168c25d34e1770e65c916c85b8fc16d94bd2c60ac4387a2a6d420734ede0fd222dd6fe2816dbc9d32875085b62fabb468fef21c4a92e246c1b137b0bfa9eccd64f10b0915da53ba37a875e908762e4eefff00fb7faad0301d77ced5890299507ce776a7eeee377747d3be5fc57496e35a441f48b36cf27ecfd48ee407671bf225ae06f89b489824c57dd6a7bc71e16cf877afae4440af8bb42ed4e17f2d9c6944d5d5915aa70727b2f7f9f15f64c171cd4168bc0c4252103305d5350420b3fc06a724a1055ac96d0a0855184d0842aa592a96410842820135290801a842100584210a833e0574210ae2c1084200108561437802ba1584b24df8a13c8c7f80b4210a490421080042108004210802c2108542a09c928529e00157561575289408421492584210a854ae84215cb0210840021084b4b2008421400210850801084270021084b4b200a00594d09802908420a821084002108400214108026a08420012ae3aa6955d4a8ee004210ac5810ac215724640aaeac22c14a782115d2935294e70680426a520017b2b9af1350008421413004e494e4146494d414d54481e0841e089e6f28e49763c603061147fcb29212408c8f6bb93ee3aa448f6bb95a4919059c96164163d4d286139fecf7aa8ac4ff67bd545491040705729ff007a83e2a8c8f6bb95f65f7ef92c80960d850bd9bc93106c48b084214a21bc097f14526418e13d8b13b788f0809592a87a2da2e79ac5c3cf34e14adcfd9f8008421353c1b93c026a5214103357b53656cb7896e9d4888e678e4aa89d6f67c57a4b88ad9f0568ae4a4df025fbf89f388a69161c92c9ec4d8443138de1cc3792789bf148733ad3c90168462b25c9e9e0b3b0d3e171868b88a4defcefc560f57b564a9f509d3e953a997b59322b2822b062e58f480528e45edc94ad6c94c71512583427c0b122d9940061200247c1581f55407d64ac965cb3d8239d6bed67e5cb3fe29f0d46a272df5c803e3fc5420bdb8af05c7350c7259e5972557b12480437c44fc5f8df3fcd4bf6b717426dfb46efe6a8dc84a252c8923669da4bd214f6d21b39c50e67c86fecf51cd64295a5dd2451dc874ceb72045cecb4d942e42b709bc210bb21236971a62c76e1ceddcc74f9d10f75662469e71c3aa4454b9f46a34f93261be4485cea384e59af60f44dfa26225619b9b2d2fd458be2ee6e15633cf4571fe97291527113971a3e93221f85d6862701998787346fe0646252567d1d018e95300356c1b39c0c4c509be4b73c15a69c2d852a1386107351a338f6443600137b5baaf9eeaf3a19f260cc73fc97d37fd9d3298b9d2c571b386ed9c8f36eadb5785acb45584cc335c9d828de54f8b1bd3f79a662a9150861cec0e7fc975fc19e52b587cea9cd312d3a44305466891227936bf4badf6bda09d1362617ad607a4477bdb97c7f05ccf147925cb6b04aa968db124d6e1b5a71a554bd7c9b7e871eab6a33cbb3bc50b19e1faece0cd9d41bef16ce46b1242cd8375f9e7a517fa43d1bd765c389a98fe8c01b07047a9cecbe84c07e526cd8396141c76e218e438fbb3d88ff002ed1cd02ce95a45ab6eee841b4beed24cfe97b2c6e18927cc2cc35322742e86f0e643977fea5efcff5658ad2dbd90fcd4606afa1d8166458e49427b6a3619de9eb7a34f6cdda00673636b65dff00a0a8433f3fa709ac34d2e6a406ca5d36b0edcfc17d49a0cd83d635caeb573b6abd45dfaff37bb067e5d00eabe6bc4f55deaa95674d233fdf0f3572199cec7f25b360aa4090e0d75b3570dea0d5d03b7a73abdccbea7bc26c62e42b3867d8d0bf33c16b5074d9cc30e64cf3b19e7b78725f16f96168f66d31f8aeb5935130c201e9d2cbafc9d37e3589c6c2b6da9ce2403fe669d7bff155f1ae94705e90636340c4d4670da4389feb760ead6e1c943ae5f45f79f04c6e32b00a94c88c511242e9da54c23426b89dd7986b261901c7a90e1aec2dd57387724c99c4433058f6253ca2c8bac6bae20d5913e2f523c1655b3f63225ed9c36de647fa16bdd6b8dec2e495d4f41181e4638c7b0546b7275a8546bb87115afab6fe8a92b3617514d9df3c9c3c9df05564ced2ce9aa90d9b5227c5bc52b0d6ad8107c7a7c97d5341c4d59a9b490cf07d364e1aa45b56412723d802e594baf37c535096d445aec1a804764e5b4e917ca03475a0ac311fed048dfebee0da4c8e1c7f4171eebac9d9846caeaae2bf237efd9cabba8c3a758c6ab1c47b7f9aa8f463ba081e6ead0a9b6008122a16cfb787c57c5b57fed16d2d3873b6a253a934e86e7226e48e5f9aeafa17f2c96ba627468b8be9ada9f5db91ac4e47a7c5162b611ca19b2a7c1ee96b47585317d3de637c134e147ac534c5e75a4c4721d7bf2f05c6a454cb884db3b0e4be97c5b321c3f54698a1a6714f25b383d01e1f9af9eb17d39be1ec49516b26110b6235a481d16df1ba99daf64cc9a9af6f42a933a75c1315815b1338f563d75afd3e11bbc1c8f3595906182107684772ebb8e19cf7c96f0c545fe1cc79327d3c4f91bcc8db000753c57d5981f18c8c514795523367379e6fbcc2fe2dad8fcd7c94da3031aec765207f768cc8b735dfb41ef6a121c54248753db3716b8710ec248e3c4d8aa496423d981c3e1dff00f5f476d00ffedd16cfe0bec5840fde0be3bd1b0f3cf97162172ddaeeb05228fba8caf7b65d8bebdb9eaaa352c8d42108183647b5dcadaae9a8026a4a2a4800561574200b0a6a08546b259ac934210aa5410842006a12935000842103452a8ac2aeaf11464158549352dac8cf81610842a900842100574210ae581085002c80268421000ac2aeac2864304210aa4021084015d0949aae593c829a14d292c837824abab0aba622102108544b2482108427800421084b2008421400212909c88c93524a4280c8d4251e084ab1643391a948491c1456f05ace30390a084e284d0a0840021290546406dc215752e4ad25802401baf1410adf1341612a7fb3dea094a12c0ac60135293549058421442a0ca5e32440ec5e217a49bf157f8922d08420904210800421080042108005615742813d8c897b1f25e44bd8f92adbd0ec646c29350faa53a155aa333d18bd1f1542118f3c578bd3c52a6f259c47d8f91ed7726f34a91ed7729c8f6bb92adfc49fb2d29a80e09db5d6f67c528715a70b5955706d08b2b2e21b819aace3ea859adec9232675afe8f4e6b2f42fbc9eefcd6124e66cb64a2734a0fb3249f2b9a427cae681a4ec3a20f05eaf0916e2a5018c7ff683bd50562a137e9317a3e29137927644e4fc065002ca684d4f074c12909aa7a0048dafbbe2a49a9c4760b160ec267ef5bb9651579fecf7a7186c58657115f92cd5226b70c0910fae072ec585d94fedf92cdd024313346f0e3e172a0a22848fbb94c426a558f1834c0521352906904a4d4a4b4f25c10bc1f785ea8004c95cd578532543c735034b097f6bd9644de49123daee5285161508671946c0fd657d501c5445947d1e3d8b5a502be99fecf19fb1d343ccae0d36f6f8af995de726e0705f43ff0067cc77d380e67cdc47e0b4c0c762e4fd4c9536f7f47c55b5465735e8c974f183132b627c3d44c5b489f41c494e6d50a7b886c64cee03aaf867ca534115cd0f37389b06edea18220236f262379ccba73cbf92fbcaf7556bd4b6188290e68555641cd35dc9d84f924feb828167c87a27c49fb51a3c773e27f227c3b0f51ac3871fc1749c66e4b8d15cd791c5ba4ff371b8a2656cbf5e2b8a47a36ace81a958ff000736d67122f3aa1497001ce44dfc797c974cd1ad51b691b41d25c376cf9bff007616f383716919fe28067c5d5071097ad5ac43eb3cfb771ed66574fc1ae6548350924b63ab3c66ddcec7afc572ead1d862c6e7796ce377a91e7dbe0ba551fe8f519306f4c61db0122f7e374e8604346c8f9fbc89a86faae7d2f6e439fceeb53aab733b1416660b96ecf33bb5f78d759c9d21b377c5c4739bff00cbbaac44f6fa98b27b7b5f55a6f57ddbb38f046411a463ec21fb402513690fdbf120ae2355a5d4183f2c5d4076ff00babea1a9c82e2e09d5b8e2b42c5784e4d564c4da74008cf8a5ce39188e1c228a1e4bb16897133aa361b70ddac7b3867d44f3ec5cbab34775487313675070e115b2216dd809f134870ca2f4a26aee53827b2c4858b5116e383469f9960ef956d224ec034a159ddf6fab36e05edcbad8ae2f259637f299d2955db307316da4339ce2ee380912ff004574fc7941f3fe180da5c378727327e4b868a963bd14d79cd4f0c3f734f35b9362e241b5f8ff0015cca76a7f99be74cf074f9fe46f8ba4391156b17d26994fdc64b8db137cb2f92d7312e11c29a30c61844e05c79e7b7e6a5ace89e23f8f05cc2b18c314579c43e76adb89f0937d52459749d03e89eaf88312b1c51506f1b690dc80dc9e240e69f7df5c218426aa2c76659f65e3cde1fe046569769f1cd92445d6eb8de377be7073145adc0f0e975d931dce6f85b05b52e06ab89f17a86f7bdff8ae2a6290f7d7443fc7e1d153c5f36646eb1284325ba7ca8b670dda6c05b21659a6c04b1710cebf6058e663d74134edf60388b2c9ce8dcca952f748cfafb58c8cacbd1d9d1c37d15a94244fc5ce9cb8ddb5b73d5f8d8afa2744ac5bd26925fcf9f4d6d1383f60f9b804777eb8ae1da30a0fed7e20730c24b96c3ff356bd8fc576ad34e356ba3ed10621aac2e669dd9a6ecde55af7599b262b934cf2376e710694b495a4b8621144e5f6ee395b3e9cb82fb22e3aaf9d7c89304b9c23a18a63878d1d377f5805c0bf1017d0663bf35194347a724dc2729c928b09a9484161aa6a0a680248421552c802b0aba104a2c2108542ff000053505340b04282159ac013428210d6009af00b28a9a86b0035084252591a0842109e00108426002108400a421082a35094841391aa6a084b4b24961084292a0855d0ad827008421492084212d2c8021094980de06a10840021084a004212e187579a00f0f04288e2a4ac4d644f150533c54105082108552c350842b153db9494d4a50c940842141235293ac7a22c7a2b3592ab82b214d0aa582c135084c454157561575645a20949a94a52c0ece413529354802724a1043591c8494208c021084160421080042108004210800561574286b22703e2518f8a844a71f2ef55b38433a1cb1950e112c9dc2c5bafbc4c4b93c9610973792365ef7825cefbd43f129223ecb723815365918d202bac2db2240cf9a4dab700c44ce484b9bc9526f0b03c5aaa9b3fd9ef4a58ee01b2f810b64c39f71079ad6e5f35b1524d992591f65e4d55d4d038b91f04a0e3779061bdbf34d8d2df6724c3d536b0308abbf9b66d17a3e2a6a94f9beb4fa3e2ae24fc194a4215ce9821414d4b40084a427c3921bc02f2e0664d93924e69a26cab0b393c92e27c04ec1c7af3ed6af15285bcd6a20d61637bdd59a0cb9b15564b63081bc00b72ac60b9f4aa08a8d48c3227dec01cefdea4cb83439275afcad656a14ea8b6601c45e6936ff5bff592967b57469ac361eff82526edfdcf14a54362590421082052ae9b3fd9ef551003909284017957421005855c702842111259478e85e545d5778f20a75e6fd3cb4809ca7b2982fd17079e444322bb3f913b9ddbca1f0f4422b5e12476ad35a32db0c1fac4df9f6ab445d53924086cac1375d14734628a928a0a1c87ca1a845fe1f31c11de2712674810db80bfe6be26f24ad2ccfc098bdde8f2b3589f2690e27585cf5397c57e88690e91156306d4db498044e00db49cfe2bf30bca0306b9c058f98639a280d5bd66d5090787c1192719363d38d0e1a363dd766e65ec3ce6413f12b71a68db31997a94f81c8b6ea5bb6b1e76b9b2d1df63b73a57a53caa556a2d9c3f6d2b7930ee7d3b5742c133fcf14f0f36ae61dbca927627970f92bc78172431bd59d38a6cb78379dae794f746d6f82c43f60e1ad79a541dc8910973267c8b5af7ec5b64ac3150916a9b495264defbc13d7984ac56c184ea7c9a989fbc4d6debf8decae2f1c9ac3f6b17a5623ecfc5639ed3b6f0eb6c6d92de2747446d1cb722137b5f776fc7e0b035cabc59b36cdb610fe2a0bfd1c7b49982e6862da6b872d9ac272bf55a2537fb92ab1074e4ba6ee3ede26dcafceffae0ba4e9527c4e69ed628873c85fb17309a401983dc916453e0b556baa5947d19a32a8d12b5496d4371526e27373ea2781f781cef9e5e2b6aabe8d64c54d94e6a74585c30703e7dcbe60c12c5c56312d3686ddd38910cf9c0647f575f4f61a9fa7cc104d329f8ae9b576005b633fa765979dd4e9b509b68efd7a984e0b2635be89309b2790f98b060753ff7777b7e6ba7d1b09c9d1b499b8bf1e6ecde184ddb3087edc03cbf0555fe9a34e341a14daa3aa25204884ecb6d27d9bae2f8971754f15542f5fa9ef53ed6b5ef6eab351a3bed9ade5acd7d35d785d99dc658aea5a40c4c27bd9e47a3737394993f92ad0cbd61f76dbca3d97bac4b784b5844326d08e7dab36da73812843b2d683fc6904e47b7b57abd2d10ae1d1e7751a89dd23274f8f796b145b5bf0fa4b71eb87c0aa35474f5dcc2e5a48de678fa3b0716bfaf99f8dae141f54194e8e4c54cfb6b9b4e1cb8725b6e8f6853e6bf95882a65d37127ee33a445c6f6e7f24db669214964ead8130f53f0361966ca53672279b6f0f5bc5b5bdfbd71df297ae4ed23690306e8628465542172e0b97f3fe3c5745c598e29584e8d371462697bbb96d2fd170dcec378e97ccf7f15cc7c98f0fcec658a2b7a66ae86b3e7bf9dab288e240f8fc16373c8cc60fb4b0955e9343a435a2b584b690da40930dc2dca5bd91332112e32d9bcd885e186e7a2ccb27d58a7184c70deddb650a6cbe0eab2623167c95987e2b5ea157617b2c6609b70e8b390457b102f74d4db27697d0aba792071572d926a6a08519065842525317f13f900466ddaa4a9690bdb76a7decab94332a00a292bd52b9289e07a10852581084284f2427904210a4904210802c21290a84e46a157425e0325842521303235094840641084208042108004d4a4d41289a141096964926a6a08509e01ac904214534092521082ade41085040021294d513c83582d2108552c0842100575edcaf10ac5417a38af17a38a00f10a6840ec113c578bd20df822c7a2049e252758f44950c94084214161aa6949aac9e462580503c14d40f0520c8a10929a42590421082c08428a00826a526a001084286f00084212a3c00a42135380526a521427901a8428a57c00826a526a90042109a009a5294c7150d918c96162a7fb3deb24b1e1644b24dbc2c9536df47b6af8a51fbc8ef566749196ef10ed55a47dea2f88502631dc395d58c593504d6c6a5cde498913f977acd6fc46159454ec7a282c6482db9afdda0ef5a8020e4b7155ec064ae69caba9ab446960f04a7e6f27b8a64936be4aad622f4782756b8c93ed4615c4ed5967d1e3daa845f780ad5422d90d5b5f35581bf2569f220fc1a428f9c3e8df59416948e9826a526a82b9c0a42108151781a84a4cd786139a77c8abb64cb54a8f615492e48bea72bacfe2dac4eac4894e2a55071f47f6b85ff565adc136182219273e7dbc30320e676bf5940bec4971bc4f9915ef6b25aad07de49562e1036a78914d3761eff829a6d8acdb59a9340a6a4855c86446c7e8df5bc15457e68392a3ba9fdef05249590aceec6d7d6f049d52a032410a48410de010842b2067a4f55d5fc8e9e6c7ca1f099bdb5a1cd725896f1e4f4e22a769d706386f9442a00fe0b4d3d996e67ec8c24822cadc246a8cd534c9449206b2de9f073e5cb2ca8210a59526be1af2b4c03132a0d629c58fd84df3853dc13dd9f82fb9572bf289c2948af68eaa5537978bcdd092081f2fcd2db21f47e6be87e370cf1440db79d843381b676feabb760e861a0bf794e80b9262b4f611383625bcc3c7e0b9139c3d151f104d68e4c86e4d8b69c1d8365d89ed22adb094ecb7931d5e88d3797fb775b6dbc99a3fc1ed4d8cb02d9b542f66b83ae5c072d9c830def7927e1f358a9ec09951890f21be57bc3695f8a7347ad6a0db7886f3a48937dbb886f2640fd7e09b3dd5b5a7c276b3f91e0adb88c1a5529f79bdc0a2b825ab73f630cfcf3e62fc96174955b7f4da3c2ea873ed69a04336d9457e816d95ea3c15e6e653a9c609c7a64b97e3a9b1b4a779b1db7d8cf06f6b5af6b28649a1d62a8f2af3f79751926d98581760f5cd64a64c840b11c5621d4f273038a458d82596568ea73e94e25cf90e6193385f38b92ee3a12f288c6d5ac674fc395d9f21c48d95e110c888ce9dd17ce914fdb7082ddeb7ff0027eaafecfe98f0f54c368b271c8f0519c8d8f47d4fa697f5a8f09edddb5f37b5ded9b76f221179e7fd00382e65229fea603242ef5a5cc34eb14e049c5ab49e2a14e9d76f0c3cb2b2e2cce4b874368da5eacf1db63227809d1c76566b23d83b9edffc56e75feefab9edfe1fae6ac40fe798a28994872e08fbb6569d27f5f92ab2a875173235a2a7de103d79ff0077fe17fc9745a3329524ec30c3a945ec47e915603edcfeafcd59cf084ec5266328586264a7139a9a8c86f5786c675422fb11263b5d6f6caa0f58b0868f4f601ab780d9cd0279b49ffd768381e79fc1518c356ade4b5a1480185b59c4a23d7b09df0ec5cab4b7a4f7b2049c0b84097efa791e8dafb89ebd8163b6cc8ef560a38ae63cf281d2232d19e0f76e62c3f22d3dfb807eefda7f1ee5f65610c234fc218799505aca86194da40950f2c9735d00e8f30c686709079517520555ce6e2708ae621c56e550d3061d9578a98ddc542d95c800159dcc954cfe8e872f387316f8a8b817b2e34ff4a9892a327e88d5bd3b5beae57fe17545cd7aaf5297b3a83a89c5bf787f34b9ea235f268af4b3b0ecb2b1351e975010c15b6c0dc0beb715d529f8828ae644addea7273bdee782f901b49a76d85a9d103c89cd6c2deb2d40bc6da74927925ff5248d4fc736b83eb2de2473982e99ae17cad0e24872fa4cfef8bf9ac833c4e239c08acbc16edfe6a579283fa16f43347d3b0c7d975220f15f3bcac5f5484ddbe299c6df0c9641b690f124bfab88a227b40575e420fb29fb499df11617bd97146fa4bc5c09d4a9c99c075b65e0b292b4b18b45b5a19047456fea157f2565a59f675b8530f0162b94c1a5aac1b6f4c9bc47aea857e1d309e1e648478aafefaa6fb21e9a6ce8c058f14c3081ed5973a834c6c60fbdd33549fab6c95e834af40cb6eddc8ee0991d654b9c83d24da379022e84f7233fdd3f25a84bd2a6132339ce61ecc95d87483842236158e3d4abad5d6feca7a271e19b1208585978bf0ccece4d6257790acc188291380d5aa4923e21315f0ef24aa5a6645093e7063ffe4e4f8a75cf44dca2bea920422e3aa1494c326842101860845c7550b8ea8026850420010a17078153509802108524029a8af09b714124d3556d787aa9ebc3d504ae072128e4bcb9e88c864721084a2415756157528864d414d413080425214640108534b4b259bc124210ac5410bdb1e8a0802484a428c9381a84a42321804210aa9e4b0d421455dbc0c89242ae855dc4609a1081c543782889a108509e068d42526aaf4042c3a2526a13caa657421082c0949aaba00b084a4d5000842100084210008421002909a94a406a10949a0350949a80042108004e495350de086b2793b92aaad3afbbccee58ee6b1dbc4807a0b7dbf2beaa11b4ec5662a2559326f7f4ba725750992b9aa91d0b55e7fb3deaeec7fe30ff00e4ab4f933c6aeae5c565b09ecaca8c06c42b0b1f367670fa3c4f5596dfe012326c6ee1f42daf61d56dc05d6a1418a18aad093c16de081c5562371c0f97cd4d41324c9bdfd3f04d02dcacc12b17509b0c53c90b2928d810b02e09d7cf352c0c4d438c5f1505e39fa9debd54b7e249f82a855c137e284fcb35e7716369d8849b8eaa2a530c646a9136175553c8bd8754d21819a467ab924cd986e0a9c67312381eab78a051f01529b44ef11bd0e5c0b5e45bf9a6fc45b34581d440816591960386f1812efab6cd7438319e8cda5283568c0971c813654e838bb46f0d7e5415da638914f27336c8a0839dce8b6332d6cec8de09e4b797f50d14387d38b76b3e36d09bc93971ebf824b661a2e732228dc559c379f9667f59a0989a84115f3b2687126c05f3f8ad9e2a16089ac264c9188e18a76562334d9d81b0889027b6c60dedd4ff00551b50d5268d54ba944daea50cccc10b648746d21d674eaf488cf6a9bfd19d4a9a248f39489bb6edfaa94eb0f63e8d627460eae494231d16d4d745b8bea3266eeb671b0beae7fab2c39c098c870a7ffd697b46a971c98ebc278055e3801ced659a7181719b79f25a8a1b833e7f24f9ba33d223673bb3ac2cf41ed518253358d55e9967f416627605c6d0b92dce197b97319259c1b8be5917c3afcd94a4f2564f2cc3cc8485e2b0e1bb96f38876d67c9eb7095c0649889fa2073042cfe8bdf9a469370bd46df6151957cedd56bf1ccd507252a13eddf1352677fe7a565de9b5f667b0fd8f698ba60950dd981dcb24d316426d7873f82d71a521fcea7b39f18ff0782940c27c93732addeb626cc53ecdbe0c5701b08a1f056457e9e7333a1b9ed5a3cc31416052f6910e0a3795474e6eee438875a54c06fdab57d2db7973b45f8a20887fe1d30ad765d41c3737826986fd39aa7896befa6612aeb477aa619ec66dbb33fe4a483f3ca3c56df12bf692222627cde46f12671c87eb25f4d689619157a5b66aecdaf276f3a7eebc27cbe3cb25f19d0849a4d7e5ba8beac3c57d7b8530cd4d95218638c2f227cea7396579f22d90f82b942b626c078b7074e7ce5d6ad428246df6b3fd56ca7c77273e79858f0ea443322dde2bc3158edf8ed8755d868b8b29588afe71932b767330171b7cec7a85a4625d11c34f2dea9427ee1b36702739de09fb2d9dbf8ab45e0a1a83c3f5a55b3b2e7fa533b6a118386de78717f8ae86f305e3e6bb17a29cd6a325b332ea270d9c583713386d7b33f05a1692a80fa918627576b8d67b69128dfd1cefd7353634912964e18ec1041bad76aee229f0eeedcfa5cfb558afd7e32e62674d99ea0dfd7ff35af437848b1e092e5b874627a2122eb78d0b3e96db4974a84e775a5cb2230495b2e8ae9adebfa44a251a275b0de6681b4e897d724e327de147c7747a597adb1056e4489e594f6ee2e78dbfa78ad6a7e2bace2bd5870d6139e641bb79d5672db61c67f5ee3c952a2611c2f419535d161ad36a2d099f3a117f5db7e39f1e2ae63ac7b52a050298edb6c0d427eda9ef7579767e2936df2ae3c0dae9f670c631c34e1809c6a334ba7cd6c67c93f60fb67719f670579ccc6dbc06d38c53e910c204903fcbc8996e1965c173aff6b15c73f480da44f9d170e56f02ae31d2b96a40714b88eafc02e3ea7cb4d2c4533ad5789877266f2ea29f5068220eb62e5c48dddc38d6bedff59ad598e8a18d2aa31d469aef6750717d59badc3bb9ab5274d34d982ce68d387fca014c874c3848807769f09ee5c99f90bd9b63e32a66469f42c42d6c27d4a44cb70b2cac2c5c406e07c962a56947064790a811d9abfcd64db63dc184e75e6e7e242b57aeb5fc89968210f88d1becaf4442083c6eacca0fe60bca9062238e6b2d4dc4185dd01bbd698c57e39f05948a43570086cfdb5f812324c7aaddd8afdab8f462d84e7ad6f6a7fcf259386a24f34e912271d6c8f7ab525bb91ad7917ef545637d965068a9b66ffb8bdfa2f3c966f7087da165397226e768555df823d4fe8c282cb89984141899dac2790b350c8951121dd3e44f078dd569b87e8715b5a9807c05d47ee1321d5231f2e535249db9cd5896c01cc4e36e59a9ccc2b4a8ac1a4d70d88ef5506109d27ec5fdafc6c98ae80b7548ca864f61ecbf44c922aa09bc27e6b09130ad1b7d242b1b96256fe9453723c8053be010aa46744da8c22c7f1409f503c560f7aac4b368e5cc8bb5790d65c9c8dc951bb70cd86c9bf540f185bf70b2f03e23ff000f91dcb0fe7e77dbf34d86bae2239cbbdbb54b8e05b4658bf95617a75be10af617ede0cc489b0fc1633cf33b544514ac97b056a4ded14927b6ea77388bf53ce4cb0ac37196b4f855815d987386b6e213da4ff15888aa2c2741632c829b2c328c08b2b147be7fc97d8b1d19893896a12045ff00698e7ca2207e0adb7c6f89e413ab8a4c37edfe6b5d898358c930cfd5ea35543cdf24709e3e4af1d45abfd8aba62fe8de2463cc67008ad5889c5edc4f04ff00f6998d6458cc32c83c3219ad0053e026e1ccacba9518608f84332ddeadfbab97d87a21fc1d1e1d2e6243f6ec9bc5f056246982a12efb7a34a8fe06d6f05cd364eb889de29bab52ff0054ab2d5dbfc95fda55fc1d4bfdb34a033a28f8eaa67fb69a0939d35d7cc05ca843503f5a2057bb39fce04ffdeda9761fb5acebc34bf850fd486703cef92c80d29e0e3ff8905c40c99a47d92ae6593900ad1f216ff226cd2c1f183e806da45c1ee045fdf32e1d5b73571be31c32e75b655694756cbe7285a4ecc8080ddc039c36f82743c859f6296817d1f4b49afd2dc47aadaa328db8ab30bd93372dea5c5d9c17cc7b18e2168a327b2eae889f419f9cafff00b95ffa9a8f60b438fb3e90d6be6083f053d6217cde1ed461b00fe6fcd5f6f5ec40dbd2955a722fda15d79383fb0fd9491f41952806765c165e33c592f286bce6df10af49d2362a97ff00895fb95ffa856c4d9a69ae8ee704397152d5ed5c3bfda862464d4ba7114a108f756c9a24d294fd24d0a7d59cb1d84f6b38b7bf0e1f8a7d5aa859d0af55913a21505537807843e29b70b4644e0b094855d5fb212c9614129096de4b2581aa6a0a6801abd1c52508722305855d084b4b04a5804210a0a8210850008421001728421000842101c8210840134210ae6804210800494e55d4302484280164e02284d4a509e401350849f880a4d42527e406a1084002108400a426a1002935297bfe63bd490789a949a8241084200139253952cf900aa86720ac78e23e2aebefb12aa37e27b92989b7e88213a47b5dcaacde4a0ae0ca29093c1c6b7759213bede498beaf8a5d8b0f04b15add8a84e847a3f4572bd7121fb7bb983eb0e0b17f49ed4a9bc06474f1983d6eb1d345e256a26f7f6bc15471c42c167e4f209995c391135610dfa2dcee66f0c968d85cdeb12b3f8ade251b2bd7963a321bbb91c261f92b120187fc6bdba854e216fbbdfde4f933af7f47a735ad2c925c7df710b5c9f3b56de8def7e6b33579deef23cd61e7fd94496c82821084bbba649f814855d585b92c9a810842803dfb5ecb2f1084016581dddc975fbbe0b1cdfd7b90e4e44f10ac2f3ecbb6e9c9641b3d4fd8fd1b78d6eeb24020f029b276f3e46a8240eb6575c1973809fecf7ac69bdd5de5742a2e0756f02e573564c8b7b5e094850307430f1175e413365fe3ce87e0528ce3077a54c9a72b043050c16e0a83c92496efdc437e372a71625c490e526b2e0f7854a0f494e186c529a1ca26cac34938cdb3890e8571c09edfdab85b97ff0050b8ee217775233afc41c97300011c1266419137554f04a3b48f2a5c52e255a7b66f9fbbc125e794ad62649f4d84836ec5c4c8b12a3a814e432764afe9e5bd669d21b38c274e200073bac33dd26618a8c6d5cbac28d6185bdf207e1d9d8b99ecfb7c1791436b66a41f475675a44c0feb3fecc9f0599c3158d0cb891ad361f373d361f48904f5f85971303547c12c9cd32becc771f6dd23cab71db2a7ee94fc54c2a1b019fa36201eabab6873ca53186306e66e2fc3cd8b5378644f924fc96d982742ba29c57a3da03cae606a4cf9ce29b27d9b754ea6f93a61bc1db73a35ac4fc3a1c83b76f3e1dab19e4f2e56e27e6b5ae8c6f9372a363bc1988be8db72de69e3b78ad9acbcec3ac674a88b524470e792f99b1fb1c418227c6e71768e5c38a783abbee1e72361fae8b55d04f943d630f44ee9b3ab6e2b7486b34886c797e6a701d1f5a4cc35372b47e0b0b8868154344a8fd1b8329bcfe0b60c09a42c37a4aa4f9ef0dbf134c5f786fcc11cc059da90bd31d587b0803f1c18499ee31209422d6b19d9f4e3fc17e96f93808bf64290ddddad13316bf8afce52e6532c66e606c7d789af325f7df92fb974e70ad1039bfa3285bbd1d8766e78eb424c6b0e66d6f0539828b558b382c78f67c172b998bf17e8bea1ba637c3ae1a8b9877fbeda538da85f51137e217b399536a32226ee5bc871222e8998167cd94f7141ad989ce19acb79539cc8d84f6cd9c7a99dff00aa0f5cd721f28dc4f579f8131449a8b004d462920be6c3d44597d82fa5f18792ee8db103b98f292ddc515fc47584f6405afdebe68f280d0e63dc1b82ab8e6a38cdb5628320ef13b79b1cfb7aaad8cb4164f8a48b85006eb3e2914d9e2d26b2df2e371fcd5f93810ec81f3835ff00e4919c1a226a4091c167f46b31cb7d23d09cb579bb4f85c5af7e1fc54e761c92dda976e1feed08f778f8a7e1aa1d2aad88e97436d58bcf773436338e449f8dd436183ec9c4d8b30f61f9155775baa489124866d9f378bbf8ae3d8a349cdf1b369186b0d616715b9cd1dcd121c1e078dadf25d7e83e4b380a8f343ac413a7d61c019971f8ae894dc3740a1482d6814f92d247204dff0024a7156765f3b7a380e07f27fc41511bd639a96eb22f62de41fcf82dc6b9a07c2b4ca0542a6daa0fceeb24b98b322dd17549475481d515ef4e81523ff939bf8ac97696068ab53287d9f0d36c5afc48875698da1eebacb4ac4cee78379300b058426087272ee558f0e6b314861226084cd712874cd736ea2117d1d4a351397d96c565d16b788e4390c92bf6ba9f509bb996e093dd757e2a4ebb4244b58ac3f85e015abb91abfbb95d23d51c746af6c9aec74357a7c820393f5beae6acc1886401eaaa51417e36047e6a8bea36bb133b676b72581634adee7c76e76e5f578a234c5be4cf3ba75fd9d05be2fabde506d881c585c921c7cbf359495a51d214827658a1f9d6e3637fcd717734f85b3ad7881ec0bc7313882718a277348ff9935e914ba28b55267d14df4e3a4a920df1241e95adf4659193e525a4027e9268ce35b8e5abf92f9ca4bba8ede0bd4a13ff00b96fec688ee7481a99eaf1c960d453ea34d32de99d99b794ee256d2c433f0f519cc47dab5adf259e91e52a73de70518bf76c4e4be66aab89ec3841d7bd5382bb54956f5571ff0032ad5a594e192f2b145e19f5dc9f296c15b7321cd0ea12231ca201660f942e8d21b1713ddb6847b45b137f15f150c5ee27004c903e29ff00b564450b79ed75e1b5f33f9267eca643ba08fb5dbe9b345cea60821c4ad645b991c56564e93701cf0449c56c4db8da25f0d418ee9fed6b1f92c94588a9c25c514cbd872b7143d24d10ed87d1f7149c4f869c8260ae482471be49a67d3a71c9ec98bb0af865957f0e388847ade91ebc9669ad748940c8a8b88a1ea67f1ee47a6c8949493e4fb37e8becc4dc8ea02899d2c9d516207664be3c618ef153671aad7123f87f7b3e3659bff6ab8d2565fb54eb2ea8509fd955159e0fab20825cc222108ed563614f3ec0b95f2bd3f4d58e9adb56a2da7fc5ad966e4e9df15804bba6b073add72fc9449b44ed3e8e0c589cc0b7c02f4329173ab3881d2cb80caf287a9e7b7c2cdfb3653fe7759895e5114986fb6c2ce8df86c27fa5f82ae4361db61248b6dbe611b38c6660973bf25c965e9cf05cfbd8d624dbdebdd3a469ab47467c3ad885c36bf0de1bdbf2c9190f5ffc3aa98618b234e920af0b7045f723f1b2d0a4e97b024e3e8e34627e02cb210e3dc2ee012df19d38fc1d04c521528b36a8a4917f5310ef493bedf8cf2151a6d5d83819569a4f2789de41b2cc874d00b6dcab3e430cc7edea7fba179bf563fdee2f92cd6b41feac3f34232993ebff00a617cfb536e6dae4dd2bcf6f79c72167f55c750bc32378fbcb66ff002e2acad48acab998335a7195f61f34cf3d4eb0f421ee563f6565479806dd88fd92931739fdd0abfb914d93456f3f9ff4cfc91e7c93fba1366e0c9f97a13fe495fb231f59ff0024a6ab5d8454d13f3eb5ecf927c4fa29f09d5be4942805b4221308b1ea15a342b0b6b5bb90e5061f9a28c71ba9fe8c336c3b0a8c321e0e3193deb23268508cccf209e56fe691576f2292c6375b59db71cc6764dab6497052c724b935cc48f4b5901b88ad3e2bdbc16f9a159f26831cba6411da29d7b0e8572798f77f7d10e37f05bad05fc54e9d29c6640e365bf4b2db2315b2ca3e919734c4415684d2471582615181d3692e9b9bcb9c7259311f6aedee58c9cf93cb2d21278f052dafbbe2a724618c4d54f6beef8ab1abda86474595355d35416268504257c409aae9a9484b2421a84a4280c0d421082010842009a1410800421083413428210671c84942b64d0390928464010842a802526a529004210a001352908004210801a84a4d520085002ca680042108004a1f6e9a949e4026a526a13c92084214378004e458f4458f44a8f00577df625546ff0058abafbeb95487d60a3b206a539fb529aa284b252c2455e91f773f058e1c964247dd8f7255fc362c54efa9deb17366dc8f47c5641ff18be2b16b2d8b289ecab366f0f47c561de4ebc3f57c56526cdd6b7a3e2b173a1cc66936bcbc9432f84a598aa7015bec980f12b53c0909f5d171062b15b9c300f6532a8e2191909124d95bb67c5427724a4d1ded452ac5f6c3a2c6273917f5dd792a350e07e0a2c20af3392f4f14bfa47444fe2126ef881f82a84216d3582f36fadfe1c42dd8bd425c9e0904214109904d784022c52d0b57c487d0b8a312675e49bdb8adc2832a9352877b76e436d6e326eb513082bd83d4ea9e3aa8cee33ce3c9b7bfa153f59f79aee1b9277733bbeff82d582c844fa6ee1acdcd8cecbe0b17c389505e0b0314b6c7f77c521097f21e092382724a12c8da81392539293c8d044ce484284f0025084200aeac21390025569dc959b1eaabcff67bd6b4f064b26b1847ec66865e87fa2dc313a10043e6d956f15ba83cd72ef26a9c6a3a19c26e75af7a7017f92ea2215aa1c9cf97032127805f3869c3c93dbd41d3cd2168801615d8c18e7b007d4b8cb92fa3a153855c5f6cfcc9d17699316689f48fbd3b6ce246ec4367ec6dceff00d57e93e1dc4b4fc5f869a5769b36132aa32778e1958fe8af933cbb3402eaa94e3a66c10d844e640b55e2391b1ec1f049f207d35b59d2a6e8dab73a2cbd753ee781edef40c3e41c4b3244bd26ba93b4bdea4f33b2fd05f2707822a4d2219317f822ebe0dc7143751e986aeddac9d68ff682695f76f93ab2f37d229126dd97eaab820efeaf2c7a98c935f02997fe06cb86795a320e742d8b61b5ed4d2bb399c6c066b9df943b733f41d8d8982f6a44efc951c4b57d9f91d86a913eb0f8faed86ef2afc7eb2e90ec617c0d0f9b2bb8867efb0fdb37a6b4fb0b71f871f05a0e12a816557d4bdb58dd59c4b21f53f134eaec524d49bcf9bbc379e3326fcca44bf834a2ce35a4b86ed9ad70d45c39a4383aadcd8816f85d51d1afa1a49c317ff00f25295e8a655a1a1546a989e0726755086f264cf3c752de19f458bc073e4ff00b47c3be97fe2527f1b7e696de093f4f271848e4b1f340bdadcd3a08a237b949986ca3a02ba83ef5d4f79170f54a6ad4323e82f3d2ff0ba25cba0abe67c01a5ba7c96b5e11c98756f066b9e188f1392ea5a63861f3d5c7ee7f05cba3b0b839244526cdd378e50ef39beff00f26e07fee3fc559958b712ca27655b7163c73b5d62cc20a85ac0ab7aa0fe85bba66c71690b164bb37f3899f221e1e92632d2255da4e85c86d2229a38c5105a9fb49b0d88bd955d30cf41ee99b5478cf7e9fbd3aa5b7311e49d3f15d3a69067491d992d4a15ea3d50fb056c8dd58e23a7c53e54ebb91c720175ca5696b02eeb0b370e273788af9d21b9ba61008b159353a3aee34d5aa95793b657313615ac4f3e6ead363dfc5635e44ca74e8360e1bc3ad7b885725923515883eb646ca2af1ee98660c6fef632ecea8681795bc18e4127b562dfb08e09a7588cf985a44026902d322cbb558150aac39f9ce777c49aa99ae4a4f50a6b067d93189dba920cb241982d9705b7d6e80ddb323eaf575ba85ce25d76b3232150315fbecaec58eb12cd93bb3b71b795d385d0ea9ce7d135db0c7659dc0433c093c7b16564526192c2c40bf45aec18a1d820c4da565c8056a1c653c43ab130b8ec0a3f6f364bba3933b017072db15769cdeaae67885a4f371c78ad71b62e62092ed94f87b4059ea263bc38ddc6b46670ec2b2db44e23a16c1fd8e89c57217b1c8f3a1cb9dd675bc55606f99e6b5b698930b87fb6dfe2ce6f0b2dce978b3059d5bd71bfcd629d535f43a3387f263aa0fdeb46f367cc924836bd8ad721c7409b79962fd772dc8d4682e58d4da79c5b886c6291f4ae3db900b9b6e53af721374b4ab7b13a9ba757c0cfff00b4332088a753a7107858ac80c6db51e9c53f2fde1c5698f5b9120decb36cd8489d11848b5e4ad32d3413c115ea666c0c31733756111bdfac374ffda5a5447d1d85faad2285276cdddf2d73c536a044520dfbd2e5a782782dfb897d9ba8af3023d19b2077a90afc827fef173dce573e877385a0b66562a74666b9d5b594ad2c4896a0ec70e367d247a9af55a0d6e3b175c7e2b272748b8b2493bae35ac8d6e3f4a89722a036b3d8415b6620c2351a3e06618e83c85c37a83dd8192df9ff000f92c93d3ec9b2d1d4459d11be983485201d5c77518445c7305646469df4a326ff00f681b47adce73624fcc59720898d51bd425b67536d11bdae15ca848a94b9cf39eeff00f57f04871da68838c8ed71794be90650048a34dbdffca9cbe65641bf9526319163e6fa54fb72017ce31387a1b806fc54dbce7335c02390048428c987de0fa6a5f95a55c5ccfc28d7b2ce78f82c8d3bcaee28f29f8367fa5c03673f9597cc31cf9d043754e2af16f7d691ae14aaf3c12d6d3ec71e56986e2fbce16abc5d2d61659067e54f8066c1b489a561bf66562be1c9f8ca40201a6dfb8adf29184ded4e9322b6cea30913c9e39836feaa2754e3c2216d99f5eb5f295d16d41ceea2aee4eafb47f5d8b138db1639abbc8a1b5a1b9cf597cb52283586f5395512ea440d9bcdd5cd758c3558735884ba7316b1dadee9da683c64c9aae23c1bbd1e01af0988f6adc9a4e809861e1ab62b4e6394571c967dace300111cf25be1f8bca399633b668eead0b8a7c34e007d1b9df82de84ccbf59ae1d806a9bad625c30ff8f6878f05d79ecd3b9cdffd2b2ea3b9aab28c4ab7ec32ac5fc97238db5b24d987667e2b96517176b48bef16b059538ba07514326370403d0af056fea1ba3a9da99dcaf490d9966fe08e69f04571658a6f34432a107a2b9266088666cbde69ed9595ef670ee86c9976c7aa9aaf704e4984d8e6569763169e0b284a42a9383d9e4802c96bc7245a1f8a507007b3e2ac990394d53d617b2b3ac3aa3b0ce09a6aaea6a1ac13d8d4a45cf54282520b9ea8b9eaa0856c1193db9eaac5cf55594d4304350948501804282103c9a142e3aa2e3aa9026850428026a0a6a080042526a96b004d410850008421004d0a0840d268505340a04d4a429fbc1191a948420904210a068d4210802c21084015d57578837e0973b929c0a31f2a6eadfd1f147dbcdfddbf7a6b83b0f7bc12e9e0d81e5740992c0cd8d9c5f5bc164552ff001d352b1923041eb986e72f15899b385ed6f15917f227daf2733d162c31bdc91e2b2d9d138662a7b824650dbbd50cc9b92b213a4dede975e4aaecfb523e4512c9b6e0186eca7c5cf6b65b84bb802e16b98460d953e1888e2b3939eda5112858ad4b0ab2c4e7543eafa453e4fdd8ef1ffb56bfbccceab33fe5bb908b4a5b454d6324db5459602752f87d2faf359b9fbb65c79ac22bcd6484cafe6f99fbde09335bcf11670dd66cc5f461ebff00e95897169f3b736ce757a7248c8df81f81685042d46b26bddafbbe296a68004d4a4200109a949a00adc96fb79220b5f77e7d550845b9ac9d227cf6d21dc323ea8e5f3522a6f928cd05bcf063cafc0044c8af6239a1cde29d73d17848b05059340abab0aba51a90210841249084253792e09c928400e424a72001084210090428cfe010a350e0539196c81fabfe4993e29ba02c300f26f92ebd0ae01e46156db680f0fe76d5f478aef263111c8add4f473a7f22da10bc39a70a09d21b5424396ee1b97321c7a871970fd66bf3174bb82abbe4cda7adfa83096f46db0a9520df913d57e9b917e6b8b7959e894e9474741db2725bbec3b772de2b5cd803971cd059f47c49547fe78aacac501d37913e73c2e81bf1cd7da3a1b9125aee024c5ad71739597c1da327dad568284e9bef329bdb622df54feacbee0d0b571ad64b078d3eac23578dd47042ecefa9a94a6a43a24b54d3301374438ba55edad47799adab582d474a93e09ba3cc4ede037bd35da86c23d9f8df14f752beed95f8ac831c55526c006ce48d5e36caeba2606d0443a40c3922b72b1086c63f662e23e39abf3bc99030d6db63c91970c866b2d934698c73c9c7dfd55fbd2639d3f33992027e088c438ca8790beff2bf15d10e835847b7dd31db69fb0beb5ff975583abe048f08624a27af0ebe992789b703e1c525cb712d33f45cfd527b1559a73c8a9c0e44522116e2abcc881e6a720098d9ff00ab9de9ff0080ab6dfddf1541ccff00abe8f5e69127959269ecf8bf4b7276b5bb0ced085cade8d49b60bad6938182a914c8865c3f05c99dfda949a66dcf06b7d1565735eab0e3ed1416d149e0a8382721350459c1197cd3755ca9489db1889b715e6fddb12080d97bde08d97bde08f3839fdf5eef027f03f5504fb19357b61ef782c3ed3b13ece7a203e259bc43fc61f25e6c67ff00ade0949c97f1203e91dabddafbbe29ebdd90fde437b4947b23daee534bddbdff0005624309a35b33cb9210c15f48ec5ea6389339bdf573b2f75cfeef8aae5138228576e3aaa1f46ec4300d88ebe0ad4b91373fa4b944acefc93e29c6c0ea65f14b51c745a3d9b652a8715470f3310ce1b571389bdb82d8e2c36f5b0d791088776660422eaa61580799e8597f9b856d2d5f48d68f63278d3a7378bd2e57bfe4b996d9eab326ea6af62351c25862aee58ef4dc42218813f15ed570cd618bb98ce7318b2ed5bf68d2545fb3ff0056dc56671837d66f2dd08af09bdc5be0b9b6eb5d57e19d0868f31e11f3fb9a755a188b66d29cdc9c8129219be6e6189cc8cf972baee34f6cc3622ed4123ac4b2efb4398f31c617695da06139f39b19b706dc53a5e522bb116682527fc1c9f0dd384b9efb6c38ec6cb2f8ce9f52a9511853244d84316eef799f73c32b7ebe0b6f7b87ea9842adfdf341a835dee5020386d98d9f7fc3e6b99e33d29efef5db5694e0616d70dfddb25557cb5766f83e08b2885305946dd476131fd5629eee2dbc4dc5f85af7fe8a156999d572ff00416dda01326aed9f38a9498a1deb2b1e5c56c35fc2547dc710fd1bfc795cfe0b91aad7aa6f754d9bb4b4ab61bebe8e2efe55a26797c53e834fde2ad380170258ee5b455b0d51e6b6d591139edb055e81409018ba899cd71b6cee7578f8adb56aa1b3b27f6b3f6180770410c36cb3cd62de53f524cacadb59c05d6cf50a158ecf7c84df9887f9ab151c0735b3da7d2b7ce1ecdedd13abd54132b6e9e5d1cd1f311b73ebbfe9fe6bbe61f8ad84da4ab70802e491e1a711551f37706d148b72e3c575e95186d460d8c37224db5bf927cee4cc7187ae5c98b9eee547469b3afc66f05b6604060a60cbdac968350761b51ee001af36c3e6ba2e09b1a0b7b71373f82d9a58e6265d4f4cdd58f13f10b616e75758d96b2c789f8859b913af7f47c56830478363a7bcdd809a2202fc9767a4e20dfa94d5e488af3a6e56bf05c0a44c11819f05d1b013d1b314f841b379b706ff00ae8b2f90d5cb4da694a21557ecb0de61c1987dc19cea7ccdddc4f3ac62bf119db251658369348a8ef6dc4e8a21d0acb49178827db202ebe5345dff00c8f6d87a08d59af680704586a91f156a44f887086fdea961f637901c38a95e23ef7159ad5632ad79c0772fa2697f55e97d5b59c3bb43373612e7c47884ddbc7d101c30032881b28ef6d7911f34effcaf4abec4ff004eb476af6af6186c6ebcdfe47546f0d7898ef6e0a7ff002dd321cfc6da7ae2f60ab1117309d13b6dc2ea5bdb61cd47fe5da6647f4bb4ad68d344d8c0b6aa917cdbb17a1eb63d11ff009650fe8b2f1567d85cf5f15e888837bf8a37e9057bbd493c4217eaca3f8223e2ec64c4ebfa362bde39dd2b7d9005b552f7d924d8427e6a7ff2ed320978bb17d16c8b8ca24ad5209cca8c2e24daf628df640cb5782bc7f56e958bfe996b64f2ea8bf6f8a899ede2e13e1f9a36cdff00d60ad5fea6d1f3c91fd335035097bc4aeabc86f9ad157ea2d0dbfec4ff004f9c46a14382136bf37a4b7fd84ad2ea11e5cf55ee7d5210b5d5e5a89f7217eabc92b175550b455aca27dc83d561692ec9363d10b42bea64619242af70133582aa7917cff03d092620179ac15f2307a126e11708c903ae7aaf4137e29170bcd60a324964a9dc734bb8ef49a84f10b68a2b65f149baf8535bb17d0ca97b2782c1712258c8a840f654716adec56143d846510f1555e39bc422846457935faa92b71b4def438e4dac4408baf552a74f8dd32953a3c8c50e6adc310cd7aca6e8dd5fb0c36476bc1e29a821353c8134d55d4d00355855d0802c2aeac2100527724ce6d111c563686fa29e4369e2d9d8aceecf2b6b64aa6e2d64b89aea4db5881716cafd5489b5740b272c5c4575507051723776c4fd6b77253e09e8ad527f264dcebf72c3cdaa4816e2a9bf9f14738822e02c7cf9b002010b25ac8c21f3ea1b7f4bf34379f0da2308bf058b70fb77bfa3c3b78aa9bc389e0c222e0862dffc3ad61986f489455e7b68656792a146bb0a64b913b2897af5d19f9426e98b9582a66a9decfc1793b80ef58ca7f083e2ac4f9f7b7a3d79a90213e7dede8f5e6b17b799d53aa13be8d17a3e2b1fb7f77c55a6b2064a7cebc9116af1ed58da009ae2adab91d85fbd557b50b5c98b8ac86128bd44e70471bd87cd21167660fe7f9084e5d04b26f129c9285005bda76215442090421082ade09acae196f35fb89eda137d69472eab14b31407de677e1cc9ca28a4db8a911259667716d219327325c1a8e7736175a39984c44742b355aa8435172639c7284582c1db3eb9a11098d534adb7bbe2a4926c4f713424a2e12d3c9704210a0682108400272a2ac2001395156247b5dc802289fecf7ab0bd9bc93444d9fa31e42c04cd08b1bdad0ce99f82fa3a55c80095f2e7900d437ad12bc6c3835a84407c39afaa21b1faa16fa5e2272ee78917178782543176268374c6c510b1bdc05198dcce913e43837867f8269b669649bf1519084b1d9f93f89698ca818b311366f5ab36a2d4a70127a8cc13c57d8fe4fd3246e4c8c9e972be73d30bf9149c638ba9edc486f3e7d46d788741d3bd771f27087756435cf075f3cd08b47b3ea6561575609b0babb21099f14500bdeeb51c6d376d84ebf08f6a9b3ff059ea93a30de0117119ad4f17c44e17a983fee73bf04993cf018c9f0f68062b6068be92e257ae9ded5af9ae90fd8d11d4f02bf52726d7bfa4b96e834b2fd8f9adde0b6b3d9daa7bf3fc974b85f60f9262861a24e723adb82c7664e957ebd88d7df30a13531c8a1c73c13f549c815c674a0226f89685f48de355e1e7c320bb3bf9d4f72496d4e2de41f69714d28b46fe70a56c247f9c17f4bb15239fb2b3c7d1f72ca8e212212953271f8218444d31a587192125c8208e4adc8967bb5f77c5559fc4272f0712973e8b52b93e39d2c583939e773f92e54408dc13c6cba86978ead523bf0bfe4b96b5179b1926e122ae266b9708538fb4504c7e96b4940421080149aacd3f76f453f64dff0078fc9340c529abfb899dcc9b286c049fab7cd09e44ec2aa1084125e4d5510802f0e2ac24ec3dff000424cd7381cd8cfa4f626b1d6d9fa3c52f6ce7f74fff0025e6f12bf792c1766444262036c3e08f37c44e47bac92d5f0b0971457b762b7bc41f79d63972465977848215567b3d5b180dfae4b28276afb37bf6af2a0619e35a40b037cd517659a30e4ecb38b25389d49ddf5af99497d04425db9aa50c3170b26c7a1697275bc270ed29b8762eb34fe016d34793664eb2e324fe056a386a322978605bfcc85b41806e473ff0570f59f33aba4ce1b66c3a348a2144d9398843e965dab769eca53a6335a887322e168f80f2a54acf95d6eb4b793b6e735e6356ac8d9ec6cef69dfe073173522d9d6e97b585ef75d3f09698f16e076525bb7a6f9c5a48eb1120f82d6f10e126bbf6fecfd1e36cbf9aa75771152691108a2178bf2fea8b1435114566765a1795f60cc42f035aac89f143cccfb58ff058dade0ed03e38add73174fc3f2a74f124b970e1b70000b0fc0ae23867469156a547536d7862dadee05d425d5b166186750a7b4dbc894e46ed34906dcf97cd4c688e9e5fd99342762b63f9a3ea8a5e25d07c322548a237a44473b588c955a863dd1353e7cf911454d3b6be7964be54a06f1226da40f5b7b85b0d270e1354f385440175cfbb48e76fb6d66eaf6c21b2b2dd49f4872f67ca684c86e669d80e26fd57ac48914e2e6dadc32bd95aa95277d179300d6e59aa113471048d8886f6e6b7d3b147190ec9d29b89d57690eb087d3bdf8ad9a221c5620a9443eb4e3deb1784a4933e64ed6e12f82d9cfaa657015676aaecd8c1c7f06ce5525d87f53ab3bb8244ee3d6d75b6d41c0859c56190165a1e1b88efef07233d6dd5b88c9611c20e7c975239fb39138e5e4c0d65c43e686dc3320aea1844991486c09bda4dd71aac4e885319824e763dcbb050228a5316908e7000577349f1393aa7878372933b22357876ac93599e9116e36e6b08c07ab3f1574ceb91e8f8a64f87831766c2da75e1d60782e89a368a272ea74621b67acb91c87076d05c762ea5a167dbd38760d8eadbbaeb8fe6a58d2336e962b79d74cff77c53755c973f77f53ff32a11c42c0959002cbe66fecee67087376fbb48316adaeac2a4a694d60a9904ade9b7fabe092853901bbf4aff005fc14b6cdbfd6f054d354640c820f0551395d224b0855d0a703b04ee7aaafe703bcfd74d52005b821b14de04ed7ddf14cda76210ab8cf65412f6beef8a658f4458f44120842820826849428dc04aff00f1ff00e95efae1f55cc03bd574d4cf7483037799bfbcbddfdc7efa4a137dd6838410edf47fa112f4540733e2aa6b76235bb15abd7df5f5216aaa8be1fca39648de445c230b1c0762f495a6bf2faa84b3b9913d2d36ac32fed05beb2f76a0fb4150111ea811c433bae957fa8f5b525c99e7a0adf08c88315beb22e7f795313e60caea5b73d16ba7f565d5cb3212fc744b662239af36d17eeaadbe58670a897d289b0362ba957eb18ffba12fc67f05a33e2fdd28130df91ef5536e22cc4ce2bc311b5f8adf4feaad35ab2ccf2f1762e4c889bcae91558cee51db8f454cce9b0f097748dfb7a9b99b8e1648d779da27a792adf6374ba09c6ce4d767bea8c98842255faaab0bf77557d2a9ed85e18ae08badc36b9100762c6b963aa4b86e3e91ec95f3ea5a96a32d9dbb57f6f067673914765265c518240cc70bab74e765d48867eaeadf95eeb47a85677fcad6e7c6eb6ec3c7fbb25df22bebfe3ee83a51e5efaa6e665353b53f57b52367da9fabdaba2adc0b22a6842680d4210802c210840134210802bcff0067bd639f392e4985be679acac5083ceca11426dc513ac49ad1a4b99d9819ad5de18e28b5e1f92e8f3af2a44c8edc16911b21164790bacd3ac0d7aa10bde9c55dc24ca739aeca6f386b42b335b6f77d14bb2ce60561ba4339c916b9d554d8c1a4cd9e6c8cb301518a0b44459656745ad28d9513093308d536b2b742f66792c53e445101d9d8bc9dc539bdf58c56e0a530836cd057fe184a8f35839dc21ef5b2d462fa31c9609cc989b83ad9a27d1061ea02224adde88c435a44a021b122e7b56a5b385cb88640e2789e8b7dd5205b804a82c927f3cc84216c81d104d551395c01253926c3a20951c991613e40def6d97aacbc563907884292b62c3c113c55d65f6aa9106fc14d8fda143331707a9edd65526cdd5b7a3e2acaa210457f301c139247041e0926c47b73d548f05151da8fdd46703cb4928dbfb9e29c945c4a139082a964a2af21082c514e1c558426955c8254fe30a6a54ffbbc2a50bb65989f76ff0067792302e28fff005b7fc57d81227988ea9857e7ff0090fd59f0a456e95045919c490bebc86a2ef5b29c7b8ad1178472ec87274d06e9a33bae74daaafe4670cf23ad8ac8cbc5afe0fae6e14a93424dcd170b56958d7545a36f09bf34d978b5a4dca3848f814cdf8e0123f3afcaa9c6e1a76c52db5febcf950deddabb6f934ba33da4e3bdc33f55ef2f66e570df2c777b6d3cd6ddb7b9862d8f2e3c5760f25930096ee4411eb5e7cab9b70bdd4a7f65fe27d90bc713f21683af34a58d7f50ccfa487d158f029dc51451124e6095ab57aa114fa73c9107012a2cd65debf86e33e5c960a222719995b58aa76322d1f9f180b4b74fc00d2a142774c9f3ef529b70070cecb7663e550c68b0ff0076309e3fe6b1b782f9e314ff00f73553ff00d64cfc56384795f92aca29f234fa2eb3e52ec2bf3e270f29ce6f171124641732c73a4a618c6a14f90da9b31bc5266dcdf9ad0d224c5107adf33f6e79fc125c704b3f4ee8e44da4338adc24c3cd0f64910888055b0ecd3e6169d4c995f82b93a78ca1b5d1c1062c9374c29bb2f7bc1561c0acafa1f53e4f8eb4d3e8d4891c75415cb995ec49eaba969a07f7b807f757319406c4d866a91e5e4d17f2b822ff00eec7e0aaa7bfe6bd4c4ca2457421085c9058b0e8a3b0f7fc1490800b0e88d71fef3315b46c3def04648c0a4b9d26f6f4baf24dfb2edba365ef782684e1815b5f77c5317bb2f7bc11f65db74d2d5d6304fb7b1e2949bb01fbfe097b099d07cd283a3cda76217bb23fbc8b38eaa5004afb72ae2a4aea89b2b03252675efe8f4e69627dfd9f15576beef8a632fb549e4d3f63660da437895632212792c96cc1c9781b4a1c90e78298c1be309cde8f86a94e5c47e8091ac474ba26e2fa14607a9942ca9cf99b2a550c75fe4abcf68df6475e50882e5df5ab259c9d5a73187067e4620a649d621c37904db3078acd35c62c36f0ec6a13bb449a8e67b96a4283267c997b16fac21bdf354df61f66de2de89dd48f6b59639e92137c8c56d90e0df8e30171b3c44e477a5d52a26afb0d67ee67ec3a1bdbfafe4b9f0a553b67145b52e0c3cef62167687849ad5755bef65bcc1cbaa4d9a58531c8d85b39f0d9d030fe34a850a961bc9dde7c8e5f4622ff00339257eda4b33ece98309f0c1c88fd593705e85a4d69b4f02b7343993db7ebdbd8b49aee1bacd1eaef99f9e5c8ddb911c563afd364cd4f7d7036ca3e2aa7caaebd71061c80c8ced90c959a863590e6fa94f9c358679f05a04ba7e2b84583b8cfc45d4e6d231753ed204b6e7b41459a7aec7c14aed9be4eb74dc7986a4309772e0b9ffd1fe6b1aff16d2274ebc98a70b71b85cdef8d439d8f9b5a1edb2f77fc5ce67ca9069179f15f5b3f8762aad1c17233db61d2a8989194892e36cffedb85f3b71572a95d911328775a9c98b6d32e33fd755cf6530c79341d5c24fceafb8b1ee2b757a3ce1e71a2d45b9cf8436baafedeab27c10f5135c193a141ebdc1eaeade2b66aeb8331a9f46ddeb54a0d73cff512f35f5b867d5662bae806bd38ad31589ed334ecfc5b35fc493f564306821b5e5def7e792ed34586cd64424f0c970bc4979b50a76af3825023bcaedb4f7021d516c805e874b1c44e06aaccc8da5bc39459f45761c96218b8d639f3162ad2816643585ad70b75d0cd4837c5ae9b650fa8e37ed5ceb6b9d8adab466e365895e3ad4b802f6bae07ea19ecd2b46dd1f333e9171118a5d8645660db915adb69f14f952e6c7c6c2eb3d2cde1172be6bb9b91dbc0e53504296b241342858f453b1e8aad60904d4bd5ed53b8ea80c0e42afb5ecf1479c47ef1513fc5e082f215693501e97a5e09bbd8fdff00057deff80c8cb1e8842800477a5ab3fe00d55d0bd4b6f249e212917094346a127580e68d787aa6c2cc760392979af0f55e837cc26bb130f5ff00d26a4a2a4a412c82108575c93f3048e69e948444b90421171d5412de4361eff829a9214e481484d420055c7545c754d42970c11b4a491b6f77c56514b63ef78213fe0948c7ed9cff00ade0a5366eadbd1f156365ef7825ecfb53f2079221e39f44a7f9c99dd90aa8c1bb7a36ab50e0eb38e1cd4ebc7569338fc114ff009ca5fd1a789c2177d8174ca2e54f976392e42c269731420644f82ebd41ff00bae515f54f1bcc22797d44b13330a4842eca3393421356a400842b08004210800561454900090334f41cc5904328d4fd5b09910175ac319437c82fc8dd6d8ea46ddb16f7b5f9f158e65442de76f0e49d51cc231916cd7aa404c7f192b68a76d9853a5ff77d9b9f756265b0deaa27206e6df05b69f4810a30831931a2a50cd1ea797101508f14b090418629e567e4c96d289d68466b57c4d4811d424c421bedafddc12e50fe01c726d521d098d04e06f7e491b724dad9a9ea195221903973b251962199b588e4958da438892475546a1ed262ad55722583ab1715096012e0c7d024ebd733cc0cd6ee21b5f35abe139204539d5ee720325b4406ea6084b3f9de27b5392504f6ad7f13a3bf008515250019a3342101ec90214549000a4d8ece7ca878f1fc9449b27ca1203997ac3aa32467078ababb3839cb23cd54e06c502cae9a782f67fb27e29d28817b9b25e07159497aa4613fba7e4a3381db90a4268f8214e0914852bd97aa008214d4b61eff008208dc852369d88d9f6a367da824369d8bdda656d5f15e6cfb52ea1ed2942ece8fb03fb3e9849abcfc4b0df317cedc2f75f68fec89163262cfb42f8aff00b395c18716e2695abc64c95fa0111b2d10e8c36bc1a6cfc38fe48ca104158a9cc67f5bf72e83102579b1bfd686e3e2998129679399986304802f6e2bc5d37cded231e949049e69270fd2c9beed0fc943407e65f9599d9e981e0b5f7893287c325d3bc9336ed64bf8f86f13e54ffc73581f2df92ca9fa608a23287a54f906c32e4b21e4955998e2a156d43943b2be7d42083ee476e0496c62e64582d727ce2081c79abcfdf8d87d63c5601d4d02217577c105579ad3e79840cc2e67a41af55f136258344581de39867b817aabe6e3eef209b7c167748b8ee0c0d412e2dbcbf7037762dbfde27ccbe5f87cd59d14607fd90a19a9d66642e312d68ef1579c0f1b8e1dbcf354ce5928f93b493e45d8ee9f8927c381c487f4936d5b136fcd7cf357a454682f67d32aad4c970d8eacd9278839ff0005fabefe6085a4cb0bf02bf2fb4878b5ce2ec5b51ad56c9713c4e395edc73e2a534c6ae8d5c98e29c2403b69c7eb656fe2bb7604f257c675b70c2ad88616f4e617022e672eab8a487e5abc81c48369f238765ffa2fd00d1557ea55fd1e51aa5549fb7713a4f1b5b871489926d109d94892de40d4824da45b8f0fe0bd249e2839f1084ac92665beedb9058b50da762369d890fa1f1583e36d344ada57b507ee85cb1a1d6822045acba9e98ffef4880cc7aeb7c972e821d554ad703a5cac8a73f68bc9fecf7a724cff0067bd58695d584aff00341414e7023058428edfdcf152dab6e854903e573593fb2edbac3ed7ddf1539350b5fd351902dd8744a4bdafbbe2bc529600b1b7f73c542e5574a93f7829a59706613554dbfb9e29fb5f77c52d3c8de8626ec3dff05550ab82466cbdef0562d97048560f04a72c8b657426ec3dff0005e79bfdc4c5c1767bbffbe1555ef9bffe1a4cfe30a3a458eacc5c486f0d1229c769790001c2cb2f1b085fcc8a17476538e672ba4e0c94de7626a1359f9405b66b78a8520389e206126f148379ce01cecbcd6bb55e9b307674b1df0340ab48a4b731064e67c871d0ad6a64891b78ad0aca62c8e4399e636f613adc161e5ca301056ad3e655fb18bb7f19996a6d225c73fd38b799917bcb30239b4cfa44f73bb43cf3fadfabac053e384389519e22eb36fb13424380d0da43abde1bf0fd5d2357be71ca2f57fc3e84d0bec1fd09dcdf0e9c5724c7a44389eb709e26df9aecba1473bc6162e0c3ab7d6caf75c5f49b7918b6b5181913978af29a2b9cf5b283fa3adb775479846446e2077bc8e578565a9f28541f19ee23b43275bb563b029d69e09196cecb64f3779bf6961fcd6ed5dcea9f04575a70318da482fea0e41e12785be2ae6188bfed2c1970583a14f9ee9b545d83f6eee4c8f8dd6d7a3c95ff006c268e80ac7aad44d69dc8646a593b8d0186c1882645f5bdeb2e7fa5e654df37ccfa04a391cecbab910b7932a0846565c3f4f550dc6931c662e371f1cbf9af35e335765dac49b192ad46b68e594d90cdab899bbc378a102e556adcc25b11f148a1133a517046aded926d7080de127a95f45af9b793876ac419857204eae34849c8185765931180dc15c5e55ce206b7e518fc97636d9af4da65f89c0bfe7933d4f730e4623c55c33f31e878ac5377109b5d384f87904cb167910de0bfbc12e3500c8f35b768ce2fa4d41c0cf3365cfcb9073b2df746317d0dd4db67b45e43f53bdba73a9e3d72771c22fe02de16f7c864476f25be08ad08b745c5686fc36ae34262b5efdfc175f8679b662ebe6f09f277132eedbddf146d7ddf154769d8ad2be4a0cdafbbe2a492a5b5f77c540d180906e88e79800b25ed8745c7f4b58e6af4fa9b5c3141b43086e1c3f724dfe39aac9cd7c0d5a3d259ac9edad726f95dc6a5b6c9bd35bed9c4fb6c40cf5afc3e0a8b5c66c19d44f9c5fb8a94d87ede43637123f967e0b0985b12d030b538e25261a954278f5cdc7f81db7efe9c961309e2460e23c4389ab74fd613e6989b70c89be7c162939c269daf93a4fc7aab30b1727d0d80e1a7d728d0bb734c9fb78ad6d61f596718b16338c5b4a589021b5b5b9f15c3746da4ac6ae6a339cbc6c1bd247a933e2c80ebf92ed3231699f36ee9a441b9e06d9fcd7b6f1be4fc72a146e3ccebf457a9bf58bafe1c7ae618cd16799396592a748a0453e865b0a84fdff2f5d3cf159a15c913676c01cc0b8bf3552a0fe4cdd617b5d5759abf175e6ca639114d3aab1ed66a50b6ac50295a98bab2dea33ffd760d7a71e3dca54fabb4a8549c53a51bcf6df6f24f03b5fd1f92bb0e3a61468ad10d684713adfc96bb8974d4ea4e74b90d80cec6d7b2f2d64b4b67e59c64ea51a6bfe38c9b16af6aa06a027102570e79ac161fd30f9ddf4aa7d470f366c67701f0eef8263aadd05838773e45327c7148fbc37deba5fe69566926a1eca65988e955353d92899ade22e2579bc44b49c438ba64eabcb674d6f3e9fbd5b27326f6549a6908c2da186a0d62804596bf2488b71ec77ec64fece881c1ba7413c019ad359637a23e6b7de6c7870bacc526b0dab03fbb62db5bb6c9d5c95bd7d196caacade119dde7dcf14fda762c4cf9fb09daee4eac3d51e70f7cabfb5ae05e0cb6f1ee78a8eb762c679c7df2a3bcccfde2b4fb73d126467cfd5b0d5cfe295b7f73c55533441c471ed5eedbddf1552a6436beef8a5aad25c017f47c53b5e1e8a325766efb2da8214d4964490949a9bec1aab04210801c92842ae722d825cde49884f20c3542c6b9264802c205471abb2de82e6106d7b7e69e499b89e643d2cb0ba4c781b50cc44d89cedd54e8d3b2f2b7fc19ac502333674a3c013c3bd7716308d98175c5301031555a5badd76961711443e0beb1e3525523ca6a399192421170baa84934d4a4d5a9016108420014d09a800427210025084e4cf800944ce49c8501f23094265bb389ce5d72ece3659bd7b8392f2c3a2f55450b3092782f04b20eb1875bb134004f04d8608757308c01503b9530ea939c3da90f22f55e8ac262e631481bcc886f7e07e4b00dead50902f04df8a4c9119c9b50e77587a94f88920c2bda3387f5673ad0f0cafd8afbdc30e0888ef79ffcc95807c96b0cc9d93331752b3b01b5d21ac881b4a972a11cb34e1cd11e04b3f9e051b95242d699d04f0450842824108e398402466101905e904f00a369d380000c967a460babb86fbc198248e850c19830083d0ab74e6350abb885b356c6693d07059a2cf0dd26412e5e0713cf221427e3b7cda745e6b6d21bb73faef5416cbb57a5559ab59321cb68644441390e2b1edf0c87f24eabf910b8e97e0aa1c4555773f797351889e409b7c92e7472837dbed27fc15d105f8305be8588a90a8b7716ff00007123e79aa5161eae017f37c5340e81508dd3b97630b98c5f866724c6f59ac3724c8a8ce87ae7c5434894ac19151eaf0f1a6ce848e812cb37d2bede44f0af4389710016f3a4ccba8571c636a939b6f51489e475096332f0610c24710476150bdef92d858e356adc8dea88de7f5be4ab79e30fcc004748bf7a941ec3006e62b26432d6cce060e9f2e089b3770deff5ac066a6d69f81dc41ac2af3a49e84f150439e0d6041637ba6016c96d7fb2787e79b35c58ddbdb867fcd55fd8ab4fb35adc97163965c50593c9ae986dc4a2ddab647380eb823fa342de7823f7924e02c5726417269c4491c8a06ae5181d5ed50a837b368bd3f0593341af8ffc35c9f8a5d429f3c021c3771d9cd4a2b27847d25fd9e6e033d29566488b5778a6817e8bf4376b63c17e687910b98293a6697bcff8ed676af2e762bf4925cfbf25a2073ef2fa156dafbbe29bb5f77c56a11918850dbfb9e297bcfb9e2aade08ce4f80ffb41240ff6b2cc01ff008465e099e4b93e442f5f37d7bea4a93e97cd1e5f87ff00de7d232ffc1c7e4b1de4b4e5b9abb96c63b4ddcfeadbe094cb9f6554278d5248facb08edc9d7d5873b0527d50311b937bad034a78bbf6570155ebadb370da49328ded6556f049ae61b9074b3a61758a1c461d61fc243766478ede7ff002ec3d1770040862cf92e6ba13c3f0e12c07486f3cfd267b7dea742065b78ef9dfa64ba26d6e45825b6c1650b7ff749b7c80943e6bf286bc3fed05485bfc6b782fd5f7836cda64906c6216bafcbcd26610aee07c7351a262491b07114cdb81d7afe4a6b7c8c5d1aa806f7b715f7be80a2db68a28448b6a8b2f823e90e1c4321bc3731705fa0da13a03cc33a3aa4d1ab508138da216e4156ce4937142bbb26bbbfd70a8c71036cd28942178782f5787824b1f1ecf8ff004b6046fb589e510f9ae63aa0735d3f4be7fbca703c4cf9bf885ca8dc2a24696b2909425c1f6b0ab4aeb92c514e91ed7729cee4934ff654094f04d2761eff0082b32a219e69aa70cae4ac5bdfdbf04a5680b28c509b29026845acbd10939a6823d3236ded5add975ece6108b6b0d5595932086c4eb7824cf3bc5c0cafde95ec5f63ca0aea8eef6f6bc13b65ef7828c8359169bbbccfdd291bb1fdef04ed48ba2084b036190e7fd13f345bff002ae11098bfde614adb39ff0057c1270464b7e706dfbe99b7f77c551da5b922e10894f0589fecf7ac7cff0067bd393535f058e9d499865d4d9c061e0d16fc710be63472cdbb8ddc3905c4e9f6bfc6ff0035cfa4476af3616ff2ab3a5f4f9cd99c1ad6b0bdfe0bc9f91a95b664ede8dfe06bf59a1445b1a9972e9c3937205ff3589a54ff003883793b103a85b3e2b9ce219111d6fa31ec5aed0613375e4c3e8916b1f9adda6b31a7176c5b9e0742c0ca7621db5c1ecb595c72c24c911831eadc0e4b273f0e453d8981cc3eb3e165ecf3e779317d021ce4f3cacb35ba8e3b1f556e3cb3ea0d1b1a7fec14af35c57b7d43f35c034a808c4b5588dbaafa2b4793cced1dd3622d360448005f9af9ef49820fdaf7a2647aa092476d978df1d6e7c84d9d38f1514f01cf2ddbc5bc456ddc667aaddaa0ee519114dbf72d430acad48c93cc5d672badcf9b216a22ce7f1fd77ae8eaa5bee2f52fc4a541a7b78288dce47789db7f87f55b168d251f3db9997fa4899f8ac7d365c4da4d31b5ae240b5b95f895b0e8d1a450d79e457e20f2e0b9faa9ff0065a1abb3bcbdb1a74b0ec5ac3d13d57ce9a7a653dc520192df56ee754e775f43d7631152a5ff00cab81e932799b2a99682d6ac0e6bcef84ffee26177f8ce5986a1bd3c6f59116d549c491ea498610789cbbd5c886ca6c63a1b71583c553899cda184710bea54fe7664e05cf6c194a9b34cec4b2e088ded38dbc176066e08b85c470d12713406f95d75d6ee81c82f4b47113ce5d66e9e0cf42e2c7926edc5b2ceeb1027d85cf2551f48f38b19ec8bcd8ef371f14d9b14d9b01726e725d3f46a6f430f2f7dbd8dd71b0e43793c35b55760d1dccb61991f12bc77eaa5fd948eb78fed1b70987cf6c32e03f35da58cfde59c33efd965c2a6ce8a4b894e9c424c9b5b25be60dc7787e7b62dcd461b48b803f5f05f33abf1b30cef747405eaa32712d061d6fef06f9f62b5bfd3dc7fe2327d1e82c9ab6301973d57a275bd9f14453db7fade093389005b8aacba263d84e7445bb7b57ccb8cabb31ee21a839777d6707578decbbfd725ce76c6748073b5c2e30e7086d5df9baa43789e3ec4eb7d9f77354aaef54d4a7f13d4fe98be1a4d4fb2ce8c3e19a3626a936114322134f19eddc1c96f826536652a06c68ee3cdec3294e1b826499fd997c16269ec2bb262a661fc4ceb75627fdd8dcced9dff008f8adc74b2f9bb76f4aa05062dd98b7900de117e9c95f5b669dc1d876bcc5b56a6e4eafb32185eb94e182a2a23b73bbcf8a6fef76ad94e3ea7b06b0ead51b38b5f9f05c424c7381fb52b24da137175e7d793c7f6ab8a30cb431474ea9694a7382373a66c0f3202c33cc795a7124c931c235f9f45abc27219299375925aab7f92f5e9211e90e7cfdebb3798e62b1e4a8080c4733c53f549e26e8d5ed4b76d93ec77ab6748229b3654f90ee4fd691cbaadeeab1170e18d745437b9351b379f3b75cac7a78ad156eb417920e8edf35712ef0d8fb5c78af43e06ddf63ae6f8399aeaff001dc3a54a721ccea5f9ca4359d4e3692e67459cfedbfeaca0c284c6a3859d6eb88581de2698a16ee2256ddc677fc2d2e2a6c3b7864de70b7db9ea1547ad594eabd69bec1cb7114b2e01b5f5aebd22a2a5f472a2ec974cd8b0be08c275099ba55a8ede1750c8044f91dab09419d8c70c3da8b0a15466ec1acfddf613db6d7ed2d6b7cbc114faf5529cc2935b6951922d3fe90dce76e17c966a8751731546aede1a838a3389f3b7a21b9d5916ec5a69a6994d28f0cc372b964e658ba8ba51a654a6546a726a0e6206db7b5cf7ac649c5f8a30fbadda73f9904f87b782ef7557f8963ad525bc758a4b8bfa5b0bdf6dc335471650f02d2a64da93da079c1c4311f52d864dcf8fe5c173f5ff00a72539bb689fe5ff0046e97ca417e13ace4d274975719ebb65936fa5a9a7d170ca1b0e16cd622bb81292e29536bf45abb96ae62379326e38f52b4ca953f1550b650b89304f931c37dab7e7f15e46eafc86927cc8eec2ad2df1e0eb4d749d4b9d110ee59937e042d9d8d55b3e24b675b616bdf5b82f9f69f5360e47a46f7ede0b2922a0ee92e0474e7710033035915eb6c4ff00b867d4789863740ef92dc440f557209c4804e4b99e1cc7b0ce8776a847b09d0e46dc16ed2aa427dc426f6e3d8bab4ea616fd9c5bb4f3ab2cd836fee78a6ac517007187c5344d0792d1d0b51c1935054f6beef8a76f3ee78a61299650aa6d3b13b6fee78a14d30dc5a4a4adb9fdcf148db7bbe2a73920b8970af36fee78aaf3a77d1a67a3d39a649e11328e0c650e2dbbf74e2d6d58865f35a76989e986360d750886e4937e2b74c326ccb87eb35ca74d5502ef16306a33e26fd16ff115fb6f48cfa996d81b268d2599cf75e21aa24117ede2bb1b2235ce565cb345cdb5a5ce71ac2d71959753664188922cbea1a25ebaf0796b96646450a2a4bab594269a949ab48a2c2108401610842007210840021085700421080042108004f37b65c57aa3121015e7b733edb61943c168b51a7081f96b207c174622eaa86324ce336ddca8c535931b42a51a6d385ce66dc95e240172ad182e2d7c92b56c94d60813bcca0756f9a74bf4b82d071038710d5e76ee75785d329f5e7edc0d79d7b2892c06d3f0495855d09c3dbc826fc45d467fb3dea0820c8b1a4d41fc80e5a801b9e111175929541a3c9bef554b6b70cd6e55060cfcd1036a5fa88b56c32bae7f58a7d5a4479c9d5045866825b3331625a453ecdd853a1b72039ac354b10d55fe53dc9d53c82c46a4f3c65f052cf9a0621b6278946a8b58e617a84060247b5dca4a323daee4208c8214944e599c9049e0e0bd51b91c979627804bc138268426d8f45040a40e29a72172840463b8f3d94a90088b891f04e5e580412bb19139712a1bb772e3b73202b4cabb59952727f3874cd508af958d97a413c0d94646f48ccb0c5988a4cffbfc56ed595958f6b4ddcef33f777117c2cb538530e59ab21523a7605d21572a15b8e45370bc8aa541d66db7717b8e67f05d93fda169f68ec236aeb47b89db6b7d844de1b7872bae1be4e53dd35d3961874d0fa50bacfc17ea3450e57b8ef5a21d18ad593e2665e527a57a3c98fcfb4ec4ede6e57bb7b75ed591a7f96de276a40ae42e32e3f46fe6bec3b368338e4c93f0172aabfc3584ea37deb0e5227eb71b37853c49f32618f2e386b53e6c9aa47488b579f5b772dd30d7962506b1888509c37a643165ecdfc16cb8ce83e4f187589738a30ad00eadec621c385ff25f2fe3bab68776f1b8c2380e9ed22f785efd397c5524c911e56d8d5ae9131735aeb49024376cc837e19aade4ccfa4cbc5d385ef7697fc17952c158f6b384aa18c61c3bb1c32da46dc1722f9750b07e4e5336f8d274ed5d5bc8195efcd533925767d8ee1ff597c7de5cb34c33fceb58c1981dbcb17add4c9732396c25588f15bd4b9b09b58ae7f1ff007bf943b6b7ff00d3b4827adae4aa4bb18926767021904096067c55a92e4fb402a423117346b8ea8c327091912e41be433ed5f04f965fa7a631ff00f6d94bee6b9bf15f0e7962c3ada5bbff00e4e50fc54224e234ff0042a4ce2bff008a2ebf4ae9d15e92c72ff0615f9a6d8eabf93d44c00762fd13a3c55d340651b78dbb9024c36f4bb3c14303353a6103b0aafaf11cc9488a7390d46f12eddebd62f59b8733db037127825b2325b5658c9b4dfade095b2f7bc15d6122dabe9782abe8d106b27c5ba6906456e282d71b59b75cb660d63702cba9e9ae7c3157a6ed62194e880ef26eb9a43041f1495d9a9cb0918f4e5566f25694927b3792af2808a1881ec539d3ad6f47af35193c22ee504359581ec29935dc776e3e2b2430fd480b09374aa2d4c3031930f1e5d56564e27942667184bb253fa290ae3931be61a97fa3e2933e8f529363b1c96c52b19b427575c2b4316b122e4859fd96a1dea87d9a644d5c8cb679f3569bd3a332c444ad9bf6969330faececa5e7da14cb6411fb8b7a68950ad185880864ea1e215799b191deb63dfe813b23083dcadf9be86481ea33e811ec7db45b6fd234ed70780409b7e4b74f3151e70bdb2f7724efd8aa74f904b798413c412a5eb211ec9f449f468fae32242609f24c36b67f15b79c0acc8b6f601493a3d957b8767b957f7d5b2bfb699a99841cc0f05e184732b6d380e31942e941c68fea30006017f8a16ae0f8c92e8960d46286c6e17b6b713659e9f82ab307f8390ec541c619ac8206ea7e6b45775525cb132a26994757b545b9d6983b13ff0067aadfeede2a2c98be33e5c3bb9f46fcd3bdf511e9b0e93b013b11499f263fbac90092380eab3947a3815d861d9392d82c287d229f5c74d67e70b867f05d034667f68a9bb16b21ccf70de75f63207eba2f29e456c793bba5788e0d3f1e3887cc3236310bed6e56a347abcf66f6539824da55ae00ccadb74974a7f87e75428f54a6396ae1b4e33fe23aae790c465cdd86b1d526eb668e31b34f91375aa17f276662d65b7a735108b82621f82c7b132a07ee1a93a90c53a2d53c6dfabac9525bcffd9ba59d9ff87fc16a3bdba86bc77516bdaeb8772cce48eac70f07d6582c366da34910c707d84816cfeb7f05f3f696043fb413dedafc6f0ff35f46e1f9021c0904278ecc1f9af9f74910fd3e79666d9eac5ddc1795f173ceba66a94715985a6cf9f04e035c772daaa12e6bc6c61b8202c1d39a912a538d8f11c2eb6f61222932a08a21736b95d6d459176056b3031d497a1dbfdd0e7bb5ed175edb2dc7014edd2a2ebd2b6d85f870fd5d696c65ff00db29ee3909645bf5f05b96098fe9735c6a036996b2e6ebac71a9e06c3b3add75c4429328dbd95c03493365c88a865b1fad539ae267cff9aef189dcc9f35467597cc7a4eaf19756912223690dd9cdb8bae4fe9faa76eb72caea65b6a3566b3e63a6c1d466c7f756b9567bacf25c3b2fde3f5be0b36da6da950e5c64d96ad509c0d488f92fabe96acc8f33a9b7f02de15b4588045971eaba74999ab10cc15ca309c44d64c40f0375d184c27812bd0c21b608f39658dd866f7830c2a01eeb1ce1b01dab1eca4d5e7cb70e59d367b890dfedadd8b667783fcd1446d88ebd5990da90eb8b86c36d6f0ed434193153dfca126204aec9815e452684de103aac350305614635bf324c693eb3154d9f9c643884fa96f23c7f416ef4290dc68eaa661001b0fcd79cf37a35ae86cce19d0d35febc19390fc986e0596af8834d544d1c62296dea3459cea39d2b586ae56ebc3e2baae1ba7b48a8cd63bb6ce0192ca37d1d609c52f49af616a7d42f6beb0e1fafc9794d2fe9e8b9e2c91d0b35ce30c9cd58f95e6869f91b6a054fc4fe6b3b27ca1bc9c6a30c2209ee9b6599dd78fcd74079e4b3a07a90bffb3fa6c9ee5ab3df21dd140116e7055dadc6569f7b7866bacbf4b528c6bc94bed88938ff00415542036c64d758f2d5b7e6b2120e8edf88a7d2b1d42618beb59c9eefcd72fc43e47b84299196f22bf58108ed84ad6dc791f623326654da62a907a7048b7f4a576708ecd16cf66f3b73ec310dc434dc5eebd2cf52eb0d517d55611caa1d398871567336e5f5ae1c7c7b57ce53f453a4fa3ed7cd751863dd655be8ee7eb5ff0015ddf05d42aad68f43a13a9ff75d8cf33edebced3fa782f33e73c27ec297641e70777c53bac97e68eaf5cc21267b768e6a4fa16efe9f24027ad9732c495082b1599cf247dd784986f92cde32a8631633e1deeb40ef16d8dfdbbad59ac3dbc382f9f6ab5539fe07a9a6a976c6492045626cb28ded6192a21bc20874e321cd321135ecc26d691c81586ae19a3a2d99f19ce40f4873bf04e49d87bfe09cb4c77872352b2e653556719802d753ec2cd6e2731c4983dbbade84cabc9d1707cd2a52f60e2c7636f5fc573189fb280e71daeb71718d1e37d1f44d9ae1d911ef47d4ce23d7c5cfa762ed783b6b8dcf79cdd7d73da8daaa123100c47879ab999227cf0cbfc07473cbb78a4c02a6deaf89dc9de0c3b2cec76d6cbbecb1cd1fe11c518d59339f21c51a9ede9c0b8cb6379fe3d163852a014fc4d586d8c776dda71d8c9bdb6b23875cedf9af5ae5fc1c849a3275173221c1aca46dd89e22fadc782d869edb6b8ccc5ad6bb4e0ddc6defc3e0b5daad22bedb0f512953eb14870c5cce9264b76e6f3e2b8f1571bd1a338f1cb67587fd26d247d1d83acf9f1fd7548f74ab9e5060b729b38914eab3c137e9d457862bdbdacff82f1ec8806da66f1222715afb09c4e4b5c6ec6a90619c4725abbad35fa459c488b2d5f4b35b0d78d79ab1c2f1399b29cc88e70cc35195be2b5fef3dd0e4cef4f9965142a14a9c644985bba72ec31fb06fba714b8e39e67d9cb6912bce723d2de72b4f59fa4bb8056f10b29ff479117dd9bdef639e7d8b5f353d6634c70e3763119fb1e3c7b565b141fcc64233afa3035fc0742c4e653f9123cddbdddb9ddffd782eb4d918271352656f2499f224fdb73d55d46a0c0d24bca64677874e3e90ddc368b2b2ad25d971b368d06df7e9379fcad38fe2b9576869b3a46986a6c4b19357c45855a519cb4f3656e4b9de641fa38371cbb7b542838b1dd0aa41a3cca49b00795d6d5bbef92da5229b4992d9f19a46dad6b4f9774eae50998ac33915230b89f6bce111d95875e575867e1ec72df4bc16b6d5657eb99b4d3ead22a72044dc8200173759086710064b9607ee70b4f321d10e9803733e1171f25b4d2ebfbdc8db6f17bf2e8af4dbb710b3e473a746d5c1b76dfdcf153dbfb9e2b0f25ff1f4d58dbfbbe2b5c2d8a29ea97d194db0e9e2bd5476deef8a76dfddf14dca29ea6ba1c850dbfb9e28dbfbbe29d8810916241facaa559c6eec669bf15ee44f154abd3fd4c86c60cb2be7c529fe300c332941930c967aa4dd703d22390f74913a00726d275be3c57d00d61321be6780baf995e3f0ff0048d589fd66dadd2ebbde0aafeea672b5f2c40eeda336c5bd23589b98a2e3dcba336fab71d8b4cc090c2286d7582dd64f00005f4aa17e270258fb320850b8535d180a269a949a9a85ae015855d584c20b0842100390929c8004210ae00842100096059310802c210a48004210a8293dc0a245949045d00734aec27ced3cf5b7e6abb790e5cb9dd5a8bf40b6caf5066b973bc36821bdb30558a0d0a2a53710bab1717b9294d119c9fcf726d8744a4e52b9367af1f67961d129394624221232b3f133d9b4f92d49366fc3358f9555a84a8b5a4545c424f1bc69510d6b0baf3663af82620923391632ab443e9326438078f25719635a44b6e5b39c24ddc43f0b596ad2e1f04c401b3c9c538445f78c29abd382bf51aee8ceaf3b786d459d4c8b3f5002d1e2875b9a58164033756949c02e7e946a2e645fd9bf1f14b9f41c28e6580db10ec0926f737bad3a2997b64a51c62110c4816de19b40c18c2d76788a41ea620b6691a1574e1944e62c5b48d973f4bf9ae60671007a214cbe7b332dbc5f8a03f366df168bb158626a0db613a40e6b1f3f046226e4832065d1618549fc96c246f4e0e7c6ead48c475093263103e9e09b5ef7e4a18c4586d84b13b9db9868d3fd4f1207155e6d21fb78f5626ce0abf4ec758998c336369589d0c514205fa2b3271cd59bc9b19bb63ff2f04b03073dabb86513bb47f24984e598b2db5c6932a2e7606753e9e761c2fcfc15da7e94cc8da9fd97a3b8d616faa7d1401a3216f7234838604d9739ce0e913a2cef9144fc5d81dcc71b91857778870b0e28c64aee34288daca4b7a9f88346d3e5fd1f0eb9da9f6b25e31381a7daf4da84d31767d546d2db8d1e14c5bcd3d86059efa335da73f6f221b58db8f15bad19d684281b46ceb45aef114f8a49fa4cfa81917bf5fe8a576564683a079e60d36e1716e35110fc17eaa54e7b56ccb6ee9db66d205f3bf0fe2bf2ed954c522ab0d4e85851bd3a7c8fa4379c5d70ba4e2bd29e92f1e4cddea7517ce238893b06d7fe2b443a334cfbeb1469ef46d850907113672e33fb01c6dfd570fc77e56d547f2377c250c5b4cf230fc1707c15a18d215667cbae57198a2d236a04f70e067970fcd7db9a37d0168bb47c2539a6486efaa10423d74e2491e2982cf9e30d68874cba6b1bcd6e1f32b074339ee6fb7fcaebe8dd1c7939e05d1a4c0e377153a81ce270e06b1f15d57532bdd40107222e028048e79a6ca5c8ff006398ce0bfde19f4fabc57c1de4f31ed748db3b5be84478afd0fd29b5867e8cf134328daf4c9d7bf72fce8f2729909d26cb82ff0059afe68fa0fb3ec66d1444f1b95a368ec079a61d20b9719cd6db9c8fcd740a2cad676223c169ba3791b1d2d6916418b5bd6b4f4adc52fec623a8c134f35331457162126216b2f609d2f818b87152df0495ab95f658698cea9571cc96f2245ad301e17ec5f0b7947e27a7e30c7926b54c6ae64c80cc13b6f0b2fa3dfcd8f4c78d264e7908870d61d9c1ac86fadf6b3ec7c782e0be561ab231eb4d8fa37a78be473e0a84651c5db8d67d20dffc41f9afafcb8d35b0a54876df1552363b306dacbe3ae3627a0fc1762d1262c70e4d468cea1f4a2d6b7a5fc943e8897474d87489a5c934b8ddc54ea7d4b86645ade06dfc94b0de9c1cd1f124c87196197f4d85c1ce222e2c7e2b21849ed6435dda9b13630c6ebe9114fe7d735b1d118377d8a2a1bc4008bfa24f24b6516726f587b1ae13c512a19b43ae48706217b5ecb7ec3f4fde2788356fcbe0b8d56f40b4dab4e86a3436d152ea24dc4fa77f3e4af611c6da54d17badd2b94b8715d3da9022ff007d91c6f6fd72557d0e83e4f99b4e32c8c515037bfd2a70fc972f8a7112e22388192e8ba5aa86fd5d9af0fa5bc4d9d3a237e7c6cb9b4509b67c1216326e8f2b92ba6cff0067bd123daee4f9bc94972a4ee013589b4a3f15071c02bb4f17daf72902b4a370559d87bde0bc652ae26911710792c86cbdef0542907831db1bf123e4a5b171d15adbc9ea14e44509be61101a8a5b071d027dba2be2286dc5223d6ff1bb951722d15b55c039705131c601b1b11cd3ef73600d9303497143ac50e0bb18a4d2c9564be7d222f4279b159269882ab27d20ea2cd2033807229925bcb1c45fb12acae3fc12af922f7ed6d6611f7a3972bab50e3caaeebf670fcd6377593c4c02e97143001aa21094a9adf68bfbe465c63ea9dafb03f24d91a467dad632091f0582d9677d55e8847010a97457fc12ae91b2c3a429c78b106fcc84d18de54563149887fed5aa99262cc204b2792afede283db236c18cda9e1091f10992f13319ff005870ecbad440201b714e6266ef92fd62ace8496512ac93367a845b5c4961c82fb2bc8feb18470661a78de18dbc8afef5bc4f046478fe17f15f1db78bfbfa2cb9fe4b318c77ef33c6e9bed5b4f6b1febf05cbd7552d447d793a153d91de757f2e5c6d48c458ca85e6c7320ce6acc971aa780bf02be6d6677f9861d86639eb2a803e75510f019ae75b895966c4b5837a6e356202eb7e974dfb7d3edce4cd297b6cded1d3292fea8e69c219e6f6e056acdf7c8712c3c33599a33a9f0d2e32621cbf3541bce9431b496ae203a915fbd7126b6a9a7fc1d684bf147d7adcecb01420702d01f05f3ee9208f596e726ebbf545e6eb860c17b5e571ee5f3c63d6b685d433a0e16b2f0de25eed637ff4e9d9fe32d524ce72c1a40331b219f45b93e135b319300205ee2ff25a761807ccf23ad96f334cb9d44dea3f801dbf15d2d4cbfbcc8ad62069d03cddabef2e6dea8d8f55b8e0476de3905c18beb47c1698e2582f9dd85c99256dda346524c80de2cac789f8ac9ad92f4b2d5ff93074ac5ae237340d66e00b8f4bf25f27e919eef38b5c4022b8fc17d4788890c3741ced9dd7c838ba54f9d58a84f71f5cccb7e29dfa46a8dba894999bc94bd70c190bea52ac4db2b2d35f4efef126e16d6f62d5a7ea8365a33e9c37b897d2f488f2da89fe0667064dfa74f245bd5dd7406ee0df82e7385882e27443f745d74ba1506b78a984da761ba359e8021df756dbbeccd815d958f59c56b73c9d630250e6e197d0d13136eed29b5a919ce70f329d38ff0083e2b2ccabd4864febba31790beaccfa74a2eaf50900b1e7eabf05cabf672af8eb0e7edcd5b13bac48e30a4f1bbd3e9ed73db4bed19f82ed321cd7abefb0f44daede438940d5a43a369f9dbf1cd22dba35d7bcb5157b6cda64f01619abd7dacaae56db79b76f23772de41e3dcba0b7c254827ec0fcd5ba753cca923d0d5baccb56c410485e2355aa9dd6e4f4ba7d3c2a898638429160763f9acad3d9c4c2dbbc4e08e7c964b622c0d97a2591cac90ec6877aebfe07b7afd724bade8bf8e2b7b310bfe6b6367a42b6b8794ee9abf9f25a911daa2498ceaf04e8790bebf8b13669a16fd746d15eaa618abc5acd600de78cad658b92fe4b725b45eb9bdc9e975898e5f3038a418b546715805b21e62cfb43e9e208d1f1861a9114f7ae1b83148732377e1f5aff0082d2680f5d6dc487435e79edb2ebd52824b8ca2fe8b99e2cc372db3af38d360eab87e6ecfdf699c4f4fe3fc8c1bf5c827e27aa5627cb6cfe76b6ef6b8fd7c164db4a31b40eb5ad7f66df9ac4316b25fcf13dbc1784f6adb2649bcb8a0195d7c86eaa509b4cf491655ddf789c61b5ecafc9936bfa5d392f534662e12ba251e6cbdef05ea899e0711e2abce9f7d5221ebcd45964521982d5c732b57c4d5789b8b488ad6b836579cb99c664404565a9568b9bc4223c2e975cf74926313c0990e664fb18f3baed30e15654fa261e7148c4f13985c4e95f4736024cf1f0f8f82e6746d98a5c886388436bf7aeacef06cea361da4d75c5358990e27c8fbb8b4f3b4edfd705e87c3d2acb1f061f20d462b2cda1ae1cc4431dd4254aa8b00fb719379ce47c1631b52eb11e1bc5111974c32244f9db63d2c15a34466d31bcda5b8a23afba17125bb773fcfb560e2634f914bc43be53ab30cf13cda2b7c57aa7f8fd1c5c67a32189293885be17a14f9f48a6090e26c9d80910e5de39724f934bab418cdc379f832d3a1667e8721ce5c3c5517d52a64fa153dbb6aad6219eda0e9f059296fdbc9c5c1c4ac5afee6458bfd505128c5cba2bb6660c499c29389e3fd9cac9dde70f443bb8939f2eaafd4a5d49b61ba254b79acecaf23edfec382b51559ac88311347988678de4e649fb7cfaaa9367d51ce0ea7c5fb4e1c48208858f1d8ecc78fc82a622bae08cc916e4e2298318ba786a01ab970cc113aa0d6d6cbe0b00d5fc4309556285ad3c5dd13bc709eb6c8eb5518b1a35aa0ad519c4f85aec36dbb9d8024e79aa04386cf314369eca93b79ff493afcf23f65f1baab792bf22db89f21bbea0549ab19f4edbfd1a7586dfed0ff2ece0a932a7b69cdea34b06537734e9c5cb73ca2887344d8cfec1539c8a1378b763206d9bb9e1b3fd78a8c2f191c58079c9c515b38697f5febb57f57ec53c12560c8ce6a435702448a8cfdbc37e5390f4d75cd51d3a352b4872ca748dbce37f9fc6c905abf91429d14331b43e6c79b6e1c0fe82d81e0d67b2dc3bf4a454a56b4aedfd5d5fa4433457ae29ee30e53ecc67c89f18bef24da44f1d2f6fe975a9b89c1b98dbed4424f12174a98c2372c298ea4ce876ed9e0de24116b0f82d271b516be6aae5fbc6fadc2e6eb83e4b4d64a3eca8769e55cfe464281489d55910ec3133dcb88bdede2b689787314817fda299de5716c4b26b4e68331ad3a7cf63381f46737fe2b8448d29694a90e2cd31dd646c7eae7fcd68f0fe2e7ac87e5d9935ba85a667dd629d8b61240a9369bf11c3c55bbe2d873bb7f92f87a4f942e97e403b3c5ae86b71bac953bca974d2cec0e24da11ff96bfe4bd07fe3da8fa660fdfc1768fb3f6f8b065bab73dca42a158c8cda5027b57ca70795e694e1bed60a5767a0b2f23cb071a47261dbe1da4e5c332956f83d4d58c131d652f93e90738aa065b31369b3c6d6d6ef569b3f8eb1516d76738cb02e0916bae7fa16d255774b13de4face1f6f22448033038e575d7c8cc58ae4595d9559ebb06bb612e893e9fb0a6c6e6186f6cad75f24e139e6a35fa8bfd5d5dbbcb71bfeb8afa4f4835814ac13569c05fd41caf65f36689db6ddd36835ac670b70e1dbe2bd9fe9c86739385e49e11f5a6189025309507c0adb2442095ae5272842d91b900e6bdfd513839c9654880a2a4782d2826f71342135348056157561345c014d414d040d4e55d5840021084002b0abab0ae008421000a4a2a48004210a80eb681400b29a101f1042526a096b27f3aaa0a09b71d5286a583d5e1e0bd42004a1084dc92810851415c961463e165e4be7656d9506a350756190f870410d98e19c7656636b7937be765b8f9898e107924bb89bb87115af95f5524d768351acbb78e5b06fad7b9e2828fb34942d8bcfedb79fb82b322b143712355db0efea805d9aaebc5fbc7e6a60dd6dcddd60ddb4227b58a1e9926b96783a76d377a94ef46d7f49431869f2c5af9e4a7ac00fac00f8adb1ce0960254874daa1781c0fd7355ff00611dcf94761bb8278929606b3b3ed46cfb5643f66aadbcfddf9f55e9c33569d14c8777b6639dd0063038b7b1e2813fddf15371497edc5cb7707b92c4ae7adc3b146491b04db9192b0260b2a56b649d7e8549059f3accff00594cd427c39c537e192c6a39d94a21f465583f70eabacb6ef2200cccb2e2befda06109147612c34a19b824de26a4afcf1a6ffdf74d1ff1c2fd67c3cead476a6d7f5613119e5d9ce6bd437750a1bca7c726dbc48c92b07bdf39509b3a9a4975c1c5c70d9d976e6064381e99fe4569d42a353e9f8bab94470deed8892fdbc57b71e1f24d2a6ab35fb9bd83a9c7b405e8aad5e0cc54dc9f89b2e873b0dd067c7ac645afd1549d81290e5c6a97117c48bfe6ae4651cbb1a62bae7ec6620fa51fb9cee5f05f19f93dcd8246941a6be5ad207e2bef6d2168e9bc7862a8e1bcf06114c9dec9cf307af6af81b41f0db4b54c078f0f15593c1383ed9a40b18220735ad613321ae9eb1a530ff99a73375ff3705b33294616f0f6ad4dbfd07ca4257b3e7ba101ff003e77fcd2a3d9274b9f24822d0f2bad3b495589d86f01d62b6dcfaf824fa39dbaae99b2877532edc5721f2966db1d17cdea5e34410fa30980e931e1fc1d4fa6102073b30e1c597cebe5544fedbb1bff00f8eebf05f58ca95ab7ed90be59f2b886d8c69c6dfe487e4817db3854190849ec5bce8a77a189a73a8cfa9324dfb78ad1e0999016e01771a5d2deb1a1496ede46bc4012670e179810fa18746c19566edf6dadcafdeb6bc3b52902bf322bd8b8cfe0b9050f09ce712b29ee36e7810485d0f05d21c51c8db9139c71cf24a488e307d61845a1f37c99fac2d6b909f8830c522be355dc8045ad90e2bdc2932f4495971842cbea820224b2888b4a47e68699a9c59e2078d6116325cce0b9a470faa24715d6f4f10038c2a601e2f268f15c960b5b358e4f93a30794294d5d511f75ee50c9ce4c712491970590612b39b9f2523cd64e9f2758cdf4b8762b5b6a4894f3c09a0d24b99338971ab607d8bfe6af0a2cd861037807ff006d96f9a34c222b5449b3c4b6dab0cd201e375ba9d17107eec570355e72144b648e9e9f41ec8e4e15fb3f0f587e4a13e93037b12733d17759ba24933c031b6cc70baa13742848ce5803bc2cd0fd47a74ff2635f8c68e29b037b42730a31369e4670decbadcfd0bb991605ceb5efc0d9629fe8d5fb6117d2dc0d5ea6e0add5f9ad34ff00d8cf2d0cce6a644efdc56a0944b5e19ad9a2c0efee62dea23f129670abf87d13142569abc8d16bc6e2bfb49a35cfa4f622159a3489d27ea8739f6a4cc272fa4b94ff00743f916ab662e4cebdfd1b77abb73d4a72f03016fbcb8f9a15d07f63555b4858f44edb8fddf15eeac7feb1ff00e1fcd32433886b7ac1c92d5c9956b0126a1c7d25ecfddbd1b5b9a3733febc5ff00c92a7369a2df486ff2443927a23bbb1e815a6f4d6de7097e8f55413a8f15dfcb87aa6867719e910411b974e2d6f4782d9da6b566334b6cda29f0ba95c41e0b5d6feba5bbb0b6ac656c5a35aa5468d8adabca63fa737720df6d523ea725ccb61bececd09e2262a3c3f52a2912dc35122743fe0386f99f8dd6b9140260757e8485ba621d253ec7189a7b6a8441d090088a7c59837fe8b518ee43c743ed89cbb5595b3af865147f836da76787e39f08e8b1d204c738f9b44003e92c852ad2b0c09111bf6f55430e933f1eb58fa1bfc972ef7c499d083c4523eb0c4310fd8f75ff00e9bf25f3ce94dd99d2089315b5ad7ef5de2ace8c4c6709b170950d970ed223190ea9e278900da2e175e33c5fad5f95fc9d7b3e064b09489d1519bb8108170725b49314742ddef63b5589a4eecda9cd216e3b4abb1cf00643209baab14af69164b151827f1c96f5b9cdf919205faadbf4765bc736c633915a439329d57e2310bde573e4b68d1acf103ed5887348d556eca3052a7fdcc9bc6393abae3ac92be50accc2eaab3a12356d6e775f546298c0b7c0af9bf11c77ae38b0e9f9adff00a523ebb24ccbe49fb22631f46626a6e173e7f3817918b85be3f9b086e7b17327b335a75c15f4ad1c3ecf27ab7c60dc70353e7d66a269b273de2d09c97d9782746585e94fe46276ed5c8765986a4f69e217ca1a2d9edb084b15c70da2a83f7e4060c241b13e07aafa2a9186b4a38c589f3f62ff0032b7710e5269d9dbe2ba19fa396741aae24c138498c61d55d853a442380895bd13b9a7635733717b66f3cc903773aa7a5f9ad4a93a17c194b114f8988a9bfb653aa076b7ecb15dab08369148a686ade1b402d65caf296fe1b20753c6e92765993393258cac1589306ae5c1522f25073ccdb9274aaab5317a2d67ce038f62f2ef4b63793d22d05cf848bc3252b0e8bd915ec24dc7f7a43bb9ea67dbf3563ce58466fddab538db8e7c15d69261fb0be0f9455b42bc57a444c27c9de19d4a4e5cd52dbb5ff796ea9fb69c7b27f6977f078bc37b6415a0df6fcafaa873267c8b819db8a895567f065ba0e1d987734b89c08ae32ec5abd7e86e032236775ba19a42f36dcf5565b297f6455de4e3341a538a43f98d639e364e279cad6b2da0c1d4f82d7717692f0950b11cda25467c6c5c0e248cb2eab2548ac49ac4b0ea98f1b39910fd6cf8df87c3815f38f3d5db5dce55c783dff8cb232d3adecc8817ef4f1eae4ded7216bcf71ae09a33832ab98a69edba1867fcf97c16aaff00ca17468d66eecd6a3327c4173743e1b5de41fb210960d566af4d4fcd9bccc9e661240b2c6be742f06a4e22f75a9c8d356019fadf4f8645ad6b9bdd3e6e93302b8931ed315301ab6b6a9b245be07c9532c3aa4457e434d667632fce7f54976f5c60bdf95eeb1b39f4c9b09827c807ff0077f2519188f0fd604029f5f613be2e387826c520923672ee8fd9dd5f13831d0d4425d3113df3884442871939dc377056d8db4934fa8521a35a9566ab227b59f9b7707d448b2c0454b0e009064da745c7359691154dd613a9539c31de690e739df47b5c8be7cbaaec78c8ceb9676b17a8f5dcb0ceb14f7e1de2c950b7d233875f438759f0b8f87129522a75891fb4d7c561dea83bc7d175b6fc57cd5579f54a64f6f53a6c323776e73904580ee599a2e9cf0db46d506d8bf0acf8b793ea226e07a9e3d9f05e86ab1d92c3397650abe51f4538c54e26e8e69f25df9be18a4810da2598938a2b9331ab672db0c309b3f728be8f22c2df35ca69d8db42788b033472c2ad048c496921cc89f7d61d6e16f50d3f01b4c414af32577fbbf61f4a9fb7bdf85f966b6dd2d9258ff867db07d9989754a84faa62c2f307ef50381948b5f63e8fc39fe49313e693f46d2d831c22e76841b3cddb878aa6c9c535c629ab35a356b598cf97633dbf87e6b6cc078b70ce11b35a9561c3991986f2be3c32e6b0536efbfd73788f226d8b55fb208c1d59f0831050c7ec2b991bb483f472d7ed3203af2fcd6fd84b4662aac9dd4f12313b79e75643707203965cd66ab556a038962b6edcb71137027e5cacb5ba269d30c562a829f26a37888c895a6bbb4745cd4e598986efdd595e698f2696e2914861835f619aa51de8aeb5338c53c9f559e599519d486f4ea9618adb3ab4e71bcda44f8afd00edf8aea6fe9d4ac52d636c1d6f01c0075af7b772e50f9861da453d8c872e2643556af017a2ff003516c2097b6b7f88cd2b6ff07f21b519f489789aa34d9ee1fd3e4545a6447faf9f3cbaac6b895509182a875b0e5bc476b71bb7db37395ff5f056eb8de4d5b10b53a387135cb889a7a3b6f0cfe6b234fc00de9386b77c68e1b35f5f996f95bafc392ab69ac9a7ae1980a7b894e6b55c68ecef3139ccef57933f3bfcd35b8de9b3076f442e1c381bb6c4646f2f2bdbbd6469ce2802af0bc6b51150b48dde291506a05ba71e365af89325bd0ddcb8a29ada79a96f1224dbd41e294e50c76117b4c0d7e90e18ed9f59b9d537712786c0fc3e6b8b5670248913c553681b09c4019feaebe8fc4d49267069ea9c9a8ca2244e6f9fd98b0fcd735afd077d63137710de03e0910b2ca2cdf4b37e9a155b2c5d1c9cb4e0e26e44c913c0e364f93499ad86a42d9b103a05b3454f70c241761d6f324712392b93983e92ef74123d78e163c174a3aed6cd70cf4b4e83c76c5f8c4d4e7534ceb6bb5906dc3d15eb3c2b87e5c7f4ba3499f239cab7eaeb3ba86e35b35665c9005c0557acd6e7b2f6f89d04f1f8237dd1ae34c1d81e9d3a974ec3ee5ac8702dab0c3c4f35bb34d28615a84f8c08dc48e1c45eeb89086c72cec99c070586e95b6d9be7d982cfd3da6b3e1c1bce97f1a52eb3a25acd530cd4a43b917ddc4e92781eb75ce341e76d8818436b006eb2f4199051db3f6b153dbc4c2a57de249161cf874e2b338130952b084c18921c5321d486f2b5a7c51586c7e5c57b8fd396d0a2aa97c8f9dfea2f0d7e864e71fca27d0949e5dcb3b04565ace11abb1ac5224d52993cba6f37313cf30b6297188cd82f7514923c836641352a47b5dc9aa52c0c89342109c506ab04055d0a50a4585350534c1a09a84e412964108420482b0842b80210840104d4a4d554b2008428a81a490a2a4806c8a9210825727f3a485391ed77296c3dff0004a1df020382f54b64e3f7c284f33e1b7d1f31d73409c33cd5ed5e443554d8d3eab56730b56cda224ae8747d134b9d0eb576a579e07dddb9bdbe2a72436ce7704adbe5c16c54cc08e5d480e5dcedde41e24859cab60fa8d37feeea7426d7cfa2d7a27f8b4372d61913ec3810382bee42db2c55a1c2387f5cd11c6f007020dacb18e712bf7b22293326817e7758d76cde6d8ef54c9f0f45294c8c46e641b7c5194464403daa5a911cf553e10d81005aeacc304240214815557566c557e3c10086a95ed9deca17e9c94e458025431a4c4f881b09964d0e9d5b29c3e4926d64b27b52c0b1e76a87fbd39f9a6b7c4b566f60d67fa2388b2a3716bdd791286499efdad7ae5b96ee1b4a30f324ff0024c635da4c727e994edbf5165ae836403958054790c1996efe9209de581032b12ac9fd999f32d69cdefd79ad76e7a94f952ac09d7f05093c8d6d346d8fb0d619864348dae2310175235a7676d878aaf2709b09c088aa4df6e16ba61239a588e29516b81c1310a69fd1b041a3b7d2674ba832a8b6cfd7f7f3e6bee4c17a63c2359a4b485dd536137657378aebe0192edc4f9e1b4730884f3bdd6d741935168f01a663190dfb8266fda2bd729be0fd18c2b8f3084e953650c5122310d89d628afd728b2313d12b2ceb0d4c7ebe9ee0eb5b2e87e175f9f664e35933fcecd71134733dc819e43f04f155d20434f2d226c5d37be59ab2b4acf4f35d1fa541dc9e453a4c423b4417e7338d2de929c994ecc738f1ca464397159aa47949632a4ce83787b59f4beaf6f547b32515335d9f72e90dec96182ea93dc456844939afce2d10c9ddf4b1467022b8dadb56dfaeabb4b9d2de27d2451ea343add46299499d7dde7dcf77c1734a05130ee11c7349774daf9a9c8888de21f871cbbd5b2b012cae0fb1e9d236d4a6ce396aea90b9963c7f3693a5bd1e56e188410cc9f3a9e0745d530bbe613f0eca2675b8f25cbfca1c499387e87895bc57f32d799b98be7faf9284f0caae4ed9bf1886a882ddeb45d35b3fda1d1ad729661d6f521c37ede3fc96c26a0de70973db38c8037cb8958f9e4122dc157289346c055d6f88309d26a37b6f12073bf05f3e795c4307ed552fd1ff0025fc174cc34e22d1f638a8e087915a43f9f35fd3f90e762b9af962398e7e24c3a2287ead3a1e7d8acb92327cfc0597d79865ab79f43a4ea0bd99e6be43bf55f4ee87eaf39c61b69ac75b771bba9649beb7a58919c9840b8cf256e4cb30e76cfaa7cb9971710f72d830f5220ab4f80c327d41e39deca1702e7c1dbf097fdcd2bfe50b3b0ac7d29bca60c64b684fd50afc2475559742e12cc8fcd6d393a8a2c6950b43917b37f15cb6f6caf9ae9ba6800e2fa844793d9a7c572e37debdd5866bf23ab07988d841de4a7edfdcf14906eaba9f5e3ec696d5f913fd5cef479f5586cefcd65a4fd9cef8aace182907b8db701e39140a74f6467b982d38e575d2a9ba45de0c243fb5fa2e02c47aa0b252261108162b85acf0f45f3defb37e9b553a4fa0e5e3c9b08b0784dd5b8b1689adf5e73bc8f25c3584123622e0dd0f643a9c2d22a12a46b753c571ecfd3b4ca674a3e424fe8efecf16328a48b383f25382a14c7041337e192f9da4d1eb5165e74872e97fe2afc156af51c88217248e641bdfb92adfd3b9c7ae436bd724dee47d04052e7c36d6bd9569d872933bd282119f62e2d2f1e3d944677ef56e1d203c8a1033cfb5657e13554cff00091796aa867447580d88846c1cfc6f1ac5ccc0b24444ed81b75375a041a4d9862e13b3ec5620d25ccd5cf6c7e216eaf43afac4bbf4ecd91d61a8409b0ea8e9c1518b0a450b7b0b123a64b132f48bb488dc10b230e2d81d4a84ed80bf2e0b542bd543e42bd94cfa130619d7e3b4b9539b8566499663026270c4f1c90356390478a749c630c44088c3dc98fdfde03fb461ce1f8af7d599f3519d84a74f841866d8f4b596d3fb5ed8c912cc1971bdd79fb574a005e478ff002547a9beaed028573e8d3ce0d797b5d5aa76079cde7079704cae1deba4458c29371f44923e26df92454313d01c525e326c1ab6733a4657fd66a6bd6df3963044a98239ed2c82dea1db98552b94fde98c50817b5ecad52a418d8ce73adc6611aaae38861f36ccbf10b6ab5bb325367e0da30d82d8c4df16b506c0457b64af471363e7ad788132679b72bf1590c310c96d8ae4c17b7a83deb1d35c4911e23f48677b78abb5ee97f056be11b0ba9f25a51e5c9105b88bf5e0abe011b7c6d2adfea7e6b0e6619b0c04c36112cfe8ba4ffdac827c46feb6f6b2e6eb56da65235d4f36289f4857a9d3cb69939bccd683643d9e2b85e90ceed22689396b715ddaab1c71318b5e2b8b5c762e15a4688189cc047d503f35e23c67f94ec5bc40ced3a702c5b586600594d899b275ef6bf35aed2a7da4cb848e0b669736d4f9808cc596bd4c736705a1cd4605d1845576c00fb3b2c96099fb2ab58705aa8733a39c5c9bdb95d6570abb30d48dc66782b4abdd5e04465f99d2715b9205c0e1095f38d762982ab37562b70e4bbe626786d3cecbfc23cfb17cfd557bbcbe9b1def9fc9747f4f53b2c92466d74bf1311569daade6725cd6388c46e56f7881c430c88c762d108bafa36963889e43532cc8fa8340f2b0d38c1a2b643786a0de76eee1c4fe792e911699da89469d81e8cff12388789209c97cb1a337ac1bba2cead4e9b5090e89fa0c8719ce9dd78aef51d26b348a49918ef1249c3b4f1f77a451ed71d3b0274a2d8aaebde6f3836a38d7196302313e2790ddbd18ef13a914f16b0ff8d3af95ede0bb643556f4e7229ce1cc4dfd46565ad68aa872a6616829942c14e68ade204c90e85e7b836fc6ddaba3d4347752827c9aa42da4ba9ad8642d7ef5c4d45365b3c33e85fa7b4f4575fb2c3526548ab4e7ba90e226d0ca9f3b567ec1c5bbfbd6e55462e1bb8a88868cf8b7766436913db3ab193c1030044676f0d5906d14ee621bdadf8f159ea7d071036941a9aa5e4c1c7e8dc3c1678e92c3b576aaadf9ad9cc9861392d2a929d38693e7daf792e5b5ac7e6b649f4cc233622e5d3514fd5e33844b65a8d26acf8930c7479f99e2d7eafcd62e2c08e67fd46148cb8fa2acf4b3451ea94fe4caac2ad86eb38b0d1db44e4cd73066fa41ccce3d153a053d8cfaeccc113c6f10b9db5e771d85bb3b6dd792cffeced568f933a3b593c7e90dc25d3b0fbb109368a9f21c0fa44e845a7cd3cf3578e92722bef8186c38eab0de786eee75a236e5c175ea3d358cfa66f5503149bdb384deeb5b60c70951a46d25489ee6793cf9772598a7381c35ade0ba5a6a5d51c338d7d4b513e8ad50334cfb366db78ba5964e9f4990ec5ea7468483c49450fef515fb16fb2656d5aea136edb5d59e9299fd1c5f2d72d241c6b3e6ad3fe81e938869332a6de4c4fe436fa4ce9205f2e67c17cb33703b7a04e9d161f33db4a9d7b6c5cfd5f92fd19c4b86e7b86539bb09f08de2513722dc3bd7c698cb42fa58a43f9be6ba379c5b0e1e9dbf2365e47cd782d4473669fe3fc0782f3b1ff1decf9e6bda2f350710ccd58871c81b2d45fe896a0dc4567c0eaf6d97d073b01e9924498b7ac2efa48e7bbb713563a4e8674ad5b9b06f2daace1b8e3203604acfa59f90d2d4b8ff00fc3b5a9b747a9fb3e629f846abbe168de19f3a21d225b1e1ad133d9cda73aaebb02291cae6ebbbd5f469a49c3501899688eb33e40e310c885570957cd39f4c1893469513797f76a842754fc07c97561aad5dd0e6261afc755bf7d7239fb1c3eda282076ce2322467dbf9ae8342655da3545a434ba8d5cd8ede436d624827ae79ad9e8327108c16ef0d61ac0b25ccf9f6d59ee7bd63718e857cab2b2ca4d464525bba6d2246c2416ce4dcf671591787b7573cb46fbeff00470cd2aafe52fa4d618e1eb8a6d68c2e22bc8fabcb9adbb0f7943e9ba1c00ee84da9b4f734f3b4dea6c36ecbfc571b9da36d2561173bdd6f0a541b4f273d5e76feab1f2f1e5628a1dd3452eab049700fa3c00256f7e234f5c36389996af51dfd1dcf08e25c618a644d9eea88dcb7be761985aed5f19e0b91277bad6f126333b630daddcb91ff00b46c5b03489ab66f3dbc11767f454a95488abcf8d4f135477a311048fddf8e6b9f2fd3fa583f63e0dabcadf6fe123a736c4b407114c9b4e339d036e22d657e9ba42c654b7114ca3b97421b0cd3f0a32a18bc6ea71d8659db8f1ed5b0cf1838493fde1387fca6cbcf6a631ae6e0a393a556655e1b2e48d286356ec25d66755616e4f120595fa7f9436248eabbc5422932628beb1b5edf82d618e90b47d839e4b77138de1cc9bf3bdbf82b6d74d186b1454e437c3ba346ceebee1eeb42e678f5242c8fc446e865c302e3a9dbf8267d058474838771a546552dbe312e27cef64c16fcd75ea7e895bc830bad46f227f3cd7cfcdf476d9d9935c14fa461b9d59fa34edc1bf5e8546aadf4a1862a2f30d3ad33d66161b3bb79c791e97cedfcd79db7f4b4276b754c9f74fb475fc5fa4c9da32ab0a5b6a8487201cec6d63d571679a71aed62af1c5ab25c397334f1bae07556f8d26d666b8a86299b59713fd226f6b676fcd65f0cef0c20a457e43a85c4e13eee24ff008d7caf75d787829d54aaa73cc4ad57d71965ac48fb3b43f8b3cdac2a2e6b73e5b69edafdfc56d34f7d057dd1aee24f484db5e41391eee4be6d63a5cc0d4fab1a5e2584b07f0f10e7d58f85f92eeb852bedabe0454b73227c8cae785bf5659f55eea62aac702ed709cf79d16535a7003d0902e3aa61a44839daddcb06256a5871b2c8497efe2200881ee58b9fa28e4b2603105267b7a84adca385bec27e5caeb9be20b97aeadd9f9aedcee544f9b92e07d5e1deb9fe34a017ec0386d008a7c917cfdab2bc559f468aece0e2b51a0556105c5cb894788115cadc70d45ab32634884b921cfddde70e2b12c9e382f36022b5cdaeb75a2d3d84c9a1bc4dc5ba92be9be3b490950b26cfdced860d7e4d26753aad31c1a39b8b580169455f7de6bd8356f149bcf9dc73f8762dd4e1a6064ede1de448f82b3228f41e113506fdd65a2dd053f6857f58f5f1939a3aa13196d674d8596c27c9beddbeafdbfebf35b437c11872af430f3e92da6c3c0f5fd59659c61ba36de22d64eadfeb5967243333f5bd194ddb436cadc6ea6bf17a692cb41fd6673f8334163a2e33ed3dc54321f540e2a84fd1f4e8a2dde272d5cb71c241170bae3414da7dac5c7cb8ac15408733e64f6d2c91748d478da687bebece6eafcc5d6275cfa27a326b3a934834c73036378cdf95d6fcd22267c22f92e794f78584f13aff0011d56eec1ec22407910cbf775977f41a9f756784d643659bcd9647129ab1ec278d51d3e2b2170ba291989a1084d06f035094aedc7540b4449375610840e5f91195cd31293534a82109c807c026a526ab259144d0842902084214278004210aa4ae4108420826842106872c1fcea7f9956c7a6472b2af63d1584a19d1132e374e3525fc16f146c0d048681dd65cc40e5c4d93b477876a6e27872d28d3a7806d172ceca8e2eae072f67b5903d48b0f8f7287d10e2987ed2d369d5288d3e9c61d5f04c9fa43c473e295bbcf89a937b9038ad3a64fd97b37bf6a46b4f71c4dc04b6de4aa867b33f3b1de27379be728b6fd2c838c2bf18075e11f15858651bdcf14db6405d4e597f4c4cfd4f153a9e4c2de387b7d14d18ae1864094697233e6b5cb0518e665c10a4d07aa265a7bdc3314e36a78ba6c91849c38960c136df2b2d7633ac730a360afbc4590e783737f49a1d26ad29b43adb09ded7ebe2bd7fa3b611c05cd2df5f2ccfe8ad3e7ba9ce4eb4e9f652066eee62da446f97153b888c30655be05aa3973bb377720c47a9b2aa70cd6241fbbeb5fb6ca9433ddc205a7cf1f30b212b10d5c0cdd9f9233925c1fd11870d57e7b60e852e7095cee2d758c32a767e80b2d99963baeb7a7c2d73cbda11715038d678fb76323f3fc101835a2c9f432b6d0c93b1e4a101b026cb6e38b69f3b3754e264f5b5aea8bc73865cdf60d3535b8d9049af45333b593259b80485d168f49d1b54210ddccb70da3d8e563fabac59c1d479ed0386788db1072ccdff351c13b59a8f2ba602464b6c61a3b7b569538b475267c86df6a46564b3a3b712b83b22dc11c02ce4d64df9a51977cefc56c93f05559a83b68a116e02ca13b093f95203974e49317536ba918a39359beac771c6d64c822c81bd94dd303227662d748d9c5901c505e0b696b6a400219a4266ff5287386a13cff00ee496f4f7ce2e5bc00eadaeba3e0cc0948a6c46a38b9dc922386d21b8f0f828c92da66b786676339d3f75a644e72b659f6adfa4169862185ce227c67cfe600fd75582c47a418643fd6a6c96cda4db61142df2cd68153ab3a7641713e224df9a3251acf06df887496f2a118914e73ad22126f9f1e8b5793519d0390e49e1caeb1527d28b23927cd2401656c99dd7cf274bc23a6ec4d44621a497ee44395b975598ade9d6b18a30cbbc2d5372210e73378571880937b95319dd44a63a15471c9dd30e794662b6344a7b4d6a782dbe8e4186ddffaeab626fe54d5595aa5db0a4b88873397e4be6802c49eaa130dac97965fd507f47d078b74970e3b9129dc54e92daaed67ef0c67b671c3e5c780f9ae6ba6bc75271dbea454e167b08a44a85bcf37bdf2f805a2dcf52aabc84c7ab970ba7c27833dd5462569c4922c2cb7aa062dafe16925dd0dfdc5ef684e456972729d0735922fa74bb0e37576f3c99b1ce0fa5b026961ad5a952a2c41f477395fb57d2b826bf459ac65b990e1ada21723f0cd7e6d435e7b2b3115fbd6fd49d2dd41ab085ac0dc88466143668af4bed3f46fcf1ef856a55664d80b7fd4bf3e469faba07a535c0bff00c60acc9f287af9e1577ddd1dd225616fd860c469a87fda9aa1e8ea71f15caec35b5b9add31d54263f25e4796f162b4c495c8f9f2c8294e937b7a5d7925cff67bd5d52d815f607f7fc15e95f653fbd255b933fd54ff0047af354ec567025846209672cef92b703d732888a19771f158389fcf90751b0bdb895b360baec6e2a92dad6e3f527823d4e45ebb393c82b53611aa65087bff00927c1568a2cb5acb7aabcbc341beb4a8e45b9ad5dfb5a4b7046ad8f25575611a7d856955198464e258ecbf1499cec03ad3a65efdabc2c59c47584cb7721cb36f3a110453b97459dc3907660f52a74262b00b212692e730d9e5c9b657e2bc2c5cff00a655d50d724fb7798b0ce6fd6e4812b54588bacf06c374ce4f3eaa218c8b0c91b5b23835dd9f6a76a0b2ccee43f7fc133719edfeece1bc37e1d8a12c87af77d9aec30cf0e7216ef4d3507445844b3bb7317d672d8ac837864b9b7a32403d8ab6d90a86c61934d89d3ed60466ad40f1fe592df67d38329006c8e7d8b0b36a321bc25bcf91335ba81c1261a885bc609709c3a31ec5e3f205c71590614c7f03813ddcf03b0855cd5988e79f6abac5cb073999a04f3d556780529745fc373e134f072ce7044f9914c92ea5f00490155a04887cd5abff00141fc55988fad8e401636bfc56378de6e87f8c5b7711b7c56de2847b2b16088dfd443ab7a590fcd64de185ae256d322e061cbe4b07512617d322ced7ea9908e5f0233b4cdce9a0464087eaf35b5e89e46df12fd6d5d517e175a537886c01e81741d07c24e298be0b07935b34d263b4b3dd6a3b655a6bfb8d51f46326cb8b690f57ce13f3ff001e4fe4bb4e219f226b39b1ed2d71c1710c77ebaaf0039199183f82f0be239b4eddff0003294fd5025c20acebd9db01610df53c560d84169d207c6e1627136259c3111620def7f4bf92ec5953958da2b1b765782e452adb42ac507d1ab4800d81bdd7b39b985bed6e4aad4e9e5bd424ccb5fa05478e888ff26ed8cdd5d94d8a49f8ae2359177d12ea38e1f411520eeb36f6beb65d992e38270115ad75dbf054ed94e660d7db935bc4b3081321bad4a1e17256c1895c92ea60b2d78700bdc6923f81e4f50f32c9b2d30ce6ec7692080e328a47c7aafbcfc92b45744c554b91a6ac52e61acd41cc566e5cf0078fe6392f84189fa067d02faf7c803493b9c8c41a2d730dc5a6bf606f6d5397e6b560cdee75f47da34866f6b5045533304b9308d6daf6f2fc164dfd3e3934235cf396f0dc70b0fe6911c9774ed1d4a92d45e7d4e6988f69597c6722cdf0e618da5b6d3445c2465636e0abebc8fabccdd457eb8be0a1566430f50a4d536d3c6dc493b285d6c75b69f3fd05b531c2739d36dedc555c088f226f7f1584c7533698870f61bdb6ade76f03e9320e5958715d1210429f547f82cfcd6a67c23010614d41715224f6a4cca0558584971288f8ada354740802ca1d70fe0aff0054bcd02a143c47ae6e010b17e61a99742f285fe2baa2f2c39050a091b29f3b6d4b0d1a751f0549bc30b830c4790b7056e7e11a61b7a0b67499b2c1b64adb119edf33aabacde99836187e4351686204ff00cbfcd5edc2c32983e4adc30db246a5b32a3d7830ea35975cf16328eeb10cae2c157774792ecde642b2b97445c7446dc884f1ca35275874c9bc4d865cfb55434a108b986cb78c8e560933a9e1c0f4611f250eb4fb1b5dd3e8d1e26e60f46d75a1e2da048ac543e954e913af7d6e07a762eb553a76ed68a203b16b956a64f88971d7959679549747b3f0d74570738a5e0b64dceef223dd240ede1fc575263409cce990c8d62e5bf2b1e0b5f82413d8b2b48c40ee8f7962f39bc595b9a6d585135f91dd64b7a397e3aa743bd4ff00563885a75230cd0aab84713359f456f3e78fdee5f5bf82fa071216cedb98e36f08b1e1c6cb9b4da0f9ab7b714d90212f3ed88f6bf575c3d5d7657639a3d9789b28d5e9e30b2270f93a1cc0b8eb0e8a735a6376f596e2e443fe381d3f5cd73dafe8570835902893b0a3760e5bc36846af3fe0bb554a8532913f78a6baf4bdabe76b7e1cd6c2db1661cc69048a2e921aeeee0002455613603e197c39ae52bacb5ed99d1bfc6e9d7f71478384e09f272c2b8a219d229ae6a01f48faadc3ad8c9e7c33eced5af39f252c4d89ea2f9a515cd429c69e09710b8f85c7e6bebcd1e60a73846ad52690b99350a4d6e5583e6e3dab5b971f9ac19c558d346988375c5b463526c48122a009cedc33ef5aa15c14374d7272aed3d739bae9e8f89a779333e80462838aa913e7c16c9cc3b1b74eabaae83f08e19c1eecc58e5b8de27b3d61091f25f46cea868634813c39a9b6f33d4211f581d5173fa0a8b7d1f3061384ec398ea8d36239fae8be5cd60d66fd447833e9fc6284ff00239db7c4b8458e1876e1cd4e272f9bbcd692c039fb5903e3c7f9ae598e31b6902a3890ba634ea3b59114af5396dcd8f3fd597d0f3b46b805dd5e2ade399f47b35d6dbf9b3fc6f88ee4fa9618a0619c39fb6949a7b69120ce2dd8ca72019f3e44de59fc573e8f13b2cf631b769e4bf181f143ed25e90292cd9b6a830a10f37cfde5b4fe39f5ede4b2743d2de0c9ec59435fc3ae5bd4a2a899f3dc362360e04cbe7dcbeaaa8e04c038858458c30de1fa3bbb8bb86ee5b9b81cff00565534698774713decdc218cb0b51f7673f779e640f533f3b7766baaf4b559f460fe9f6a8b9ff07397b46d16629ae525835ac90c2a52b58ef110cb3c950a368ab10d119d72b7a3dc6f3e9ee28d7bb76ee4de7196388fd735f4ae8cb425862bf872ab82348984db398a9f33d572be7639fc973ba5e8168d403516d4bc6d596f3e47d5b440def7ea562d4e8a30865a38f6ea55766c352a2697bca0702d26995cc43875a628a4b916139b9be65758a17961e895908462ea3620a24d06d1072dad6f97c5695fb07a44f3116edeb529fb0a6ce30ec40d8e7cf3b762f31968df146256922b95190ddc6ec361bc117eff000e0b92a9a633ddb0894a52fb3b7cef2a7d0ebd6f21b509cb93bd8bca9f516db2947e3fa2b92e92b4d18928d50a1d6f09d668f59f3dbbdd9c49d5bf1bdff05c91be199549a43a6989aa316e34c9c43790dad3ae267e87c965a80fe44c7d4a78eb0980e69d9499c1bf1b7429aa884e7bb03aa94a3db3a4525e541ed61dd75c536160e6e36f2077addf0f4d3509d1b89d0de236cfe6b9db4a54f138cfd6ee5d130700248bf1b2ece9753e84922f3d4e170ce8f491be5126b4902ee21e03e0b056278e4bc808c934000dd4ea354ed39f75bece8cd507ccee2cce261bc38ed49705cec1dba6d0ddcb7e57e2a8b5730b471bd351671c8a6b8af3f9a008e326ddab469fc84210d93ecbd1646becd6bf6b5f4b2755d7d6e39274caecd92d77b7151875475cd64274896e9b98a7ca6e3a04914a67148d96c829b3530b78474233a6c479062060e459d33b988673dbd965584f87ec44e2641391256227d23d4096ded28f5b5c1486d467b22643377c907566f0b94cd25be9998b594513860de29352dddc1913a3e0b6d9738d85f805a49701fcedd4c3c336e6fc02cbd0aa5193ba3924d8db3e23b17a2aaf5760f297533a9f06d2a6ab48205f3e36566c9e649be7009a95fe6777f14d4af90135342828f90fec68e0ac28a92722013925393431904d4a420531a84214904d0842bfcc0821084b0042526a001084200fe7740bcd8bb95e61275e7cb3ad6ee4a9123670eb45cd6469d0da78bfdb724a3a1f23aed3f18ccc0d835e40de3dddc56e506f24def7be7c17149d158801643103ea91ac090ee3bc4dac563c1d688c455253c02292b689fecf7aad3792a6469652f6beef8a4296cbdef0400c5052f5ebd52049227724d428133af27bf65db74c42f36beef8a0855ec3d4210a47821084006c3dff000528245a2075bc14d0ab9605886da96b8549ccabc5ac13ae7aaf14ee236a24c1c3c64486ce62836f09862b767f553975eaf35bec2a33808beb5e249ca120db82672b294c85526660e3aab4fd887644d327eadc705928b496e4b785b39a7489d08e178382d4a1b43c028c72f5b3014a986cc1ba4ac75429b23613f0c48d5ecb67e0baa5130968ef48f492ebf66033322d7b4444fcbf05c630850e439a8c53ea2406edcfa57e6b68aee92a753e0f36618921b5af7273bf4e5f157c8a6b2f06e357c4381707b5f3234697e90f1e1fd570c7f5f7cea7bbcfd5b9ed537cebce2e36ee2619f3a216172965bc8b1bc0a8db0754d7662629bc32499e75ad7e4b20e606bad61c5465b20e330321e0a32c9d9fc942547e901657a3846ac2bd98d21944582f4429b11332ac936bf72f2386d6cd5a6ec76b23577810f3c8af7cdf33f787c925ac1aa8e622b57b52d58dca6f546eae7fd181476584aab50e312b41b4d3c92ea20d89b7057afe6ccb73c44c7f3ef4f4a4d5ab265af80570f354d59bd92ac794d9baab6232c3a213e57344de490ff11e6c18b622193500f45ac2d93159060696e1b30b5b558bc899919fecf7ab0a84de4ae2b2284d3e47d9ce5554d006310bdff30bc4eaf910336beef8af76e3f73c5290825ac8ddf5d43fe3449922acfe127567c44f6aac846088f064e0c49546e2d0cdb5fb55f6f8eeb23d96a7b2cb5c22fc5021038051b50d4f06df0e3d9c08339883da0ff2576463a6510b4f6c47c325a3a9955f522cdb46ff00fb5740d7b870003d7884f86bd87275be9c2fd2d65ce1161d146cad7657db2474a0fe833c81bc373ff37157e53e69280325cb623e2b932f4c517ef44aae8aed21df647b3b5cbaf5460194e541fbddfcfaf9c4c5d4ae4adea0fda93bbc7386b71b7057a1ae55c70a80ef8953f6308f283f73366fa284c9c7a51391010adb6a4346d06df7880db95973e6f8aebb222b6dcc4167a8588df55a6c721cf084db337baadba78a80daad6e5866db87012c8436c81e29aeed21f899ab914bc307568f2a288665589914314f809e4735e7ecca9b3b117fdb2962a97a8eda39b72fe0b04f66c3198e31c6eb69c57698c01b7d905a6d422d592b553cc72669193913620cafd174ef26a6a1d55a6ba31ea81170b5fc5735a843b3a50cb8c85d43c9921b6d89fdefe2b9de717ff0a6c668f3ed4754c48d77080cbd4fbc47c7a2e378cdcc93895a9d6e8bb33ed8399c7dad55c33155a2c4726c381baf0fe13f299e82ff0089b3520eddd433cfa361f56e931b0827ed1cbc95f4986d78afd54308b6313286708ed6b656e2b267d5311717baeb6a3f1999a3d0caac42093c2facb5e9b16cead4e86dcedf82562b7cf9bc96edb7a33779be57bdb87f15826cf2a26a5245b3d5ea99450ecfc984acdaccd695df386cd6543adac3573cecb96d21f17ae7535ae02df34a53e2974e96de6c5ad602d15973ca09d69d1903d95eb7c5d7fd9387e42e6e460b104fd77532c38ac64078762b2fe2d7753218ba955464bd1d31c56702d793686717d078725f517903609a839c5d89b48308fa351697bbe62e0cf99d7e5e0be5980eeed80bdcc202fd3af21ec01050742d429064da7572779e670b7d6b84c5932d8b83bf3226af8b293439718d853e41713c9e77fe36562edeb3a510cf78867799a56b6b6f2470ece56b2b98158c3e79ade26752edbc80355cb59035b539dacbdc0ce4b886b98a274605e79b425cc89d7d9f1e89d5e0cada4ca74d9fe77d2a39063f534f6fc2271278f1056fe611d5695a3630d48556b51bade62733b284b9913f57bbfa2de80ea8961174c56cfb548c59594b549cc04084f44708914445c48e2bc315b8a74d000e7dcb5cacb972ddb988d8f6050f8e4d1a6ae7759eb7d1959ef6548b08b3bdf9ad41de2c70356d18cd6266d5f5871317604e2d8b5a4ccaa3a9036ee013c6dde91659fc1eb749e1a153c4c8458fdeb09f79b1000f0b9e3e0ad0c5ef6ab20991526d22dc7b56853ea7227b77754702edd8fa5b026c2fd6ddcb0b5cc4f228bb293badf78f686727b972eed7fae5b727797e9f835f13aab7ae54bd2be22a7cde1c4f0f14c82af5e984eed3d8930f1cd73061516558985ab79f4e111b72bacc30c372e180c14dc40d9d70ceff00ab2ac35fbbeccd6784a20f08e8f26ab8821bde4c89fd33e0ad1c4cf5bd8cfa4cf20f0b4365ce8d0abe2105bbc6e41e31499f73f34377f8f28fabafb337e168b8dbfaad30d5a7db33d9e12992ce0e80718d19e7d1dcc64888646dc163aa1135712f51b4e8ec788e8b5efdb38a77a9af5065c2e62e26ca13a063710b78b670c3ec8cd395d1b3a229d0fed9f059712837e26f754cc063ca13c1365be206a3993b793dbc56699d29839d52d268309e078590b8363b61fe398a673d84f6e2439b488cf0cf5bf82a155c2316c6f266eda1e46f75917342a9b5bea089cdf867658f9c1c48275cce6e3a8cae89d71b3b274f74f49666b9706895ac304eb430db58f2b2d5a6524309baf3d889f27adb8aec913d8278d9bb950c701f054e7b1a2cd8cc59e7c88e0b996682b9d9ecacf450f2f6595ed39f32a5bea4b835cd1f576703c67d262b5cf67e2b68918d9a621611536a46761dabf08a7eee674807c3f05959381991b396d3611719725373866ab238ce706fc33e28fda4b18623dd191a29c158bebf52864bb9b862a0d221f6f23f592f2a1a17a937e187d839b7fc7397cd6d5e6932cdb660abcfe26350941b386ce0c115fd26ee47e2952d1243e1ad9d6f099cb4610c40de7f9b1b6166d479207af9ff006e22f871576a1a3caee329123cf98a5bcd94dec4e678f23e0b3157c085c0d66d5fac369079c316b5be6a84fd1ad00ce88b7a83e9323ac46ff9a4feda5f468af55bfb62d960aa560e8670a2d4a57d20113b787036117cd6ad58c3382818f5ea0e9c4c8b806c4093dd9ada3fd9b481198693367476e2628beb2ca0c0cd9b58cf3143d2e2e85a6b3e8a4f595c5ed9c8f30be90f101a853d9c34888c86b277788db85b8725d1f1de1160e25fed2b784c5ad0d9c1b74e6b55a5b1a0d3a788b6245f95d7508448c5b83a7356ff00548d6eb74c96927656e333c7799b20e6a75afb3918a5b0e114936ec2a3e67a772969d1bfa7b79dbb4f7d284d903d207b787e09e67c9e3b46ebcbcdaa2cf5cfb2d0a6d94372462fcc6cc4addb600ca1c0221a0338a9fb9c6da4995dab2b7bf4ee52832c80e0a78096fafe4617f662922d66b0abd218486b0885bc8845bb15cd517ba601616b204f2cae9a9d63d12548605213528025cd9040d42f48238a90cf8272404105378f05e14278062f78712726d340bf22af40f778921c424ef323ef078171d7bd54200e2029b7bcbd69845c5d6ed26ae754d34ccb6d4acce4dc70e548542c218ae05be2b65308195d68f86654522a01c3587d4c233ef5ba6b88b82f594dbeeaf79c1ba1b2cc0d42108c0b4b208421558c83c9615855d4d58d121a84216a4207210841604d4a4d419c1084200108420010842001084200fe7aef68615b660aa089ee0b871362970b693ec8e2b5a6321c4f732a4b692639c7286dc96e156c3757c3384a4d76a6274872e27fddf5b31f0f9a4b9651bf6f1834ca9184ba8c65754c928d633a77c538cbb5b24bff00d8d8404ecbdef04cddfdff00057363ef7826247437d7228ee32ff7bc179b2f7bc15f42bef893ea91477099d7c12b769bfbab26847b2247aa462b62e7a8f9216410ae50c7a82c9ecfb51b3ed5242abfe989fb7f7757bd395bdc25f5f052ddc7ef7828055ffd11f49e68b38e8a7b2f7bc14376f7fc153001671d178279e70f8af0c99a0e59f7a3673ba2b81eedfdcf14c862d6e4a036907f877bf6a9c316b7250c0f10a5f46ed5321b5b2b7cd182e1707815ec247049205f2392dab0a603c4b8a1dcb144610b9bf552990fa328de94e20a5196dec6e0ed8f5bfe2b4d8ddc98ec41e0ba9e3c732707e103840c321cd59c0135ff00302f75ca431840fb6ffa7f9a9c94ab9910db7bbe2ab7d21653701fba142749fab68baf2554cb98dd97bde08db7bbe29a4433bec60e1e29bb803eca3b24a5eb67f6eaa54e9d6b7a3d79ac9aad364c88edb7f4af7bf6abc1192f9242a4f357d53db7bbe29b673d147ae6c9aae85701fb4ec56838d53710f8a4378779b7aa1ddc95b858c04d87e09aaacfd8ab355800f1bd86f3cb82c557b709ccc396d3458f67159d1438a78d6e16ec583c5ecc35932a0b5ae136bab0ccb3d4cac5835d9be95935bc92e646aeadecab6beae56baceb0c9b0255b0c59525309a6fcbb933cdbee2b93b79cb82f6f33f7fc157d7ff0049f635d15363ef7828dd5bb38ff7687b8a5fff00c3ff00d7fc916d7c0daad9378333898451c96f63c2505afdc019ad96b2212de5dffd30b558e2b93d992c4b8372e882b0949aa51504e6dfe27fc85253a47d9ceff955886f05191ed77210a7f6feeeaf7a72128ae85777099d4fc92bcdfee8503b04109db0f7fc1253fa2410842a81e9e2a4a278a95c754b404136c3a252f4714224f480a2a763d1163d1352c10417b0a958f45ec2a1ae0081246575b060f04cf747a4afe2b096be4b61c1f682277111fe1ff1596ff8b295afee9bdd0cec68adc9cb5b241984c64dc6472cd425c5a9436601b100148d688e6179d94774f07613cac0eacbff00eeefadd56aeb2956885db81cb358600c4e41016dd3d5b21911396659362c413e56e517a5c612ba8f9340304c9f2b5799fcd72bafd8b236b702baa793c7dd1dcdb7eb35c6f3b2c68a66ad2615a99d22bb3e16938eec385efdab83559d4c99890eb906d2c95db6bc479a8cdb662585c1df7a75b726d7b4ab71f8af27fa7e8ca95993b17d9f81bc61f9dfdd523d1e5d55f722d2961e8d30c7489a443c89e2bd7150de0446dc7b782e8dd5e6622167e026b9204e9f21c13610f016fd7e82c0333fdff06792befaa53e7b61adf63206457b82db473b6eedd8d6222b67c3b16ca23eb86456edf2303a4a9f3a7b59306b0e16bf15a8508ec6446756f70071f8ad931a4f01c09445f573bfc16b922db93a8adf5ef6ef5ea3c52cd691c6d5e379a34e9d7b7a3d79a64001885cd9569a6f652b806ebd01c891bde01a34dc718ca87845b671d51dcb6e72bf5e4bf68f09b7870f68ef786d4bf476224b7905b7670cb8afca9f20ac250e22d3af9f1dc81148a3b389d7e0bf53a498a091b2b715ced7792868f0821a695c67580387f479359b6bf9c5d11f466cd3d71da8e42c94cf5691a3512dac4e21a84f94002dcc99338ed2dc56289ba98e05735f9dcf5118bc4e796cdb704bfa75230db66b3aa80b8cf6b7cf5bfaacacbc4d42d6b6ff000fc9739bdc9c947552df9d9ff0363e263f723a94bab535d025b5464fa3c6e5384e86f9cebf72e52325eed72b00af5f9dcfc911678b4b1b59d6edac01bad6eb2ce22de3930c5ad617bad3a4d49f48275aa53b3e173c1362c4955b66e6223e29bfd720f8921da5d24a89a9f678dd8eece778b70e4b2d57d955687103333878f65ffa2c0c5569f167159319555a93107241e16e56ea9d0f234dab6e4efc6e6a4a6cd16a14f925b54a96f7ec27c9b5be1fd56b5406f579ec9e353b173bb1cd84fb660dfafc175a794ea1bebeb548e7dbc1601c50d946eb7d917933ff007844b937b86fecf57479683872cd630d37a4f9b5e536368e29f36a20d89cec7a5fbd18bfcf94711c549a7936e39df556d0e6934f7530387307d2394ee9dc89d4f9f90f38fd1bfe64b5382e8c92d7d2ed34964cb1d3ea4c55a8ab4d9b4836dddbb824e59d82cbd34d7e46d77baa38a6b96f24b8ff005a4cf93d6d95b82b1506d52a48de9a36733efc246dc5be4b07577fa43acd18d2d9d0c3792e3ef19d8c7facd35598e8df5db0bb88e0c9d52bf5ed9b62e9a480cdce5b7b6de513976a8cfaa38a138950bafb07560de713784a438a7d425e0d6f84e4445cb8866e73efea1bfc4f4e297ea0e199183da5ea7303a0e27cff00e4995ce6df03a55555472cdce80e8bf32c5ff3016c75aa14ba4b535a6ce75a1bfc42d6f0f307b42a7870edbc515c0221878e5fd5652a55e7b55d690e4fa1f15ded3dd270c33cc6ab4dedd4662662918cf201e480603ce1e4b6d0ce9d5a904da1371cc66b4ea1b164e40108195aeb7a68d0356d096f081cca7a3cf796ba7a49fe060e7e0e6fadab0ca86dd42c33dc12e35ceee32f82e80358c3788e6bd963c15d5714b28e6d1e775357472f8f0a55dbcf1b137b71e574cd862aa7c9b5b6e7e0ba791749d40788bf72b6dcf46b5fa8ecff00689cce76227d2c0de293abd2e912dfb9711ef1228e354f6ff25d40c96e78c91f2440ddbffa30fc951545ff00f219c963069cc25d5679101a3ead8723fc949c53dd0f44d007ff0021fc16eda80010c3900a508b2b7a6284cfcd5dd9cca746e598841a2cf9023bd84595edfd561df56a7bfbfa7c7c176536e76ef58f74c58cdd511b56a756f9582855a22af34a535ec38b0800e39755b7e8fea4e2555e36b94521cf0bf25b51c3d4abfddc7cd39bd0e9d21d878d7ed8fbbc526554f733a77f9cd2dd43adc793e77d37e1cf356339afa0b6ef531bc6438ae7ba83f7ac17d57a58c351e22c1af20910889d37bcf917f87f25f2a406e2fc8af977eabd2bd16abdb0e2323e9bfa3b5b4792d1ed9afca3c1665bfa848bec6a2e05f8fa4b2a717d74ff009be1d8b0dabd8a0213cd79aaf59641f123d35be3349771346cbfb7155ff4e57c930690aabfeeadbff8ad5940901365afb31d8aff00c7f42d7c4d93f6eeb4784cb77a74ac7757982ef437717e370b5119af60be5650b5f72ea42e5fa7b43ffe4e82df484de1bedd87c334e918ee8dbc02e486fadc2fcd73a248199295adc6e53e1e4f5073edfd27a2b1e5707608714d022193e02fd8bd915fa44e317f784a86def2e4720f129998e05695e626bb460b7f4852be32c1da24b992e01dd6708b57eb65c13045c57189739c4bbeacd22fd1649be24acc82755fcdcf8fa5c536bf310ff7461b7f49ca0b3091d56f6e4bd1603aae71271a558646613f088acb36c7d16a6aba6315ff007baad95f94abb472adfd3babaf3946f94ea8ee0e36dc6dcaeb7960f75cc60cbb70f69713938da933aff5c11d42dbf0d6246f17d0a070229397e8af4be23ccd4ffb726799f25e13534ff7369d42188c42e4597aaab37bb500c4ae037cd7ad4b2b279acedec8a1084a63205853505352691a84a4d5a91504e4942052781c9a949a8120842100084210008421004d0855d04fadbe8fe7bcbe9f4e732dc37761bcf833b959b7b8f317e2184b5a9d6e09f2361e8dfb78fe4b16f257ac3da96d18eb18e2dadaf6f656552c9d4f4cd3c10d87bfe0ac266cbdef0561533b8d55d6210ac2155bc97c9e5a9bbbf0e6908561487429410ac6c3dff0425802b6cbdef0449936bfa5d392b28b0e8a3229c05ecbdef05ea10817d0252b0a363d1435b482a26a66cbdef05250d6004d874458744d27578e495bc36ff5bc1400587450ddc7ef782997d223e11705e6ddcfff008f08e8066ef2ff0074251632c0c8f8286f2fbaf8a6ec1e837b2b860506d9e416d982eb11e1821cc351b70dde2e37e3f2bad7089d2e1ca3bf72e8b8130a53dd317d50a90fbb35de2f6e974c4f252ce11cc6acf27d46af39ccff004a2caf9a8c2f2206e214f7f1c0628a2873b2553e46f04676bf3e8a1ffd150df9e04c15a70e059bc9061e51109cde5559d476c8427aace37a74b966f1c5afdd657e097042008258c951ca08e955a69591cb3050d11c91ac6216ec479aa543f5a29f7f05b1db2cf258b7ce5b426292e0903b115cb74b04d9542983dc6b8f61d59976e723c4755e868e081e8124857b7b922e24c005b9aab39f3c07d445973c96eaebc9e5eebb3365171ad21cfd24fa3c9642137ba4b89194226c1719d9792a4f1f4bc1684b02d59265f95c225764e52962fea76dd39bbdd5c88c94c497c991f3a4e81a5b9dedc5622ac253f91aaeee40e013e7193145782222fc922384456e68c1530b14a95058ec782b10ce10b7240b76273c10c24c221e4b1bae6e47251844ac990dafbbe2bd92e3eb6cc8ed4bdda66efc104ecbb6eabd933792f4e70f3d1cc2a9b173c5c45f0c93bce1ef15013fddf15164708b43b32f5e1ea25fc0fe4b543cfe2b6bc4ee0ec5afa3fe042b55b5ef9f35cf92c33a55fe488ab0abab0ac30526a10a12c14292bac1842666f10c37f7539bb1dde7eadf8f627802cacac2d5d7b87efd07eef8af15242a399add4df4084215d5b160ea6cf765ef782365ef782f10876a21d4d89d87bfe0a5b1f7bc15ab2f3243b628a2aa454d87bfe08d87bfe0ade5d50876c5844a9b0f7fc11b0f7fc15b5edb3e0872c155564a6bd19abdaa57b0c275adaca1bda1eb294328e592cde171689d83c85956865c205ec1652820cd1364402d1723f155b6598e0ac218b326cc2388d29bc2392735804c178825ce61558a0dd20a6b771aa6f692e6f74ca7c3556b1081c61e7c72caf9fe4b90ebe727478c1afd42388bb8c5b2052dac20cd170ac5583f2ea6ba99427f2240e04c09521c3780da6d874bad5079accd3ecc85589899440f45d77c9fe4de88ee2fde85712a8b8913db1844c6e3e21774f27806761876dbe8c2e3eb7f25c2f3754add1c944d5a5e668d9f1a09eda8534fd5b8b05c237b33ea2ea7ea6adc5ad7baeefa5037a0cbf802be7f902ce9c0ed5c1fd3d4e2a964dfacb71c1d0f0a8867d2a2917b4518b055aad3040034845848c954c3914e8d8ea4b195f35e55e232e3328e66dc569db9b70cac78acc2397fa82293f5415b86129245088b70b0fc568d556e64197786db65d0a92de6d3e97b1bf1cef6e2b5dfb6b88bae5891cc718424ba9b7e9c56b6e7d1a238cfeb0b1f92da3134335cbd2dc58f1b9e8b57accb2de9336027805e87c6494611397ac589c99a21523f1513c4a63062eab1516945686f3dd4fd848b7fc4e3f805dffac9c6f93c1f7e7f67468f5db4c3156c70e2384c7588c402c33b677bafb8357b173cd0ae0b6f80701d0b0db7bfd01aec22cbe5faed5d20984af09afbbdd7b67674b0d90c8a422d64f06eb28c10856146e38592dbc1512842133e45c4a13908012aaab56cb8212e32c91b8aa9aa571d54ee3aa131cbf1177ecf1471c9310a9ec698d29cf9573c2ca142c1d48abbf85a4f8f6309ede2af184116b2b547b4aa84b8c42b6692c6ec41eeb698e533e66d21f943607d1ee3cab607c4582eaaea7d1a796f1386ae6de362aee11f2d3d0f31311346a84ad703a1bf1588fed0bd1648a3625a26929ab73135ac8ddde9be5fac8af8ba7b6bdb54af7b5692a6ba391679cd5ae24cfd2c6fe52da2ec6f04969fb7ac0defe8df20b6fa59915f3fdc4fdb5405b8b69e4feb82fc9a8a5450f55f517f676d7dc35f2838a8227d9b56e8d385adf5bf57579e9a31e625b4dfa8eca5f313effc35440de1d6881cecb71912b565422dc17c35a63ac633c03a56adb2a662d7d21a89fbc5b78e3e0ab32f283d31524eb7edbba9d7f7b82e54fc9574d9eb91d1d4f8cbbcb43dd067de1abda8d5ed5f0f7ff553a64fff0036d3ff00d94a3ffaabd32039d6da7ffb2153fd5e98f273d7e99d51f70eaf6a357b57c3d0f95ae9845f5dc53e7f4d66d6b78ad9a89e5a58bdadcd670b539c4395c9042bc3cc513e109bbf4feb2978713eb8d5baf756cb85611f2c1d1e55dc44d6b14f7f46315af09eb9e5d8b7ca7e9e343d549e1bb7c76c8447b7f9ad55eb29b7fd8c5778cd5d4b3289bd58af090389016398626c32ff003a7e2160e6ff00f1f82c888a54ee0641ef4df6c5fc598bd5721083c53761eff8213eb685283fb428f15e4527545f5bc15951b659a3a44618a9409b8b70ed5f2ce967084784715cd6f043762ec6de4102d6f8762faa0010dcf55cf74df848628c2bb76601734e1bc0205c9ec5e6ff005178e5e4343278fca28f6dfa23cc3f19ad5559f19707cd4357aa2d0a5f045cf55f16da7df93cf20a1b3ed535e20b2e08eefef78214d1d8ad02e9608214ed74261224f04e42f12a266b3e8f5085e4884c3ad74609ecf509a84ec10c5423b782b925d4e6f6dddd443f255f57b500595ebb655fc4c97d10b9624756d1ae90e2de20a155dc110f0933a2cc02bb1cb9b10b03c57c91aa7a2edba2cc772ead2053aace86fd24da304f15f47fd37fa82362fdbde7ca3f55fe9970b3f71a55c7d9d3d5854dbb9de6de97f25701bf05ecb27820b0e88b0e884207134d55d584e4b20084214103935290814350948400d42521005842aeac2073582ba1584209c9fcff006cfb531bd3bd50f4024122dc559913a124822c4ac193d0c4af73d54ac3a26cde4968ce4867961d1161d15a89bedf95f552776ddf95b592b25fd62f65ef782f0caf7bc131055f045df6265734c1c558428dd811815b1f7bc12c704d9bc92438937b4e1607975528b4fac8fd9f6af27c3bc3839eadfbd54f39f678a56d9cb8fbab6822b78ab76662f25587455ef582e7d18aeac6e3fef107c119c978213bccbeaa579f3fee7208b753c564fcdf264fd5e7d8a42c0deeab91bea9becc4414ca84e8ed3ad08ed56bcd0ca50022e2b260e564b9b0eb1547f88dab4d17d95e4c8926fab9a765d1476c3f73c54ec3a25be476cac4f9b9b7eea471c965365ef7825ec3def0564460c7eadfe8a47feefe4bbf62bade0aa4e89e6d3a985b19e6480e21e1f15c1ea30ea488e742161aad509d13185bb79f78b3e5c53e2d2397ad58e8f752273198613c792cb3065bbcab1b5ce7655a9b4fd84235466b332a0308b5aea256e0d3a5d3adb991624c8bdfd2e9c94e1173d1376deef8a62539f1c1d1f8a1061392d4712ce8db55ad070016e33464000b49c684effb6b710ada77f9e59835d1cd65470fe173f773c7876ab6b0f25ffd61acae17f267703f5576933c8d91db2323b1ff0031add96b2a950f6b77ef5ec275b81e095e976abef2a4b6fee78a157421ac92b8192b9ac8ac7b7f51235beb7829edfdcf14ac645c5e0aaff89494942b64be0bb26771f43a734e9f945bc35e5cd545192e00d6bc3e2af95104585293c22ee4a9cea51b7a439a4435012b80e3da916ac21d5c72cd9314fd835ffd1016b7261beb5c735b162820c86bf0842c0c81091111d564e19d4845a4467fb3dea4a33fd9ef49552c5857377d872b6b2996fb03c2dacbc1c52acb1f183457590b9ea84279b762aa46af58903b178ac6c3dff05e926eaebf006f020016e08b0e89c854c081361d1161d1391b3ed46004d874458744e42300272ec41217a850315790d87bfe0a0ac5874458744edf8120a0a68554f25e489715189f4fa7cbbc8e1d14d21c43adcaeabf27816d153f6cabf20d8d4083ff002aba349788c7f8e6df15ad3d846dc803828d8102e16885506ba39d2d44d337393a58ab4a273173c45f8ac8ccd29f00e6599f09e565cec816e01799f6ab7ede0caad54d33a853f49f413142d9c521b9862ff81fcd5a938b3019b168d8b6e8b92083f56530757348b7435dab6b4316ba71e91ddaa38bb0a3f930c6d627cdae73ddea56b7cd619b31631ccffeea7232fdf5ca64bbf6753bee9e5feac37d439fbc97578caea5c7d967afb278dc771c3ae1db432a138e9b96d0ff00bc36beb7f14e732eb91540b96afe90fa28ff00cc58c9b7ebbf82e071552a44fa973387c63baf64e25af342442fa317e39f159adf0f1f67b2268ab5edf0cef8e28b88e7bc957a7487314318d62ddc5fc2cb6138b66366e1bbac2d5a8a2926d7ca6937ea79705f39c9c735e88d8b8b7c3259693a4cafcabde6937e84acd6f86f64b23e3ae843b37cadcfde2a05d48933c431746d105aae2b36a54d232ba5b0d2de20933e112dd3817e852f18575dd799475373999e4919dfe2b669f472a308cf7eae1667068c7b5776f229c0bfb6da73a73a70d75db5184da918af7b7f45c24d86457e88ff0067560b147d1dd471c96e0cfac3a10836cedcbe3f25b75963850da31e9a977db889f63ca885e13656618eeb14d1fb89e04962c3793d6ffc9641bcebded336b34f75d78afdb4db3d5ad05d3e9162e532fd8a917fb416950b78bffe21362910cc3957184af8c4acb493fa176682705d0f26f925d8f3575bd018c77dbe2a00f2f51c11061ebdb75c52c1cdf85aea3f6373fa32fedec5f4504ebab1e69727ef22f7f14b7cc5fb0b3a774ee37567a697f03fd36fd8bb7624a1bd42438b6ae49a2207206e96b4b3fe087a4b2a5962927b8ab6618a4e76bdd4b3e40a5fa6cac463f828dd17591869ee279b37917238e6aa5429f516b6de5b3816bdfb14faad0c605210859ae8e243534fa04c93f7997dff00925a9c246df8857d3acda2eef89a57f686d29bbed00b472655f615991e8df8f15f9a514bd5e257ea3797731defc996ad95f779ed3bd7e5c99861cd7d3a8f823c86a1fe628c8130decba1f938e2f75a35d39610c49320d66a6a1bbb8cb3d8ccbad0e0796ca60bf44d9c7613dbb86b3af3dadf6597fa77b276322327de9e5a584e75271db0c59bdebb6ad4bb5b8db663af7f8ae045cdf9597d4ba6199334bfe4c38434a111d612244970e6119900f303b97cb0615e1fccd7b2fc9f54fd3d72b7471487282f6ce179b43fbbe2b8e77783cd8fbde0bd39af77ff0078fc93c3804fd5f1403592b1959dec804ca22caccc80456d550d89e8a72c36a635b3d9d26f9def6578e20ad8b6c2b551957e36757bac6897c81f04c95018795fb95e17d95f4ccf3d269ecf944d89869334974ffb1c77571d7d79cfc5675879406979a910c38c9d13cf5b3fcd6857f82888756fc539790ba1d332cfc76965d44e933fca2b4ca64c460c5ce0fe5e2aab7f289d3619d0eb62d706dc3f575cfed9e64a9581192b7f54d425d955e2b48fb81d3a9de53ba5f6a41f3cc99e07bbc17d1da03d30ccd2cd1ea14ec4d0c88aa2d4440c2398fd597c431032b3038f62ce68db17d5300e34a66286b38eab79a778807fa3309b9f04ed3f92ba73c5b2e0cdadf134571f6d31fc8fa2abba25a730ab4d932e7cf888f6a22b1f374652ec2cfa705df2bb4b6189d935afb275096c65653db9e27b3e2b4e1270d19c64ef53b2e7acb36abf4fc2db1ce11e193a7fd53ae8d7ebcf472fff0066d0f191533175b9e0a945a357f0fd8bc925767869b8633cea5752f3450a2fad39cc81caf9eb2c92fd35ff000db0fd59ae4b193879d1e5707000f72cbd3744b53abca314aa935da8ede2ba4c54b687ecaa523e695b84f95c05f24b5fa761097e48b7fe59ae5f671f7980319d3bef3409d7e43a8550e15c4717fe073ee7b17d1d48995172c669a9457195bb78ac1cf61b07e0402d75ba3fa4e9ba39ce0e969ff55ea367e68e19330c6229562e68b3e501c72bac7c6d5d49fbe48126dc725f4957e9edebec096ee776706e0dcae5afd8cf9727d7cadbec781d5ebf82c1acfd291abe123a9a4fd42f53f389cf357a15edacb37b27e581a7c0c3796fb6dbb87123edfbbc5675fd05a06cf032a7481bbec7719108cbf5c171e7e02c8fc19d5fea75c7b348191e0a66d6b81de98c2935dabbb9e1a36b891f5b3f97e0b618f064d9ed6e6cdc9ff02eb2cbc36ae2fac8c5e4289f6cd66c8878e4b31330d3f9709862d58670e3232e0abc8a0d41c5f6122fabc73e0956f8ed455d44b7eea8974cab6110192b0c6a33a9b5094e9b9d59cd8016ba7bda1d5a9b20b872c27087b2154756c42a428bf473f76195b7d3aaadd595c9f41e0cc5b2713d383965613f2db37be77eab71633e19ddf0dc2f97e85597f41abc9a8b1362480577fc2f5f615f91e70a64d00803786e3883d42fa7780f2f5eb61b2d7f91f1dfd4dfa7e5e32cf6d7f166e0abab0899c97a347954caeac2526a692084272094b208421024108420010ac2ae81e982b0aba100c6a12935027e47e036d7ddf144ae69723dacba23607f7fc172f3b8f4fed89612539785beef24c3ab6bab01099170c9452b7897c51bc4f9e406edae3adb8aaa7802da56dfddf14bb39e899e6ffa37d4570c4ec11ae541c3870e6f9f156f63ff0097815aee2a322fd5659d185fa4762b5b84bea3e4ad211d92a19286cffe01ff00e49e41bab9b03fbde0a797629e85d753fb108933ad7f47a73459c7428fa9db749ecd35c70584d4a5253d9ab04d58d87bfe08de361ed5b591b7f73c54259205225f34f1bbc837075aea1bd49e90a80c1eec07eff82ad11c8d8ab1b5f77c52d05f6a2ab9876b20c8238aa0de82db6a0c50f00b2a601111756653703d203929cb17669a163cb425bc9d5cb5792b72a186dc12f580b58724f9282d1af1d0e9200bf7261e1c57aa0a0daa98b2310b958baad3f7b6f1436bac9a0c1716529e1e50bb2989ce1e516020c520fa47a64b0f3d9386c6ee5b123a8cd75372d6fc0daeb08e9beb8b27c35128f671b51e1e167e75a34892fe3967d1240160159f3a4ce642cfcca2c89e3d2233ec545c6198011aae2c3a6aa7c756bece7cbc44d18ef3c0ff00401f8056f786bfbc95fb3ee3fde0fc91fb3d50e9e2b4fee60bb3159a1b21d4496fd23f7943ce2c3a4f4bf313e1c543cc2eff007947eeab2bfb1b3ffc939ef9843ab94e3c524d407fbb01db64e387dd9f68fc93461900fae72491c0147eeab27f6173ff005291a84245a2e6ab9737b8861bacf48c390f4b80ac8a248845b619aacf570fa636bf1763ecd56094e6745786592ad4aa63a9d9116b755b637a74fd9430c2dc00ac0a1ba39eadafd8b3cf52da3543c663b118824189b3524f2856b6ca3bc2613c56d38a669972651b7b375ab53819a0c56e652e32db5ee2b35eb9ec5c9e96f0b89e6188f359291ea2c07a5e09fbbeefc88d6429ec757a5e720842124dfe9ff8414e5f34264ae6827d4be87e4929d628b1501e9ff825084203d3ff000526a10b407a52ed09ee5ea6a1513c0a5525d0a426a15a4f05768a426a157711b44006fc149350af9d81804213557716f51add75beed3beadb8f7ac385b1d7649d87d6ebc960b985be0b30385aaafd7310a684204c410842001084200108420010842002e7a95b25586b501a8ec056b9a91745b057e130d3da8238d82095d98210ebcf323a2fd94d08e138707e8e30be03690da7346324b8b1e833fc57e5668030a9c6ba67c354382519d237c13e7f6423327c17ebde1d913219f51308d5fa0fd1ff00e5cff92e5ebaddb5ec3d5fe9ad242d94a4cb4e2af2a0a33b70d802c5bcfd8c363e8cf19dff002f9ad2ce236afde8159de4b21c24374aa5bfaed3a7eb53186f111b6f3238dfaa744cb0557e76d64b99d457238377117a92579e574e4f83dffaa1059c19a691c3e696f5376dbccd4fa8d8c8a753c7ae707af2bf1e8a35ca848c332226b0b6d8cf87eab16e321ffab3ff0092dc2bd4b7ade453dc5068b4da930a6e526f3c8d8dad7f8f2f92d76ad29cd5e76f552c014889c9ff0014d44009f3566decc51f5d96e7061280eb1562e9d39b539e4991bb70848e37fe89ae9b635a3c1bdba2ddfc83c8e607c7e6acb56e698ec396d46a0309fef542f7590618d6914a9e27d42a4ddd4f3ea21ddfd6d8f871fc952b93ff00663ed856e5fdb8f0589123104a66d2a3846a7bcb79ff00558d4072ee542ab5aaacaaac989ab6a8522e75dc1200907e1f1cd60b11e319d5d9b4ea761b605b486b0fa88a2e195acb67d23d523f3453254717f7a800ce6e22bf4b9f04defa12a95bd6e42b11c55ba4c32aa30bb6efd8391792f64e60fc4857e855886a5ab39b1221e041372b1d4a85cd37470fdae2820cfaa4e3bbb7399bdcf1fe8a38164c3267c500371709b5465bd311f8384aa99d398b0df1b11ab9aa2e18bb644de1161d55c618b58d3c01049db7659632bd5c7d882782640033205ecbb92a2bb2bc9e7ebd2cebbb30f89764d6df5afaeb73a14f70fe513362be42dd9c56b587e851188177101c2d95eeb7d6d0eca11071ed515d105c60e4f9cd44286ebafb357aa609a4b984eef16ef3b9058bff00678f2d954641ec03f9adf274a048364a1e890976f88a2ee7079986becaf8c9cfce01aedf2dd8f6eb5d1fb055ebe50b5f9ae8a2e45d045f239252f094447ad7b91c6bcada995ec43e4f788687446ee1fbf12a4c4de436f679afcbc1a25d2e473f63fecc714e5cf76bfe6bf688cbcee4274bd5310839d9762bfc16d314a0ad99f8ef4af268f28baae6db43f588bf77b7c16e8d7c88fca5e2d49c30ad3e55b944e6f7f9afd447f5496d41d48af6e3dab00faad0ba82c04573db756776d3a1a6f0f3bb9388793be8f71d618d08e23d0fe92dac86f9cd34ed6272bf67cbe4be5ca83070c1cc6d5c369ede7c936c97e81c50de0d69f11b7c56a98958e1babb72caa34690ea51ff00796f7e3df9ae2ebf4bfbc964f6be234bfb189f11c373d57820057d2f1685746f327444497326ff00f9a39ac155bc9eb0498096f577f2213ec88ff35e7ecf1b3ade0ef7ee21fc9c08ca111bd864a2090bba4ff277c370b28a7b4c64f354fc335a94dd0ad41bce10d3eb6d9df7dbfa2cf3d24e23a1646473e11922c534460f0fc56f10e8534897244895ff00ed45501a24d2543f6387b2f8a5ba26862c6326af73ca1e3c14e186c3e92e848016f14fd07e909d49db3a6121b0ebbcac05770457e84e0b7a9d3f5c0bdf2baa2aa7f62a597d0fc5b84ce1d92d9c48abd36a921d4ab7a8fea7aa4d5b093d61476b5b90fe54f90e3819115edfc78ad93093b389f073bc10d70eef2e1b0de5b89144db4fe7cfb6ca7a34ac878c2ab84034a01350249dfa40db427e7dab4434aa6b933ca7283e4d464612ab39c3d3b12b63b794d8da76ae7aa1794ac27886b34e7152a753b7990dbed85beaacfe8d2b323076279b4dadc522735710eef3c545cec640fc7aa953dc37c11a4916a99714913628837a75473712268e3643d1e3a426cd4c93e0d6d9d22b156710b6a1b272e5cf20dc6b2a7e6ea84e71bb356d3a29dfe8dbf00b7fc6227e05c6d26b786a9eee9cc5c7af6f20b8dbed8e5cf97f356b4871b033e9d8f704d06af4686780670dbfc2d95c76a85a5922b1d44a7d9d67c947482e226af7451890b9335b113d9edc7b27a92ba262d7154a5d58b669264356f9faf88643b97ce9569f427f49a7695b08bac430d7a973c09f21c19f385a5dee36ff00af82fa7a915665a5dd19cbaed30b76b39d4920424e5227d8647bd7a1d3db3504707534c74f7fb24bf1669bfb47884da06d550e22e8d9add2db625c65b780eac5bb7ffa6fe6ab5043e714d7743adb113eb14f1f47de7ec558c27bfe20a1ce86a6e0efc669d8eed0dac0703d8ad2be6bb3a91aea75ac2328717d5a411b4a6c73afff00038281c6f14e037aa0498adc32b7e4b1b0e2c9b87aa7fb37558b56a0e0f2cadfabaad4fc695c9d589b4c734374e3eadf773b6b7150eccf62de9e2d708cf79f70cb986205bce6101c8df21743989bce2036abc33881702eb1c5fbe6f54126a0c9bb5ed7120e5f248c4ae9b30fa436a6ea4817ff0029b2e9f34daf5097611abe919033a6c83eb618a2ed4b9818d5a4881dcabc22f604ac6d42638a4d2a457629b05429f3edad3db67b23d3c7c1269f88193d23e91e1c14cacaedec7d75595bdf5b31f3f0616d3e1dd22db917b8312ade6e7cda20d1e35135b0e30d96f058cf70009106b6af15e4b9132411be01248e3cec94f4f07c9a7f793fb34f122936b933e41e601b2c6be9f5d2da73792e1b3790e6fcf8ff001b5d74b932e09c0887779c075e497143209f5e6c9565104825e4367672f6ec8cac3629ae9eeda6ff0081cf656fc78ab579ee67d3a6d3c6f4f9adb6f3f86dff00873eb65d04b6c3832dde1052deb66e1c8dce9e24017e5655869d27d8afea51b78678f67d64d2e53474da28241e5c555a6d0680e270de69724dad616568369b33eb057cd04b784ce773c4803993c53eda34f77e138f06596b2caf9848d3aaf8129513e8cc96d3a4c3c6dcbb957a5d2aa7866a12ea543751020dc5c745d16a06990538425c99f38f020e6b5a8603c02f3d3d1c3477fb2b157797beeafd56728e96c2a0274894e5be4d85ec7aacb917e6b98d0ab73a933e11ae767c0762dc37f8848dbb68ad20782f57a0d557aa8259fc8f1f7e99d53cafb336858a64e03917d6cbf05905d0327b1bec6a1297b6282f92d210840c2c2ae842084b00842104821084002b0aba10460fe7ecbdd5ff000203757dbce733a4eaec22cba9b2b1b80d86acf8412380e8a5aa3aae53783d0d754f9c957cdef67ff991e8fee9479acc39cf7649f67356e5019af40b2ae4b7aff912de586e6c331d55b0471c812926c33b209250b81f0a912b9ea8494e42e4738e08c30dbb5114fe1e878a69976f694ae3aa33917d021171d54e50bdf340605dcf451ddf7997c3f92b6a1b4ec40d55afa23b84afde1f24bd97bde098ab8e2a08502e6c3e8df5b9f44b4fb0e8a33fd9ef40cf57fd04a428cee482ed124900745e6a85e67da822ba9aecb08421033d5104db9ea949a8249649b61d545082554a5d96647189352539496051d8fbde0ad6c3dff040e28011b1f7bc154a849fade973e8b31b2f7bc16366f249f914f598b0c25db88f92579b8fee2c9c9937bfa5d39266c3dff04ec03ad3ecc4f9b8fee8479b8fee8596d81fdef049b9e88e08f544c4f9a9df67c91b81e8b2dabdaabcd17b203d30fe0c66c25f45e266c7def04489379fadadc7b141907ec475f051dc07eef8aca5c75420d0a22e548e3e9f827732a3cd34f052d15b6acac44d17124e86b13c366c2788be6a0c5942da48848cd6c0f45e7c59aa1142380cacafbffb7839ef4bebb14cac85610782a266bf5a2ba13c116e2bdb8ea84b22da2ba6c8f6bb94f607f7fc13647b5dca0210c1155d5a50cfaaabb52ec302f3bf34956b67ef252b042b14ac587452d98ebe08bf678a8f663b0c11b0e8aba7dff5745ff5747b51381084dd63d02f353b51ed457d4a22d351b0f7fc13777dbf2beaa60bd855426af6e7aa942fd678bd5e2f4714ede5c455f391135e37f15a9ec07ef2dae77d65819ec279984422f64caac92391aaabdacc75d4eeacee333fddc7cd2f76f7fc16a39be99a1685e5fe08b0412aa7f67a85e023aa2e3aa924f5084286c8042f2c7aaf6106e3351917eb91e6af62d8f1508616ad611d42c0c201cb9acae313eb64807801f9a9e8ba8fd1f567f66ae8ede621d20623c6f14805ad11a1919f1e1c07c97e8e4cc173ae08e3d8170bfecf8c0470368069ee22244fc4734bf9d09e42d95fe6be9b335f420fa371f1596eaabb4f51e1ec9692273f8b0cd468953f38d3a5dc45c481c6dfd557714001dcdab5383530b9276cd9fb5b7876adf5cbc7d091e878a56fcc277de99fa63b6cb17ec228f40fc9b9766a54a388e83781be1f840c806d21cde4957cb5ac92363a3b65ff004ace446830db6137761c82be1bb2245aa60f7287a16c4cfc8d71e59a43bc3f88e74062384e830e6b1f1e1888fde347b4dcb86c5cfe2ba849634d8b3de61f9261634487ed621177aaaf189847ccd6bece5d26f4925bd37061653c70b051a7d2ab9b5da37a7376d387f8dfe31ef5d3c4dc34c6703137bdbdfe3e0b0ef8c99d3ee33d5e0adfd31aff0061b1f252b6588235793a3498fa742e2a759836c78f3fcd6dd4fa4e1bc2cc4431390e6643cad7b958e99276a40860bdb866acb5a14f787d1977d5f0bad30aa30ec4ea5c93dd6b31715a2cc1e39a21c8de13f25b34184a76ae705aeadd3f09eed10d6b0edb274774ba15fd428ae1b727b4031930f136b2dc208491c16358d3a16a46a884acdc980102e13a0b0785f31aa86aafdf590b67c14a749bdbd2ebc94d09e727e25791ed7726af1c4885c5f5b2ba48e2a00f66886017b5d631e4d8cdf2c96526cbb8042a73a503c42ab583a9a5f5ac3356a8988ca20f0072bac4cd770c904823259caec225b788887995a84c248f4cdaeb35926a47bcd0575ce09a10f5fb89f73c01ed53a0d067d5e6edde436939581080d77b3b09075a38b82e8548a61a751e537885b2bdecaf5adc67d6eba153f5d6605e51e9eddb44da1900db9ad1aad15347aa12ae7aadcf17471c3208822b659ae59559c61822d6e6b95e42c509e19d7f11a5fdd57ecb4f65525c555feecdfec3e0b393c61fc1f01670c36ece1c3faa8d11d8a56069f581633b5798fcd6bd8648dc9ee2cadb8137bf8dd736535db3ab286259ff005464e170fdd7d30496ec24f39d3cfa2162cd7b0e44e037755eabba84ff00bbb5bdd6ab5ec4b3aa93cf2b76decb68615cc2581b0f49f321f3856dc80274f1c6dccf8acfeedf3e50cb2bf5478fb323224d06af3a190d1962e7309f885969da3bc25b611be11d3af91de2a5242d3e933b485a43b868fe7b66a6c77824c902fddd89f50a5e01c2315aa4e5c629ab0e2de4fd8dfb53a165725d1cdb1ce13e1f26ef8730660ca03dde9b637dd41b5ed15ff5c55e93a2cd1db77f05630c5698499e41b1842d49855718c9a7ed835c3f86e9e3818db5edfc3f9acf5631e53e76112e62c7120cf90418b776b69d9f25d0a151b0e36b29d6d93de995b491a1bc221c49c510d3a9d10b5c4f72eb877af312e8c30be39a6b69f53c2b509cfa4c9b89ede1b5cf557f0d631638a70bbaa548a87d2258fbc4fe1cf8a561ac5b8a66ed9a79c586296f3f849b6ca77c426bf495857aa8c3f3ed1afd5b40149ace17f373481bc970dc020f1bf8ad7b0a689a8eda8f50c3359a5d37547f9e7e7e3c47f35b0455ea1c8af16189f0fd528d3466036717cbaadd6b8cf1761b932ea386e38ab14f162e1bbdce767c782a6cae5d0f8ab2b6b77d9cb708e8bf0bd3a7b9610e2a713db39b37b42e3677e3d56d5a0ac2788346d8b2a7421526ce69351ce4c40d8defc53ea72291576b2eb14cc37566d1477beed26c2ff3c97954c453cc99150f39d21bb86e2c0378bd77626c36c0add5cb530da6771f615aad2312435aa43e85bc8706e1b4e3ea4705831bce1f11b9692e46c6713bc6e16900dff15d665cc938e3086f1918a7c917b73cb35a7326f527d2a6e1a965c917fb123877a46a3adc8e3d5adb2a4ebb3b461316b0188a9126a34d2ddc9b5e193508bd7f7f451f3279fa83e726e5c072d22fa496f3c1f4bb6e7b165a91aac5c474c782448309f462e371f0ec55e45e9d553fe2361dcb17bdfd9aabd7b7135a64fa45468de63df2ce62f65bb7daac339c6af6bd88053286ea4c86eda4eedb07fc67ecc7f3f15beba91e65ab974db7704736ee6e0f8a2b74f2de74badb5a716dbc5ad3dc71f9a9568e8eba28d79dcfabd0193268d8133dc7060d9c9d88bfc5627105120a4509b571db12c2ac67005bb6e03e0b73acc997586b26b93059c0880bc2de207e692f290d31452a48a940db6adfbff5c15bdb11f4eba1bd64c560dc4426810b88ad716f8ace625ad49aa12644902fd14687e60a44984cb65e91e078aa2ec4a33ceea0ecb92df0d4d5b76e4add757659beb2f51ec04109e8ace29712210cc98c6df9f82c3417b6adf259d82548ac49ddf5bd7c7c92b53741c38667d434d651af137e4b3341c3cfea36710b8dda48e056155d6154a8d1ec25905b0e320fe6171e8bbfb88cc9a329358ec0011bf97e97054e439a7c520177e9f4b9591abd0a6ce9129e36fb1b5f21c2ff00d161b12e1fdfdbc0ee967388fd2245b207995dbca6b232b6a6f05933f0deafa424dfb51e6d6ce241754d7222e90dd684fdecf6b3a5c30ca87616bde2cd3d8d5e0859170e29d166333d164b14272cc8e82d064db22a6bacbd009ccde39653487568641b0b2d6e878b24ba6fea77e320dbd1eab2a311486b76ee2e62878e7c156aaabaecf657d98357e3e72960d8db544c87595c48e20ad9593f1380f4af75a2307d29ee524de545c96569afc3771b09d15a20bbd4dded3cc6af4bfb79e0dda1209c8a6002cb1cd9c9b836c9646123541eab5199ff00c3d421081809c929c82c810842091284e494148c303908420b9f82b37929266cbdef05124755c84b27acc90b8ea99ae12357b53765ef78282ee278842367daa482ea54eddb2e1de9285068482c3a22c3a28a92085c85874458744210181c8426a067aa22909a9d66aa89e43d6544276af6af3607945e0aede0b7af22365ef7826297d976dd7aa8d64850c0a505342abe4b82848f6bb94d354e4014d414ae3aa6a404d0bc8558ddbdff0005005991ed772b09523daee56d2dbc00210842e4905527fb3de9aab4de4a069e212e57356ec3a2694701084ee417963d12ac7965452ab3792ca2c7cce4820c4cee4acca9433f4bc158dbfb9e29bb6fa37d5e5d534a2ad7d90d91fde5ea928a57c46240a52f9a8a9295c81879ff00582c7ac8bdca03f158f3c54099c392b2b084296ca8210847b19009a244f2db7a841d8b81741175ea8f636009371d5390858633d62509c8528a604a139098b92feb11b2f7bc14f65ef782621047af02509c8529141284e4d42781392a296cbdef056761eff82f757b5413ea9143667f7bc11b33fbde0af26b86d24c9924b91b6d5e6547b240e18fb31192abb1f7bc15c9f7f46ddabcbfeaea55b815653192c14f603af8215bef2929dee7fc995e971f42767da95b94becf92bd63d1411eeffa43d27fc31db94bfd04bf3636e8b2abcd97bde098af6c5fed6261bccfee8f925f99dcf41f259e429566053d0c4c06e13fa0502c27817d559fddcfef8f929db5b257f6a8a11fb5da6bad99b8db084c0b69a6e15a8e9071fe1ec0d4c1ebab6ea53784d9424490333c17d1de40f8322c43a70a8e3870c44e6d84e9b78a13171535d8e6f9316aabf4c77267ea7e89a854ec3b86e561a6d4edda9f469325b37704df78d9feba9e2abe16ac3ec438d6ac3f6a9b38a3b539d3fcdbb204136e2a785ccfc2fa389f519b4e72de6ba9227cfddfe993ced2df357b4530d40e1998eddd4abd52dbcff48d65bec67f3e3c6eb52af272e7aab97299af57eae5c6951b616a5e33f376b7dab2345b6dadff001ff5c564f4b1579387e9ed1b32c514ec38f67cfe2e29db633b2eeeab1d811cbcab6902aae5d3cc7122436bde4d65a5a408bb7a2f31bd59e3fd2151e86db1655e9cda41f5edbcc9b7913f3ff5b97f357f594fdfea17fb1bc53e80c2653a479c8b7733e19044d9d24dac72b2c8b6a4d3e4466381be7da6ead2f61cc15318649fdd6a2cf94849a6d3e2facdc158e7585294e89b4a10dfb165803ccaf00b76a994725e3aab20b0d9adccc08d4906173e16fcd78702cab5c4fbad9b3241b9c9022310b7449f5c4d95f97d4d6b099adcac252241f4ec7b565d8d3dbb5b585fb15bd53c7597a01eaa5550656cf297dbf391e6b048d6ec4dd6ec46b7626ae0c0ee90b56122cbc55cec299c19042526a800499d26f6f4baf2572c7a22c7a153827062810dc127d2baad362e192cccc966d706f658b70dc4900c3c1525c23569be46bf5a6f14e6b16a72cd6a5398cd200038ae8240209bf05ae3c6c618ec1226b2cf6de2f51eb86c30f47feeb7f79c7d4e570b7e867b7a8c9b37710dfa15a5990623723826c8dbb38b6d2270137f7adc54d6f066d7e9f7cdce07b8ae9f3f63182335caabac27880d8755d9645761aab63086f69e3d1bdf8f72d2b10302e26910019def92e5f92d2fb9ee3d17e9ed7620a19355c32607f852a34506c408ae4f3bf62d330cd5e2a38994fa880e584f8ace2491c0755bcb7268f5731c5948e4785d6bba43a179aaab0d51be721c8cc819762e15aad8c777f07acaacafd92aecea4622ad8067b76a6a5866181f322321cc2d4dc9991eaebc57b7059c6588abb87a32ea9ee3769c388b6b2c89c7edb100ddf1661862e045f5a7c991b09c0f5bac798cc6356d33eb31379c01363c41a227741a23902acde020823c475589d0fb7631541e79ca4422a917d9489f95f8ace68d1a539ab69f4da1564b86d3c7a99c329cdc1bdbf5cecb035fc578b308558c35ca2b5a90923d438d870f9772eb43d4a08e04b7ab671fff00469b8d2a1892a75e99e7d2e1b3884d8c8e045f87e0a34ac573691479d428a9d4e73266df584f6e0fcc0b2ddc69a30ce2391bbe24c2f267c517d6045bf255aa2ff430f7817acef7f6beb2c5286d9ef8cb83a15593aabf5cabc96b0768e1eb2652b12572452cb7990dcb77f7b80b171e0dab53f13f9f6871377521b4fde3766152b117590918c18434ff0032fed5b5a9b1ff0075a834bd8744c86ab429f04a30bea3d3a36f6b4f907d7fe565b94a3282c311256c9bb2e3608b11e19c713452de529c37a8b5b1d8b982d3c1ec08f344aa937305171b561b5569f9ec5c3ae5f25669f3a958cb14d3ab94da7cd6e69a2d35f4f86c08b1cafddc5681a50c4f137c7731d501f420c9199873173fd13e374698e59cf854f5166c48dab7fc552209cdf10e32a8b49cdf36fbb34f507a2b944c774bc4ade1a1e2d9be6ea839160f641b5cf44bc2f5e63a4da04d96e0ec1eb5044e00f30b9a57e19f497b3dacfbde49b5c848b3532f9ffa9aabf1d1b24ebea4766d1b3bace01c5f3308d7dd6de9f53f4a9d389c8f507e6b61c5f27cd38864d75b0bc9719123a8feab4ad12d63f6ff000c3ac39503f4fa68fa3ce2785b81ef5d324ca38cb0a7ae3ebcc56d6233db4190cb92e82d9a8d3651e27cb532d3eab0cd4f101f59e776ade70e369f3c7153aa42c6a14f81d1a8b87138defdbc3e4b16ea6d487f76b8773c8311b49209bdbb54a43e9eda416ed1c1ddc9b8165c076e0cf0fcd705c3bbd5e9e1b8824c89ed85c002d7eaa34bf5b7a6ee3bcb836e6aa32a939a74fdbb68b56244e7c66b92e67fd63c7b50ed27d522c319db8ba9ad27c2e048cb9f0e297aae6935120421bb722c4386f7b28541ec89f7b37d8eb76714c70f1ad418411389d3e170dc022e78aafb72595525c8bad53f77710bbde36bbc5b3bf4feab177cecb30d5f453e9de6ca9d4760ded71cefdcb0c38a54ed1b5e50d19e7c111705e0e083c167736cb36d8b3c5799af4f15e223268ab6f05c6558a834b0953cd81bd8ab33aaf14f8b5e2956ecbac529917e6b6d7ae9c1609ae4d3c9e55d9526b22ee64813a2e161fabac5b6a147489e67d29c457e509e5fc565357b57a9cf5aacf923757adb21d18d126642669dc60cc70b2c3c4debee67ddcc80649e775b51cf9af00b67742d445f1934475ffc9abd05f6e55567b53abb6fb76fc3fa5d7450253e706441f6b233ed17fe8b0e63d5e2144ba8b780e617369c0fd6b715d3d2eaa3030ebf66ad60daa975082022488ef65b0b77319ea6fc969af80b0a9c337eb456b8e6b3149a9df546be6bd0d3757672cf29753e8ecda90ab499f91f47a735655f02958c112f9a10969e46162c3a22c3a2ae8552410842080562c3a2aaa4824fc2add65745532ec56bed7b2c953a4dede975e4b9a99eefd49747abcfa4741f35ea66cbdef04953689f58bfa476a1352fecbb6e80b2be4f17bf46ed4cd87bfe0a72f9a6938c9e5c75485666f25e49937bfa5d392921d69f64179f6bd965667fb3dea238a818a39232248f4893e0a33a44fb8d5cb8a76dfdcf149d63349272b257c82bac8a1583c156d97bde082f6ace0696fb0e56d64f551376fee78a94b250526ec3dff046dfdcf1448f6bb9400a5099c958fb7f7757bd0825430290ada10415179379262104a860948f6bb95855e47b5dc9c821f064909523daee4d400e421250348cff0067bd255e5527fb3de8020ac2aeac2001084e400958f71f7685659625ff00da8f89401493cdbb1214e5f340bd85a42108180abab0aba00a6fe4fa27d2e7d1513c559a8cef44fa3cfaaac78a9f60a128d9f6a10a0a02724a7200109a8417f5e48210854209a14d4f58740abeddbf402ee3aa8dcf54d41e0a3d992deb2197620dbb17a78a13836105ee56e4a48403590b95ee56e0bc561055f222fdabdb9e89c853bd92f917add88d6ec4c49d71fba982d5592acf8afab975489d6caebd1c4a1026caf9126dd88712761ed6b77597963d13d0512c15509bb0f7fc141046e182308d70a3add88d6ec529e08d992771d5171d54d57500a392761d1574d4c95bb9bd82915657858150cc30705fa29fd9ff00833cd3a0c77891cd3b68e716d62d1657f1ef5f9e10b085d4e9521b6514f25bf0bdf684afda4d0be05678668f84b049632226f87a9f273873cb3e7dcb6e939960f37e5ffb505ff4dbb490d5f1c2f4ec3d4bc2d57a88702c22a3380cf77d9fc3967d167dd377587f01c2d695427d3e7ee60061bd7af17ff8cb52c7d8660c4fa43a3b77982b14549b30e2f9b548496326f6f8df875e4b23a686efaa3872450dbe039f89617518fa3b5a8ee57fd772ea2583cf396eec9e87e92e985027bb7747af5367b99f7d8d62a1be116b72efede4b1585263cac6926a2e9db4c6f4c89b67fde22cc67817cfe1fc56d94065e61c092a4b6a13930c86770c0b8db4efff009f6fc96bda19a606cdea4f05171452f789a7d4565c6dbc7b2fe2a45f6f074950534206104210802ba9429c930902f736512e89ec65aea570abcf752e44b3103ac4f00160dcd7483611254a583755e3ecbb18364b8e1709445ae78ad4a7d69c1fab38858a9d57a98393abe7fba93be28e9c3f4fce5dc8e83adc72e0a84caf30906f147e0b486f5071517fbb3aa8ec09ec43a7b4065f78a96dc8ece3e2877c57d8f878170372fdb4a38cb6be2a4316b2bdc4df05a51c5941996d8d1e738bfd5bc36529b8bb0cc8b6de91a822e097fb981a2bf0d8fa3788716b222e672b12b15530f1a84b5cfa5e30c1b3effdd84db8e5c15e9751c15362b4510fc15d6a2b7f64cbc37fc3788b1351c837760fc02ab3310d0a70306dec495ae40cf08ceb65abda55d830d61d9e0113edf184ff00143b62fa334fc6aa4bb1b86d38185b1bc4b12f05cdce4541e60d9d20ef748a85e219800f254e555dc378f75adb5f48657086b28d9a67ebe00eac37e895362205e1cd5f7acb5c1d8de10a84724c191cec93fe33af56cb6bc09a55db3f31b837da9c8f0cd5fabd277905c4823adaca94441c9586f5298dc08621af0f0b13c959590976648d5668acf6566b354a488e18b5a1f88b705a954a930643679c17cbaaeb30bea7cd8fe9104326fc098962ded11bb8bc522d0db303a15cfd568959cc7ecef683cd47e377671797222a55665b974c1b3a942f71c3f8ace622c2f42c4f2bcfb86a20270b99edc8e1fd16cb52c3d78898db8f8d960a6d027b4985db79a21887bab953f1cebe91d6b35bedb3d907c1aa617a3c89d3a1be20f3455dbc46d00200eef92e98cb12d6691ab48c574e89cb724085fb7cee3b725a9bf6149ab457a9cb0d5c585a7378ad7ed28a5e12c6d42bcec3988b786c2d95ff009a2ba5c1f2856a251d41b057686d4b73566983a8188597133da812678f8f2f15a71a0e8faa3b66c705e20665bdfd16e387f0590fdb3c6ac67ed1c519aea9ff0018b7d8dd671ae9a00110a9502fadc07ef7cee9965309e0a54aeaa1de7ffe9a09a3e8b1bc50c3365e289311f662595a5e25d1ce13953a65330c3aa83d88fdb3f8473ed5b05634ab84e7b5267e14711db8580e7dcb587f8b702ce8e280e07722fcf58a4cab855f035c652b61b2cca30989b48b8b2b70cd3b685bb536224b73c16aa44f71cc444782de63afe04d423f62dcf0ed591638f700b29a238b094e6f145f54924dd63754ec7f9b36426a9862112fe8b30dcfa4413ab550f510b89035b2bf55ae6909f4aade249b052ed39b81ab7e0b32f71e52abce377325f963fbd6e37fe89adf13b6a449860c318524b78a1e13e70bfe4b6a841c3660caadb2bb3d8ccde8d9943a38a5b9c5d88e6eefbcc9b4a6f6e5d48ed59cd0de36f3857eab4275380f38ce339b82781f8ae6b547189f13b92e2a41cce03d91c07eacb6dc05439b4fab4a71042088c5ac38f7ad5a6b15762ae1d1c6f27a785f4cac9fc99d13491498db38f3e3483544fca7803e63f15a698cc591165d96ad4ef3c51e6b6c8646d95d723732360eb76075bb6d658fcae955567b2be99e43453cb712a217a411c42f2e0712b926e2284eb5ee8d5ed4bcb02b29a10a338004210a0012539250008421000842100084213401084295ff00086f07a266a1cc5c73598626c36cd4f0eab0d6baf643e2ddc0801b5d76341ae55cf64cc3aaa7db13a1d25eeda01ac73e05660440f35a3d1aa1671ab7c8f15b54a73717e8bd5d562b2bdeba38162f5ccc92100828574f24a9160704155d79b6f77c5206e707a84214fb12ec940842127e234fc2e825dcfd6f0515353b37e8b9ade0fa0a592bc9ddb3ee534dd8fd1feb76f04a9d26d6f4baf2501f320a3b09ee667d1cfd6e1da9fb0f7fc14ec3a2057af7030fbb429a9163d1163d100e1923f47ed52b9eaa13a4dade975e49bb0f7fc104ed0dbfb9e2a13fd9ef52b8b28a0aae452b123daee48d97bde09e81ab909fecf7a829ed65ff00a3ff00528d8f4400942b1b0f7fc11b0f7fc100289ba7426fcacad37a71122e0109339bc52b8dc5d0355793dfa3f6a82f2c7aa2c7aa0975498a56367da97b2f7cab573d5047a98addb6dcaf65e6c35fdae1d89cbc1b195c22e294ac2766452b123daee5142692b92d272a2ae4ae682bea1e94aea8208c8a55e7fb3deaeec3dff055a6f2541c5652426137571522484d4200a8abcff67bd5e5467fb3de8231831a9cdbdaee5e4ff67bd7adbdaee40b1884e4200abb5f77c556b1e8afecbdef04bd9f6aa0dd862e6f254d5d9fecf7a82a08e8aa85672b72559119e45821085727e235352ee6ebc554f70cec6a108554b2541084e425901284e423002509c846008ecbdef05256157572d28e06a12909848210840024cc17b27245f2e281732b21350a77b0f58a426d8f4529126dade9f4e49b12b82921390a054eb1284e420b7ac4ab1b0f7fc13f58af755bff00bbff00d4a48f5ffd2b6c7def04bd9fbde0ad13651db13c20f1519c0a50cac9d77c91346f0691b4fb43a13a27634d8fce33c0e3697d39735fad5a3362d8c55cc47152244885ccc06c1c09f3af2fe19735f007f675e111358e3fc6d14a9f3b7891228fe89cf8f0efb2fbeea1fb2fa32d12c2ddd17145926442dffb9e1db4fcff005d8bafa3ad6cf61e23cddd9bbd7fc18fd1c4986b58ceaf8a0d131b36f44890e2b0f2d249cfeca47eb92348340718ab1dd39a3cd1438aa306b6bd59bd48492ded6fd772cb683e9f489583bcfb4c7f8a1fc1559a5cc3fb406f3cdc703d8b55c16df065774c550ae4aa2e376150924fa2fc5989b76725b3b389bb3c9bbe961bc53b0a79b1ae13ac56a5381712290e7613b97cd5bd1a50e461ec16d1a3661579110bfd1dfb8db4f1f1e165cfbca12af8205628d42c518a71751260b1910d1c7c2d65d7a932b654966df7b72e7692afb67050597f90b484def1f345c75519448a505648b2f149382baa6ff8456e8b204dd527c2fac1565d1a74b1fee726a0fccd33bd71b7458a70fb549d4072e6b2d8824c461040c8e4b08d9bc427c26743791c92247b8d338d546f3da230738846fb0b98837e561c57955614ea791772e4f1c81e8b73869cda8ec436a749b491c335ce715cf9db59e35b864b1eab31864bf8db67a9bf931e5af9ea76eedc44de28bf7a2e2894696c2f053daef5fef33a78cadcf358a98fdcc8c0f3dccb1ebdcb91267e7d3faac5e3072e4d1999a1c17a4ecace437e07864571adb9c4f570d365f26c4713ca993f776ce77b8bfe037312c8eed2a6ff00de6fe169abc76edb82e6d4cc6955a75361614edd9b6d78b823d79fd5d6c2e28f4da0d469f4d34f35bafbfb38dbbf3790dfc0f5f0488dce5d88d4e9fd52e0dadad0ad3a114ec494a8631f541babbfb215b9a46b36a54e03af25a4626c4ffb2aea1a61a9ba9efcdf78ddfd4b72b1ff00ed32b8676c24b7317520dec98b5318f64474da89d7ec8746fd1e13c4305b59bcc95ff2f35ec2d712c826e63700f6f05a7b2d23d5a1b49aa44e18db812322b3ff00b5588a911433aa6c77f627fcf303985a6ad5a6b28459a6b64bf332acb1239cc38753a4836b11cd66e3abc4e21d578df6f7e6b4fc418cc43037993b615aa7cfca4b86ff006caa8ac474e71b1dea7eaffa0e0a72d6f38c99a1e2a1359ce0de194e89bb88219108ddc5fd4159d9335bbf8408e123a02b4261556cf3ed45b870e5fc567d9ef2e62bb79d01039ded65b2bd442c39fa9f1f3d2726767511bc7e9083e0b1b3e82fe59f404247c9786bd50a7cfdd9d43970cf9acc37afb09f2b58447bd3b757f467cd9246b220b7da41f02951b88a020cb8c85b9fa8a849b000dd517187654e8354439f5010b7846fa6b78b3866ba5e8880db18491c1569b35913ad148ccf40b333b09b8198b9b762c7b8a0d4a1f477607bd46ccf66bab534bf848a068ac6a7e843ab9f65c855e761189b40626c73e6065746a6ca2d631452623f548298deab559306adc1edb5d2aca22fe8d91be5de4afbbd5e466e5c6d6fc05ef655e6c0d67da175486d16af0f46eb649589a9f305dd5381e97370945c61d753afab10bf51c12ff685bf7debecd7450309cf3a91d21c1bf3d549fd91c1107f95707e256e2699459c2d04f23e0178286c0db21921e8e25bfaa47f934d9587f08b58c914e336e39c3c149cb3a4f1f34b63dcb7014367cb5539bd2a43788c50c309bf62168a1fc112f3118aecd05cd043887561a236919755926d84dc6ee3d4f82deaf966a93cac36691eac67e06e9b1d156be8c1aaf3764e3fdb3501b4a77a9dc89239dd7b22baf5b82216f2a1bf1c935fd5dcbd9841390f0556284c76caca654575f4468adb355f3e8e8b81315ceab981ab98ef388cc5d60f48ade4521f42e8c425499e623c2ffae2b0d457f1d26a125d4b245a2cd6f7a40a04ac718267b66d689cd8b891f25935d5fbe8692e4cda9d04745ab8f3f8c8e59e77a57135194a129ed36324359ed8db8db92e433e389b3889b3804450f6dd05c4f87393c3e2be617798745beb713dd2fd1f0bebcd73ce4ed50e573e08e2720b9a37c75586f24c30f2f7b8f8268c755a26f7979f586eb4ff0055a7b39167e96d6c258c1d0c8b2865ccd969d0e909c65b66122dfaec4c1a439038b01ddfd11fd52997d89b3f4eebabff00536f10df30178011c96bd231d5248066433e4dc74c8ac8cbc5987e701142f8ff00f14caf5954fecc3678bd5c1e251320491c4286af6aa4712d0632007b6eefe6acca74de7e7233b714d8ea2bfe4cb6e93515fca2084e494eca15b5aed0210852402724a38a6400108429218248ca2ba720e481928a90f62f3633844782de29f3b5a58bae7a6f9db8accd06ae2410da7c565ddf19e43d78aec385aed2aed1d05bccd619c4ac8e0b0eca7926cb2d0460c20af51df28e472b8253392526a524dbf6306a129352d21b58210840e3f0cfff002dd9f597923daee50dbfb9e2ac499d7bfa3d39ae61f414f057427fd1bb1210402b084eda76201028edbddf14b52d8fbde0a83b08439fb5294a678af15c482f363f48b6b78267dbfbbabdebcb39e88025f65db7566262e5c76eaf627d3e47d5f4bc15a70e377bfa56b78a06d7030bb2f7bc178acd3feed0973f58f3eaa33792a16109bb1ff78887664949d3e7ef57f4bf920882c0edf8fef8552217e7656e4f34a9a3302fc155726a16a099b5f77c578a1bc94272a571cfc1640813c5af6b77aad3a75ade8f5e69ecdfeea09d5e1dbc5593c94d856736951ea8cee956273b2f62266c573c94c422caa57a3d9326f7f4ba7256ac3a28a093742792d5d6584c932f8e6932b9aba01bf057270350a25c43ec8ba92aa630873473473509bc959b16fe02958fa9db7549355c4e0108420724793792aaadaa88136cb0b055494e4940a1c8494e4a9166254a6f24c49564f234a4949937925aaa7833c8125392555950422e3aa25f35000845c754e52900210856004d42f72b7256f88df81e22c7a27126fc54955bda315657b1e88b1e8ac211b83d64143253511c55894b2574d5e906fc17963d102c11b0f7fc1163d13871464862554d87bfe0af282b95131132260cb5aca33c0713e74fbd8e57ed5617845d031565342b937925a948a60af73d5415b50d87bde084c495d0af6c7b52f74f7c7c9309c60ad0f15e9e21487d65e93620a18ab56642c82792f3691c897787e29e61845811e29d44a539c4589293865a8f4aa2ee4b7e17e696de3b2963d903f48fc9170234a068630650ea4d5fc13f11cef3c541b351c241cbd6f6937f15f4c6931c628a8d1d9d2b0063161479d190674f70df6dd2f9715ae61e95329b45a7511b41b162da4eeb224839439f2598115c5956cf30aa8faebe8f196e856b2c7659c1b0b5c4c21c366993eb0e1c3ed86c37f2d789e5dbc96bfa358312e16df25e38d25b9c441c7d844e9aec776e37b782843c78af4c36e6b1bf376ae987f4ba91ed7dfe3f7f8e25d569d8e291230c8162c1c532f3fb3976f45d0cd76913c8d47f28f7ae7319bf25e42af5f9db1ff91157e2e1f4ce970d45844327520f72f619d2223e8ce06fd1731bf6a2d75a179ec7fa83f13f699d561b5ae0dd7ab984a7cfe45cca733c13f156a4e24aeb7e0fe223a449d0f395bf90b7e3268e89aaabbe95944b51831b5607b4d8fc53dbe3975f56749907e0b4c3cbe9a7f64434b654c6d61bc11c8b936375838641ea1641fe2094e61fbbc30eb1e59aa1becacf8e69b0f234d8f1167a2d3b6aa50b0bec1e4d9476062e3cfa2c3e2761b7835352f609d03a9627c26e5658c2c6b17caf7ffa532e9d5757c329a6bbf6577072e7ac438a23fa242070339b82b44a53faed1a65e9ad671d5277891c8feb35da6ad86af11d587eaf0ea1692f29ef682fc551b8b8e1158705e7b515cb71ee34dab84e1935a6d1e0cc473653b7b28d15f186c0c59489ddb6fd715bee25955594f58624a6d22454db37b7d87dbc81970ebfc96bd55a130980d728d4d92e223f78636e239e7fc9470de2ea361e96216d156243707d6b6710eda48f85b824d71c32b6bf72df1315597fa3eaf3e9cf5cb87f87aa0e61f5a23cb3eaa784e75230d54fce34ec594ba86b4939b93c2eb6498e69189a708e9f5ba4cf906f791586bfc7bd21f60e14f8816da3ea038b7d6b423f82ad90db2c97aaff00edfaa45e9356c33519b034a8d6a439d6beda4084cdbf4fcd54adb86d81f0ece8a4ba267b99f76524c59c892b0735c6396de95370937a77ff00a793c562d9604c6588dec46a2d66b7bf19ceb87cd5e13c70097dcdf06cf4e6d48c6b8626d71a538487d26e2716e6daa53682fdae356a709d56db62dc6e2e0f11f1f0561b521c616a24fc3383d8c2e5c39076f3e7789bac75298d2b043c9353733bce356920ddbb78724dc6e5c0abbef6ff00fc30d49715163579f4b9b164dfd40bf12bb0613bedf54762e67224d5eb1519d5289b02e1c5f81e1fc56f14f2f68ec258b6a917cfaad7a3aa4a464f257fb61b246e78927525b52a2de8da7722b4464f44cb89599ec529f144ee2d7733c4e1d02b4d00395b82eb3462d3e9651af71b061b2eccd86e32ed5b7422cb07469394110cacb39165926c3e8f15e5e6e57f04b57b505bcb396a91f029e3820f05af1c1cb574e3d3312e30fd3a78b6c00b2aff00b30c2d612615988feb2f2e7aa4c92c9aa1e52fad61b35c7181d84e3ac6c39f058d7d80a18e110b303585ee56e885471c8c8f99bfece7a307d4649168f3f8a9c3872b66c35cdbe2b7f2491994a3c518c0cfeaf39ac346a2df0bd4e2ccb820f4fd1527140abb687eb08bbd6da38a6dc103256c2c645bd749f273c9ecab50f4b7c5625dd3decd2499417582322ab99609b90a3be8dba6f330a7e68e4c69ce6139cbcc241305ad70bb01a7c9703d2957551c5069fac3d48ba4db5cd9dbabf5369e9865c4e610b29e631e8f35d030a3f971d3f74bfa5205ac4f3e6acf991a0e10c3ff00c5596cca4b73782086e515d3291cff0025e5ebd74735f67cfba73c25e68c4d156dbcab37a8420836e0472f12b9b6672be7d17d798db0bc9c5f87275226dae7386e3a2f925f4834e733dacf8b56737363975fe8be53fab7c67ecf57ec87c59f55fd15e63f7da254cfe511484217934b27b8f97608421412f905e7c17aa0acac79e0aba22fb27ac4732889d38943e8ce4c04f117e2964d979973164cf6cb02add3536f1345d93896bd22c0d49c9f844b2431dd7356e66ac0fc0a321c6ca61acbabfb30dbe2b493e144da99e909fc3ae5c48862872cc0e0ad8d21c03372c445d2c6d6f05a2c76be41453e3e46d5ce4e7dbfa6b4572c3474495a40a54ed610b79d971b0192cbb1c4742756d9d4e566b9542795b82f0c37cd68afcb4d7d9cdbbf48e99fc19d80d4e9b7c9ecaf9a607124e4235c641373d8ac4a7ce1bdeee62cf92d50f34e3da39f67e8c7dd733b0c3108b82f49b0bae64cf16d5a4030cb706c5648e90aa7c3769197bab655e62162fc8c377e97d555c2e4de01bdf2e0bc30e77caff05aa32d224ab12e69b99e99d964e562ca4cd36dadbbc27c7c8573798c8e5ea3c0eaa1fea6ff00866af193bbce8ae470badbe4b836000bae3ad2b94f7132d21cda2198cecb7fa15576d287a76057b6f0fe521756ab6f93c7793f1f6d0f7b8e0db10aac99d6d6f47c53f585ed75dbce0e722650a08ef55b18eaed4bb268504258f3f0cfed7b2ca49bb0f7fc141730f7c5852d97bde0ab58f44f400210a2802099b5f77c52d7bb2f7bc1509e44ce9d7b7a3d79a14b61eff828c9937bfa5d392b9059de7dcf15ec81f493dc9ade437736fa5defef704ad97d27eb78201199ff00d0bf6ac6bfde7798b2f9ab3f49fbab55e1de8905cf1ebd52dbc1a8a56727273c390ea8d8e76d6f04e5e9e2861588d97bde0ad6f12f76e28d97bde096782a364ed2ba8ab1264defe974e497b13d7c152bfb182d089fecf7a4a69239494a573514028641084efa476280f89e037591554c7adcad652dbfb9e2a40b0ad4be6aacbe6acc2a1bc10de09126fc5009bf15e2f47157167bc95671c477abe9312a52b3920a32b9ab523daee50534e05f990426a52a00244de49d3792c6ab8ab1e32454b61eff008272104c560ae84f1c17a93bb030a2856157572b9c9466f24b4c9b2f86696aa66902109aa52c901b199fef11a5210a47f6084d4a40026dcf5426dc209488a9214d04a4084210490429a10008428d8f44b4b258920a10a00828906fc102f7524ef91504cddbdff04b528898b9213c154b27a8422e3aa82c085e81b7e7ababdead3665bb5839ca21cac82aa1828ec3dff04e5242b893d9f69edc9d95fbf8254a95ab7f4bc13a14b26ea5092339b4936d555c37bfb7e0afeefbc7b37d55e11b0996fad650050304987ed1774f23bc1f2b16e9824548361bb515bef1c6eb8abc88389161ecafb5bc80f05c54ec16f71c983d2abce2249b71fd5d64d5d9b2063d4d8e1c1f5f53c58c60f67e6af8e0abc916b59581c1708e2021084102909a94802ba2e7aa108242e7aa2e7aa10800421082010850529b4191d7cf239a0250249cca6c1c132374e20de59119a9da239dafdea400ba9800852ef9b1f55f3ad6118f34e6c5c174d8ec1cf337e29c5a53e7583d66de7754c7205c1b24f0e0aeb5321cb577c7e2caf3b0ee1b9e21269f09b72bff0025426609a4c246e2f9f36d5e168966387045cf528fdcc86ad75df6cc0bbc3756912ef44c6938037fb603c14bf6631239caa18cdc0805ec1b800ff259998782ddb47644513bb1fd66b668ec57cf6487dbe7675c374964e61230354275ed547000f793e4e13a4d26dbcf2e8be78fed07ad629c25a58a1baa0e237d4e9150a41315b3eb7e62fc57cdec74efa5fc3b109f4cd21554eaf284f0f15ea2ad04141339d3fd56a1da3f4f193f674e84eef48cb95c5d50c415a9b576e1a86fbbf1cedf92fce6ff00eaaf4de72fdb48be617b2fcab34ed2af6c6a61d6ed09b0a1433b4a2f31a6b3e4cfd0a822caf6591612898628cf3e017c3f82bcb83482ddcca8b17d368b51a6806e2f600f5e0bef8ab3ec358470c9c635299662363ebed6e1d8a1d724752af3945b1f5d6f9337483ab20102fc02cb91610f6ad3b09e92747b89e443e63c594e1ce2ced7e9f9ade2616f35beb3672da70e1f5aea62795f270cdb9129c8d87bde0a4b445e0e328b42a7fb3dea09d3fd9ef4bd89ebe0abd8b7c1142f6c7a22c7a20323d79b23fbc9363d1072e282ed6d12857410781491241e11f820a914b9bc9796b26dee80148421007bb2f7bc178734dbdd1c410139cd2419c722e0bdb8ae09a78c1e29f516d899b41042daa570e09cbe91cd77dd9184ac562fc3ed71561d75427007d221c89e4474f8ae1f9bd147c969a55fd9e97f4c797978bf211b7fd7ecf8fc803985111762bd5cc3ef70fd4e6d2ea728c33a51b11d554d51c02f88ea299e96c75cd727e8fd3ea61aa82b2be9914210906c22a0a6840b6f00842820acb804210807f882108404bf1224f6a39a2c7a20037e08142ec3a2f53529038821038a2c55ea1328e0b0855d08ddb456323c46652dab08e389944770c4e8433a48b0b11f556a27994b8a76a9b08415bf47e467a49ef84b939daff174790afd7623ea1a1566455da876ddc7a3d1662538d616c8af9b30662d75879e83091bbc446d6501910bbfd3dfb69f224bd6675a4cf86e0afacf85f3347918252ecf87f9df05a8f1d7bc2fc4cc837428c89e33cafdea4bb2d1c1a815855d584846c3f0e21e29e842e69f43bbec108420b227b0f7fc17997f97b76a61e017bb6f77c5266f9c10a39108428ab962c39a76eed8fd2618ec79955437bfb7e08861d5e69cdfd6db95d5ca58fe84c8e25c8ce136b0576e4f12a5b2bfb5c3b17861cf8a4fb31f45abac8af3d7cefab1704adafbbe298ac9e00159122091f54fd65415bdbfb9e2a26b2f24565b97cd34b1913e418a21c1519f3b87a3d79ab2a3b357c8afb0f7fc152d88fdef059afa36ed67398e8b1737925a13b442f6549b5fd2f0505699fdaa68e2323d49d6e3e0ad89576ff5bc17845d36171500db7733bbec965c56c3dff04256c3dff042ad7c95e89edfdcf15042b69c410e49f2b9af792b3120081e29e9041baf1584939fecf7a87dbfbbabde841e0a1bc00a421099f1026a0bcdafbbe2bcddf7a9bf56ff0092008253800c17e8acce6d109c4b59fbc03caeaace8bd0e0814de48a4af36bf48beaf8af104212af2ae78a125968f00928425d9d962a41c0a0f04f854614c80b4210bdb8e88b8e8ae5bd884a6a133643f79046322d0ac5c7555d04e0b0842f00164b4b237e27aa6a0a6a62f0435904282146409af3e91d07cd7a8520414d4128f1508b409210856183908421bc8a488926e98a2a481ab904e9326f7f4ba7241e2ad213149e0b7224fd1a2f4b8f628b8121b36dda18be93f0503589a24eedbb0fff00516551467040bfa3f6af10852d9402e3773c40d6494214f621adc4b6beef8a05a69cf2b25a1305129d236e4b66d631119afd55d0ae139983747986f0cc6059ad3ed7190e4bf38f40d84bf6bf4bf87a910c1b7910ce867cf1c17eaa306f149930888e7c572b5b3ed1ccd748c9a1085cc39208421002957561574013dbfb9e2a0a08412582a292851ecda4264d084290042108004210800561574200b0aa27c50eb735e6cfb504894272071546f042e0ad3782db346b11f384d111e328ad5e78d5175b1e8f23b56cc3d64d96ef1cdfee5317a94d56cf953fb4f5a1de303d4608ef086d3ad0db8f7af8597e83ff0069f31dbe12c0f50b5f7675361bf4bdff0082fcf6805aebe8757c11e4b511fcc2e7aaac725652cf04f29d89330c26d62bf5ef094a938f7c952950037de30af1e3c82fc86305ce4bf5bbc8d9e79fbc9630f45afa9bb349d26dc78724abd620cd7e3ecf5ea123e29e3975571857f13520834bc4afdaff00e83922df2392a95095ba555db2d6fbb4eb5aca3110495f3bbaf9d737c9f63869e17d7968dc1ae99f4a149308a76377e2def705b9533cad34bec3ed9f319dc2d6cff25c6c0052c9315c5956bd7df0e98bfe93a4971289df1bf969e3f81def553a3521c481c3d1f9fe4ba253bcb4304cf91f49c2d5736e1e91ef5f1d45082724c959103a2db5798bea31dbfa6b436bced3ecdffeb134587fc8d5fc15c1e56ba24e5156bc2cbe31860d6851143609ff00d7ac3259fa4f44fa47dc34af299d1055a79902bd1348ad917047e0ba231aad3eb1221734ca8c9712ba8c97e68c5aa49d603259ca1634c4787cc10d12b136443072ba657e7b2ff3326abf4a41c7f067e8fc1722d7197452b1fdef05f0d30f287d30d28da1c471386fcc39172b6f65e5858da45bce14660efb88bae9d3e5a9b51c2b7f4d6aea78ecfad36395c2558839af9a65f9654c88fadc0ad8f4ccacab5f2c2c3b108855b0a4e8a336b8cbf8277efb4d2ed996cf05ad8f48fa050b86527cb0347752761abba6bf6111f866b7a93a72d12b9741a35c5cdcc5d5361abd3cfe2ccd678ad556b3346f162389477ac1b1c6f826a241658aa9d3fe0e02caf9c29bff00e41bff00f357f7c1fd999e96c5c345ccbb17805caf14e11e9037e7d131ce2fb223097da398e9db05c559a2c3889a5cb9a7e432be56fe4be75eceabedc9ad9b396b35b39b5a613c73b2f8ef1ad123c338a6a34619c5226de4e56b64be6dfad3c6c2138ea6b3ec1fa07cd59745e92ced7461d084a5f3f68faa26085e5d7aa0805052bd91708248a117ba2f64002108ba08c82129797082472a93fd9ef4e5e1e080109e08b71484a24df8ab7c085c16909485517f1042f76beef8af1445648ec7ca17375b7605c70eb0bbc121dc00b09f10872e03e2b4f9673192b52e2b8cf20ba7a0d5cf4762b20723caf8c8790aa55cd1f4b536a2dddc885db79e229511b020accc13b58036e2be78c298ba7e1699e95e6328beb0bf25db291576cfdb870ce789b2af604710beb7e1fcc57e460937f91f10f3de16ff00173cc57e267d0972a6dafe8df8734db95d7c1c6aedce771f8996ff005c7c1544d4cd97bde0b8c7d272a425493b63cdcc599e06dc54a7fb3de82c9608a12f65ef782b1bbcce812fa27b169bb0f7fc143ec3ded6ee4e4740572dc3699f57f9af6449beb7a5d392c9b12df659227722dadaa6f73d523d8c6a79168558705ed8f44d5c9047e8dd8bd707617f6addca6ad490dcdc38ce1e9d5182631c9415a14f6dbb7debfea4a9e6c46ec32e64aa3b488f09be082b5d783285bec3d9b6b2adff00e9bff724fd27b578a470edbcf9df540c92b65ef7822573566e3aa00c7ab806c7b6e9e84010421094964b8251e29a8455de0ba5814ada829a6892c6dfdcf14d55d0802c2108410d0a5e1e08b8ea94aa90bce08a6a52f65735a10a92c8c421084b2402521266725043782aa948f6bb91b7f73c578cbdbeefcd00c643c17a00b1c958852090b25bf22d11092ac227fb3de9e912995d20f14f50d9677d6f0432b67d8a53504152591610a299b5f77c55522ff116a09e436bf25e7d1b79421a562defedf8200b735902ddb9f68aadabda96ad6294707885242b8e4b245097add88d72a4870c9ed8f45e806fc13145508d842c3a2108542c913494e494e01c8428ecbdef0400f952b8fa5e09b9762849fb0d5eabd518051c821041bf0458f440a25b7f73c534a458f4458f4460824842133e42fa2284e23b125533815d0952d8fbde09895f4923766aa1d8d1572c23ec3f20ed1d40d64d47486e9b01701b37d61c05b8f6f05f68c20c3c5732d08610181b47740c3b10b42d640338f42baa4500165c6badf659b4e16ae7be43109472c8a166327c06a52123562e88167884210410421081d51002ca6842525901c84214a791441085613082a2725cde4a296de08e8b6aa29a0714c246aaeac2ae8198da0ac2ae84b4b24b44a70c8059fc04752bd2c5b230d96bf3380598c233e3935f6da9ce2cd69d258ebd42c117453a5e4e43fda5b4ede342549a8dafbb56f5afd2f7fe0bf34c5b91bafd5bf2f9626a1e4d15c36beeb364b8b76f55f9416b735f48a9fe099e335395304120665085a04a09732402445166bf4aff00b38aabb7d09b9a70ff002b589a6d7e0bf338b731ceb1f475b9afbc7fb352bdbb5631a61288de2d849a91ced6bf62add1dd1c17a6cdb72347d2d537cd5a4fc51209f4bce73af976ad504e272b2ec7e5674114bd31bd7464fab7f2a4cf1f1b15c6b52ddebe6dafaf65ee27db7c558add2426866d3ff307ff008af55742cc9e4d981f37eef0f7af761eff008266d4feeaf5096412272f9a924c99d7bfa3d39a66d3b1401255b6c3f77c5375bb12ae3a28d80c76f137af8278f59d9658e1c54d4859c60c92ad1704a933af7f43c57a73539138fa1110b4473e0bc86758db57e69845ef9f24a205f8a646d943e25fd5192e4b21fce0328be69c2a8fadade709a49e40aa195c591065c7350afb57d99edd3d6fe8db60d28e905949fa3629a91ebebff92cf53bca1b4b54ab7fdaa9ee35ba0bdadfd573882f622ea30c261cd31eaadfe444b41a7b71ba27d79e4dda7baf638acd430e62e771389a3e9122dcf8f5ee5bbe96701d3ebdb2af4021b0f50e0f5b73f92f887076287d83b12d3f12352229b4f702791d8bf47e9eea9f8d30c4a78daf14aa83733e1247c8d975e1647c9695d167279bd6b9f84d646fd37e393e6e1a34a35f2713fe6a33746ac801b17b3fb56eef9b1a73a9d21c03099515865c42f33e6178bbbc742166cc1dcd3fea5d67cf71c9aad836aec0c5bb4bde21e56c8ac44e62f1b0114f953a1079eb5d76e8a1b83cd538a0022275561b7c32b1e6b676b4bfab270ff2238b8e08b2ebf368d497000994e93e8f484055a6e15a09e2c259bf62cafc4d91ecead5fac687fe589ca4f455e288926cba3ffb3ea21e734f7add64e83707d62985cd3df38917e11037568786d45b2fc4d0bf57e87ed1c1a117be4bc03aae8f5fd07d458410c74daaef56be409b9e0b053b4678b64dafb2cd56df0bada7e513ab5f99d15f5fb212355f4415e0b1360b2dfb218ba19c44148dbeaf1b2a3358cf6c4876de7359e0d8dd66b3c7ea2b5ba713455aea2e788cb92a291e09d754963c335ac2170af0f144d1603bd7801b9c94d889c8e4945c7545c75552e049b8cd3920f101339d94a2264d5d54936f64de844d64b209e04e4b74d1b579db0aa0a6ef261933c8ca21703f575a188883724e4acc8791489e1c4898618810458f02ba1e335d2d15eaccf0717cb78b8790d338fd9f4e357918b431725908675c5ecb9a606c6edebf286f3ab2a77023b56ff2a758597d9b49ac86b285381f01d7e86cd0deebb11f8c523daee4e00dd44037e098b967d261019771d027f7a528cde4a9ec686925ed9cf45597bb61d3c546722fa3d9dbc8b65d78a112675efe8f4e6a2ac9153d6ff48723d9b8f8ab9f63ef5d542427edbe937d5f15626b29a9a838f5e6ff0057c54f61eff82aa781a42471894b7b1165af751d87bde096439de3eec3bcdd431438c408e3c55c68d6445285a1056345ef64126f6e494ecc02189485753468a50fb0f7b5bb93777dda570b5bc5452fa1dd903c50948574f02469e29aada52ae06be410851dafbbe2a40f1325734b42b8a2c2b09523daee50401efb2bcb9eaac2ae8484cbb04a4d4bd97bde09c96454de4f1097b2f7bc1310de406a526a14015125cfb3deae24a08c60aaad4be6846d3b10047352428d8aa17f992b8ea84214763368bd8fbde097b0f7fc1395499c95110f92ba1171d53f65ef7826152b802dc14ec3a266c7def05059d12f208421041e153515e582b2782513426c9fb30bd32aded78291e2529599bc955d6ec556d060f509a9b7ba382e55426dec9486b051304d4a4294f007b37929210980493a5f3494e4017557429edfdcf14010421350044f1522023ffe6a119c8a4b25742b0ababc9645744a2170b6fd0f61a9589f49b8628865dcb979d2f7fd5d69fd8be84f23ac190d4b48ceeb91fd264d0e4d8c37cbae6b34e2fa426d8e63c1f76d2cea49397159a735662d7576d37575af6c96b6f5cc314a89a37221ed536f8729e1beff005c8c7a3c32f9fe4b23d27de0cb5f8eddd99761566b529ff437104fb7eef6ac8c50df8c565adb6abd3f5376c3f4bdb1e17b2ad50ac48956fda3c6329b88af76ec3fae4a9fb78f45ecf130c659b4c4e25483e9ceb286f4d23394ccd6b9499384eb3098a994faed475ad9cf8b643e6b3505030637ff00bc29f4a6ff00fea2b56b782b7ec2767c4c76e82bad6564b42284e6330bd8b825c9a268c5d44226d51dda11c26b7733b34c71a3ca04ed68a9ba447cde69e075951f8db9182ca6a5f6c545c5162aa9c238da0cd9e27a43f3172b70ee57e1a7d7a4fdef0fcf1d76076bfc12a5a3b97d1455e7e2c4a15b714f732266a093758fdfa4f54b7a5b23f43169e4fa2efcd36fd9e2a926c9cafc7925fa2c5f447a6c2da10851812b8e8a53f842a0accf194365592d223aec9a17a013c17ba91260bec91e690ac084f1b28a558b0cbfd95614c4210684b238af693ea2a125d9ce1db8b8e896a72c800dd368b3fb884ddf06643ca7606757f279c6cd9c1f445349e17e0bf1e380b2fdb8c65866562fd1d55f0b48b0352a6ce6f73c3b3e6bf142a5489f497ced83b8be92ce7ce6f385ad6d9afa4e9e4dd68f1bab4b7948f14c95f562ee502335e2d86564b2d6bd97d1dfd9ff0058f31f943b3bc76f38536737fd7c97cde0d8f1e0b7ad02629185f4d3832b7bd08776ab4acfa5ee82b078b327e807970519aeae18c4b1126c377c8711f15f289017dc3e5854ede74461e91ff7754251e17e3cbc17c3b08e2bc0f99abd7a8c9f60fd33a856e8f6ff00041038a558f4458f45c83bc36c7a22c7a29587450cbb1033d8336feef8a6aadb5f77c55895cd05327aa123daee56d2e6f2407627607f7fc1490aba03a3d1c8a926dee9079a08b23f678a373d5367fb3de928299c8b8912b9a26f25ec8e67e08233c9352d8d9b7d6f04b53da7678a5a792631e45c208edbafb07c8cf49536b744a8e00a938bcea392e18939fc3b82f8f88b9e2b6cd13e3b9da39d2053b13903776df45717e722673f15bb417fa6dc9cff0031a2fded0d1f7862dc2336a2efce4d27b56fac0ef07b39ac34382db8379b5707b2dfcd7438a737ac520b96b72dde3705b93c08986ffc17297a5c99f0b785bcf045fd2879af4d3d0516cfd8d1e2b4f29afc326c72708d205aeeb5be3126c786a850d8197acb54858d76fe80703a5d48b0c591e50b8888e862535f8fa2b7948dcab93fb336eb0a52e71fa2cfddfa0056bcfa82f5a8ce0d603a2b02838b26917893bcc38b240b8987359353e32bb7e25fd6e1f66b59039f0571854a7d3e7433d94ed58c2cf399d573262f38d26439bf6dbf258981c61f880379f23dd3966b17f4d9d1f9d7d834d9b7357cceb124c20faee6095abd764452a781176abb496f4997520e1ad60916c8f0596a8486ef0dc713c575f4d194e1f99a74b6cea9f26b58545ead09fd735e63ba4970db7912ac0dee2f7b70508f78a73d30c98b54137392d862ad49ac30d8d524dc804659f7a65d4576d7eb35c6fb69bfd95f4712858b5774aa937129b6de2fa448cd6b18e1bd39848a7c6d9bc4dc39957db1c843c174dafe12f364cdee9b098613e9023815a362569af2ccc899970c6ff603fcbc4bcc6afc4e9e2f383d8e8fc84a78cb30d5d93436cc6952284e1c399ce6c676af3e1f8dd36bb84a6b174ce90ce7ef155726d3a4836d80cb3b7cfe4aa1c385fc21e619a908a7819d3dc4569d6038fe2b75a73870edec9c5ae1beeb50903757d267c390e590ecfcd73ffa669e7f4746cd7594acb668354a479a3d44fa937713c5ef616bf8e4aad39bb8a84fd83782f19596afe01ad369f35c376de71630e65c36cc67cafc96470cd0b0e3aa1082a667b7ab09df777379447c015cdb3c1c27663068abcb250dccd6dcc89ed6796f3a55a70cbe296e04f6ae7749f26d38f6f15d464d20386f136736a948916fa47f8f23b7b6c902830c5542ea5390e5fcbcf77707344ff4f6dc6c65ff00ae43ece720dd4cded92dc5fd098d576aee83ad21ec3fe46fc3e2a9e1c63407f0c6d2a8d0489edcfa608cfe4b1cfc0ddbbf12efcc41d79358da5ae2cbd84d8dc2ed12344b852a722ede63995c2e7f47b16a2ff46fb83ddcc4fd7b7b57fc95bff1bd638ee48cd5f9fd17c5c8d3dabe70d2743b0b8bf12bb760ac4d0e21a78dbc476d2cda7427983c0ad2699a23aad40de0a8b787e23f9aa31b7c4d826bbac418c8e36cae076735daf1966abc3497b63f89e6ff0050e9741e5abc56ff0023f3695d4217a84b2672c2526af37084b6f445d006355757770fa4fde20eaa3ba7fc4f05317814a183da7e70087aa62631fa3fbd6ee4e712626f7d6cede293ec19eb2a6c47ef7827b8f517f6addc929cac31151083c5651bfdc86f1dca532862c714d4a9fecf7a6a62e07e012a47b5dc9a849e8a7adbe8aeac7fe63fe951fb1f7afdc9df6bd9651b89f535d8a70e379beeb15db7e09e8494b8c49ec724c8f6bb958514c72c11ebc8d4a421580157571bfda8dbf72adc5cd9b7d6e63aa860988dafbbe29d9a13947b64446391a9dbc4bea5544c95cd3058edbfbbe2897cd790715ecbe6af1226290ac215c9d8575e4ae6bd5eed7ddf15414315556ec7a28286f005742b0aba84c0a285612b6fee78a68243509ae06defecdfbd292b7e06ae09a14d09362c3c81587051d87bfe09db03fbfe093b03fbfe09a90bd87a49bf15e5cf54a420b9252b6499b7f77c51b0f7fc12adef0353c11f37fb8aa6c7e93945e0b2aab704a17b21bca93a4dede975e48d97bde0aca14a015264defe974e4ac96fb7e5f552ae14a4ef373bafde7242cb27a273595a1109201eab176f4af7e6bb49c08c9bd1379ae3a73bf9ca737e3f355bfd9561a9e664f35571224c045813d531576338f679dd2d567ae47275e1bd8aeb0fb44f87a3941ed3f11c26f236e4dfe6b5c3a35aacfbeeae0930c8dbc771c023d7621d0f33a29ffb1a1c64dcf2f8af2e00ccacd4fc2789643a2d61a699f7f1554d0ead049de5d52e743209b5ecafb5fd9aabd4516add5c8aa856b63f46fade0abcde4a323b29f4c5a9285c75535704f209c8ec4d4649149a822dc53553207a255fdaf05ecde4a77ba08ba9ca14a59109f225ef10eb6f0d8dbb53af648d97bde0a8e582322dc7d1dc90e738872e883c1083c16828201b9370bed6f21ea55b05d62a77d5db54afc3eb585ff5f15f11cc9db33719afd1bd02521b612d06e16681beeee1d4813dc7487f59a97845572cea924353b778ee1d5a7b03706ffae81547cea95bb4bc4d599b6de6db1956e2915c9f2e8ace89468bfccce13e7c2b09a4f60fe27f266cb87e833c66076acda89fe1c1d6d255ba4b3f60e312d6f11c526898729c24453b3d94ae43e4b26f5a616d1eeacda84bf3cd721035645ef2640f8721fc16874ba84ca34ede69cfe7c89bcc8896e7a3ea4b07721fe36c451ef12a9a4e405c5fb561d3db1b3f0fb19afd3caa5ec6ff0012d37678f3184b351ad55061ea2424f3d912129932c3322696f84a813b10cf36f5cfc02dfe3c33f972453183cd273c8ab5895d89140a7930887a91cff9ac3e2cc7313a8050b064658d2db1035b85fe0b65fa98d5560c14d33d459eb371758ade5208150c70d98123265476f7cf9fc38a548d26cb733a2ddb1ebb9062e3bc53756cb93ca942693088865cd6d234598ce293b6829a0f66b2c30d75f67c570742cf09a3af1ef924cde4e25c691490fa9b51a46216f9daedc70eee2ab31d29d026bcdd31250e7d3ae3ed983ae0b9718abd86dedf55c319f01b1e201fe2bae54e8542c6d446efe23037713e295f480386775b29bec9f0cc9aaf11a5ab89afc7f94665f622c474263e7ca5396b8868310bda7e53e48fd10a84dc6583717b707561a6d422be672cff0035acb0978bf47e66c732190e29f3f29fa9f657e76e856370dd3e8354c451b6acccd8ca7200035b8945baa9466a0c551e3ab55ca72e71f68da8b87f4a9b0c871689b91f78e447c16519546173002220095a062a6558c1957828ae9c170da2f49beb1b8f9acae1fabc97f201930e7cf3e0ad1d4273d96ae07ad042747b17c59bd36704112a6c7f02adcc36b0b2c2b3746700ddc1b41f8ada69346075408322bbd5e974da986123c56bb4d2d14d98d8a111e575e4ba6ed73db886fcacad4c65b07d3245aca31832964b7c4555fd1b74b553adad245991862ac7fc11f34a8a8f559447f774e8be0135855a736206d6d62b71a5554ba916d526d6e6b3ff0048aecf8339bafd34f40b2cd0b6736c7d578aae4d895d541d6cd226b2653c8dbca931767359adf053cfe32390bc9c3fd91cbb547541805b8f82e88e709505cdc99024dfa43c527f61a913ff00cccf8addab2cfc1deba2cbc940e7daabdb13c0adfce8ea90013bc4ff00fe4b16f30058c21ad43adee3f9aa47c3ea6b965a225e421258378a0c426519a45c3d580bf17b4ccc45074c18ca9e7fcbd61d9b70bafd8dc3fb662ce4c971e945285ba2fcb1f2b8c2989a569f716c4cb0a55a26af26eb0cb95b22bdc6893552de79fd5f2f8385cf1620251cd64a3c338a6d0eb512a5da375541ec8a8d385dd531cc30f5d55b728cbb5b42785caaec670a7541bd42413acda709d7e9656ec38117baf36204ed9816ba8dc81439c9fb198bdb7fb45d003875a9ff007950a43abf1be47e0bf3fe1b0bdcafbabc936aed717f938e14e114029bb8381c4df9af8971752bcc3896ab49bdf76773a470b702bc87ea2ab189a3e8bfa3acc2955fc98742f38f052d5caebcd1ef9b1878a54ff67bd585510271804c95cd2d4d0546a116ba52006af47149b1e8a1b4ec420c16f589b2f7538155412785d6c384f12542815594e9ad4361ad94e339bed6e85f3264de0c3983b52a336c96f9a51c1551a5ba8b13b499477349ac5b769d4f9f6e3d99750af41a56a7e21c172b0454346f4a74f5b48025be911e43bff9a7faf3d19653c1cbe2f48a949e2566709d3b0d43885a7ed7cd72de93e96f1bb9f5f170b7e6b63d25618d1c506260eb0163486b6c1d7017bdf870549553daf0888ea61bf69a3dd400cfe2b79c11a2ca963f94e9dd32bb476b3db5ecc1c3832b6fdc33cbf35aa56984fa3d466d35d8fa4c8b6db9590abe072ba1648a7a997c54373cefb402fd8b68abe8d71d5058c8aa5670eb86f4f70729c7c33e4b5d88676cd0aa9ae701ee83fb3edaf249c7c71468fbcc4e9c7d3e8a781e26dd3c3e4ba362a7ada8d2cba36111e0be1ad086923fd9ce90d939875775744367f7e308ecf15f79e25c3cc7175067348a2f467c3ea26f01f1ef5e9f4374a556c6783f25a7fdaeb15bfeb2399bfd264a3790d087138f05567630c61b01364d3e75ba5b82a4ed948c3f7f59bbdbb2faaa8ceaeb69f685aca73509e79016fe2976df3acf5ba4d05364158fa2cb3d2abbdb0de2224f259b6fa4cb9178a2f9ad36737c43341b608b65d3f927b1958b9949f51820fa7c72e9dc96b5361a2dd169544df5b69065b9b88a222d6ed568d6e81503670d011c72e4b99cd9f040479c70e396d6ff00cbff0034a88d2a7c3f47ab44da28798cafe2b4d7a8963939f2d24174cea630d61d7f2c46d9c19309cc8e2b14ef0f625a71b36721e36e232b903e0b516e7143639ba0e470ccf056d9e39ab3730eabee0b542e8889e9651e516e7bf750ce26a4de3cf8af253e990e66e42ca39c59055db5dd535b4e27a858f74c583825c539deee62ff00067957524d96ae0cb8cdfc975096ce00208e6b095ec273435d5910d9bb83686dcff5750397159261539f200bcf22dc33e2957510b238c1a69f65767b20ce42ff000d6e8f887125cc5221e5c2cb28c6a35fa24e88baa849a853dc456dbb81723b974aa83992fa030cf950c479106cb5c718481d63419b083c9b11684ae54b45eae8ec4b5aac5891889149a4d4a284c9dfa9ee0f26ce49cff258d8a9f5fdb6c4e32b7bf3a99f9d964450a748ce185cd3f57a72fe2ad53a76356b9c97cd9c6af1ec54f44bb14ae48c38ab53a9e35ea98b1cb887da9121bdbf35a9625c6afaaf8823adb084b69f7f5171623adecb797ae71cd42221d614a74fd6e3ac155934eac48710918229d11ff9553d531f095725c90c571c4e70c30c4e628a5d4356f1107e1929d5a386ad8498e2974216cf8fa9717162e22f87e69efa3c4ce26c0f2a18564c425657bff258d7ec2bf5a9f79f306ef171cd5fd3242e76c5706df836baf45362b5f2b7e6ad3a7739eba2e279bc49b82a82c29d2e181cd4ec4d88cf8a757c300f2d4c06100dad75d4a97ae1938b6a86ff00c0cce1e9bb1232beb782c3e2b6177f3dc4eccceb440a519872b42b30dcf9d5896f3feae495a8a55d1e44cdece4fc974d552e3aa66d7ddf1493bf81a6d27ef43f926cfab70b9ebcd563bcf4094916fc885c89be5c54538f1524f45be059933adade8f4e6ac9701c49315f82a6a32b9ac762cb6c664928297f98ee5ea84c43860a89a9bf47ec4b9dc077a944288bb0e88b0e89084ec17c97a57352494e51d8daf82afdaf659314d4d59f24e48cae6968424278160aba10a0a139fecf7a7cae691f6feeeaf7a13d82591aa5b5f77c52d0a0228b8de7ca6f6d517ef5eac7fdbfbbabdeadc9937bfa5d39296086ab0a926a60a2c29a886fbd6a6eb0dee2df14c0df61ecdb5900424c9b5fd3f05153499fecf7a0072f2cdfa05555840135045c754200ae973792b8a92084f22579b2f7bc11b1f7bc139bc067dbd9bf7a3d8c93d426ec3dff0004a529608c0d4a4212c6a58050534296b01d98f495614f61eff82aa61eb15c1351b0f7bc147904abb879075ec04f9326d7f4fc15756125324b2e5806ce4dd45c372ddb1b8fe6a2675dcef1abdd756a7ec1d5f749e05fa8e28590fb30c2237cd747d13e1c0e67ccc4b1c179eda690dc91c075f0581c37826a78a1f16ed60b486f10dbcd233039fc57649bfb3743d816c67d3a7193ba82d8d969aa3b9e4f3fe5fc87a63eaafe456c4539b4fddfe8d0ce7026de7c4e4df6f35631ed0ccb6fb9eab822465f47edebf25133aab886786f13ede6447233e7655dc39dd1d96cda36a765c24c81eb85ff0015be11e0f9fddfe4cb2fce9d1386a1c49612a26e6c246dbacb3c96bec712e27734e0ca9ad5c36d84d1b50e05bed41fd772ccc72e29d4e94d9ac62438db5ccd72d45e45ff008fe49321fbfa4bfa9378c86f25c653a4b8cef7fe8a45e5be843061570ca518837371cb259199fde316e1199d3a172276dfe7f9ac54ff00ef2aac9a8535cba9125afd837706d20ed7b3f5c165a50734978184f6c4379e0c3227b73c7b5438a632174ebe988f30e119f0b3a7113e73636e115951382303d5a1bc17a738f6471bf7aa269e70cce8ea8cfd17d0ceb871c7595ea64f93502efe9ad9ab9756eee3f355f545fd1aebf23a8aff00d8c08d1a53274fbb7a84e6edcf037fd5d2e1d17672dc35acb775262be77e3e392bd3f5213269e188717b12e1c39ca47c7aa1bba6522742e8189a9ff400fb6d9ff4ff00a947a626aafcd6a61f660dce8c712c98b7884ca16f67f9a40a03b2ca648994e9bb736badcaa2fa7b8db87a5c990de79db8ebb5fd7822a15ef32b79521d59c53e104b5ddc7ae1c2caae88b36d5fa8ed79dd139ccf60ea408778696bdede92ae3e0ba6c58969475dab86ceb54db65bd37bfa3cb3ba1ce1ea0ce6f25b96e37e7236e376171f04afdbc91d0abf5157b7fb88e67dea6ba87ec86159c7e90dc1b6534b7c883cb3f9ac14382a96fe78934aae6c36308849d6ebdfd897e99a1d579ed35bc234e3f142c8d430ace9150994f6ef619ce6412076a5d570d57e8f3f60ea4440e79eaa3d5236d7e428b3a66291c42b7e61ac0db7d09c72e7f158f8a1be57b221c1aebbebb3fd88c99125cbc90ccc3f6f9597e9bd2d9168c30f61a8e6088b792cdb64322073f05f9e9a1fc38713694b0f534e7f4a0785d7e94d320951571bcf73f58df3ebc1326f6a19a778b37a35dc74e8cfc4b379ec7d1cd5cc398c98c710c2b8b210e298e46a8d6e9dbf35531a49973ab6e9d34ce18a2ba8e2bc05e68a634adc89c67c59437b762e47b2c8cdc9f47a26e8b6855cfb29e3bc0155c311870d46f74b9c01953c6791ea56f8ce434c05a3f690b96d3ea2d2ad938931677c969786b1ad7f0eb70c5d35867d24922737703af6fe4bb1619798531b61f3466addbb8911017653c8cfe29d4d71b1fb6b38badb6fae31aefe631355c12ff47ad68efa88d2ab0c9633c4422913efac07e8ad7eb5a1973bd6f7876ab2273720f1e7e29956d1fe0cdfa64aa4d7fccd3fda63566c211d997cd506fa2dc60d22da50ab34f9e07d50dea24fe4af6533957b268be9adadd9ecaa7b73fc9876d83f1d61faa377f0512745bbcdb7a27c574e99888e26992aa759a155dace6e40f461b0f92d56660fd2ec40426b52649eb13e27f2537185315b49462ac6921bb7b70fa411f9e6a94572a3a1faa70d53539c96efe51b6b5a4b5af61b7f2f13363bb0262641c10671e3fc9616bac25608d194ba7bf71acf66f117e0b14db17d03089db35acb8c46fa23e899d6d877ad3712d76b18bea31546a5344e7110b016e5d169b3530841e3e42b4da2bec9fe4ffb6765c075818b309990e87af6fad227677bf5fc968b5c1229ae6633e1b03c167742f4a7546a554aa552876529c703cc0038ad0b1bd4617f885d386711d5d6b7c526f5eca1592f91ab4d2556a65556ff0003a3381063dd1297738fd3a8fcc666f6fe41681841e96aff0077191cb59743c18dff0064b442f9c55e3067be24e5cf2b0fcd68d4a67335b6d1003a5d5ecab76c97fe8cfa6b7d5ee8771dc74960d839d5b1b6b73b5ecba561d9169326f9ae7b4123632ae16df0e2b654e91611ff0035e9348fd28f3be6632be1b21d99cc5acd98641dc771387d5b0cd73a96f36c2d9f79ba7d73134faccc1aa4d85c5c9e2a9b0653cebfa3d3f35a6db15a64f11a6b349f22dc32628b3278adc70d99846715ef658fa353a28357d2bdfb382d9e9f4f0cc5b56ca6aaf065f33ae8287a8cc0e2520714f55a6f24e4b1c1e267c9ea6c8e112527284b2292c8d49719eaf7a72f05f5bbd5df23dbda63a788a18b866960b798409f2f5adc15d7b08da1cb92a2338d511571ddd8cdc184eb6b3295174b85467e14c34e00df30f519c71bddb1fcd64e46ac22c4aacf9d4106433ea6e98e5845eaa7774738c59a04d0be25d5f3e68f68e75af7dddbec6fc17cb1a49fecf3601dcd79a3dc65bbe43d5543f0e37ef5f69bc77098a1bc3c2eb033a6ebdbd1b2ceeec1dba7c52b567068de48b83310e88f47b3f04e399ed8eeb522e24eef78baff0025c234f1a32c5a749d5ea95028d3aa1497134b8913db8b81debea937e6bdd61c8e6163d5d50d5c364ceef8ad2bf1f66f81f00bba254d9456774e70d757224f04b30f4b5d7dfae216b33577a69bc5ef7c96a958c0b82ea1abbf615a7b9bdefab7165e7adf0d24d6c67a986abd9c9f179392aa7895f624cd1268dc59e1c28d865f573fc55087465a35acbe126a3855b67cef7baa7f499c7b09eb6107867c94a6be94c57e4d581c401d515fcea7917b8878fcd72fae685abf4cd6dcaa74e7fd356222ff008d961bb4d3a9e10d8daa7d1cfe0be762bc3966335927d867135261fa5d0e78eb6548357f265175b9386f6f6967d960d4d15677246cbdef052b76af72e681cda47878a70e69770a28429ac1d7a932742958c17ba556a155a3565bc902e0eac99f17f0e192f7439a5973a3a793dab5a0337f13fccedf95bb960f4618df0361881db7c6784a1abb7700f039defc08e6b5fc5950c28e3123c7384583a6b48724eca4b85bea5f86f39d2839b9576744b488eaaf51c5356a956b0e0a34f753779326d6bf15b1b8abe86eaf830341875fd1f1336956dbb604c99f6ebd7f1594f34e0ec5ba3d6d1c3a42ddead20db72a86773da0ac568874930603a8bc6b53c16cb10b17f6f480e9d9cd5f727d8bb56d87e3ce0d67089a0b7c4ad86262e8d305f6c5bfdbf2b2d9349748d17c13e075a3dc433df971f7890e62bea7eb35ae63bab30abe277751a4e1af3236730eac865602df25b9b2d2168fab581850b17e8ecefed64986455e9e00ccf6dbb15bfb5821bf8ccc860f9da5cd23617758528d8bdb39a7884b7dce7b83c072bad09939c49a31c762198d9b0abd1c5e26ee21b5cf67665c5637094f62dabcd23aa3d74da9b1cc1bc4f6fcc735d2b4c184f466da4c189b09e3e159713e21bc49bdfe285cc1240b642cf5ff00fa31da69738931dc8638b6aba35f3336bfa2fe448ca70cb8fc57d45e4c3a42871be8ea4b6773aeee8e7779c09bf0e04762f9bf01e27d2ce29a1cec09872b2d5c4a12437dc5ce66d9dc5ef97c97ba16c4b55d07695e1a1e2d933a9d21c82d5c1873cb883faeab4e9adf5cd2395e468f6d7b3f83e90d25e01deebde7d795170189246b18badbf82c1c1087d43d9e00c58c29f3a18490c4c8165d7b1bd1057f0e3ca5c91789cc905b8ebc495f2ee03af5230ae2a9d062d60e208e4c394421be7d6ddeb5eadc2125ff004b78ad4d9aad3ec4fe2740a7522b74e98d8e2fc68e76ee7392c76f6b9ea98f2ab8af0fbaf37b2d1e9885b29f39d6dbfea5cfb4a15c658bf15c0ea8552dea438efb5edfcd75d7cc2ad060f978668d5f6c6a314b1689c4dfcd55451bad6e15c67fc8ca6624ad452ffbd27d21a923eec4edff000b2c3bfaee00ac38dad4dad227f1c8c8b7e6b56635071a246be737b144e2a951008b9e47978aad8d312e914c72ab4ee950d3984f0326fcae84d445d745964b26cbe6ad1f99e7cdeea16b7ff77a85b555f859d1febd424b88e40fab38b7db7c7f25cf293a42c3d51a58a6636c3067ce84e73db437b7f052a0be866ceda68f6b0f9b4f6e32a738704f8767e6aeac8b66870ba1c336c830ab771777872b125c8199924f11f354a17ae584e2deb2c761170f4070fe2b2d881d601ab3797154aab3a8d546d62679bc27c3e0b5485fd78561b516a35e6151a7b8bc32274fe27bd5ddbb7a194adf16670b96f387a136e3b17b00e60dd62716525de0c9b2639f06c64b836bf1fd715599e26221b100f6dd11d5625b645e3a69d95efafa364f4ad65e1b8175e31705d01ac2c4f25766b0741b19e25704fc65a32c6c757e332899d361ed1f056378a64fbeda4eec45ac78dd29bcd8208c18e1591b329f0811cbbf5cd4b88c5352e8a624c8246e955b03c42b50b39ae0887680ab26854a7126f2c5c9e392c71dce56422704f2ba55db2ae598efd4ba8c80c3922384170e0424f000a9b8a552db36104f248e47aac3ed61115e106dda9fad2a700369abf14985fa797d9956a656f6cc4ec4c19d9348046445d64a2a7431e61c4bcf95d4a4d0ee6e334ef741ac21d1b630e72219d3e73ab65607b16c54ca4eefc62f0e298c2653e9c06f736f619e5c16bb56ab4d70ea381acf225762a3989baff6708fc9db1ea9d2776cf8a5cae698b3a793d1fb5cbb3dfb5ecb2f17b673d1793b7916efe2a4ba29cede72e1cd4b6beef8a5ac8dd93697f79872e838a1bc12de0a3b7f77c54947ff00d2e77f1534864a248421411104211b3ed4a0113a75ede8f5e6bc53d87bfe0a0802c27257d1fb578a52c8ce8b2e0edf96af8a56d7ddf14adafbbe28dafbbe2a093d425223fb28bb90546a52c830a4812438743873b2f1c090defad0dfbd0536155575e8e29ea2be41720a3b7f73c54979b0de65f0e3e0b43446d7f67a992b9a8ecbdef04c5180c0d448f6bb9085624b34f7ee69f5292e9ab9d86c3c53dcbfde5c975ad6de7beca9cae117729c30eaf34e88999ea10a6a80b92083c14d0824828cfe30a92aeaff0011a58544e6a7b3ed569bc8dbc5abadabdd74914e382b4b94623602f757644122410630bc6205b6861ba4be9a36d610a51648f27fb3de92a684e659021335bb11b2f7bc15724fadaecac84f1c1212236b43b181284e49565c946b008421540ae9c92b232a45db171add32b20a14c837b705e41227c534093c4f6f04e201ec5d0f4498483f71e7faa346f0c96c4eef2678be5d54a8e4c9a9d4c74b0764cdd30fe1b9d816912dcd51efd19cc905c436bf158f9d510e5e40d76f9e6e36e4676e46ff003597c7355313734c91336ce05f5e47593967dab54a550ab509a4baa8ba0e77984393249fadf15b2a86d3e6be43553d5dee79e064521d368a26ed2270d219fb66e360df2bdefc2c98c2a1398ca81d3d910d49c5b769d9de2b2f5f09ee254c754185cef1784191bd039cb39e5cbf9af5f498ea534454e7f3aa5bab42e26f3d96ceff008ad0fa39f296595dc317741775115a77e739046f5b06edefb1ece59a7ef0dea34f86a8c23b79e47f981cb99ecbaaac6ae63a73b76de506a4667786bb133c6798ec3de89cf696c99489aee9d054e7b6924ed9873baaaec8ca214fa7cf9d36698ea76900da4453db64367cf87bcaf4894f760d854a333e7b8db6c21395b676fe23e69d21c5143d90e6289cb788483b6de33d870f9abc6993dcd1678a256a53672dc4ed87afe1d3972bab13f58314e5e31aaeb39dddcb5dc3da6e38ed3f0fe4b155465b36f2dc3785ac53e2bf65f82c8d0b6ad9b86be730dc91bc389ce32dbdff0004441b4972207b14972089d3c01c38ded7ee4c8818d7e63a04892e5b3195b7753c6fadff00d7bfe8a954243c9bb59ede90e2453e2b6f5bc9b6af5e4ad44f629ede9d4ef33cf72e0cf0e61db0bec24725e5458487f13aa7baa94467e59837b71504b2bb67cfc3830cb7725b496d771b7396afc15b88899229eda1adb16fbccf1b59d7bedbfa5fc52a5b6dbb3a8b59f599ee9c49d8da4039e7fd1619ed484e63b3a8b810b8db65208b1f5632f873564f019c8871ad21f38a5bc931b8309004e038acacc72fa8d0ed24412a754299b66fb06eded6e07b3aab2cc40da44e7adb0bc913dc493b09c4587a7d96ec5403e14da59aacd60dea2f5cde49dd9c5ba67daa52e4ab960f645467c9c2cf5d4f91bb8da991bbb8723ffe766bd76dbe82e2189eef521c483ad3f8dff8ab73e7d464b49b88ea45bc0d9bb3b386ee0f0f8ac554e4319feb9d31dbdafb016d8dbf0bd93122d1478e5fd70c86ad9c399ee2438bddc35f72ff00c5665bd628f1c0d1b5367db79ff048cd616873e1934e9b2e2a9b66fbbcd1bbc86ffe38edfd7358fab3fde5ac0d1bcbbcf17e7c382a4ab521ae4d2e0dba87579ac3ceb56750c80e8cddd8c33b8926f6f82a724d01f483bdd39b3a7514fbb7bf21c8aa669d20b19baa26b86d3e56f2cb78cf5bfaa4bc32dbeb6b523e9317de32e1b2fd78aa7a204c6eb2be99dd7c9370ee1aad635a9e246d878b5346922f687da3f8f02beaedc04dfab05d710f22dc34e67e15abd483798db7a79abc7eb5bf87e6bea793870c9b13003cd56cd37b227b9f09af8c20bd8734ac51ce7e81cd66685fdf387a6e1aa89d6f440b9e20725b9542810cf84c4248c82d7e761a9e46ddbea89fd7a2caf489768f4766aab9432690c6befb07ba9b46aab20e1b93712ce564c6c7034c792eb942acd42915017b8115ae7e0b73765bbe80b4c4cc04e07da88643b47458f97a3ec36f86f0daa1784f2880c9227a79d6b312becaed5f9333afa9f8371dd3a06f882aec6a0e21cc3e6d6953b2ef374b1a1bc27048d466f5d0e9364b9bad71f68966c5abbb89238df3209e8ab9d1ae266b2eede399101caeaca735f2465f56c7b2167e25d7da1df5625d3f10ce16f672fc6eb5d99a21afc562d1cc89f7e16c95b99a3dc632edab3a7e7efa8d3a87a4f61521b09d37579de3e2953ad58f9474eb53a21984e25393a20ad9b8710c8936e16e7d56cb48d1b30a2421ebadad45d0b657b0f148342d2773c43ff4ff00355c50b17b79db09d5e72e218c75395955e96117bd225db65abf29195ab34c515f6db0991b6a4313f5b5fa769589694ec07868c4e1ccf1597f90319cf350182ebce09d4733ceafc7f8accd13478fc987791045d139d7659d44c364a10fb358aed7ebd8a9f833a10d9ab6b6433cbc3a2cd51280e5c91793610db9ae814bc03243801c41081d56d9052696c353d581c7bd6cd368ecb26a761ced47918d35baebe59a25429269f4702fc45b82abbbcab122059ac4b5c913e289ac888dc1b93c56221e175d4c2844c7a1565967b2c13b302306cb2f4e71aa40d558fb04fa7e73c0ba5aff008762e87e0cde291008631723b96c5c81056b34e8b540016c326fab0dd742a6944f99f957bad2e0e0a28b1e8842472c4a108542889ab0aa21352c1a62f232154a7cad500df85f92b41c7b9e2b1eee6dec38a58c872791b8b030c39ad7ea150d688d818bbd15a661ecb32a23c385d63a78200bf14b9cde0ee78fd344946e8c5cb8251d5b5ce4888d8592dec620926e78accd9e9e8af0b02e74f9300ca2198589755286036863b25cd984901616a534c338e48596f03ac82acca45562480625e07d01170afe1dc3313b0227108cb80b705947b86d9348ac648f8dd44a3c64c95eb23bf6a35772ff005649be775ae4d9ae25b827b16fb13662ced3adf57aad56b0f6176f4c245c43c3b173f5176160ea5752b70f061eb55ed76315e2b5bb554c33428abee6170ec7a819af053627f5289ab6957db8d53d9dbe2b7ea4d2e2a63196de2b6b0e365cd8477d9b99bdb8d31da8c779869ad7eecc61d6238c46f64541bb87adf7778d584320fd60725571562cf364a89b53a3067f3b1c960687836b58963f3954aa339b378b80399b26591adf11433d7886e90b7fa35c07529e5c541a363d4f1b2ad37447a1e864477a7137ed5929f48d1f4a9db0998a1c8b8bdf68ae36a0e013221be34f1fe690e952fa22cb2352cc8e6154d0fe8ca39e0c9ad55e571be60dd6166e872851c2053318b8b9e6e1a7a27f82ee230968c26d8c78d813f1fe690eb45f810cfbcad24816e2324b7a193f8a175f95d1c7fc8ce2b843467152f1233a85525d26b4c644d30b86f9addf4c5a3ea0e2d96c27601c20da9ee60b19a439b5fb8705bbcad0cb19bf678e29e6dc73bfe2ba31c16e061b34372ca8ee676c3e8f3649373d33e5fc96bd3e967b1c268e66bb5fa5f6ab60cf9db457a1b34b7aea0d25604915090ea110b69f25c5edc78679725aee2dc2757c1ba4186a7a36a1d6833670ede4eddbe5ddf0fcd76995a2bd2b522aedaa7bb377f284cbec0b9e3f30b67c6755ae30a7c4e685819f6dcdf8420d96896936d5c4445baaad4d6c96771f3ee927fdade95e82caa552c0ede5c8a79bce9adf29fdb9772d23463a479fa3facbb85bd0db5664546c1cc971cc0fc79afa12818d9d4a7d32998ca8d50a7580bb890dc71e97f92c7bfd0f68af7d9555a2d48b57f206ddb9d6fcd25e90739ecfc648f9ff0048539bbdaccda8c8c1d3f0ec99dc580e76ebf35b7e8ce83a03afe0dffb65587d46c4a0104124443e002ed3a4bc218f348f84bcd4f0309edf2fa4b59036e7e6571cc1ba2ca5d07109fdaf64deb4ce1161208d9e7d72cfa24baa7096304bbbd90ef072d1fddf55b36aa6aeef1e4e1bc5c575cd2668f70cd4f0ec5a40a5e9665d667b690356539036a7e37fe1c955d2ce8b298daa12df68d70ebf8e4cf3771200bdbbbbca8e89f42f86717c874d71bd62af87eaf17b3c2d7e3f922aaa7bf380ba31bab733e88f267d2c8d20e0c9141aa39d7ab513e8f3c5bf5d157d3468e70fb87d2eb21c1a7ce706e67c27d51ebf8af9b681567da0ed314a34c770bfa7369bbb389f6b6f122675b74257dc389e82cb196199ace38446ddd48f5048e0791efbf82ea3afdd1e51e7a6e7e3f551b21f16706c6b55a549c385b577006c5de7bbbc6100d87667c93e88dd8637c3f4dad57a716e29c400e2445983fa0aad16a98d300cb754d714715a6304f2ddcc988f01e3da9f4bc5783e1ac46ea0a738c3e5c5b6d21cfd8b839f87059dff006f867713ca2de97b0a8c5eca5d470e3f85fc52254200cee2dc56af8224e3aae489b86dbd6216e6194496f5084927bc2ed149a4e15974afa237d8c309bed9bb8bfc33165cdebf89f13d1a76ae24c2e5c4984db6f75497cb70ea35328c7613c0f842978604e975b6bbd56985fd4c27ede57223b159c494ea7e2e0d6b344a31a03f10dccf89b027bc7cd3aad82f073f65163ba7559cb83b0b82ddc5858fcecab60ed28c2de7caa250cbea96da1224ca703eb0eb7575f9116dd3b27bd3e47e1f78de7387742c718776cfe4c9bdc43724677bac054f06e19af19951c10e8c5171122fccf51dcb78913712d4713f9fb1352052185365eadcdfe902611f873ee5a8d634b38603871152b0bda7c36d94f9201eb7e5f0512d9fec569ba6a665a84db0fd7b0dfecce34ab8331b45d731d173bc5384aa982a74139b3af38b12009139af023af35bd53e75071bd264623dc3567c920ce944e46fcce5d8aac8c59a3ba7cf2d1a99f030a91bcf64e05ef9149b546c8f06cd36aa55cf73ebf8fa30186abcd5cb7d9c3158c56b827815d4f0cd5b7a84b59d15c65f25c6b15e1bfd92c471376d1451363f486f34710388b1ef5bce11adc53498ec05c0c9334b7cab96d61acae36d7ecacdd6ad866270d62774d801edb2d4a29e644ed881cb8dd6dd0e2592d1b0221371dab407f38b97b327883575ed95eebad9cac9c8d3fb213d9233949a8913c8862240599aeb0dad37ce2d20bcf239ac0d07eb424c0b718e6da99345bfc336597515ab61c95d771c9a1926f9af2f995e8cf823e0bc9cff000960c219dc66b2be69aa4c004728e5d4abd8468522a4e2376e2c437363df7fe0b65af3f841886add75b40a56c32ca2935334f147770f1855e0f99306e1b376d2e1862ece0a93e7e3d01b33cf9ac138adf99dd6f5b96f1eef05d3843f9345556e3f2c13257351fb5ecb28ace99e9225adbc25c5e767d157702539be77bf828ec3dff04cd8fbde084b23514d0ac214b1db72369ec67cfbeac3c6c9ae29d68449d5e1cd284e703d8f15eedfdcf1494f257b21b9cafd05351dafbbe2a4a7a34601476beef8a924a4a5928c724ecfb5291b7f73c540760842104220842b08340a448f6bb95b5e6c25f4408c0edbfb9e2aa4ce49c93339201881c53d796375ea2a1710ff00f4d7f79336f3b76dda3160789ea968fb7f7757bd3c78e424a7213c896b0350949aa481cdc6dedecdfbd4e5734b426952c25213503521484d420ae496cbdef055761eff0082b08509e4322870506ee376b67c3c5467fb3debdd6ec4ac95554864ff0067bd54fb1f7b595c93c0f725b993eb0fa7e09391f1220f6a00375e58744103a26465827d6487053297f61ef6b77290b255bc705644d08425152a2a961d15e4a41668ad61d1161d1594a26e8230222be575919136dade8f1b7354c48bf08eddca521bcf713cc86e6ee67dec159260dc60b2ccdd2682e2b8fe090d25edadf783c2c7995daebed6954ea1b306190de26444f91f4bb67fa0aa60ac3cd6812435774873e78c9c5f573bfc118969545355fa6d4fcdfad7be76bff15b28af7727cffcef95fdd4bd70e91879d8829558accd94e2a4da44f36cbaf14dc3ee2a2edf4d8aa8e643fa837fad143cbf85ff00255621230fc89d29b53bcf5bcdf5677eafd5516129f612afb80da44873558ace1c498b3bc89b6fe056b71da792959965a76c1cc5280a236912018a6b99f25b0d5dbed387c38152867ccdde70654fdde6b9bdbf5cd429f4ac48d6acf2aae6d4d61109c59b61ebef71c7af3569a309ae99874da060759bceb4e3691d7a8fe2a51579c1685522aad2e542dea05bcff55267ed8e73c1e3dd9aa93aa331fd4a7d129cd0085b4f2de7992d8fe2162a893e1dfa36f2a19ce0eb7d2379e247359d34f6b236cf9a45fde0e241f4640b00a484d97679a4c9773696e45ea30c819745ae4142ae39a1cf733e07267b6bddbb756e9f4bf374b6b5c76eb78ddb6bb08b79b7da5bf1b782f3ce1266bdd576d668704133dbf4da0e9cb8f8281bbb830ef6653a7eecea9b4e00b7cf61ab636f87259c7d4e9158a7c4e5b5808b8071c5572e584991aedd8d404875fe7a70bec2ff00c7f2519f4e7cde5493269c6b2ddae53a7def6b2644b46593c635e13a2914d75516ce5cb8f5e645ee4c8960daca8ddfb313e26c7cdae227a36c0fb572afb88ea90d43cc75c0d5a4f126db5a79fbcdbfc1fd7554227fe789ee5a434c91aae61c9c38ff0000fcb2fe4898cca2ed59e474e6f360a2d3246ac73ae644efab3fafe3e2abd429ee708370d9b5437989d03cadf9955aa14c98c2904d7a285c090448905ab9e7d72e2a96216351ab4966ccc99cd030b8920f3da71b7829873cb1531f3cb76cea73b6f03801b5f3a7ff00c4e9f0bf82cf53e8b30cb1aa5a960dbe92ded98b9e0560e92c1eb0a7b5a63ac42df7f75277925c1b8cd79846a33dcc71347877890e6fc72561422735a54c7d0c12df6f121c544ec67b86bfe3a9e208dcb07f25c3180b890dbd7b773bc442fb4fc6d7579cd569d3d8b6d68eec5b6db72db35e1b2b70cbb47cd51ddddd418eeb5ea8ec18ff00968774e3d11d8e8cd7d89aa542639a8ef41c6f5ab26c3763ebe4f676fc579e697cf643414b2d8b973f476ee2d6d54f92ea751678c30d1d49a71b03b7739fd9f2fc79a4c766e627514f339fbaa8fa9920def7ede5f2571a6c53cef2ea6532449731cf8a78cb7703ecfe239dbb96327c2fa73ad49326d79199ba6c4e276199e3fbc834d8cfde1c6f2e6d6f970e698ff7cc438919b667098ea33e64a9f2270e933f0e5f2427cf00965e0fd00f27161230b68aa88d357fc2de2dc2f905d5a2afc9ff004bfeafe4b47c2ed836a733a748801dd24004df8e592da20633b2f4027c5f07abf1da2fc14e4cb736bc6e3e8de09921fb27206a5a1bf6dd62f768d5634f16faa4f72a2c6793b328ed5c333b3e850456dde01da2ca9cfa0b8910ed226e08ec0b1ed1f5529b68a326203890565e462f8af6712ae3a26ecae6b06595b28b31ba9b036d420a7974f2d93871f259118829538fd21be43804d9150a4ce3ab09211fb68159ebe34fce26276f50b7d69e72e61596cdea53a58b8f9acec1153dc810c3158f6ab8048922e002a1e963fc0a9797dbf089ac0c36e26f50ac34c270888eda1163cfa2ce4d7d220b5e21deb0eeb126b884496f0c36bded15afe085a7844459e4f5172c57c15ead42dc2409ede6ea11d0ad7e64e73101eba2f8dd5e78fa7ba26f15845c45d55861cb85eca6518d7d1d1d069ecb52b2f622eeec7e9b387c2255a26cea6c59d4277c2f757c0e2005281947348d584dd2e364be8eb4f4fa7ab968a5b9c7918e3b8fc53840464b32c6984eb6d874b7ebe4b3028124437d6c87bbfcd0e139f2c4dbaad3697946a725bc53a2d5878fc16669d4904802d7199365b148a33222e255be255f974b821378631f24c8d7b4e26b7ccd76436949ab512a00045ac7aacd48ca11dc90194326c6f74e80585ba2d305fc1e235777ba79188421686cc80842166040853426647e044de4aacde4af2ab3a4f0f4bc1558dacc5cd93ad0fc15070c6f736e3f259e1c563e6c56840b714997477b4963fa3587c435199b5f805889eea29f09835964eb22ee093c1624c2b3cb867b0d343f053150c209cd550d479d251bdb8fe4af5adcd5fa55127545f4b9d6b5b9745a28e9e4e5f96d4fab28dc2448d94a861315c80b17578b67ac62e63259889b452881ad7ed58caac236163c545a96d6723c7bf65b8342ab3edb425bdf319ad59e4e10cd3d567eab0fd2a3b64b54aa5c4ffadc5797bec7bb07d1f49545c38361c26d6298f4b90728466af631c59161e6f0b76c6f3dc64003c95bc0b0ed6812a62e67508275731786a62b453a6dc8e214eed91c910ae365b2cfd196c2b87a2afb9f38546e5b93ad0eb735e69071d06bff0067e931e70fa13c836b77f4e2b39896ac30ad14b46d66f3c0b4ab677e9f35c7e719ae21dbc7737e5d164b6d6a3f89b2aafdefd93f8896cce7d45f496ad2189c387111000eefe2bbae19d1ad130bd021a862c1b59b101b5be432feaa8e83b473b18462caac10c511b1916e43f5f8ad4f4cd8ca6e21ad9a2d31c1898b7bc3706d729d5b8515fbec672b55bb5faafdbe9f9fe4b53f4ab86983d88d370731d975d4e3e0b254ad2dd5aaf3f77a2e1362e6336ff2e5729c3b84eb78c2b429b4f8a111936cf9afa224b2c3ba2ac3a409970780b7dbf67ebaabd16d963f62f88ad76929d3ff006a18722e327f89c922a78368444633f46d7f0579b636a8b69f14938629f9f08a454c03df75c0b10e24c6d8f6a45ad376e241e321b73fd66b3b863447b8cc153c495a2d6dc075f1f82d956aa5bce5d9e223286e976774978931dcd1aa30448021e73dd65f32b374faad54b6d5aed1437807288ad3453e91330e9f35e2930eee3fd6e17fe8b41c138f292deb73a1aad6dfb8d6064c3bc1e23f3b7e6b77ee611e19c88f8bb6d7275af89d2df6909fc89f68f4695917885b31d55aacfec91a0cfadd469320366b79fadc6cb4ac5af74854f7d139c2b539fb80bfd1dc1f97e6a781b4986b2da2a66379edd85445ef21c371981d8551d909f44c3477eddcc293a4bc1ae1ceed0531d539be595bf574dac51b00d5e745137ac48867df883c529ce26d194daa474ea9d19bb788f19d2424d5b43b49ac5aa984abb0c222bc40c27587c12a524ffe9ba155497e7b9176ad3eaf4f625a39c3bbd11c1cb73603b782d5a9d5a66e27fd24116e19ad6db636c6f826ad0d2dcce860d8020c870385d746aee1aa356989c48d2a12217318bef0d858456eb9e6a9f66f544eadbcfe3216fd8e0d732379a711e97b56e0ba060b792a75283584da3926c42e61419f4ba7d3f75aeb10e611601ec9e7fac93b0e6279148ae970d67fa82357a27d3351960e66bf42f515b51fa371c7347dcdcfed3361aa611ebc8e40735ad3f68e71bb314ea953653a17bd8fdb13f15d4ea0ddb551bc2d8da392e05efd96fe6b94c3267d25f6ed13b32278e207459b5b170cb38fa6d4ce10d8fb46b7875855704d704da610e29e6fbc319c0d8f68badaeb4e2556e46f585ea93a913a2193726d227fc7b3b3b53b1061f7ede41a8170d9d76df8a950311d3a1651532ab4213a18788fe0573fdb289a96aa7296e31585e4c13dd3c958d18d3a2906fbbb86cdcf770588c4a21c1f56d6c3b83292e2239c97f22d7cbbbb7aac94fcac0859ab61174c6cd67b9913e0f64c4acb56d7668af5bf9f273f7d234bda43a14fd472da16dabac5b01b09ff0003d1738c3989311e02c4b3cf9b6213cfd1e7487527871cb8aedd262d94f87e93b227deb5d36af400d6015c6f3dbcfde6d671adf97f3549dcac793543c8a87134b055a65525b8613b1339c3ade8f03bc9c03cfb96a7a3f794fac3e754e77835bbe6ce2611b616f5033b656fd596fcc6bb5470c7ccd1535b54e411617e2b589adabf47b35a686f4fd5f640578d914596ae0e2f062b4b555602a6d698dcdb75878def7192c46128a642e4430c5604588eab76adcf8b14524b2a9e1e91bf45fe624703dab1787a84c9b43099f3e18c937061558d895bc1a21afaebaf0cb6f98bad940e402649e3655e1940fa4b7edd6913a9f0b51526f0e5c6ff0092d12387673b67c4755dcf7c3d6234fa956d992dd3de42d670b0b5d6e6c1c357cdf6608b91d56870430eb75598a3398e4cff004781162167f745ac1a357085b0e0a35064e183889b1ccc3c4db8aae2e388cd6f0e98caacb2dd4fa44f25a6b86f13471b09c6d10e4bce6b2a55cf838c3583f9ec2707120da20b6b92fd95704472130e7c78ad32d728970ec66edb8df92be8755b27b0aae1e4c857594e6d304517d5cc293da317f4394e1bcabb96c6c4755b64c6722b14fde35ef9f1b715846b1bda4b9ddf5ac391ea17a6a65bf23a17ec3f23367da856ae3aa4ecbdef05ce5c9ebba16a33b927a520923b11d7c1490850de08e84a10a3fe6bb92a2cb29649264d95ab6f4bc15c42a9631fb3ed4264de496806094ada806fb7f66faa827057448f6bb93361f46fadcfa27a012192b9a37195fa096899c92be2353c8d3c5027eef20457b5eeabca9bc7d1f146dcfee78a9c0b172b9abeaba130300a3b9427eb457ee4c52db7bbe2a6be5e01a1bb1907edb3e8abcde4a1b5f77c5493b0598210a486cab64849bfb5e098bd9322fade9f4e498a22f226cec87d87bdaddca761d17bb2f7bc178ac431a85355d672c350846cfb503810842082292ac2f763f49b6b7820993c95137edfddd5ef53d87bde09333928c97ad604ecbdef05ea9a10cb24414d081c50900d9fecf7aaf63d14f3ed504b15ecff008078a071458f4473400a4211caf9a06858f45d2344f82e7ba712318545bb985b1fba9e3f05a9e0bc353b14d5653581b4e9d207dbc04705df4c7230ccd2d24d4c9963eef2037fade0b552b2cf29fa835ee987aab7f9056ebefe8ed4387352de9f9366d0c8395b91bae77157e7cc7d21acf89cedc4a9ee83a707d4102f63757f10b6a7d424555e540f9b9fc366cde7381602298385bb962eb13dee16826c6ca636a94a6d2b5785c45fc56f82fe0f9ed92644348cf9b5d42ef777041bc5fe0c263babd5d6f586d5ca7d740dac43effcafc39fcd63189792009cdd84e6f48a8c9dbc89e47d8feafc164c54a7b596c245a29ce5c4b1eba1ceff00c55a4f7194aee7101a9547ce953a6d41bd387d62e8ecaf7ef539f5761507b2dcd2a9b24b06c7769367194ef867fabaa05bd41c4c712e5b9a8090e247af6a5c6d649bf4431c28d833dd9e53a7b591245c59bc20481d508865f65361a137946a74e9f771381716fab247459a6eda9d22ab24d4a5c86cda206dbb39fb73d78f15a8d2db16b508598985fb78380b709e1676d588a4ce30ca935172defbbb68bd6886df24061b2bc5bd369f51712a46f521acccb7786ff686ff00af8269733e6d66074e263614f8aff48b6c2cabd12ab8c7612479ae41ff009b35e4b76d67bf0cb124316fede19c1bcfdd46b5b3cee80c9649994ed953da4a9f148cdc6ac5ddf8fe4bdabba7e1fb76eda36e6438e86d6e0a8c55d8e95512d2a6e4b9710fa8b08b80e4b25891bd2e7d3d9d2dc4d32623fe3b7740eb6cefd543e098f6536513190de4e1978d5cb585d4d2e654f70e723b4bf1cd6283fbbe9cd716d31b6f326face036ce2f81ba4be9d47ac3694da96e4cf9f147b79573c0cbbacad1e74f9eedbe248377e7b01f2cbb54c5b7d8f4d98d9d16b4c9ee77f9a2619b27e81ddfae4a5261f386f74da8360d1cbbff002ee071330dbf253a33288397e2864b88ea3387aee022dadbe7fc90f6810b98de34a9b90de29b27773b63ca5db3fd75575c10fa2358a2c5519ecfce327cded9b49327e8ee7972eb651f3b4379c5ad535a11276f1486f1f1ea9edd83e96de5506a92cda9f38c449727d7c9ec23e0a3e68a4c4fa6b60ea6c330443e8ee1b13adb317f14d8c72298b6b43990e1f97899cced59e67970e1b6af0eebaf26b27758a9ef7498b6ed9bcc9424102d9ccfe9e09669757f3e3cdf6a4d86e528c27d2fd7451635e6f22544d28928985c5f3d6b49f9a904f2c43d6d0bea3473abceaf39b7d19bb76f0fae6e7e0a6f1c53a16f13473bcc13e548fa44ddd88d87cb8ff250a4c8a6377925cbb89c83b79f3ceeee49042cbb26efe182a0cabd13aa8b171b4716fc3e0a1f581b1b308c5549cd01cc9774cf3a09dad28fdbb7beb782e9de4f387e7e2ed25d09a086fe6fccc56be4789f05ca365e76ae3b754477b0dde47a890e0f1fe9f9afad7c87b044da64188b17399c27b79f34366e6f983657a965f25a16e19f5a49184304d023c538a2a0de9ec24000cf9e792d9306d7b0963da0f9f307d4a5d459c5d173dd30d0341d8bdbd230d697f10b7681b38de5bd3cbad85b87f10babe1fa461bc118764b7a1b792c2954f97616f8fe6b72ae2697e4f511784ce43a44f291d0be8db164fc1d899f4f85f48e200162ba7d3a9749a8b06f5369e8c873276d7b5f8ae5b4fd20f92a694f48b29ab66948a9e28d52244f2d6fcf995da2bd5bc3583b0fc75cc44fdbb161238c47f59abaa61f61fd5751fc9c864e96f41988b1349c234ec66dfcf0e276c24c9b785d6fb16048c0e21685a31a5792e62fc593abb8029f48735e6a039b5b9725dbc9d63965647aa0898f97bd7299a641818822e4782bf2f043216bcd37ed0b6286253d6ec53848adbe4afb7b356fd8c10bad6913edd7f57552a5871f09bc2236e856e90f1baf23263e764057ad9aece6ae2835280dc483976aa7369efa1b43b0e0baaeae44137ba4c4c64c66f6499a3aba7f375d3f389cb3707dce42648a74f39187b974bf37495034b91c6e97b326f5fa96b7c24696c68d0c5f5c0b959b6147b023d100f62cdc8a748862ca10ac0930437b4365655edfa30eabccceff00b290a6490db52c324379424111017215d3daa3ab0f44e4b838576aecfa90ff00a3f6a62c7a66d7ddf140a76b9744a7fb3de929d63d12518c086810842790084216725021084d180949a84a1b598b9bc923d94f9bc920712aa7674b2c1ab57a4c5ae4885612c4715b75620862bdc2d65c4b008b42b258bf23d9e86c7656b22db6c76d0ed8e4b7da0b592356d0d8d973f992a2b70b2cf506aa691685d9f479f62d34bfc4e0f98aa729ef3739f240cff35aed607a310e8b6530c97eda174ca2b8b5c8bdeeb195060639645b3513cb472f437fa6dcb3945440dea3b95a5e2697141c7dabae978829310771cf10e440e4b4caf4af5065f0889e3f05e5b595b8b68fa9f8dba164117f45d5088529ed34e7bacdd51faedfc9689567a70f63598e01d7dda7117e17cd6c3834c34fae44223939e1d856374a54a2ddfcbab1ff003308b81fc7f5c5639ab1c17fc35555456a1ffd3258c1b9c4ac1ad6e9a44c221bdb8e4573d3c0f7ac8619c44fe86ee1d801148b58cbec5b43dc2f4fc5cdbcfd84a21bc1f49c49032ee1f348cb97068b17edbf09fc4d55a62cc48d69de6c6d579d2640f6415afcf88c11057df36a8b09dbbd4da44de68cac563dc9be60dc256f9ca5ebb3a2d4c6b82f7547d1b8169547c0182fce4e213612b789e623c485c271662da9e2fc4067cf8e2bc59c9900d801d02ee4fdc8c5fa309d150409ff0044245cdaf61fc9712d1eb268e71953cb902f0c6042ba6e328ed857f1385a2d96596df67c8ec38470c33c0d86e29d518a1867c40cf7136f7cedfd571cc618f2ad5f75100e7e8c33936f64aea7a71ac4e9186a5d3da442113cdcdb2e8b8443209ea7a2cfacb5d6f6419d0f13a5fdc7ff0022de8dc347f81a7e3d0e849c41299386b16a9d500df8f5f82c4e25c3357c2555f343f89b8862048cee081cfc5619a87129c19ed5d38913c787f1593654e7b5f75bb5a739733b3d6078a4c2ff0074367fb1d0ab4b2a6f9599fc0e898329da4ec4945827516b966317d51c7f3551ce2a9edde8a2690a8f226c4df29e46600e79db359fc31a1fd22d25b6f4deb21809a33b1cfbfaac6d5f4218b9ccf9af3cff0025c3839eb442c574a35ce30593cfa9d175d25ba3b45d57476de752056b08ba9fb0b5f60e8e63f82f344eeb16415c9d4e60f9bb09cdcd8b69e33273be4782a74fc53a41c071c145a936862917d56f1b8f0cc2dad94ca3639a442ea1a741bc37ce2879dfa26d534a6932ba8aa5b1d49e626f38aa8587b183314eacc890deaa7d2d61d47e59ae66cb41d8c9c399d262a83790de49b08ac4df8f2bf62aeff043f9f11acd1f14cfa8b9900eac87510db4aee0b16c714690e63f2d5ad66a05e43da6c53acb22e78c08a34fa884365735c7f266a5e06d28e11bbb672a175265642107323f3561ebf755da5cbaf4382cd3a78379f3e48cf57e165ed231b690f0556217d8b9acf72c1d9227188703d5749ac4a7389b0fc388f47cfbd7e5693febf54caa1179c08d46a2ca30ad8e7fea2ee8d315c588f0f86e67eb4e6e00cf98e493a46a56b982bb260cae36802e1b4daf62bd1c62e82a15aa7396e0673dbeafccafa59ab9638cb0fef6df26d51920827826cec5757eb97c8f31e4b45e9b7f7357c6473da161d7f5f9734337f10d5ea563de3179417f1b6780c99d28d81238f6a9166fa8cfb778a1dde7f3e76593c4187ab921b79c9dd9c08728ac782e15af1c19377f025e6fd58a7070e29c46b7d69edf2baa147734e6ae81a9b5dbc83c61b2b987eb958613836a70d633afea49c8ff00058eabb6a8c97d142f69e5b139765d23b2547ecb554dc44ffeeffb2e4a541a4d3aa06644eead0b59f0c3ad7887f3cd5f6aff0007b8a616ce29f1489e0da2b8c89ed5acc516be4020616aa301a4d4c86d52261ff5dbc4b2538626c534f96eb5b6f233d5cadc7fa27bca1d1bcdc1cb7acda79cb76bac2521ebf6d3a2694ca999027dfd0be57ec476b2892d50ab4f28d3c16a488be36556bce5c3f75bcc6cb617bd85f8a6d528f54a75e73a02187e16594a6e23aa44da1a7c3236f6e2a1d8fe80d4f3bd8f15e45088a2d63c535d3675227c41d36d87516b287c16795f6c5f236a96d23abdabcda81ecdd1ae3f757badd887aa9c4d0ed9ff002641be237cdefab11cf8a8be7de769e5ceedebc9e6a82f61e6956ea676f657b3c41ece28b8ea859d3dbc817e91881f520ddb444e7902782d89be20a6d6a0125d881bb9e796456982e79af72e617474fe4e748a91f97f60a3632726dfd179974f153cfaf82eafbdb3defc45cff67bd574d9fecf7a528abe44c9644a10843233ff0004ff00e64f1e63aaf647b5dc9a9c827d44fce3ef946f1bbfb56d6504206a42fed7b2c8d97bde09d23daee51409c7209a949bf4650d6470a26e96059645bf99f65771b6de47154671bb9872eaa496b25256129414afc482c2133ecbb6ea4892da0465734cd9f6a8ab0aade0b104bd5ed56365ef7825ec3dff0004745046af6ac88a782db78d4ee53a7b297b00e0e7173cb8a7bf712f61b006f6e7d50ec653062d4ac3a28a9023aa923d5b7ecf647b5dcadc9917d6f4ba724a93cd5fdbfd1b76d5ff00dd747457d62ac7a22c7a276af6af353b50f80f58ab1e8bdd97bde09babda8d5ed407ac5ab12776cf8f24a4afb0f7b5bb9008f66f25eaf26f24b9fecf7a0304d250840f4b248cfd87b56d654e7fb3debd8a2d6e4bcd9f6a86f046703a4f3491c57b2b9a26f242633e47bffe9bff007289e01083c0289f3c8b2533fc5eefcd295b55150988280164d0428daf92085c91518e21b4ddedf5871e89c244473b715d0744942910d5dad4aab05f56ff00cd36baf7193c86aa1a1a1d9f66dda28a3bdc133a73a7514873bc7d623971fe2ace3caf4339c36de60ddb74beb7a3c782956f16c4ddc46d9d5367c9907fd1916b7c33c96b1508bf6828d0bb70ff006510907eeff6e6eba1555b51f25d5eb27abbdd927c0dafb4c355f7b2e2c4b102e08227496ee2fd2dd5539f0c86d4fd56d4fa8d428f04e024e76b75ebd8afc552f3831694df36c8320cbb19ce07f255cb9c4e5bec1dd51bb6a689f94f907d405a638fb32b441fd71fe226920d6dac8b37204fbc819fcfa7e6bc735706854898eaa0c7776f30ec72bef197ebe6ac50ab33cb79d86a08736febcbfd5b6dc4de774b7eea1932251868b4fa84d756712091f57f1fd0518c886b918de8ef98c12aa666ca0c62bb8fadf5941954a74cd59f4b9cda78ff001dbef240f590f671e07e4b0229d5e04cfc2b502de4ceff0079227888fcd4e8348a9379d1b78b56eebe913b55b5c3852898f6665f30930d737389ceea0fa81283637f1e0a6ca9740a63b951455b2ddcb61abe899e7f355e882aee2a135af9b5cb79000321c3775c7faab72aab230fc6e853e6f9c2a110bc30db87e365425b48c4d5a7d43719ee0beb48717bb86f9c52075593f37b06ec253bc483ce6e5b4abcafa45b57bbe4a9546af2b7f0e713c5229cfa7ca3b7910fa9047c3353934fa54ca84ea9ba2e22c89138e57110e364c815274f88454a70daa8de2883778676ddb1f1ee54dfd1d8cfdabd755b7036d34cf62dcb5cc8e561c9154c39138a036aab773bccf75ea0c86fd0daeb21436514f6eeb13c99e20a8343bb37645c81ea60bf78e2a31905d985d572c26eaea360c394f6ee4832678edfd705e379d4fc310f9943635300e70b73c3686ddb7590ac3293139de9e50e498dc4c3ceca31519b066edb6c24ed2284c5227b73b10075b95096072e8836a5329f5e9703b6d5093e6ebb86e6171b117ebd9c1795f90eb113486a6d6993e9d099bbb7d247dbf774fe2a946fdfd399cedeaa0d9c3f713ceed3b84f1f22b2189aa069f84857aa33dc172eea7abb002db2fd7e4a4194a283ce33aaadabf201cf3a8373c7bd516a5fd3e9b38c51181c38bda79ce7ec0a6b3adef1512eabb21b378848e897bbd3deb8674d790d4bd1965c4875c7a73f926a12ccc387bbc3590e1c9dd58bbb378a7f0dbff1b7e6aabca1d2849a7b36cd006193773506c6c077fcd2ebcc1bb66b4ca6ba712226ce266ec5b9e02f6e07b7f2559e3f6464193eb64ff81b16f903daa481858d1d93f93153585467ce12730dff00cbf51f82c589021734c70e5c49de8137261d9df303a66b639e581ad06924386dbb8d69ee5bc560e2dc093f3562ad3ea3558271a3194da7c56dda770b6ccdbf5f151d81af40dd9826a9142e361509c1c9910f11b3e7dbfcd7e97792960a347d18e1d6f091088be9339c6ae67e06ebf39b0c336b8b71053a844b62f9b483e709ff00e948cbf1b1f92fd32d12691b0255b06b569a3caeb7a935a77d1dccfebfacd3aa4f7011abf92d68c6bfa5771a41c4b5472fdf43322730d223704824f51c792ec1886ad86b0fd067cdc49536ade916dddc09e2c7b42f94f407a15d2d37f299c51a53d20bf9ee69b205d90e22ff003ed0bbd69c344940d32e16fd90ae541cb66fb7de04f6f6040eb9adbdf2461c8c5e89701f9389ac478b745746a2b87ad46a970dbd9badb34b13b45b16188a81a53a9b06f4a762c644eb5cdd60742da1ac11a11a14ea1e178a74e89c825c4e9e73f8ad63ca27c9c287a789b4d9cf314bfa74fa7927d11dc00f152a455c6708f46dba1dd18685b08349d5cd15d39aeed5100efed9ced8d9745845b9ad3744da35a1688b04b5c0f4572ea6b76dc26b8cc95b96500cca96c9a566393d42f2c7aa72b0fdc2907826a5213284d08425f42fe24157429abf6390d55d0850de412c133c50820df8295c204b592ba13ac7a20037e0a30181285ed8af13d2c900bd1c578bd500788421506821084378252c8a56c71494e91ed7724e49acc7d424f1f4bc150d8fbde0b3f38136b72bac34f84c36bf6aa9d2d3dbb4c5541a45141144220b5c9f26216365b8117e2561ea3043af1444254e27a3d06a92305b31d17b624a76462e0990c30daf64985aebe0ed58a17d7967b4da8bda3cfeb20718495b607f22a2dc399116517117cc15aa4c875859546efb719f11bdaf6ef5a94f79e4b53a6f4cfa331566dae2207815ceb123088036190e2ba33d9d7801b725aad5db6d228b585c46325875b56e47acf0f6ca092340960377303902e60e5c16c38d6962af87273980002c2c78aa8fa9c003ab0d88591c2cfcce11b29f170b58762e061747a99d9992b21f4718960424957a93567b87aa22a54a9db29bcf2bdd65719e1ef30d6219100f513b3c87c96b6e49848cb25c9b37d7664edff6f574f3d33aed32a983b4b8dfcc78b636ecaab08bc89a2c0c41681a42d14623c0f335845bc3306c27b7247f45a918b673f6a79ae8583f4d155a44b869789e10fd8db56c61cec78f1e3f05b69ba8ba3b6cf91e76ed2ea3436efa1ee87f06c1a137b2cc974d9acdbcecaf970e29189b0ce1b795d9d1d3ea90d1abe61ca45ed205ba2c9d2a8b4074fa0c4fa3da8086758eb481c223f0591c6d857f6d69c5c3621ad55b43ad606e7b8e4b7d5f0e0e5dd6c5df9c63232ad41738e28268b899a090f07a4de7c8192e2f88302e2dc3379b54a588a45ec27481759a938f71b60a7a29aee170dc4196c27c36202dad8e9c1ab995bad6181b9e76e2b35aa99adb67c8dfa37aad3ff8bf289c8b682d62167705e23185ebad6a247d165137e5d17429cff4418a8445d4b14f9fc4e760495838347b83269fee3c5c21b70b67f9ac95699d7639c24765eba1aaa6555b09473ff0ea38d2b757c4f86a45530654b56671001ccf62d129742c72ee479cd9d627489ffe8cfbe4a8b2c058ae873c4fa1d564184f50b6295374aede4dc6e93f57a1b2ea2b779e723a486963f8e0bf876ab271ab277872b922185f361f4882f97ebf8ad368b427d80f48b2e8ce1d5db3a8758fa3901f35b668ff000a4dc3f5373892bb506e5d38873b1fceebdaa55a9989f4954468c6285c6e1b633e75ef6bfe3c0a7a846c829becabbe55cde17e261b4b2c5c6157d4cc494cf51e96ef3cc26d750a0bba163793bc363bb555bf017b5ecb39e508e1bfecbca6bac08713c65d57cf94fa8bfa3cd94eda38dde7c837b8cefd8b25f62ae7c9b745096a34dbd7675ac5f5ac573997986b0e44f93f5881cd60b08633ae60e7e5cb271ea0c579d22dcbaf15d130fbd63a44c2713a730436bda2b75e6b9ce29a239c3cfcb69c416e7ec481976a26e6bf3a9f036854cab96926b96760c5cc1a69870444e68b3c6f0db3b18b3edfc1613c9f710bf693ea3a3caf401bb86df6171c6fd3f5cd6838071a4783ebfe9dfcdeeedbc5bf1fc5750c7f86c433e9fa49c3960ea9d1833ceb7dbc9cb2bf45af4f38cf124ff23cdf91d2fece12aacf8be8daf1fd104d6bfb44d60b39910913bb6cb5ba34baf622962436a9037cf621d5f3f805d0e9ee64d5d8c0e441acddd498b2bf15cc6b6c2761fab4f6724f1b6c09e7c72fc167d7d0ea5ec876795d3adcf68b9c5e516a06110994e64122e4702acd42b9892bf49d9b8921d483cadd5629cb970e3370ec9bf67f3590a1e29aa515bc2dd9cc1aa38df35c756e0d4d63a2b3276d9ace13dcb6db45da9d5c9f497437860da7b7bf3b5eeaad41f9a83e98e037d8eb72591a4d7a92d9a434ca953839879827829f6c7057056a0c8a3ce7fbad69f6ed0f0eb750afd1e5d3e79f36bede25e7cb82c74f0df7a9a1ac44c9b886d6e9fd56758d2b0d54188d7abcb6ee7976abd738a8808a4b2aa555b45224d46dbbdef227c57bff000e0ab976fa85540045b0987bf87f558d8a66eb3b2996b78aceb8c37589ec83f6b3b78bdf5b34a9589be09dac2af55aae256c65b96397370de0bac0186dd8b2d48af5529222d838bded7cadc12ab521f9725ebda796fb536bdb8d92ac591b13128422e3aacac7020f045c755e122dc5401ea10840d042108f8893f2fd1b4ec42af633ff00c58bd1e992f428f6e827fb3de9499125abd4b9c9208da76210a6b1c25392365ef7827a00109a851901484d4232054fb0f7b5bb909b3a4dede975e494a40728ed7ddf14afb2edba7a0b094e51d97bde0a4a54b05410850556f05fe24d3a5734942a320b772a09b23daee505005e65f6aaa4ff0067bd358b57adbfc2e1dbc513dc4f1abad971e680295cf55e826fc5317a38a0084816895cdafbbe2a937fac55c942f74d01a84292009af001d12d49015c31922929ca3abda806b22d09c973792848a8b505eec7def05e25b7b4817379262ae84259247c30eaf34c946d7516e2faddc9c5bdfdbf0410de0ab3fd9ef535ecee03bd2d04ae49a906fb0e56d65146dfddf14010b8ea9838a2c536437de27ddb4379fcc269593505965da4529c55dc86ada037cae6dc02ecb265b8a4c02951d39bb99d278822d6bfcd37026156ed6845b367108aab63ebf2ceff00055dfe2d9d29ccf8a1a6085d370646d757b792df4d5b6393e73e7fcb7efacf5d7f1461df620a8b81bab9827b9f5febe742dfec3f0e3f92a53a5bedbb86d4d0dea53a79b6f33c6c6448eb7ebcbe4b2ae2169e6b9ad9bd3af2a3846da29f067eb072fd7250a438863a57ecdbba74880dee7547db7c138f2ff650b4e9337779e4b86e05c0de721a879f050a13e3589335cb86ee21911465c6ef3f97c7e1f9a5cc714c6f0c96aeaa52446dc0046ec2f2b696e3d7f928396550c4af8511aba0df5b39dbb709f7e3f870ed539c048bb4da853432a8b9f3436f37e5b1cbfd3b7f158ddc77aa248aec6e2a53e7d42db0cfeb7eae96de16d0d7e4353469ee206c0379fb737fc958a6b69af674f8a9cdcec1a3ddde416e6e0f75bb102a4f696a63091552cc4c12dbcf6d7db0fd74fcd4447b0912dad505dcc5733e737ebd53e9f079b6dbf9953a6aa0d5c4b65221c3751d94fab09fb771d9dcaed64aed63b577563bc4075a7c1f7713c65d992af151e86e27c893e7490e377b38bb670739fddc52ea05f57eb9e670da3953d8660b6fb09db5e77ecfd7153187e87497dbd5b65e79fa3ec1c34bdf65ddcefddda9691193d7ede44f9d3abce62a7d6644f0448de5bfc95a7d222d466d9bd418397ee677af6eda3fad7fcd5973e626b448a86ea9b0356d148d8c86fab910b1b850c583a88f27d4ece6743770c279cc13c8a7c718246c987cc6edd9734f2cd8b6face387f451dfaab0999035a34a6a327067381f5b8dff2f9a4366f1b7c2f3e82ea737a879c666f10cf02f7bfe2a6e69532281dc9a8342de2e30b86ce40db9ebd87e6aac170c22acbba0be931381b72ea54e13c427d7585fe7c555a4d427e21937fda070430e321c119ff005b2b7ad0bf837472d6e644bca7fd6b9586dda9f03f68ea0605b381344906df6dfc146076ee00d42ad21b1ae396adf60da6eb7ddc8bed3f85d6626386f14a691d49fb570c1bc9bc8cf94d1fc87c9622af57313786ace9b4e8585aede9045a449ecb7c952a7ec30e489d369f4d915072e6fbc387235a445facd02f70eadb38aad367bb7150de1bb79bbb8a4117248e37cff25987d2f6f1cd67bbb66dbbdf2b7158a71369335a4ea999de6f1143ace1c5afbc4ffd5fe17560bd78e654d70e2a53f3204992da2b5f6992ba655953cd1be4e735b0ddbbc71b62412e07aa9e7bf34e9afe835f710549d389104f6cce70dc2737d8dcded73c9558584d866b49753a786d00325c91261fb0b7e3c15d78d1c4a7f26a6e19c832244f9cddbc41ddf991f9856ed11d16284c603469553a6d56d29c4407d6e36feab002b932754e6069eba2b8f5f7fad3e61bf7ac83f13e8b466ee9e49b6e3f6d0df877aeefa1ef23ea8e38d1dcdc60f7154da779e277d1f3e3273cecad5c79c864deb465e4d904df270abbb6b5184e23c774d1f573fcf3f0e2b3fe47fa00c4fa12a7e21ade36a9370e6a06c6206f9e76fcd770a14897862934fc30d07aaa7c8d80e56ee56eb940938830cd46995570e9b31732b7671b0cacb642291291e683b4dd41d2c36afbaa03170de4516a7bb09fadadb71dbfae6ba8471cf9c6fe2b9268570561cc0b47868b861bec29ed0da1ed5d9a50e50f82f33e4bccd9bde9ea3a3a7d36f86f6cc74d8a12407078700a2d5c487ed77a6ef5b38907beeb20ee9c63379f0fa9981619853e91855806d426c24489000d90f0cd799b357ab8d997234aaa0fe8c919da90dedc782ab2eb90c31fae8757a7a4bcf38c89dc45bbd6b1507edf6e408c0ef5e83c6799b2d97aec117e99463ba26f305405b39647c53617f067e8f8ad018579bc13f75db859e82a12edf5bc57ac85d939c9fd3364dfe251de22f685d604d46123549364d86a005818ae0754d83c913b519adbfb9e2a4b05bfc1d8adeff0744ff90bc992b0e8a238ac7c9757bde11f357f781fbbe29592724d0ab6d7ddf146d7ddf14d2a5942458af2e3aa00b0855ee1170803db8e88b2889c3f77c5530fa47b515bc5036aa6771788038af09b0bd9605c62ca4ca705b89f73d524e206d34130cfb8f920d90f1f63fa33c67006d9204e04d96ad3abcda039ccf15e4ac4cda13e945975ba53960d3fd36e97d1b80371742d661c5b4f02d139b772bd05724103d6fcd5455ba2beafa3309f71c563b7f933bea9faa9a324230baa75990b020dcaa93d86da1b4310b8e050269e19a64138f4e2a83699b460a384d81b64b0b5106f164b6d792c4cb90332b01529006b5e15077bc7591f623029638a93a8626ce4dc5eddc9371d56168f595bdc7b3a77d5f47c56336df4f1e8f8ac94e20daddaaab891ac45a2ebc96aaec51306bf4b2b21be06c4de497f235a0e433583abb73045083c95ea054c3725a4e36bf3e4565deb185cc9d516238853387b7a39fa2d6cb4f66d6682e5bc11c39d815ab3d6e644c8b2e6ba1d42911424da123b96bb50a5466f14433b745c5d5e9534cf71a4d5d76a58342a8c98dc6500b83c7b16b5586861bdb3365d0dd339bc2dd8b56acd366911901702c81dcaacdab065d9e8da955dc37e72a23f71b7b5ee625ce9ed31c359feb45b5b82dc706620a961a7c27407e8e729df05b762ba037c4d262add0c08c6795b303f356fdb467039b1d5d955febb3e272363557b87dec2e983e85b38838444aec783b49749ae90deb3aaddf5edb71c7b173ba448c370bc07143086f09b0b8f9acf55345f28b785fe137627cb881b7a5f9ad143957dfd14d55745ecea7895ab3898c5fb5d48159a65b27127eda4f6fe8f25cf1ce8bb0d62621ee8ff00144a22187ee4e388ecb7eb8aa380f49f5bc12f3cc95a339c32240dddc0b6c3b065fd56e15ed1cd0f184a18af46af21913b38b602c45f8e6ba0e35df0e8e341ea3c75ff008cb6c7f9fa390d7347f8cf0f4efef3a04ee24070dee405ac7d91e6575795a47c7d86e7eeb5597784dc190e61b9b7e4b250e9430d3eff00bf308b3736fab7f1fc9739e9e39e19e8e9f2da9a61fdd86eff00d1c8e4d51f3680399135cc317c2eb2ec2ab88dd5b64e9ec3adc735d3a4e3bd14ebff00f6381f2fe0aeb8d37e0ea54910d170c18631ec8005fc11569767ce666b7cb3b562bd39a253f08e912b27779ed5d37279ce702c1748c25851868fe54da9d4dc488a7c43ef1c323f8ad071369e314d44914d6cde9cdcdf2233e5f35a2bdafd6ab12e27351a8cf7049eefc724eb3551d2adb1fc85aab53ad8e2c4a31367d316398b16d5a5b5a5c516e2d61d5b1e1167c973a8e088e712be22b8cc71502dc464130ae3df6cee9ee3b3a5a21a682843a378d0bd5b77af79a4c204a7326c73e19ae99a42a4f9c708ce9d0fdbb5f4865c6cb9968928da98861a96a881bb7b8f8aeaf8ce7c993855fc5af7b43f35d8d3ff00839391abff00eda9547cfbbc9308bc39f05da742d8f627cde760fae033e1327e8fd39ff15c4e223e0ba7e83e9ae0551d570e525acbdde2cbe2b268dce17ffc2de56aaeed2b561d67474fdc307d52c12e4dc36b3a6049e32667f3594c7744f38d2217b260b38686e4f32172fd25e2c7542c4947a9d2ceacf6e0906fdabaee1ac4acb1752e0aab48844da7dedcd7a36a17c1c3ecf9c6bf4d3d362d87c4e4517a56bf45ec03c16671351cd1eb335b422c2d7927a117588e2066bc5eaa16573d8875328ce3c1017421049ba5fc47894210ab903dc89b94d0f1cc8166f3c8bf1b24a0dadc10e4d7246d3d119372405988b17556732f37b98778927d9585d6ec538491c0a85393fb2521685251544f23810842a8104210ae0038217808b715edc7540a3f31762db76fade0973cc96f7d537eeb256dfdcf153dbfb9e2bd01ef4ad3792f558420087d17a24ecbdef056557401e6cbdef05ea1584015d1b4ec421000847d8f6eb772526463b881c0762f119a5ecbdef05096467c4f15855765ef782b9264dafe974e4a5902a67255d5899c9295a0f002509ca3b2f7bc155bc0093c5584212dac013db0ff00587c95bdafbbe2a8a6a00bfe7473bb7158cd5ed4c4a4154b233ed7b2c96852402e09abf2b9aa7b0f7fc15a4d480b084210588a1092801ca638a8292008a4a724a57c4a9e6cbdef04b42102a52c02aeac2103464ae6ac9e0a926a08ec7cee4aace937b7a5d792b286febedecdfbd05ca9b0f7fc1790714fb145ac85d876796045ecba6604d1ebeabd2a56316d3b750d4c3bbc8b5c6575a1d0a96e2b552934c6d0eb4538dacbbf30c33150309487351aa4992d9b8b37bb8191e5c16ba6193ca7ea0f23fb7af643e4546afea92229ae59cab388a5ddc48d6e239e4b56635f998a64543cd92b61af79072e7fcbf35951587efe7cb14f864b76c3eb99e739fd7b96b74b85a51aa0f5d161bc913acdc1723edfe2b7a7b560f9e379e4bcdeb2fe6089bbc70e359bc1fee8542ac055a1930389f4830c99370045b1b9efe2b1b55a7e206eea44f76d6a2de275cdbbabecbf5f92b93a6c4c2444ddb3adea336fbfb723f040b43a6cda40ddc3cc3d57754f73c8371b03fc562cec1c55de398b0a386d148924c992e1c6c48d436e16ed0aebf93b7a3c53c499ee6648ff00064baf5e6fd33cf82ae5bce9b8767b48e9f5178fbd1ddfcf078ec8febe68092ca3d7f0f9fd8caa84338d3418aee6448717b01c4593e9f3e9460794292f9cc8de6d79fbadb578f62c0614a84f9cc1d506bb3fcd71b99a4b892e1af1efbacbbd9d31ecf2ddd30de217306eecbcdf9ec3f88cc744d82c8bc61f264a9f5f912df871322f49bfd1e76f07616bff004ed55bd7bb9d3dd4504d733dc5e2913e7b7b13dbc9558a0a336c49acdaaae1d4fbddc487e7eed6e1f9fc959c532aa0dea338c31533766a24963bb39eccad9f621f65d7286ee5228f507f5edab6da3693ad7d5e3c5631d6dcd419bc734dde456810760e85fd6760e2ad4c633c3935089fcaf4b37b3f74fcbf9a1f19184a44eaf370e9bc89f2b56dc6dde9625a639e566738c4af24e1f2c1c488646c3777322c2eb0b509eea6513f66a0e53f3fe8afe1facc8a861f68ef0d3a9ee1cb969ad14efb0b4ffd7c536186638770b47752bcfd85c19f1dcedbaf6ab7fe8816da0dda9cd30e4e78e5cee93f7806435f53f825c551914f9ee98b79cc5ccf73cdc0fadb3fd78aaac2ae4d6c4972778dafd691ab7bdbf1e29b1b8b370de183630ec0ea8bdb61b424777e7654cc80b4c456039a8d4dcbff0052dece98b16cdb8197d9f25429958fda17939e5323d837912739eff94febd8a2e1c38a836f36d329dace44ef5f3edf3cd1517ac05621de1a38a7b76f6d5de72fa42643fe92631ad18cb730ba775c6d5abcebc83222bdbfa2d9db61f9129dcdac542a5e70dded76fadf653cdf977782d5ebad61a055ed5ca8b7d90d6d89a71ff52ffc96c72263a7cfe580edd35d849b4eddce4769c6dd3f92248198e7ee690de20daa7851bc98677af3bbff008fe1c33f158c7db234b94fc013b6ef476596cd41aa0733ced3760e45ad73eb42c356e950377420865ecaff0048bf1d6bfe08ff00d105b2d3cd723756a219ee76fb713c45c871f8ac050670a8465dbc876d3e4cdde656ee7eb5ff001e0b30ee802a2e6486b5fa6d3e506f77139b65b733066b64d1be83dd6921fb68b0de3534ea7824387c0fd848e7c7e0990ffa4a59377f277d0ad534e15e98e2b6e5c49c36c26819c599e9e1f8afbba7eead1b4aa637f5321b5bd2facb8e69a6bf87f41da107942d1f561ab37859eef4f222cc8b70ef5c33c8fb4f189b1356dce8fb1e56a7d47783bcb09ee480389e7cf92d55a25c5a3278534e9a60c41e555fecce586fe6690ee7379ede11fe07c7b2eb78f2d5d38e2ed19e01821d1f4ad785ccd0dccffad616bdf867cd74cace0cc3785f12c5a41dda48af39685bc53e0e39f0fc56b8fe6d35c53e679f376323a38faa977d8ea5945a3d99cf252afe24ad682f0cd6f16b985cd66a32439736c9779a7573653ae62b83d5725c2354a7b6a54990d616e1b191691badbc16c926b3aa6e230be69a9d4cd6a5d8772883f5a48e8ceabbb51ad702eb4fc478b24d2244cd848de679ff0006df5acb10fb10cd32b63bc8b755aed42b404b276a2eb26a3573b47c6966d0fb10c892c4da2106af3bdeeb4b7f5e25c7d63f35ae475fabb9d7de9aca17b5b3e0b193dfce3389254e8b5338dd122fa73066e72ea924ba19add5854c4e920eb5edcd71c6b51b4e86f12e874771142ce0b712be8da4b5d897270271367dbfbbe29addfeac47d7dbb085adedb3b6af8a76dcf287c5766bb1a583359c1b16fc7f760f9a76fc7f747cd6bdbc1fddf151dfe674f156f6b166e322ae2182d10cc26c15717e2569f0d53540d6054a0adc022b4520dbaeb2956b449bbcba98887d63dea62a02ff005fc169f056db6ae622057b22b7019a46b1b0e054fb0b9ba40fc65788d93e17d2621600dd69fe753d965e79f60833d6170a15a912abb27d1bac33c442e10495a3c58accbc8443e6a83bc6710c858ffee4c56ae8d34f8fbad7c9b8bea836f435e6db8db25a9559debeb8d4b77dd6aaef1643364c5b39dac07158d91880ce2449cadc6c55f3c64f4da5d2c7470dd333f359071ab71722f65e4ba44f26c23d51f051a5c898e05e1f6b8d8705b753196aca04cdff00a503edd4c7e8d60512a7305a1bc5de8340ad5ad6f82dea5cd6cd87a518f92979d198c8c694e49762d6ae4ba473e386aaa0eb4f04744c143a9c36d905be79dd9fef05e1aab3396b0519225ac9cfe7134290e6bad1d6cc47183deb232f16d7db9bce88eaf510adbc44de79b90a9cea3b79d0ea9208ed082beca67f289469f8f1a450c4670120f41cfbd679862290e6d69d6bf62d46ad84e6c60c4ce0170b5cf5f499f7b920f75d2c6cb4545c96c676685d9d5f4a0d6e3cecab9702324ea817ed5a451b15fd50613ffcbf92d864d42539835e51bdb88e8aadf02ff613a391af29f0b8111001bac038a7c6dc1362b3f2dc444e7750730c2e20d53084868d546a674f1935b26fcd40e7c55f734f2df302e3aaa91431422e47154f8b3b35deac42b579dd65a9d588a441b0740c508e05620ce22202c990cd041b04f84ce5eb7430b65ecacd921d8bd95706ff0092a351a1c53a0bc2465d8b11aee25c5af22e08e86cad31c4c045b1704f4255ee85772e0c7a5d45da5b32d983a850e60d6005d6bcfe8711946fc4ae953a6b69f6326206fc561dfd2af30c421bf62e45ba0c747abd3799728e19c89ed15c4b9a629109edb2b141ae546913a132c5a41e775bcd428e223af35b9b2d7dfe1fd6bc520d89e4471595e9a513447550b04d770948aec935ca1c37861bdc5ae6dfa0b4f9359c4785dcea379d3e50111bc922c22ebfaed5b4b77551a447ab1c2754730b3e5ce1bc57200744499f10b5a2b5c254b4f37ca1d458be327c1abcbd24b1a843bae21c36de7e56ca1b93f1baca5262c0026c13e8789e751a740794432ecb154ea5a3670da6176d220e657bbc6cb56a85003724ea18b3ba56ebaa193a69ba1b371dd616d2b11b0ddebb0b1acc8b5b789001b77f554e93a39a0d1db4d66cdb19ede75f29f08207f15c3f64fda805abc72d8dbd1596a4e33c634af47ceae6783d4a6c35115f34625a1beb5fda91d1ea5a33c30e22d585a19279884ad46a1a1670d8fd1aa17b71b956069a2b6729f4a6d3a13ecdbf92b1feda62f6b0fc63e5fc113b34d6e323a8af5b5b7934e7da27c483eb86d3c41c332a8ffb35c4d247a14e39f6adf4e9925c5c680e3b804c834b986e703b76ce21e872cd22cd369ef58dc6e5a9d4c3892c9cca2c0f8a86628f3aff000595a568cb12bbc9c83207b397cd7438b48b8209bf9c27fc001fc5593a41c11043715527e5fc556bd0e9e1fec0f5b7ae1459ed2e86ce80cf766d08b42072b127aad171f628357726954a889e20740b68798d703cf6e779a81737398392c648c7b81d80d5a7522082dc0ad164e0a1eb81953b14fd9346ab86b4775dafce884c6a5ab6845c389f95ff008aec41c50f0161b85ac5ea037190e8b9e3ed2dd4e7c5ba535b16f6be656b8e5fd42b33b6f539c1c666d737b2556e306174acd53fcfe250af62371882a736a0e011ac7d1b95d234215e14d7be638726ee06409e1facd68b26992667671e4b6cc374370ddcc978d6e22924459056aef9577a666d7d54d9a7d88ed58a6851d5984b2da1bcf6e2f0f68e7f92e6570389cd763a74e8dcd3e4b88f8f08bb56858fe845a543ce3201d838cefdab4796d27b23ed81e0f4d6284f6335842ae4819217963a7ff410842a120949a94a18d26a4a28544f00084214002928a14a78004210a00149450a53c01f972891ed7729103a2f761eff0082f447bbf90210108284369ff983ff00c52948016e08205b82bec022ac280fbc2f26f25421727bc3e93ff4a50fb04ddbfb9e28fa2f440cf895667247d7ecb26a13114269b23daee50fb6f76cac7d9f6dd4ae4ad62ea1bb08ae0d979bc1e70a7b89227dc91c5548a406b3b580bdd47adc7b182e71b8094ac8e25244abfb5e09604ae7aa1478fa8f1562c7a2004a6ec3dff05391ed7726ecfb50022cd57884200361eff82f1c4ab4e116b78262820842765ef782b3b1fa47d6ede09b0b7d8fd29c8e3c6cbd70e378704dff0092304ee1a21b725e371b7b65ab7ef44b205fd6f82b7b43d02629b0055508520de01085241522852420b1150535250d645d9f45242b93656adbd2f054d2d7058109bb3ed420010a6a0813f104f8b2cd214a0178ac81ad64b503784cbdadff00f6af037110b84d976d4e392dcf46743a5d66ad2cd660cffc092067d99724eaa9764f263d6eaa3a0a2563ecc9e1ac12c27b06ad9b08b7c8e1be79f45bd541837a8ee740d7d8b610eb5b5acb1150aab7c214b991b96b3a271049bedff5c560281570de841f39acb031b875f6ee192e9c2b503e59acd5d9abbdd8fa3254f34f75542c4317021902f26270ead7d416e37fd5d63f5e8948ac3da1b6681c4f3b69c7b4e57cb9725ece7747218b822538a8ed4c53f3e3af7f97f258f6cc9f32aebaa85529ada9f4f36714f841f5d24cb36b8f056c64c0ded2e9a563363592eab739aeee2fb16121c58e7c32c9630c864e197ed25529baaca2fb7867c17f5ff0ba74aaf487ef9ed72a6d5d54673a3bc6c03ab48e76b0ba6e26a05261c3f4fc3f866a33e5317334ba9d6e00f325047fd2be1ca8d267ee9fb32227259fd21bd87ae8bb4fc958abe24a8d1de4aa83c89cb660e275f7690619b3d63778c5cd5f542855672dc4f6a613760d7d77ad16e49f4c6cc290c67d6b68e1c19173aee22bdcf555680462c2f9fe1580579b48755070f779b366f6f51cfa5f92b8ee8636304fa3cd9dab9eaeef9dbe296ddf556aed26346f4bf37d41c5bfc71eb6467d7f59af1b326387b799156c413c6efb0ce137bdaddb92bc278e025c86d6910cefa5d35c44ff0063eba7b886df0fcd7b367ca714ad4a94529b4e36712077ff004598a2522b7227bafa15b6f349e3c2ddddab44a8caa7b1ae4a7913b30b7336fe6f7473ec50de591d9b652a9fbac82e3135167ce86a36705bb674bd75576788229b51fa3379314f124ce7f0e7f1508b13509c366940a9bf637dad816c6f7305f35ee2e66c5bce8abcdc393247091d075b2829ff00049c3f2c4c81953dab7d873ddcec562a7c9a4bd7f4e2da7c5bf379b69ed439d619765bf57574d48d7b09eeeec4f6d3e44ccc0e27e2b17051a8c5bcaaa52288da8efb6a5acebfaf9fdfc2c985199892651a46a4874d673875b69ce76ee6db1273b7258fd9c525ff00ed4549fd3e7d39cca267c2d4f8d94686c6ab36a3bed4244267c23601c5ae40e57577ced1612a588dd61c6eda1137849fb78a7721c146082dc96d3e169e73a0cc70dbfcc6dcc9e079f155b1056056374a6d4aa2d2125e890e1c96b733e2f87cd5bd8e2b735585bb76004f9f0872da4c272b2a750adcaa03b22a753843933ae2f170fd5d4f4059933a8f4562f1bb42c5cc0dedd9d7e4b1716279f0bedd67c125b317728c8de248b8b73e9d52ea12e86f775ae8a7b9733dd7d570df9704313866b33c550bc732243697ebe7b83c67fc7b95d12566187e9d4970e210c26dced8489cdce473202c857a0aa425a4fa2089b542a324377bbc8e1fab94cd9b085c4da6b37ee9d3eb870e7ff439ac2f9f27b9adec227713a907ec376ff06dfaf05469fd12b19e4cdd4a73995258b7c3d4f86a12090de2d616f8f5b2e95a6f9d84703689693a34d1b001c9b38abcf6c6d6ecf912b5aa0615c4cf30fcba0d128ae27d69c5cdc76762ee1a3ef27ba7d363935bd22ba1519f10077107d44ab70cbbfc14c2366793441c1238d68d3449a4fd2cb36aedc44ea29048905c393d3f15f5a68b742f80743348798ba653f7a9f4d93bcb87e3239f0e1d2cb0434d786281a5ea0683e9d4470e1f54647f95ca4481f25d2715bd8a268281f7995143ace003ab9f5e6b5c1b8f62acb63d23e35c35e5a38d349ba666b871be1d6c292fe7124c2331d2d75d2fca1b0a626c71a2da850b0742237c05f54f31fa0afd2308687746f89663aa6b2a4d16af52006a5adad7bf25be358b6dabb16bbc6cb88b70bff459b58f8782b5d9c98dc2339d48c35470e8194f9bb41ab9dfe2b6b6388a7490038f4acb549cc71048a7b5c4ee5a09329fe43d1e9c89ef4d90f654f260d65f28d74e70bda4cf59a4af756a4cda1cd79b450f1b5fb5625cd465df89542200db3090edc4bbe565ce9df335ec1b39ecb887a37baab1381113110abef100e43e6b9a691b4cf48c3f8adae0969103372edd55a7c66fbaeffd08d424a0ceb2cc4339ccb801fac6cba7b091136912a126f61f35c6f07b877507ed758024f3e8bb2b499afad7e4be9ba396cc1e5ac786354c704711927589e0176e0653c4a56d2767daaa508cff0067bd57ceead9917f6bc12c4827daf047b50dad6454e07644854228e28211e970ed597710ecdbea902eb5f70e357bd2e57ed376934ded9e30113a8b5ad7f1582715f207dac5dcbc74f07acb667a2d7a28ee756ca3de8f5fe3fc5c135945b718adfc06d0dc0ec89579f88e19d2499e492395d631d9d6882c6cd9bebf656cacaf0ba2de0ee5ba3838f08cfd3e7cfac540b5860b4836b5cdd745a43462d64c57800115b2f9ad630952e4c9961d1ced6cad64c7f5f92daff48115bb2cb44b571aabc1e6efaecb65ebacde3f68e4b2b9e7176f4545fe39d69515a65acb8b627d21b790e8b592e639f17c5698710627afcffee26ce1d74e77fe0b956f94fa47574be0dafcac3b5d431cb9722eda2ccf1cd559b8deaf2a445aee6d7ec5c49d620ad53de96ef5beef3e47dbf2feb6fcd41c62daa4f772db6beaf1f4aff059deba72676abf194d70f89dce4635abc8bed1c71e1c96c74fc66e35e2889b816c8c4b82cfade2ca7c222a9531c37072bc5981e0af33c78ee286f14d208e216aab573fb0b3c7d528e123be45a428008a413165cc1fc9672918c009c6ce0f2e2be7e678b5bcc835cc641e8b66918b9b451db58fcd6caf539ed9c7d5788adc4fa35ad5a54f8418e11093cc158bae5164d424c46186c4663b1720a369326b59e244ff00aa392e8549c60c2a3235b6c2e070bf05a5cb723cefae7a599a9bd33e92e44246b5bbae165295895cc114368631deaed7e5c87d20fa5c7c173b89e9a73b2dc456d6f6baa4ca4d1d8d3ea63747d733b5d3abe1cc3088858f5eab290bc944e6571ba06203bd81bc2de18d5c4732c4e4a9ec4c4eab4debe51baca71248bdf30b12fdb88a331c278e68df25190a70cc118bfe6831c355e97831735a1b6b5ad658b9ce66489daa3805b1ceb45d16b158956b910f8a5b960ed693515d9f65e6cf22982d1d8fc13626cde68bc22c7e0b5a85c991998eca70d7a11684c5e29b5d8abec7dda6aede8ca1dab79f706d657db556126d38fc3358286ad2275ae73e69a1cb7ca3949aec56182cd14ea3668664a7109cae3b42a53e930cf27561c8f62c7b7ab897717c95a871149b6ac4543847ec2af653d231552a14714261d51f1b5d60e6e198c0e238dee05885b9cba8c977198618bd203814f81b42e2592611f254951166c86b3e99a2b77b54a211b09e45b21ad98593357a55421d6ae3286188640f53d5655ed12e0eac2085889ecee3ebdadd8933a7e8db55d19fd8b9d86b0955e0da37a8c326dc403654e668fdf42006bb19e39724ddd888b2cd589067c80765308bf1039acb66922cdb53b22bf16616a1832acd41304884dbb6cb0ae3095462201a54ff00fe2ba141886a6dfed75620785d64646228bdb8a445f0495a2abf825eaae81ca860677307fdd4e87c0592a6e8daae082d9ab887f785ef75d7ce2707d10de13da946be26706e0153fb0adf21fbdbbf8391ff00b36ae987367177aad334655fb930362bb29aace8a136821b1ec58b7350a8039ea7caca9fb28a1b1d6d872a97a33c47af93722dd8a7fb24fa4382d1e416b71165d222aa3de71854a610e23d69f3093f1557a5884b5339f0cd38e1a736faff00f4ff00356dae1c719027203a7f35b837610c46d0837ed0ac170189877893ab7e0ad1d0eee8c1a9d7c29e0c1b3c2fad09d5b1b71cb82db28ec03788420004800d95415d84f19472ed4a8715d421110dd65e613ead0cab7939766b55eb103a5505c430cbdd221ece59f152af53c55e9f3191b7a42f63cd72e8b15d421e207715d26835a357a54a731111456b13f82dee11b2bf5c8f29aaa6caed762393399665ce22f928c24755b2e3ca6c4daa30bb03d4cee365acc50af07aad3fedb50ce9d36fb218c124210b38d049205b827251e0aac9042117b287c0d2684292aa5902284214002928a929400842109e40fcbbff00f891ff00c5375bff00351ab3bb7bfe096bd39ee7225555694bff0031dbf5505be4535614247b5dcafc9936bfa5d39294b2505519beda7c50eadf8772c857a4489d7d5e6abcc7b320b6cbd1bf155e74eb5bd1ebcd416ce0aaaba958745150de4ab4084d511c54259213c925e4f7130cb39a0f04a71f6a568489b197e44fb48d6d5e1cae95121bcefa34bf47af35664faf875beaf8a559f2028cde496accd937b7a5e0ab2581352514e95cd5c47d8c02c89116b6b65d166853a545205cf82c5802533993c67183c52dbc1242a22ee0aae991473270b18ed652b7d1bbd4219d15a5702acb1633dcfdde2b83d892b22cdec4d739106a91ceeaf27964b7825506d31a350268b95898633c755659ebb9ae613b537bac65ac801aac5c754b9326f7f4ba724e9dc95b192e2d0a32b9a620a914d42b3264eadfd2bdedc9057b2b5874458744e9d26d6f4baf24941494b6821350a52c90964ae97b2f7bc1589bc978a06645213b5bb11add894594b02f97728926fc55842640a15d7bcae9882ad1ec9dd82dd2a96eab0fa5c86e35af94d3ef735d8d853e45269134519bd1db4f20c5b7723848f8ac3e8cb0dcf870e4eaf31a81933ccdcfd1f8f3bab157c4920b27331cd1db4d9b3fd44718cae3e0b6d492593e73fa875b3bee75e7831eeeaee44506f5591b1238483c24f227e3f92a352c40d1b45541369ceaa34f6e7d74fdd7871ba79914e6cee18274136285d110379109f5324f500fc424e346550a2562372c6a1689e6c654d061e308e5e09e79872da597d4bf3bd1c064eb5223f486f3db9b5d229ec68d5ea5454f72de275bbeb6dc539d5ade2a1a3c87ce935d3390edcb7844f3988baab758a8523ce529e5358cd6d366cd3249244561f9a6d6887c92c38d994386a5d0db32d86ebab221716f8f3ecfcd45ad0a3c3d51775ba9ba7352b8b43171d8f4fd7628e209d3a6b5914d89c4d32dc6733d2e272cd29fcd9f0e1da77d226e73a5383e973cee144b860fe2c85424c73ea6f1e3aa96b3832a548864b78f8d81017836339f496b0d467c53dc7db3788fa8b4b24febe2b114face24c4935f454e76ce9ed64c370616fad38dafcef65b3d2ab46a14072ee29568a191e9656bdaeaae592114e6bd79487ed9b4787dbd4244f22e1abace476dbae7c3b159aeee33da4353acd39cba6ade71864e7fe9dfe4b1542a73a859d16b2c1e96f25ece0274a845aeb24edb412a74a865e50c24d87fcc0ff05524c238a8d4eaaeb5684d048bf06ee1c5d679f89351f37549b3c9b4f8a4c1f60ddbed6d3c5bbd41bc99d4ca939a40124d2dbb53366910de74d8e60b137e1d39ac762c87cc156a7b76b527db06f06c5c8d6177032e39e5f92007b5a5e0d735f0ea453e08b5bef1096fb2bf5cf9ac8579f30a85667b7a0d15b1ddf5b59c3875ea4f4b9e5cd5c97417f54c14eeb51d48c326397e848ced0f7fc962aab219d1a8929937921ccb6d019ee3781733cfe5e2821f4615fceab423cc75f74d9cc304fdbc3b06d7bf4e4a0de9d4360ddec2e5b111359d6dbb81b0ddf2f1fd705b4e146c313d36a739ecf9a27353b76441ca4459f0f05aa51cc503899b68cb8dbb9d8c5b53ade8a60a7d8fa853a2c43b17f13b9d4ed84f16725d5ffa7055ea15c92f81b539cfdbcffa46adb578fc944e33792b11d56285bc3e6892d36018eb656cee7864af611a2bcaae1d0e65d7dfc86cf6f79023bdadfd543e8a92790d46a53a44f9f8aa46ab4925b170da2bcf91aff8ff00250a706af1f194e69ed5d0a7daf3c8bde20b26f30bb97a6274c6a0606c7d46c270d6cbae4abe2294d296c9f4f1b59b1b2e04919ff0e0a1760556742dddabb735ea8b92f5bdaf0eb7a83c79f3444d2933e91153a3feee7f10f48f0f803d563298f239a5ac89d0eb6de7497119bf13606de0b3588e801bb2a8d6a17276d28ed65da1e04dfb5580c3b9a830c410970d681aefac3d4483eb409673cacb7ad0a687b11e991fc868dda8a751dbced59d3efebe4481f2bae7edb12cfa1b298f64b390e22753b631ed86b5c1eabec5c66f6a1e4dde4d01de0f32bcff00517124cea86609cc26d5d939c1db5b605a1e0cc3735a51d99d85364c2e679bfde36679f6667e6be79f26fd30e2ad35e945e6169f874b7a5447f76c09f8f7aeafe4d9a6879a59d0852712621a743bd38dac99b637114362b3fa357f8470354636b82f08b7630399febaf6f4b8dbf12b544953e30714f288d33e8cfc97b49d13d8b0b79ef16cfa6eed3a79190e0b31867495163fc32cb183268e1ac5509267ec278e2395d6174f981309691b4a631a627a44b70fa44224036e5f15db701e8c287270e4cae5684539bb291eadbc836b7c0944c53e6783e1263e46fa7cd30e98dc5727d4435a08a8ef2e2ab724e7d2c7b0afbc1ce28c1b81a38b47d83aa0ddcd55a992d5f0b7af3b4cb82f90f0d7966e95ea7a5b9543a6c0c5b51674d9d2226510c88b7605be6857053b6b884622c4755f39d5311d4e7541ccfb11e971033ecc9717cbea7f6b43b3ecd1a5af7d87d4f8d692dea78625cb1003bb1bfc5715afd19d53c99cd01d90e8177b673e289bc528e6b48ae52e409f08e46ebe6daa5ed6ecfb67b0a65b62a2711775d73205e08891f158f8abd14f26f1116ced75d4ea187194e9b7b5add8aaf982992ae7600af3f6516b97e32c1a3726688c24549f91a848bf7ac2e94b01512a1229f5e78c9b07d449a27c99f143c2dd575489937e5070ed5ace3f1b5a442d89b433a767e0b669a17e9bfbd197252c8c6c8e0df7465566188680d8556441bcdbdab2de9bd1260277373bd6b705cfe80d206b200839713d5753c314d9388e441f4b7323e06fc57b6d079d5eb8d76c7279dd4e9713eca9e62aac1631b6cfe2bcdd9fc822f2356fdab67fd8cabb0ca457a2b47c41bf2feab1b0435793112e9cc89fd2f09165df879a87f0cc93d1a7cb313de17a6dc9666655f51a8d79109bf45e1d83e95a914a033e9c16aaf5aefec462461a61bd9107a26e47057ea14b81a42229730e4a8c31de1b10a5d83aaaf7e0c6d69f0821d503572eab557d3a21209e370b215f744440186f73d782d5ccdbbad7b7055b267b3f17a086d561e4b8ccf9a4c4757e2b1ee0896e09cacacce88cb9a4c395d629eb9884ecb925ca783d1550e7814ef3b101602a2e0369d2e331daf7bf6ac8bf7f301160b54afba8a69f48701923dce1ca36a5c1d2ded6ecc65da2e37fc9725c4f8b209ee8c0da78e7ac9956adcff35c3e875e7f0557475426b528e6d61c1bc71424186df9acba9be5694d2e82baff00345cc3582f79722a75c00c9cc8d6165b438c52e5a38f34e1462d9bdb89bfcb97c54a0912ea2f777982d09e2b098d7104ca03e96c1836844b39665626f08e8d70df2da41de0a7d56741cd4eb2d8b99bc883cbb6eaab8c031535f4139a57c378ac73b917e0b5ba8d4de4c88fd2a68bf6ac0d736bab1fd266fcd556a648d8b4b9e327708b1057220499f26a3ad9116e3dcb0f55859ceb1ace1bf37ebf11ab95ff00565c5e9951a9489bf40a8cf6f6e168aeb7393a4fc44d649de6190e3572849162b457aa9742add3fade0cad5f0e4f712a27947a86f2dc0beca2caeb134e7f3a44e0d5cc53f58769c96e185aa4d316370fd84a9d4f9bd6188714e79406b5482285d9d68a3f6adc16d858fb314ebdc2e993e09deb613c2d75b131a83b922ed9c450ae5531c3ba64c9b4e933ef0436b1d5f8f25b6e1cad3a9a35481c81cf8ad35ea649e0e7ea7c757641e4eb34ac66e2286169518f872ba962590daa0dc3c6936d15ee6c382d28ceda66427d12b2e98b8dca61dbcb88677365aebb1da9e4f2ca8744cb54faace9337ea837edb2db99d79c4f0089c3e165a0d646e957d59395f8f6a9c33c9b6450b299da852afad26774a4d5f7a399162382bb3ea064c7ab09f15cbb0cd6de5feb2df219e4904857ddc1e5fc851e9bb064cd467920f2497b3607432e7c55198ee64a20581099266ed6031ea80aa66aac754f08a0f656ac472cacb06eb28be0b627a3d007b16bcf2588fd1bdafcd07a8d16a7d8b0caa1fec0e455b915c04006202cb5b8a698898adc9538dc4501b84278e4ec42b56766ede78956fb6174a35bcf2880ed5a56fd34e57c9785d457e1e29b1b3256742e8dce4d7762e75a29a42d9a938c65dc488ac611dab938767982ab0a9b9913fd18b86792d30fc8e3eab4ea0f28fa29bbc90ea004657e490f1a359dec8b9e6171da0636aa48cf58c5aa6c2e782e90c2b53a7ca86d06af7abecc9c9774eb9f0c9cfa51e32ee5509d0195c42cec0f27470664058a7b00faa916578e0e9e8fc8d9c64c56dfdcf1561559d26dabe978207159db3b55dbec2e6d7ddf15e4be6a0adb195ad188b5b8f629ec6be8b300bc30fc14cb02e40bc24aca376924c20eadac02bd2a1861c8054ecc16ea5d7d1af4ba06d88bc3656a5e189395e58ef59f840b7052bf4535c3273eed7cfe9959a30d48443703f353774890e21d78ed7b27c06c6ebc7136d2ce5c16ca92471b577cac349abd28368cc56b03c2cb0d1657175b1d75d18dbdedcd6b115c9e2af63c44d1e2b99ac8b8c5cdaeb70c0955d83a9b4db7debb7a5ff8ad4353b55a613f767d2a76a6b6adf2bd9628cb6bc9ddd668a1a8a248e9988a9dbfd2a6c8b77ae171e3560d5c090e76cd678e86f65f43cb9863304c238725f35f940d15ad0f1bc539a8fbf4a136316b58fe8af3ff00aa2a55571bd7672ff4de921aed57a2667a5626a0ccff00c4a5857e5389336e047c170233ae6f659494f1d40d84704db5bb17867e45aecf75acfd1d18bcc19db3e0a317a2b9230c4b5e6a0181ff00017fabc7c564e563eadeb58ccf14daf5ea470adf013abac1d1d1dcb526d8f229909335802797a4af48c5921cc1ac5bcd87b0596857399cdbb496526753557dbfb9e2a69b0e04b8ee1a84215c48210854da00842801650e3803ffd9, 'abc', 1000, '', 'AC \r\nAttached Bathroom', 1, '6.952029292132658', '80.20246807997601', 5, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `seen` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warden`
--

CREATE TABLE `warden` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landlord`
--
ALTER TABLE `landlord`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `fk_student_id` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `warden`
--
ALTER TABLE `warden`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landlord`
--
ALTER TABLE `landlord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warden`
--
ALTER TABLE `warden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);
--
-- Database: `malcolm`
--
CREATE DATABASE IF NOT EXISTS `malcolm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `malcolm`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `enquiry_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `price_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_submissions`
--

CREATE TABLE `contact_submissions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_submissions`
--

INSERT INTO `contact_submissions` (`id`, `name`, `email`, `subject`, `message`, `submitted_at`) VALUES
(1, 'abcd', 'abcd@gmail.com', 'hi', 'hello', '2024-07-12 17:29:39');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `enquiry_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `enquiry_date` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `price_id` int(11) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `enquiry_id` (`enquiry_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`enquiry_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `gallery_id` (`gallery_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `gallery_id` (`gallery_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`enquiry_id`) REFERENCES `enquiry` (`enquiry_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `price` (`price_id`);

--
-- Constraints for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD CONSTRAINT `enquiry_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`);

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

--
-- Dumping data for table `pma__column_info`
--

INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`, `input_transformation`, `input_transformation_options`) VALUES
(1, 'green_residence', 'facilities', 'image', '', 'image_jpeg', 'output/image_jpeg_inline.php', '', 'Input/Image_JPEG_Upload.php', ''),
(2, 'green_residence', 'property', 'room_image', '', 'image_jpeg', 'output/image_jpeg_link.php', '', 'Input/Image_JPEG_Upload.php', ''),
(3, 'green_residence', 'user', 'date', '', '', 'output/text_plain_dateformat.php', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"watchwise_db\",\"table\":\"users\"},{\"db\":\"ecommerce\",\"table\":\"customers\"},{\"db\":\"ecommerce\",\"table\":\"products\"},{\"db\":\"thulana\",\"table\":\"dhanuka\"},{\"db\":\"green_residence\",\"table\":\"property\"},{\"db\":\"green_residence\",\"table\":\"warden\"},{\"db\":\"green_residence\",\"table\":\"facilities\"},{\"db\":\"green_residence\",\"table\":\"admin\"},{\"db\":\"green_residence\",\"table\":\"student\"},{\"db\":\"green_residence\",\"table\":\"user\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-07-07 19:46:27', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `star_food_city`
--
CREATE DATABASE IF NOT EXISTS `star_food_city` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `star_food_city`;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cashier_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashier_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `p_quantity` varchar(10) DEFAULT NULL,
  `p_value` varchar(10) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `current_status` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `age` date DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `employee_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay`
--

CREATE TABLE `pay` (
  `payment_id` int(11) NOT NULL,
  `method` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pay`
--

INSERT INTO `pay` (`payment_id`, `method`) VALUES
(1, 'cash'),
(2, 'card'),
(3, 'cash'),
(4, 'card'),
(5, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `MFD` date DEFAULT NULL,
  `EXPD` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `quantity`, `price`, `MFD`, `EXPD`) VALUES
(101, 'Laptop', '10', '1320', '2023-01-15', '2025-01-15'),
(102, 'Smartphone', '20', '770.0000000000001', '2023-02-20', '2025-02-20'),
(103, 'Headphones', '50', '55.00000000000001', '2023-03-10', '2025-03-10'),
(104, 'Tablet', '15', '550', '2023-04-05', '2025-04-05'),
(105, 'Camera', '5', '880.0000000000001', '2023-05-12', '2025-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `supply_date` date DEFAULT NULL,
  `supply_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply`
--

CREATE TABLE `supply` (
  `supply_id` int(11) NOT NULL,
  `supply_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `cashier_id` (`cashier_id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`cashier_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `pay`
--
ALTER TABLE `pay`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `supply_id` (`supply_id`);

--
-- Indexes for table `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`supply_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `pay` (`payment_id`),
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`cashier_id`) REFERENCES `cashier` (`cashier_id`);

--
-- Constraints for table `cashier`
--
ALTER TABLE `cashier`
  ADD CONSTRAINT `cashier_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `cashier_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `pay` (`payment_id`),
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`supply_id`) REFERENCES `supply` (`supply_id`);
--
-- Database: `tara`
--
CREATE DATABASE IF NOT EXISTS `tara` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tara`;

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `subid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `tele` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `message` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `contactNo` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `email`, `password`, `address`, `contactNo`) VALUES
(7, 'aa', 'aa@gmail.com', '25d55ad283aa400af464c76d713c07ad', '', ''),
(8, 'thara', 'tara@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'colombo', '071444444'),
(10, 'aaqqq', 'aa2@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`subid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `subid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `thulana`
--
CREATE DATABASE IF NOT EXISTS `thulana` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `thulana`;

-- --------------------------------------------------------

--
-- Table structure for table `dhanuka`
--

CREATE TABLE `dhanuka` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dhanuka`
--
ALTER TABLE `dhanuka`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dhanuka`
--
ALTER TABLE `dhanuka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `vogue_collection`
--
CREATE DATABASE IF NOT EXISTS `vogue_collection` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vogue_collection`;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `user_id` int(11) NOT NULL,
  `cart_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`cart_items`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `category` enum('men','women','kids','top_picks') NOT NULL,
  `availability` enum('in_stock','out_of_stock') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `discount_price`, `category`, `availability`) VALUES
(1, 'ffff', '1.png', 1200.00, 1100.00, 'women', 'in_stock'),
(2, 'fff', '1.png', 120000.00, 122.00, 'men', 'in_stock'),
(3, 'sss', '668c2b27bbb81.png', 1200.00, 1200.00, 'men', 'in_stock'),
(4, 'gggg', '0129d3b0-0766-45b7-bd59-1950016476d9.jpg', 400000.00, 50000.00, 'men', 'in_stock'),
(5, 'jjj', 'a.jfif', 455.00, 6000.00, 'men', 'in_stock'),
(6, '45555', '1.png', 2000.00, 200.00, 'men', 'in_stock'),
(7, 'aaaa', 'dedededed.PNG', 1222.00, 12.00, 'kids', 'in_stock'),
(8, 'sss', 'Example-classical-logic-circuit-and-logic-gates-NOT-AND-and-XOR-Any-algorithm-may-be.png', 12.00, 12.00, 'top_picks', 'in_stock'),
(9, 'ddd', 'unnamed.png', 12.00, 23.00, 'top_picks', 'in_stock');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(11, 'user1', 'user@gmail.com', '$2y$10$fnju1Vm4Iw2NgdSSnLJkaeKiWayhaPfjCb1Uksnwxk.pbLVEKQTmm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `watchwise_db`
--
CREATE DATABASE IF NOT EXISTS `watchwise_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `watchwise_db`;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `gender`) VALUES
(1, 'a', 'a', 1.00, 'C:\\xampp\\htdocs\\Watchwise\\Images\\668c2ae963bb5.png', 'men'),
(2, 'aaa', 'aaaaaaaaa', 12.00, 'C:\\xampp\\htdocs\\Watchwise\\Images\\668c2b27bbb81.png', 'women');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(2, 'admin', 'admin@gmail.com', '$2y$10$oT5M2dmo5tiow6vacrXo7OKq8c04Qz1X8lsN/W/jSnONnTo.i/QNW', 'admin', '2024-07-08 20:08:32'),
(3, 'admin', 'admin@gmail.com', '$2y$10$iShe89JElrPb6UbaE0E3quFNJCbsYQ8dyeeaSI.jJ9K74w2GAm9sS', 'user', '2024-07-11 18:02:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
