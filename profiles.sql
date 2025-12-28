-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2025 at 04:05 PM
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
-- Database: `student_profiles`
--

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `program` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `intro` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `student_id`, `program`, `email`, `hobbies`, `intro`) VALUES
(4, 'Nurul Huda', '2023445566', 'CD551', 'nurulhuda@student.edu.my', 'Writing, journaling', 'Hello, I am Nurul Huda. I am interested in information systems and data management. I like working in a team and sharing ideas.'),
(6, 'Aina Sofea', '2023665544', 'CS142', 'aina.sofea@student.edu.my', 'Coding, online learning', 'My name is Aina Sofea. I love coding and learning new technologies. My goal is to become a successful software developer.'),
(7, 'Amir Hakim', '2023223344', 'CD512', 'amirhakim@gmail.com', 'Reading, chess', 'Hi, I am Amir Hakim. I enjoy activities that challenge my thinking skills. I am interested in programming and system development.'),
(8, 'Farah Nadia', '2023556677', 'CD142', 'farah.nadia@student.edu.my', 'Blogging, social media', 'I am Farah Nadia, an IT student who enjoys sharing knowledge online. I like learning about web technologies and digital trends.'),
(10, 'Nabila Syafiqa', '2023112233', 'CS414', 'nabila.syafiqa@student.edu.my', 'Drawing, UI design', 'Hello, I am Nabila. I have a strong interest in user interface design and programming. I hope to create useful and user-friendly applications.'),
(11, 'Nabila Syafiqa', '2023112233', 'CS414', 'nabila.syafiqa@student.edu.my', 'Drawing, UI design', 'Hello, I am Nabila. I have a strong interest in user interface design and programming. I hope to create useful and user-friendly applications.'),
(12, 'Adam Zikri', '2024123401', 'CS240', 'adam.zikri@student.edu.my', 'Coding, debugging', 'Hi, my name is Adam. I am currently studying Computer Science and interested in software development and problem solving.'),
(15, 'Alya Batrisyia', '2024123402', 'IT120', 'alya.batrisyia@student.edu.my', 'Web design, blogging', 'Hello, I am Alya. I enjoy designing simple websites and learning new technologies related to web development.'),
(17, 'Irfan Hakimi', '2024123403', 'SE310', 'irfan.hakimi@student.uitm.edu.my', 'Programming, reading tech articles', 'I am Irfan Hakimi, a software engineering student who enjoys learning about system development and coding practices.'),
(18, 'Syafiq Rahman', '2024123405', 'CS210', 'syafiqrahman@uitm.edu.my', 'Gaming, logic puzzles', 'My name is Syafiq. I enjoy logical thinking and learning programming concepts.'),
(19, 'Fatin Amirah', '2024123406', 'IT250', 'fatin.amirah@uitm.edu.my', 'UI design, mobile apps', 'Hello, I am Fatin. I enjoy designing simple applications and interfaces.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
