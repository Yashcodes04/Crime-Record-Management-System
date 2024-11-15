-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2021 at 04:33 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ghpolice`
--

-- --------------------------------------------------------

--
-- Table structure for table `case_table`
--
DROP TABLE IF EXISTS `userlogin`;
DROP TABLE IF EXISTS `investigation`;
DROP TABLE IF EXISTS `crime_type`;
DROP TABLE IF EXISTS `complainant`;
DROP TABLE IF EXISTS `case_table`;

CREATE TABLE `case_table` (
  `case_id` varchar(20) NOT NULL,
  `statement` varchar(200) NOT NULL,
  `caseid` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `staffid` varchar(30) NOT NULL,
  `case_type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `cid` varchar(20) NOT NULL DEFAULT 'Not Yet',
  `complete_date` date NOT NULL,
  `diaryofaction` varchar(200) NOT NULL,
  `highlight` VARCHAR(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `case_table`
--

INSERT INTO `case_table` (`case_id`, `statement`, `caseid`, `date_added`, `staffid`, `case_type`, `status`, `cid`, `complete_date`, `diaryofaction`, `highlight`) VALUES
('210728101', '<p>HelLo,</p>\r\n\r\n<p>This CID Officer yahaya and this my findings so for in the case</p>\r\n', 56, '2021-07-28 13:13:49', '333', 'Robbing', 'Completed', '005', '0000-00-00', ' This is case  ', 'Green'),
('210728102', '', 57, '2021-07-28 13:14:53', '333', 'Assault', '', 'cid', '0000-00-00', 'Here is anotehr acse', 'Green');

-- --------------------------------------------------------

--
-- Table structure for table `complainant`
--

CREATE TABLE `complainant` (
  `case_id` varchar(20) NOT NULL,
  `comp_name` varchar(100) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `occupation` varchar(20) NOT NULL,
  `region` varchar(50) NOT NULL,
  `district` varchar(100) NOT NULL,
  `loc` varchar(50) NOT NULL,
  `addrs` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complainant`
--

INSERT INTO `complainant` (`case_id`, `comp_name`, `tel`, `occupation`, `region`, `district`, `loc`, `addrs`, `age`, `gender`, `date_added`) VALUES
('210707101', 'Hanan Gundaadoo', '234567', '34567', 'Bono Region', 'Tain District', 'Sunyani', '67788', 22, 'Male', '2021-07-07 10:56:23'),
('210713102', 'New Case', '345678', 'fae', 'Bono Region', 'Jaman South Municipal', 'wertyui', 'ddd', 33, 'Male', '2021-07-13 09:20:49'),
('210713103', 'asdfgh', '567890', 'dfghjk', 'Ahafo Region', 'Asunafo South District', 'ertyu', 'erty', 456, 'Female', '2021-07-13 09:27:48'),
('210728101', 'Yahaya Osman', '0509997797', 'Lecturer', 'Bono Region', 'Dormaa Central Municipal', 'Sunyani', 'Hse No. 60/G, Kotokrom', 55, 'Male', '2021-07-28 13:12:57'),
('210728102', 'Yahaya Osman', '0509997797', 'Lecturer', 'Bono East Region', 'Pru West District', 'Sunyani', 'Hse No. 60/G, Kotokrom', 89, 'Male', '2021-07-28 13:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `crime_type`
--

CREATE TABLE `crime_type` (
  `id` int(11) NOT NULL,
  `des` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crime_type`
--

INSERT INTO `crime_type` (`id`, `des`) VALUES
(1, 'Domestic Violence'),
(2, 'Murder Case'),
(3, 'Assault'),
(4, 'Theft Case'),
(5, 'Defilement'),
(6, 'Robbing'),
(7, 'Fraud'),
(8, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `investigation`
--

CREATE TABLE `investigation` (
  `case_id` varchar(20) NOT NULL,
  `investigator` varchar(20) NOT NULL,
  `statement2` text NOT NULL,
  `assigned_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status2` varchar(100) NOT NULL,
  `completed_date` varchar(20) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `investigation`
--

INSERT INTO `investigation` (`case_id`, `investigator`, `statement2`, `assigned_date`, `status2`, `completed_date`, `id`) VALUES
('210707101', '005', '<p>thi is a cse</p>\r\n', '2021-07-07 11:03:58', 'Completed', '', 55);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `staffid` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `othernames` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `staffid`, `status`, `password`, `surname`, `othernames`) VALUES
(0, '005', 'CID', '8cb2237d0679ca88db6464eac60da96345513964', 'Osman ', 'Wumpini'),
(0, '1111', 'Admin', 'f865b53623b121fd34ee5426c792e5c33af8c227', 'Osman', 'Yahaya'),
(0, '112', 'NCO', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Danaa', 'Shafaw'),
(0, '113', 'CID', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Kobi', 'Adjei'),
(0, '222', 'NCO', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Yahaya', 'Eben'),
(0, '333', 'NCO', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Staff', 'Staff'),
(0, '4444', 'NCO', '8cb2237d0679ca88db6464eac60da96345513964', 'Yahaya', 'Osman'),
(0, 'cid', 'CID', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Staff ', 'Staff');




CREATE TABLE case_count (
    id INT PRIMARY KEY AUTO_INCREMENT,
    total_cases INT DEFAULT 0
);

-- Initialize the table with the current count of cases
INSERT INTO case_count (total_cases) 
SELECT COUNT(*) FROM case_table;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `case_table`
--
ALTER TABLE `case_table`
  ADD PRIMARY KEY (`caseid`);

--
-- Indexes for table `complainant`
--
ALTER TABLE `complainant`
  ADD PRIMARY KEY (`case_id`);

--
-- Indexes for table `crime_type`
--
ALTER TABLE `crime_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investigation`
--
ALTER TABLE `investigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`staffid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `case_table`
--
ALTER TABLE `case_table`
  MODIFY `caseid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `crime_type`
--
ALTER TABLE `crime_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `investigation`
--
ALTER TABLE `investigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

SELECT staffid, ct.des AS crime_type, COUNT(c.case_id) AS case_count
FROM case_table c
JOIN crime_type ct ON c.case_type = ct.des
GROUP BY staffid, ct.des;

DELIMITER $$

CREATE PROCEDURE GetCasesByStaffAndCrimeType()
BEGIN
    SELECT 
        c.staffid, 
        ct.des AS crime_type, 
        COUNT(c.case_id) AS case_count
    FROM 
        case_table c
    JOIN 
        crime_type ct ON c.case_type = ct.des
    GROUP BY 
        c.staffid, ct.des;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_case_type_highlight BEFORE INSERT ON case_table
FOR EACH ROW
BEGIN
    IF NEW.case_type = 'Robbing' THEN
        SET NEW.highlight = 'red';
    ELSEIF NEW.status = 'Completed' THEN
        SET NEW.highlight = 'green';
    ELSE
        SET NEW.highlight = NULL;
    END IF;
END$$

CREATE TRIGGER trg_case_type_highlight_update BEFORE UPDATE ON case_table
FOR EACH ROW
BEGIN
    IF NEW.case_type = 'Robbing' THEN
        SET NEW.highlight = 'red';
    ELSEIF NEW.status = 'Completed' THEN
        SET NEW.highlight = 'green';
    ELSE
        SET NEW.highlight = NULL;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

-- Trigger to update case count when a new case is added
CREATE TRIGGER trg_increase_case_count
AFTER INSERT ON case_table
FOR EACH ROW
BEGIN
    UPDATE case_count 
    SET total_cases = total_cases + 1;
END $$

-- Trigger to update case count when a case is deleted
CREATE TRIGGER trg_decrease_case_count
AFTER DELETE ON case_table
FOR EACH ROW
BEGIN
    UPDATE case_count 
    SET total_cases = total_cases - 1;
END $$

DELIMITER ;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
