-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2025 at 10:16 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theatre`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(8) NOT NULL,
  `blog_title` varchar(128) NOT NULL,
  `blog_content` text NOT NULL,
  `user_id` int(8) NOT NULL,
  `blog_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_id` int(8) NOT NULL,
  `blog_image` varchar(128) DEFAULT NULL,
  `blog_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `comment_id` int(8) NOT NULL,
  `comment_title` varchar(128) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `blog_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `newblogs`
--

CREATE TABLE `newblogs` (
  `blog_id` int(8) NOT NULL,
  `blog_title` varchar(128) NOT NULL,
  `blog_content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(8) NOT NULL,
  `blog_status` enum('pending','published') NOT NULL DEFAULT 'pending',
  `blog_image` varchar(255) NOT NULL DEFAULT 'theatre.jpeg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `newblogs`
--

INSERT INTO `newblogs` (`blog_id`, `blog_title`, `blog_content`, `created_at`, `user_id`, `blog_status`, `blog_image`) VALUES
(1, 'A Spellbinding Night with Hamilton', 'Last night’s performance of *Hamilton* at the Grand Theatre was nothing short of extraordinary. From the electrifying performances to the breathtaking set design, every moment was unforgettable. Lin-Manuel Miranda’s music continues to dazzle, and the cast did not disappoint.', '2025-05-25 18:45:00', 5, 'published', 'theatre.jpeg'),
(2, 'Phantom Fades in Modern Times', 'While the original magic of *The Phantom of the Opera* still lingers, last night’s rendition felt a bit dated. The vocals were powerful, but the pacing dragged. Some modern flair could breathe new life into this classic.', '2025-05-20 17:30:00', 7, 'published', 'theatre.jpeg'),
(3, 'Wickedly Good: A Review of Wicked', 'Wicked delivers yet again with soaring vocals and spectacular visuals. The chemistry between Elphaba and Glinda was palpable. Highly recommend for newcomers and fans alike.', '2025-05-22 19:00:00', 13, 'published', 'theatre.jpeg'),
(4, 'Les Misérables Left Me Wanting More', 'Though the cast gave a commendable performance, this rendition of *Les Misérables* lacked the emotional depth I’ve seen in other versions. Still worth a watch for the powerful score and iconic moments.', '2025-05-18 16:00:00', 5, 'published', 'theatre.jpeg'),
(5, 'Cats: Claws Out for This One', 'Unfortunately, this production of *Cats* missed the mark. Confusing choreography and lackluster costumes left the audience more puzzled than enchanted.', '2025-05-21 20:15:00', 7, 'published', 'theatre.jpeg'),
(6, 'Behind the Curtain: Sneak Peek at Rent', 'In anticipation of the new *Rent* revival, here’s a look at what’s in store. Exclusive interviews with the cast and directors hint at a modern twist on a beloved classic.', '2025-05-24 09:30:00', 13, 'pending', 'theatre.jpeg'),
(7, 'A Chorus Line: Dazzling or Dated', 'This production of *A Chorus Line* proves why it’s still relevant decades later. With high energy, real emotion, and impeccable timing, it’s a must-see for theatre lovers.', '2025-05-26 13:00:00', 13, 'published', 'theatre.jpeg'),
(8, 'The Lion King Roars On', 'Visually stunning and emotionally gripping, *The Lion King* continues to be a theatrical triumph. Perfect for families and first-time theatre-goers.', '2025-05-27 10:45:00', 7, 'published', 'theatre.jpeg'),
(9, 'Dear Evan Hansen: A Modern Masterpiece', '*Dear Evan Hansen* taps into the pulse of a generation. With a powerful message and an unforgettable score, this is one of the best modern musicals I’ve seen.', '2025-05-23 15:20:00', 5, 'published', 'theatre.jpeg'),
(10, 'Chicago’s Sizzling Return to Stage', '*Chicago* returned with a bang. The choreography was sharp, and the music was as catchy as ever. A great mix of nostalgia and edge.', '2025-05-19 12:10:00', 13, 'published', 'theatre.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(8) NOT NULL,
  `review_title` varchar(32) NOT NULL,
  `review_content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(8) NOT NULL,
  `show_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(8) NOT NULL,
  `show_name` varchar(128) NOT NULL,
  `date_shown` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_type` varchar(128) NOT NULL,
  `show_image` varchar(128) DEFAULT NULL,
  `show_info` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `show_name`, `date_shown`, `date_added`, `show_type`, `show_image`, `show_info`) VALUES
(58, '42nd Street', '2025-05-26 18:30:00', '2023-01-10 00:00:00', 'Musical', NULL, 'A Broadway musical about the journey of a young woman trying to make it big in the world of theatre.'),
(59, 'Annie', '2025-05-30 10:00:00', '2023-03-12 00:00:00', 'Musical', NULL, 'A heartwarming tale about a young orphan who finds a family and love in a world of adversity.'),
(60, 'Dirty Dancing', '2025-05-30 21:00:00', '2023-06-17 23:00:00', 'Musical', NULL, 'A dance-filled production about a passionate love story with energetic music and choreography.'),
(61, 'Disney on Ice', '2025-12-28 13:30:00', '2023-08-04 23:00:00', 'Family Show', NULL, 'A magical ice-skating extravaganza featuring beloved Disney characters in a spectacular performance.'),
(62, 'Fishermans Friends', '2025-07-14 18:30:00', '2023-09-09 23:00:00', 'Musical', NULL, 'A touching and heartwarming story of friendship and laughter set in a seaside village.'),
(63, 'Grease Musical', '2025-08-09 20:00:00', '2023-11-01 00:00:00', 'Musical', NULL, 'A high-energy musical that brings the classic love story and fun dance routines to the stage.'),
(64, 'Life of Pi', '2026-03-14 15:30:00', '2024-01-12 00:00:00', 'Drama', NULL, 'An emotionally powerful play based on the life-changing adventures of Pi, a young boy stranded at sea.'),
(65, 'Mary Poppins', '2025-09-27 11:30:00', '2024-02-18 00:00:00', 'Musical', NULL, 'A timeless family story filled with magic, adventure, and heart, as Mary Poppins transforms lives.'),
(66, 'Pretty Woman', '2025-11-14 22:00:00', '2024-04-04 23:00:00', 'Musical', NULL, 'A glamorous and romantic show where an unlikely couple meets and falls in love in the world of high fashion and wealth.'),
(67, 'Shrek the Musical', '2026-10-17 10:30:00', '2024-05-01 23:00:00', 'Musical', NULL, 'A whimsical and funny musical about the adventures of a young ogre and his friends in a fairy-tale land.'),
(68, 'Steel Magnolias', '2025-08-13 19:30:00', '2024-06-14 23:00:00', 'Drama', NULL, 'A heartfelt comedy-drama about the bond between a group of Southern women facing life’s challenges.'),
(69, 'Winnie The Pooh', '2026-04-12 12:00:00', '2024-07-09 23:00:00', 'Family Show', NULL, 'A charming and delightful show filled with whimsy, as Winnie the Pooh and friends embark on adventures in the Hundred Acre Wood.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(8) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role`, `status`) VALUES
(1, 'john_doe', 'john.doe@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(2, 'jane_smith', 'jane.smith@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(3, 'alice_jones', 'alice.jones@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(4, 'bob_brown', 'bob.brown@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(5, 'charlie_white', 'charlie.white@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(6, 'david_martin', 'david.martin@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(7, 'eva_davis', 'eva.davis@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(8, 'frank_moore', 'frank.moore@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(9, 'grace_lee', 'grace.lee@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(11, 'isla_clark', 'isla.clark@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(12, 'jackson_walker', 'jackson.walker@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(13, 'karen_hall', 'karen.hall@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(14, 'liam_allen', 'liam.allen@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(15, 'michael_young', 'michael.young@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(16, 'nicole_king', 'nicole.king@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(17, 'oliver_wright', 'theatrewatcher416@outlook.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(18, 'peter_harris', 'peter.harris@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(19, 'quinn_lee', 'quinn.lee@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(20, 'rachel_perez', 'rachel.perez@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(21, 'steve_garcia', 'steve.garcia@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(22, 'tina_robins', 'tina.robins@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(23, 'ursula_wilson', 'ursula.wilson@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(24, 'victor_torres', 'victor.torres@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(25, 'wanda_moore', 'wanda.moore@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(26, 'xander_jackson', 'xander.jackson@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(27, 'yasmine_james', 'yasmine.james@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(28, 'zane_smith', 'zane.smith@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(29, 'amy_walker', 'amy.walker@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(30, 'brandon_carter', 'brandon.carter@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(31, 'carmen_foster', 'carmen.foster@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(32, 'dylan_perry', 'dylan.perry@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(33, 'ella_davis', 'ella.davis@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(34, 'fiona_brooks', 'fiona.brooks@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(35, 'george_douglas', 'george.douglas@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(36, 'hannah_james', 'hannah.james@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(37, 'ian_martin', 'ian.martin@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(38, 'jessica_baker', 'jessica.baker@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(39, 'kyle_robinson', 'kyle.robinson@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(40, 'lisa_moore', 'lisa.moore@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(41, 'matthew_smith', 'matthew.smith@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(42, 'nancy_williams', 'nancy.williams@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(43, 'olivia_walker', 'olivia.walker@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(44, 'patrick_ross', 'patrick.ross@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(45, 'quincy_bennett', 'quincy.bennett@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(46, 'riley_martin', 'riley.martin@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(47, 'samantha_taylor', 'samantha.taylor@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(48, 'toby_johnson', 'toby.johnson@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(49, 'victoria_campbel', 'victoria.campbell@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(50, 'william_davis', 'william.davis@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(51, 'test', 'test@test.com', 'aaaa', 'user', 'active'),
(52, 'JohnC', 'j.coulter.20349389@gmail.com', '$2y$10$crvBQCDNmuJd5VHVCEKND.rjIKQS6N449uml7cOtb9U4.NCWhXVwy', 'admin', 'active'),
(53, 'JohnA', 'j.coulter.2034938@gmail.com', '$2y$10$B/SpeHD5/y/BSv6GZULE2eDddWEAxaHYsdSsclXVrIaP6FlombkFi', 'user', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `blogs_ibfk_1` (`show_id`),
  ADD KEY `blogs_ibfk_2` (`user_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `blog_comments_ibfk_1` (`blog_id`),
  ADD KEY `blog_comments_ibfk_2` (`user_id`);

--
-- Indexes for table `newblogs`
--
ALTER TABLE `newblogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviews_ibfk_1` (`show_id`),
  ADD KEY `reviews_ibfk_2` (`user_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`show_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `newblogs`
--
ALTER TABLE `newblogs`
  MODIFY `blog_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`blog_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `newblogs`
--
ALTER TABLE `newblogs`
  ADD CONSTRAINT `newblogs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
