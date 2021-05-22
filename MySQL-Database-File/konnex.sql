-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2021 at 07:53 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `konnex`
--

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_USER'),
(3, 'ROLE_USER'),
(4, 'ROLE_USER'),
(5, 'ROLE_USER'),
(6, 'ROLE_USER'),
(7, 'ROLE_USER'),
(8, 'ROLE_USER'),
(9, 'ROLE_USER'),
(10, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `password`) VALUES
(1, 'parvgourpg1998@gmail.com', 'Parv', 'Gour', '$2a$10$qkIHsjpCtBXzSWZ0Ee4FqOS2fbaeu55gGGP3MJw4FuxZtcjhdtoRq'),
(5, 'parvgour1998@gmail.com', 'Parv', 'Gour', '123456789$2a$10$BmARf7KFUESIMuJibQ/79On3ZE1eUeJ.3l/0nlkcDjm9j17uki93C'),
(6, 'pjaiswal98@gmail.com', 'Pratham', 'Jaiswal', '$2a$10$BmARf7KFUESIMuJibQ/79On3ZE1eUeJ.3l/0nlkcDjm9j17uki93C'),
(7, 'parv98@gmail.com', 'dghrdgh', 'frhfrhhdhdhdhdhhdhdh', '$2a$10$qkIHsjpCtBXzSWZ0Ee4FqOS2fbaeu55gGGP3MJw4FuxZtcjhdtoRq'),
(8, 'parv1998@gmail.com', 'Parv', 'Gour', '$2a$10$1C90kOosi664OhInvKIUouV0COfPyB9I.a0UxX9761tFyqbyO3YeS'),
(10, 'parv1198@gmail.com', 'Parv', 'Gour', '$2a$10$OnLRk8RvhFAdyWFqIODhZucHjyw5vBDHEJB/KmdUh4l2lAThwjivS'),
(13, 'parv11198@gmail.com', 'Parv', 'Gour', '$2a$10$MRGTk7zUx9Mc8lTWEB.e8Oh7PEhNNkMJ6VdYTZmOcIeOjo6pSBcsa'),
(14, 'parvgour98@gmail.com', 'Parv', 'Gour', '$2a$10$zOSkqUrIghL4B4TwL0QBMOPzFLmSXE1yvb3gP79inM3K95Ut/B9dW'),
(15, 'parv19998@gmail.com', 'Parv', 'Gour', '$2a$10$2qvKADXp8L1nhs0JradzsutOS3CMOxAsLjk0wqPQdJdTqnPS3Xb/.'),
(16, 'parvgour111@gmail.com', 'Parv', 'Gour', '$2a$10$zR5JKnqPZUsPzIl14GL9VOQUizvFz52VHRl9lbg7AR7XHuELkloGi');

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`user_id`, `role_id`) VALUES
(1, 1),
(5, 2),
(6, 3),
(7, 4),
(8, 5),
(10, 6),
(13, 7),
(14, 8),
(15, 9),
(16, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD KEY `FK3qjq7qsiigxa82jgk0i0wuq3g` (`role_id`),
  ADD KEY `FK70yokprcxt79v4p7a5y42obhx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_role`
--
ALTER TABLE `users_role`
  ADD CONSTRAINT `FK3qjq7qsiigxa82jgk0i0wuq3g` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FK70yokprcxt79v4p7a5y42obhx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
