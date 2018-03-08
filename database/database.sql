-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 08, 2018 at 11:03 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Public Library`
--

-- --------------------------------------------------------

--
-- Table structure for table `AUTHOR`
--

CREATE TABLE `AUTHOR` (
  `ID` int(10) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Phone` int(10) DEFAULT NULL,
  `DoB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BOOKS`
--

CREATE TABLE `BOOKS` (
  `ISBN` int(13) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Price` float DEFAULT NULL,
  `Available or not` varchar(10) NOT NULL,
  `Copies` int(2) DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  `Publisher_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BOOKS`
--

INSERT INTO `BOOKS` (`ISBN`, `Name`, `Price`, `Available or not`, `Copies`, `Year`, `Publisher_ID`) VALUES
(232410, 'AASF', NULL, 'ASFD ', 3, NULL, NULL),
(1000000001, 'Art of Nature', 45.99, 'Available', 1, 2009, NULL),
(1000000002, 'War and Peace', 19.99, 'Not', 1, 1999, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BOOKS_DUE`
--

CREATE TABLE `BOOKS_DUE` (
  `BOOK_ID` int(13) NOT NULL,
  `BOOK_NAME` varchar(15) NOT NULL,
  `BOOK_DUE_DATE` date NOT NULL,
  `MEM_FNAME` varchar(15) NOT NULL,
  `MEM_EMAIL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BORROWED_BY`
--

CREATE TABLE `BORROWED_BY` (
  `Lib_ID` int(10) NOT NULL,
  `ISBN` int(13) NOT NULL,
  `Mem_ID` int(10) NOT NULL,
  `Date_out` date NOT NULL,
  `Return_date` date NOT NULL,
  `Due_date` date NOT NULL,
  `Fine` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BORROWED_BY`
--

INSERT INTO `BORROWED_BY` (`Lib_ID`, `ISBN`, `Mem_ID`, `Date_out`, `Return_date`, `Due_date`, `Fine`) VALUES
(100000888, 232410, 1000000001, '2017-04-01', '2017-04-13', '2017-04-04', 10),
(100000888, 1000000001, 88, '2016-01-01', '2016-01-21', '2016-06-16', 50),
(100000888, 1000000001, 88, '2017-02-01', '2017-02-21', '2017-04-16', 50),
(100000888, 1000000001, 88, '2017-04-01', '2017-04-12', '2017-04-08', 50),
(100000888, 1000000001, 1000000001, '2017-02-01', '2017-02-21', '2017-04-16', 100);

--
-- Triggers `BORROWED_BY`
--
DELIMITER $$
CREATE TRIGGER `Check_Fine` AFTER INSERT ON `BORROWED_BY` FOR EACH ROW IF NEW.FINE > 30 THEN
INSERT INTO MEMBER_FINE(Fine_Greater_30, Mem_id_for_Fine) VALUES (NEW.Fine, NEW.Mem_ID);
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CATEGORY`
--

CREATE TABLE `CATEGORY` (
  `ID` int(10) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `HAS`
--

CREATE TABLE `HAS` (
  `Cat_ID` int(10) NOT NULL,
  `ISBN` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `HELD_REQUEST_BY1`
--

CREATE TABLE `HELD_REQUEST_BY1` (
  `Mem_ID` int(10) NOT NULL,
  `ISBN` int(13) NOT NULL,
  `Request_status` varchar(10) NOT NULL,
  `Request_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `HELD_REQUEST_BY2`
--

CREATE TABLE `HELD_REQUEST_BY2` (
  `ISBN` int(13) NOT NULL,
  `Request_availiable_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LIBRARIAN`
--

CREATE TABLE `LIBRARIAN` (
  `ID` int(10) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `DoB` date NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LIBRARIAN`
--

INSERT INTO `LIBRARIAN` (`ID`, `Fname`, `Mname`, `Lname`, `DoB`, `Email`, `Phone`, `Username`, `Password`, `Address`) VALUES
(100000888, 'SAFD', NULL, 'SAG', '1986-03-05', 'xixijiangyue@gmail.com', 11213, 'asdf', 'asf', 'asf');

-- --------------------------------------------------------

--
-- Table structure for table `MEMBER`
--

CREATE TABLE `MEMBER` (
  `ID` int(10) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `DoB` date NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Phone` int(10) DEFAULT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Joinning_date` date NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Gender` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MEMBER`
--

INSERT INTO `MEMBER` (`ID`, `Fname`, `Mname`, `Lname`, `DoB`, `Email`, `Phone`, `Username`, `Password`, `Joinning_date`, `Address`, `Gender`) VALUES
(88, 'j', NULL, 'l', '1996-01-11', NULL, NULL, 'g', 'h', '2017-04-01', 'ggggg', NULL),
(1000000001, 'Ann', NULL, 'Luo', '0000-00-00', NULL, NULL, 'Annluo', '123', '2001-10-09', '8600 W Hi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MEMBER_FINE`
--

CREATE TABLE `MEMBER_FINE` (
  `Mem_id_for_Fine` int(10) NOT NULL,
  `Fine_Greater_30` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MEMBER_FINE`
--

INSERT INTO `MEMBER_FINE` (`Mem_id_for_Fine`, `Fine_Greater_30`) VALUES
(88, 50);

-- --------------------------------------------------------

--
-- Table structure for table `PUBLISHER`
--

CREATE TABLE `PUBLISHER` (
  `ID` int(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Phone` int(10) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SUPPLIER`
--

CREATE TABLE `SUPPLIER` (
  `ID` int(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Phone` int(10) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SUPPLY`
--

CREATE TABLE `SUPPLY` (
  `Sup_ID` int(10) NOT NULL,
  `ISBN` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `WRITES`
--

CREATE TABLE `WRITES` (
  `Aut_ID` int(10) NOT NULL,
  `ISBN` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AUTHOR`
--
ALTER TABLE `AUTHOR`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `BOOKS`
--
ALTER TABLE `BOOKS`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `Books_Publisher` (`Publisher_ID`);

--
-- Indexes for table `BORROWED_BY`
--
ALTER TABLE `BORROWED_BY`
  ADD PRIMARY KEY (`ISBN`,`Mem_ID`,`Date_out`),
  ADD KEY `Borrowed_Member` (`Mem_ID`),
  ADD KEY `Borrowed_Librarian` (`Lib_ID`);

--
-- Indexes for table `CATEGORY`
--
ALTER TABLE `CATEGORY`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `HAS`
--
ALTER TABLE `HAS`
  ADD PRIMARY KEY (`Cat_ID`,`ISBN`),
  ADD KEY `Has_Books` (`ISBN`);

--
-- Indexes for table `HELD_REQUEST_BY1`
--
ALTER TABLE `HELD_REQUEST_BY1`
  ADD PRIMARY KEY (`Mem_ID`,`ISBN`),
  ADD KEY `Request1_Books` (`ISBN`);

--
-- Indexes for table `HELD_REQUEST_BY2`
--
ALTER TABLE `HELD_REQUEST_BY2`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `LIBRARIAN`
--
ALTER TABLE `LIBRARIAN`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `MEMBER`
--
ALTER TABLE `MEMBER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `PUBLISHER`
--
ALTER TABLE `PUBLISHER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `SUPPLIER`
--
ALTER TABLE `SUPPLIER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `SUPPLY`
--
ALTER TABLE `SUPPLY`
  ADD PRIMARY KEY (`Sup_ID`,`ISBN`),
  ADD KEY `Supply_Books` (`ISBN`);

--
-- Indexes for table `WRITES`
--
ALTER TABLE `WRITES`
  ADD PRIMARY KEY (`Aut_ID`,`ISBN`),
  ADD KEY `Writes_BOOKS` (`ISBN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BOOKS`
--
ALTER TABLE `BOOKS`
  ADD CONSTRAINT `Books_Publisher` FOREIGN KEY (`Publisher_ID`) REFERENCES `PUBLISHER` (`ID`);

--
-- Constraints for table `HAS`
--
ALTER TABLE `HAS`
  ADD CONSTRAINT `Has_Books` FOREIGN KEY (`ISBN`) REFERENCES `BOOKS` (`ISBN`),
  ADD CONSTRAINT `Has_Category` FOREIGN KEY (`Cat_ID`) REFERENCES `CATEGORY` (`ID`);

--
-- Constraints for table `HELD_REQUEST_BY1`
--
ALTER TABLE `HELD_REQUEST_BY1`
  ADD CONSTRAINT `Request1_Books` FOREIGN KEY (`ISBN`) REFERENCES `BOOKS` (`ISBN`),
  ADD CONSTRAINT `Request1_Member` FOREIGN KEY (`Mem_ID`) REFERENCES `MEMBER` (`ID`);

--
-- Constraints for table `HELD_REQUEST_BY2`
--
ALTER TABLE `HELD_REQUEST_BY2`
  ADD CONSTRAINT `Request2_Books` FOREIGN KEY (`ISBN`) REFERENCES `BOOKS` (`ISBN`);

--
-- Constraints for table `SUPPLY`
--
ALTER TABLE `SUPPLY`
  ADD CONSTRAINT `Supply_Books` FOREIGN KEY (`ISBN`) REFERENCES `BOOKS` (`ISBN`),
  ADD CONSTRAINT `Supply_Supplier` FOREIGN KEY (`Sup_ID`) REFERENCES `SUPPLIER` (`ID`);

--
-- Constraints for table `WRITES`
--
ALTER TABLE `WRITES`
  ADD CONSTRAINT `Writes_Author` FOREIGN KEY (`Aut_ID`) REFERENCES `AUTHOR` (`ID`),
  ADD CONSTRAINT `Writes_BOOKS` FOREIGN KEY (`ISBN`) REFERENCES `BOOKS` (`ISBN`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
