-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 25, 2024 at 01:13 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `flask_articles`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `pub_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `pub_date`) VALUES
(1, 'Thananjayan Rajasekaran', 'admin', 'thananjayan1988@gmail.com', '$5$rounds=535000$1t/rJ6wdG3EgBxVD$p6xrlfx4NuY/oUWCbWJWQdVg8aMh/5lan/69Ts66nRA', '2021-01-01 16:38:57'),
(2, 'Tester', 'admin1', 'test@y.com', '$5$rounds=535000$VdkiWVm.OGFeQNxD$4kexlt8ahJ689ew5Gdk9mO9OdP8mrgwZ01FBS6BocM0', '2021-01-01 16:53:54'),
(3, 'Thanan', 'love', 'love@gmail.com', '$5$rounds=535000$6PLWl3QvF9TTiX2i$H06q8RUXunD07ji3NKhKWggW4hnbd.8jXhTnB.kQQH0', '2021-01-02 02:28:01');


--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);


--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
