-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2022 at 02:08 PM
-- Server version: 5.7.36-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `School1`
--

-- --------------------------------------------------------

--
-- Table structure for table `Class`
--

CREATE TABLE `Class` (
  `ID_class` int(11) NOT NULL,
  `Class_Name` varchar(40) NOT NULL,
  `Students_Number` int(11) NOT NULL,
  `AVG_Grades` int(11) NOT NULL,
  `ID_prim_teacher` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Class`
--

INSERT INTO `Class` (`ID_class`, `Class_Name`, `Students_Number`, `AVG_Grades`, `ID_prim_teacher`) VALUES
(1, '2b', 10, 4, 1),
(2, '3c', 15, 4, 2),
(3, '2hd', 12, 4, 3),
(4, '8ef', 8, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `ID_student` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Class_Name` varchar(40) NOT NULL,
  `ID_attached_class` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`ID_student`, `Name`, `Surname`, `Class_Name`, `ID_attached_class`) VALUES
(1, 'Sabir', 'Khanlarov', '2b', 1),
(2, 'Sarkhan', 'Babanli', '2b', 1),
(3, 'Tamilla', 'Gambarova', '2b', 1),
(5, 'Vagif', 'Gambarov', '3c', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Subject`
--

CREATE TABLE `Subject` (
  `Attached teacher` varchar(100) NOT NULL,
  `Date and Time` date NOT NULL,
  `ID_subject_name` varchar(40) NOT NULL,
  `Duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Subject`
--

INSERT INTO `Subject` (`Attached teacher`, `Date and Time`, `ID_subject_name`, `Duration`) VALUES
('Jafar Hasanov', '2022-01-11', 'Mathematics', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Subject_Class`
--

CREATE TABLE `Subject_Class` (
  `ID_subject` varchar(40) NOT NULL,
  `ID_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Subject_Class`
--

INSERT INTO `Subject_Class` (`ID_subject`, `ID_class`) VALUES
('Mathematics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Teacher`
--

CREATE TABLE `Teacher` (
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Provided_Subjects` varchar(150) NOT NULL,
  `ID_teacher` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teacher`
--

INSERT INTO `Teacher` (`Name`, `Surname`, `Provided_Subjects`, `ID_teacher`) VALUES
('Jafar', 'Hasanov', 'Mathematics', 1),
('Samir', 'Dadash', 'Computer Science', 2),
('Ilkin', 'Ilkinov', 'Kebab cooking', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Teacher_Subjects`
--

CREATE TABLE `Teacher_Subjects` (
  `ID_subject` varchar(40) NOT NULL,
  `ID_teacher` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teacher_Subjects`
--

INSERT INTO `Teacher_Subjects` (`ID_subject`, `ID_teacher`) VALUES
('Mathematics', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`ID_class`),
  ADD KEY `ID_prim_teacher` (`ID_prim_teacher`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`ID_student`),
  ADD KEY `ID_attached_class` (`ID_attached_class`);

--
-- Indexes for table `Subject`
--
ALTER TABLE `Subject`
  ADD PRIMARY KEY (`ID_subject_name`),
  ADD UNIQUE KEY `Date and Time` (`Date and Time`);

--
-- Indexes for table `Subject_Class`
--
ALTER TABLE `Subject_Class`
  ADD PRIMARY KEY (`ID_subject`,`ID_class`),
  ADD KEY `ID_class` (`ID_class`);

--
-- Indexes for table `Teacher`
--
ALTER TABLE `Teacher`
  ADD PRIMARY KEY (`ID_teacher`);

--
-- Indexes for table `Teacher_Subjects`
--
ALTER TABLE `Teacher_Subjects`
  ADD PRIMARY KEY (`ID_subject`,`ID_teacher`),
  ADD KEY `ID_teacher` (`ID_teacher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Class`
--
ALTER TABLE `Class`
  MODIFY `ID_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `ID_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Teacher`
--
ALTER TABLE `Teacher`
  MODIFY `ID_teacher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`ID_attached_class`) REFERENCES `Class` (`ID_class`) ON DELETE SET NULL;

--
-- Constraints for table `Subject_Class`
--
ALTER TABLE `Subject_Class`
  ADD CONSTRAINT `Subject_Class_ibfk_1` FOREIGN KEY (`ID_subject`) REFERENCES `Subject` (`ID_subject_name`),
  ADD CONSTRAINT `Subject_Class_ibfk_2` FOREIGN KEY (`ID_class`) REFERENCES `Class` (`ID_class`);

--
-- Constraints for table `Teacher_Subjects`
--
ALTER TABLE `Teacher_Subjects`
  ADD CONSTRAINT `Teacher_Subjects_ibfk_1` FOREIGN KEY (`ID_teacher`) REFERENCES `Teacher` (`ID_teacher`),
  ADD CONSTRAINT `Teacher_Subjects_ibfk_2` FOREIGN KEY (`ID_subject`) REFERENCES `Subject` (`ID_subject_name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
