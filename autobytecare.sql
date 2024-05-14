-- GroupName : TechCraft
-- ProjectName : AutoByteCare
-- WebsiteName : autobytecare
-- Members :  Shree Dhar Acharya : 8899288
--            Rishab Abbhi : 8874858
--            Rohit Rana : 8874589 

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 19, 2023 at 02:52 PM
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
-- Database: `autobytecare`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(8) NOT NULL,
  `primary_address` varchar(50) NOT NULL,
  `secondary_address` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `postal_code` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `primary_address`, `secondary_address`, `city`, `state`, `country`, `postal_code`) VALUES
(1, '123 Main Street', 'Apt 4B', 'Kathmandu', 'Bagmati', 'Nepal', '44600'),
(2, '456 Park Avenue', NULL, 'Pokhara', 'Gandaki', 'Nepal', '33700'),
(3, '789 Elm Road', 'Unit 7', 'Biratnagar', 'Province 1', 'Nepal', '56600'),
(4, '321 Oak Lane', 'Suite 202', 'Lalitpur', 'Bagmati', 'Nepal', '44618'),
(5, '567 Pine Street', 'Apt 10', 'Bharatpur', 'Province 2', 'Nepal', '33400'),
(6, '901 Maple Avenue', 'Unit 3C', 'Janakpur', 'Province 2', 'Nepal', '45600'),
(7, '234 Cedar Road', NULL, 'Birgunj', 'Province 2', 'Nepal', '44000'),
(8, '678 Walnut Lane', 'Suite 101', 'Hetauda', 'Province 3', 'Nepal', '35000'),
(9, '123 Pine Street', 'Apt 5A', 'Dharan', 'Province 1', 'Nepal', '56700'),
(10, '456 Elm Avenue', NULL, 'Butwal', 'Province 5', 'Nepal', '34000'),
(11, '789 Oak Road', 'Unit 9', 'Nepalgunj', 'Province 5', 'Nepal', '32000'),
(12, '321 Maple Lane', 'Suite 303', 'Itahari', 'Province 1', 'Nepal', '56500'),
(13, '567 Cedar Street', 'Apt 7B', 'Dhangadhi', 'Sudurpaschim', 'Nepal', '91000'),
(14, '901 Walnut Avenue', NULL, 'Birendranagar', 'Karnali', 'Nepal', '98000'),
(15, '234 Pine Road', 'Unit 2D', 'Ghorahi', 'Province 5', 'Nepal', '34000'),
(16, 'primaryaddress', 'secondary', 'gorkha', 'gandaki', 'nepal', '33700'),
(17, 'primaryaddress', 'secondary', 'Brantford', 'state', 'country', 'fsfd');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(8) NOT NULL,
  `date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  `customer_id` int(8) NOT NULL,
  `service_id` int(8) DEFAULT NULL,
  `automobile_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `date`, `notes`, `status`, `customer_id`, `service_id`, `automobile_id`) VALUES
(1, '2023-08-20 10:00:00', 'Regular checkup', 'Scheduled', 1, 1, 1),
(2, '2023-08-21 14:30:00', 'Oil change', 'Scheduled', 2, 2, 2),
(3, '2023-08-22 09:00:00', 'Brake inspection', 'Scheduled', 3, 3, 3),
(4, '2023-08-23 11:45:00', 'Engine diagnostics', 'Scheduled', 4, 4, 4),
(5, '2023-08-24 13:15:00', 'Tire rotation', 'Scheduled', 5, 5, 5),
(6, '2023-08-25 12:30:00', 'AC repair', 'Scheduled', 6, 6, 6),
(7, '2023-08-26 15:00:00', 'Transmission service', 'Scheduled', 7, 7, 7),
(8, '2023-08-27 08:45:00', 'Electrical issues', 'Scheduled', 8, 8, 8),
(9, '2023-08-28 10:30:00', 'Regular maintenance', 'Scheduled', 9, 9, 9),
(10, '2023-08-29 14:15:00', 'Suspension check', 'Scheduled', 10, 10, 10),
(11, '2023-08-30 11:30:00', 'Coolant flush', 'Scheduled', 11, 11, 11),
(12, '2023-08-31 13:45:00', 'Alignment', 'Scheduled', 12, 12, 12),
(13, '2023-09-01 09:30:00', 'Battery replacement', 'Scheduled', 13, 13, 13),
(14, '2023-09-02 12:00:00', 'Exhaust system check', 'Scheduled', 14, 14, 14),
(15, '2023-09-03 14:45:00', 'Diagnostic test', 'Scheduled', 15, 15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `automobiles`
--

CREATE TABLE `automobiles` (
  `automobile_id` int(8) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` int(4) NOT NULL,
  `plate_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `automobiles`
--

INSERT INTO `automobiles` (`automobile_id`, `manufacturer`, `model`, `year`, `plate_number`) VALUES
(1, 'Toyota', 'Corolla', 2022, 'BAJ123'),
(2, 'Honda', 'Civic', 2021, 'KTM556'),
(3, 'Ford', 'Mustang', 2020, 'LAL789'),
(4, 'Hyundai', 'Elantra', 2023, 'PAT234'),
(5, 'Chevrolet', 'Cruze', 2022, 'BIR567'),
(6, 'Nissan', 'Altima', 2021, 'POK890'),
(7, 'Mazda', 'CX-5', 2022, 'LUM123'),
(8, 'Volkswagen', 'Golf', 2020, 'KHA456'),
(9, 'Subaru', 'Impreza', 2023, 'DHA789'),
(10, 'Kia', 'Soul', 2022, 'BIR234'),
(11, 'Jeep', 'Wrangler', 2021, 'LAL567'),
(12, 'BMW', 'X3', 2022, 'PAT890'),
(13, 'Mercedes-Benz', 'C-Class', 2020, 'POK123'),
(14, 'Audi', 'A4', 2023, 'KTM456'),
(15, 'Lexus', 'RX', 2022, 'BHA789');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(8) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` bigint(10) NOT NULL,
  `address_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `user_name`, `password`, `email`, `phone_number`, `address_id`) VALUES
(1, 'Ram', 'Shrestha', 'ram', 'pass', 'ram@example.com', 9801234567, 1),
(2, 'Sita', 'Pradhan', 'sita', 'pass', 'sita@example.com', 9845678901, 2),
(3, 'Hari', 'Joshi', 'hari', 'pass', 'hari@example.com', 9812345678, 3),
(4, 'Geeta', 'Pande', 'geeta', 'user', 'geeta@example.com', 9867890123, 4),
(5, 'Mohan', 'Rajvanshi', 'mohan', 'user', 'mohan@example.com', 9856789012, 5),
(6, 'Shreedhar', 'Acharya', 'admin', 'admin', 'shreedhar@example.com', 9801122334, 6),
(7, 'Asmita', 'Paudel', 'asmi', 'user', 'asmita@example.com', 9845566778, 6),
(8, 'Rishav', 'Pant', 'rishav', 'user', 'rishav@example.com', 9821122334, 7),
(9, 'Rohit', 'Rana', 'rohit', 'user', 'rohit@example.com', 9876567890, 7),
(10, 'Amrita', 'Thapa', 'amrita', 'user', 'amrita@example.com', 9823456789, 8),
(11, 'Rohit', 'Adhikari', 'rohitadhi', 'user', 'rohitadhi@example.com', 9878901234, 9),
(12, 'Andhra', 'Basnet', 'andhra', 'user', 'andhra@example.com', 9845612378, 10),
(13, 'Abhishek', 'Shrestha', 'abhishek', 'pass', 'abhishek@example.com', 9812345778, 11),
(14, 'Aditya', 'Joshi', 'aditya', 'pass', 'aditya@example.com', 9867890122, 12),
(15, 'Anita', 'Rai', 'anita', 'pass', 'anita@example.com', 9801334567, 13),
(16, 'biplab', 'pandey', 'pandeybiplab', 'password', 'pandeybiplab@gmail.com', 1232143434, 16),
(17, 'santosh', 'parajuli', 'parajuli', 'password', 'test@gmail.com', 231234, 17);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(8) NOT NULL,
  `date` datetime NOT NULL,
  `total_cost` double(7,2) NOT NULL,
  `work_order_id` int(8) NOT NULL,
  `customer_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `date`, `total_cost`, `work_order_id`, `customer_id`) VALUES
(1, '2023-08-01 10:00:00', 120.00, 1, 1),
(2, '2023-08-02 11:30:00', 180.00, 2, 2),
(3, '2023-08-03 09:45:00', 90.00, 3, 3),
(4, '2023-08-04 14:15:00', 240.00, 4, 4),
(5, '2023-08-05 13:00:00', 100.00, 5, 5),
(6, '2023-08-06 08:30:00', 150.00, 6, 6),
(7, '2023-08-07 12:45:00', 210.00, 7, 7),
(8, '2023-08-08 16:00:00', 120.00, 8, 8),
(9, '2023-08-09 14:30:00', 60.00, 9, 9),
(10, '2023-08-10 10:45:00', 180.00, 10, 10),
(11, '2023-08-11 09:30:00', 150.00, 11, 11),
(12, '2023-08-12 15:15:00', 120.00, 12, 12),
(13, '2023-08-13 11:00:00', 270.00, 13, 13),
(14, '2023-08-14 08:45:00', 150.00, 14, 14),
(15, '2023-08-15 12:30:00', 120.00, 15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE `mechanics` (
  `mechanic_id` int(8) NOT NULL,
  `mechanic_name` varchar(50) NOT NULL,
  `mechanic_email` varchar(50) NOT NULL,
  `mechanic_phone` bigint(10) NOT NULL,
  `mechanic_specialities` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`mechanic_id`, `mechanic_name`, `mechanic_email`, `mechanic_phone`, `mechanic_specialities`) VALUES
(1, 'John Smith', 'john@example.com', 9876543210, 'Engine Repair, Transmission'),
(2, 'Emily Johnson', 'emily@example.com', 9812345678, 'Electrical Systems, Diagnostics'),
(3, 'Michael Williams', 'michael@example.com', 9867880123, 'Brake Systems, Suspension'),
(4, 'Jessica Brown', 'jessica@example.com', 9801234567, 'Tire and Wheel, Alignment'),
(5, 'David Miller', 'david@example.com', 9845678901, 'Exhaust Systems, HVAC'),
(6, 'Linda Davis', 'linda@example.com', 9856789012, 'Oil Change, Fluids'),
(7, 'William Wilson', 'william@example.com', 9823456789, 'Diagnostic, Engine Tuning'),
(8, 'Patricia Martinez', 'patricia@example.com', 9801122334, 'Battery, Starting System'),
(9, 'Christopher Anderson', 'chris@example.com', 9845566778, 'Suspension, Steering'),
(10, 'Karen Taylor', 'karen@example.com', 9821122334, 'Brake Inspection, Cooling System'),
(11, 'Daniel Jackson', 'daniel@example.com', 9876567890, 'Transmission Service, Fuel System'),
(12, 'Laura White', 'laura@example.com', 9845612378, 'Air Conditioning, HVAC'),
(13, 'Mark Martinez', 'mark@example.com', 9878901234, 'Electrical, Ignition'),
(14, 'Elizabeth Thompson', 'elizabeth@example.com', 9812378901, 'Exhaust Systems, Emissions'),
(15, 'Matthew Harris', 'matthew@example.com', 9867890123, 'Diagnostics, Engine Repair');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `part_id` int(8) NOT NULL,
  `part_name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double(5,2) NOT NULL,
  `supplier_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`part_id`, `part_name`, `description`, `price`, `supplier_id`) VALUES
(1, 'Engine Oil', 'High-quality engine oil', 25.99, 1),
(2, 'Air Filter', 'Replacement air filter', 12.49, 2),
(3, 'Brake Pads', 'Premium brake pads', 38.75, 3),
(4, 'Spark Plugs', 'Set of spark plugs', 8.99, 4),
(5, 'Transmission Fluid', 'Transmission fluid', 18.25, 5),
(6, 'Battery', 'Car battery', 75.00, 6),
(7, 'Wiper Blades', 'Pair of wiper blades', 9.99, 7),
(8, 'Shock Absorbers', 'Front shock absorbers', 45.50, 8),
(9, 'Thermostat', 'Engine thermostat', 7.25, 9),
(10, 'Radiator', 'Car radiator', 60.00, 10),
(11, 'Alternator', 'Car alternator', 85.99, 11),
(12, 'Fuel Pump', 'Electric fuel pump', 28.75, 12),
(13, 'Steering Rack', 'Power steering rack', 120.00, 13),
(14, 'Cabin Air Filter', 'Interior cabin air filter', 14.99, 14),
(15, 'Oxygen Sensor', 'Engine oxygen sensor', 35.00, 15);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(8) NOT NULL,
  `payment_amount` double(7,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `invoice_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `payment_amount`, `payment_date`, `invoice_id`) VALUES
(1, 120.00, '2023-08-05 10:00:00', 1),
(2, 180.00, '2023-08-06 11:30:00', 2),
(3, 90.00, '2023-08-07 09:45:00', 3),
(4, 240.00, '2023-08-08 14:15:00', 4),
(5, 100.00, '2023-08-09 13:00:00', 5),
(6, 150.00, '2023-08-10 08:30:00', 6),
(7, 210.00, '2023-08-11 12:45:00', 7),
(8, 120.00, '2023-08-12 16:00:00', 8),
(9, 60.00, '2023-08-13 14:30:00', 9),
(10, 180.00, '2023-08-14 10:45:00', 10),
(11, 150.00, '2023-08-15 09:30:00', 11),
(12, 120.00, '2023-08-16 15:15:00', 12),
(13, 270.00, '2023-08-17 11:00:00', 13),
(14, 150.00, '2023-08-18 08:45:00', 14),
(15, 120.00, '2023-08-19 12:30:00', 15);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(8) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `service_details` varchar(255) NOT NULL,
  `service_cost` double(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_details`, `service_cost`) VALUES
(1, 'Oil Change', 'Regular oil change service', 30.00),
(2, 'Tire Rotation', 'Rotate and balance tires', 20.00),
(3, 'Brake Inspection', 'Check and inspect brakes', 25.00),
(4, 'Wheel Alignment', 'Align wheels for proper tracking', 40.00),
(5, 'Air Conditioning Service', 'Service AC system and recharge', 50.00),
(6, 'Battery Replacement', 'Replace old battery with a new one', 60.00),
(7, 'Engine Tune-Up', 'Tune-up the engine for optimal performance', 75.00),
(8, 'Transmission Fluid Change', 'Change transmission fluid and filter', 45.00),
(9, 'Coolant Flush', 'Flush and replace engine coolant', 35.00),
(10, 'Diagnostic Test', 'Perform a diagnostic test for issues', 55.00),
(11, 'Spark Plug Replacement', 'Replace old spark plugs', 30.00),
(12, 'Exhaust System Inspection', 'Inspect exhaust system for leaks', 20.00),
(13, 'Suspension Check', 'Check and adjust suspension components', 25.00),
(14, 'Fuel System Cleaning', 'Clean fuel system components', 40.00),
(15, 'Cabin Air Filter Replacement', 'Replace cabin air filter', 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(8) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_email` varchar(50) NOT NULL,
  `supplier_phone` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_email`, `supplier_phone`) VALUES
(1, 'Auto Parts Supplier 1', 'supplier1@example.com', 9876543210),
(2, 'Auto Parts Supplier 2', 'supplier2@example.com', 9812345678),
(3, 'Auto Parts Supplier 3', 'supplier3@example.com', 9867990123),
(4, 'Auto Parts Supplier 4', 'supplier4@example.com', 9801234567),
(5, 'Auto Parts Supplier 5', 'supplier5@example.com', 9845678901),
(6, 'Auto Parts Supplier 6', 'supplier6@example.com', 9856789012),
(7, 'Auto Parts Supplier 7', 'supplier7@example.com', 9823456789),
(8, 'Auto Parts Supplier 8', 'supplier8@example.com', 9801122334),
(9, 'Auto Parts Supplier 9', 'supplier9@example.com', 9845566778),
(10, 'Auto Parts Supplier 10', 'supplier10@example.com', 9821122334),
(11, 'Auto Parts Supplier 11', 'supplier11@example.com', 9876567890),
(12, 'Auto Parts Supplier 12', 'supplier12@example.com', 9845612378),
(13, 'Auto Parts Supplier 13', 'supplier13@example.com', 9878901234),
(14, 'Auto Parts Supplier 14', 'supplier14@example.com', 9812378901),
(15, 'Auto Parts Supplier 15', 'supplier15@example.com', 9867890123);

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `work_order_id` int(8) NOT NULL,
  `labor_hours` double NOT NULL,
  `total_cost` double(5,2) NOT NULL,
  `part_id` int(8) NOT NULL,
  `mechanic_id` int(8) NOT NULL,
  `appointment_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `work_orders`
--

INSERT INTO `work_orders` (`work_order_id`, `labor_hours`, `total_cost`, `part_id`, `mechanic_id`, `appointment_id`) VALUES
(1, 2.5, 120.00, 1, 1, 1),
(2, 3, 180.00, 2, 2, 2),
(3, 1.5, 90.00, 3, 3, 3),
(4, 4, 240.00, 4, 4, 4),
(5, 2, 100.00, 5, 5, 5),
(6, 2.5, 150.00, 6, 6, 6),
(7, 3.5, 210.00, 7, 7, 7),
(8, 2, 120.00, 8, 8, 8),
(9, 1, 60.00, 9, 9, 9),
(10, 3, 180.00, 10, 10, 10),
(11, 2.5, 150.00, 11, 11, 11),
(12, 2, 120.00, 12, 12, 12),
(13, 4.5, 270.00, 13, 13, 13),
(14, 2.5, 150.00, 14, 14, 14),
(15, 2, 120.00, 15, 15, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `fk_appointments_automobiles1_idx` (`automobile_id`),
  ADD KEY `fk_appointments_customers1_idx` (`customer_id`),
  ADD KEY `fk_appointments_services1_idx` (`service_id`);

--
-- Indexes for table `automobiles`
--
ALTER TABLE `automobiles`
  ADD PRIMARY KEY (`automobile_id`),
  ADD UNIQUE KEY `plate_number_UNIQUE` (`plate_number`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  ADD UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  ADD KEY `fk_customers_address_idx` (`address_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_invoices_customers1_idx` (`customer_id`),
  ADD KEY `fk_invoices_work_orders1_idx` (`work_order_id`);

--
-- Indexes for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`mechanic_id`),
  ADD UNIQUE KEY `mechanic_email_UNIQUE` (`mechanic_email`),
  ADD UNIQUE KEY `mechanic_phone_UNIQUE` (`mechanic_phone`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`part_id`),
  ADD KEY `fk_parts_suppliers1_idx` (`supplier_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payments_invoices1_idx` (`invoice_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `supplier_email_UNIQUE` (`supplier_email`),
  ADD UNIQUE KEY `supplier_phone_UNIQUE` (`supplier_phone`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`work_order_id`,`mechanic_id`,`appointment_id`),
  ADD KEY `fk_work_orders_parts1_idx` (`part_id`),
  ADD KEY `fk_work_orders_appointments1_idx` (`appointment_id`),
  ADD KEY `fk_work_orders_mechanics1_idx` (`mechanic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointments_automobiles1` FOREIGN KEY (`automobile_id`) REFERENCES `automobiles` (`automobile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appointments_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_appointments_services1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_invoices_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_invoices_work_orders1` FOREIGN KEY (`work_order_id`) REFERENCES `work_orders` (`work_order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `fk_parts_suppliers1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_invoices1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD CONSTRAINT `fk_work_orders_appointments1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_work_orders_mechanics1` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`mechanic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_work_orders_parts1` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
