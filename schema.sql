-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 23, 2018 at 06:59 AM
-- Server version: 10.0.35-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `solvonau_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `404_check`
--

CREATE TABLE `404_check` (
  `id` int(11) NOT NULL,
  `link` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `error_code` int(11) NOT NULL,
  `last_check` int(11) NOT NULL,
  `live` int(1) NOT NULL,
  `times_checked` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `activity_link`
--

CREATE TABLE `activity_link` (
  `id` bigint(20) NOT NULL,
  `link_id` int(11) NOT NULL,
  `time_clicked` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `activity_search`
--

CREATE TABLE `activity_search` (
  `id` bigint(20) NOT NULL,
  `term` varchar(100) COLLATE utf8_bin NOT NULL,
  `results` bigint(20) NOT NULL,
  `ip` varchar(25) COLLATE utf8_bin NOT NULL,
  `time_searched` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `link_index`
--

CREATE TABLE `link_index` (
  `id` mediumint(5) NOT NULL,
  `link_id` mediumint(5) NOT NULL,
  `link` text COLLATE utf8_bin NOT NULL,
  `title` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `subject` text COLLATE utf8_bin NOT NULL,
  `license` text COLLATE utf8_bin NOT NULL,
  `site_address` text COLLATE utf8_bin NOT NULL,
  `last_updated` int(10) NOT NULL,
  `first_harvested` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `link_table`
--

CREATE TABLE `link_table` (
  `link_id` bigint(20) NOT NULL,
  `link` varchar(300) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `link_term`
--

CREATE TABLE `link_term` (
  `link_term_id` int(8) NOT NULL,
  `link_id` mediumint(5) NOT NULL,
  `term_id` mediumint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `node_data`
--

CREATE TABLE `node_data` (
  `node_id` mediumint(6) UNSIGNED NOT NULL,
  `node_value` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `node_term`
--

CREATE TABLE `node_term` (
  `term_id` bigint(20) NOT NULL,
  `term` varchar(30) COLLATE utf8_bin NOT NULL,
  `node_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oer_site_list`
--

CREATE TABLE `oer_site_list` (
  `index_link` int(11) NOT NULL,
  `site_address` varchar(500) DEFAULT NULL,
  `site_licence` varchar(255) NOT NULL,
  `feed_status` varchar(10) NOT NULL,
  `url_type` varchar(20) NOT NULL,
  `items_harvested` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reporting`
--

CREATE TABLE `reporting` (
  `id` bigint(20) NOT NULL,
  `type` text NOT NULL,
  `message` text NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `404_check`
--
ALTER TABLE `404_check`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_link`
--
ALTER TABLE `activity_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_search`
--
ALTER TABLE `activity_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link_index`
--
ALTER TABLE `link_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`(255)),
  ADD KEY `description` (`description`(255)),
  ADD KEY `subject` (`subject`(255)),
  ADD KEY `link` (`link`(255)),
  ADD KEY `link_id` (`link_id`);

--
-- Indexes for table `link_table`
--
ALTER TABLE `link_table`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link` (`link`(255));

--
-- Indexes for table `link_term`
--
ALTER TABLE `link_term`
  ADD PRIMARY KEY (`link_term_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `term_id` (`term_id`);

--
-- Indexes for table `node_data`
--
ALTER TABLE `node_data`
  ADD PRIMARY KEY (`node_id`),
  ADD KEY `node_value` (`node_value`(255));

--
-- Indexes for table `node_term`
--
ALTER TABLE `node_term`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `Unique check` (`term`,`node_id`),
  ADD KEY `term` (`term`),
  ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `oer_site_list`
--
ALTER TABLE `oer_site_list`
  ADD PRIMARY KEY (`index_link`),
  ADD UNIQUE KEY `site_address` (`site_address`);

--
-- Indexes for table `reporting`
--
ALTER TABLE `reporting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `404_check`
--
ALTER TABLE `404_check`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38244;

--
-- AUTO_INCREMENT for table `activity_link`
--
ALTER TABLE `activity_link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `activity_search`
--
ALTER TABLE `activity_search`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2641590;

--
-- AUTO_INCREMENT for table `link_index`
--
ALTER TABLE `link_index`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356499;

--
-- AUTO_INCREMENT for table `link_table`
--
ALTER TABLE `link_table`
  MODIFY `link_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371508;

--
-- AUTO_INCREMENT for table `link_term`
--
ALTER TABLE `link_term`
  MODIFY `link_term_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1807097414;

--
-- AUTO_INCREMENT for table `node_data`
--
ALTER TABLE `node_data`
  MODIFY `node_id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2074208;

--
-- AUTO_INCREMENT for table `node_term`
--
ALTER TABLE `node_term`
  MODIFY `term_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1203820;

--
-- AUTO_INCREMENT for table `oer_site_list`
--
ALTER TABLE `oer_site_list`
  MODIFY `index_link` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1794;

--
-- AUTO_INCREMENT for table `reporting`
--
ALTER TABLE `reporting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
