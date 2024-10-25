SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `flask_articles`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `author` varchar(100) NOT NULL,
  `body` text,
  `pub_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `author`, `body`, `pub_date`) VALUES
(16, 'Thsassdfs', 'admin', '<p>sdfnl;skflsn</p>\r\n', '2021-01-04 10:23:43'),
(18, 'sakflsknlzfsdnfz', 'admin', '<p>sldf vsn sjknd c ksldn lsk dc</p>\r\n', '2021-01-04 10:23:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
