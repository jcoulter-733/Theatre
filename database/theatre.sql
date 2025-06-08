-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 08, 2025 at 04:48 PM
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
-- Database: `theatre`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `comment_id` int(8) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `blog_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `comment_status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_id`, `comment_content`, `comment_created`, `blog_id`, `user_id`, `comment_status`) VALUES
(63, 'dsdsfsdf', '2025-06-05 16:22:12', 8, 54, 'approved'),
(64, 'gfgfgfgf yh teryrtey  yrty rty  ytr ytrey', '2025-06-05 17:05:05', 8, 54, 'approved'),
(65, ';lm;lm oihoipupoiup ipoipoipoi ', '2025-06-05 18:07:28', 8, 7, 'approved'),
(66, 'jtyj yuyru  rturtyu', '2025-06-06 08:29:30', 8, 66, 'rejected'),
(67, 'yuhjyj yuyu ryurytu', '2025-06-06 08:29:40', 7, 66, 'rejected');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_name` varchar(255) NOT NULL,
  `feedback_email` varchar(255) NOT NULL,
  `feedback_message` text NOT NULL,
  `feedback_status` enum('unresolved','resolved') DEFAULT 'unresolved',
  `feedback_time_sent` datetime DEFAULT current_timestamp(),
  `feedback_admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_name`, `feedback_email`, `feedback_message`, `feedback_status`, `feedback_time_sent`, `feedback_admin_id`) VALUES
(1, 'jb', 'jb@jb.com', 'Testing feedback', 'resolved', '2025-06-08 12:00:02', 54),
(2, 'jb', 'jb@jb.com', 'dsfsdf fsdfsdf  fds sdf ', 'resolved', '2025-06-08 12:03:50', 54),
(3, 'jb', 'jb@jb.com', 'gjfdg gdsf fd gdsf g ', 'resolved', '2025-06-08 12:16:17', 54),
(4, 'jb', 'jb@jb.com', 'jhfgj ghj hgj', 'resolved', '2025-06-08 12:23:34', 54),
(5, 'jb', 'jb@jb.com', ',mbn,', 'resolved', '2025-06-08 12:23:48', 54),
(6, 'jb', 'jb@jb.com', 'fdaeftret', 'resolved', '2025-06-08 12:26:10', 54),
(7, 'jb', 'jb@jb.com', 'fdaeftret etrgh', 'resolved', '2025-06-08 12:27:28', 54),
(8, 'jb', 'jb@jb.com', 'rt retrewt ret', 'resolved', '2025-06-08 12:28:07', 54),
(9, 'jb', 'jb@jb.com', 'NOW', 'resolved', '2025-06-08 12:28:16', 54),
(10, 'John Coulter', 'jdssds@jasods.com', 'Testing a message from an unregistered user', 'resolved', '2025-06-08 13:53:27', 54);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newblogs`
--

INSERT INTO `newblogs` (`blog_id`, `blog_title`, `blog_content`, `created_at`, `user_id`, `blog_status`, `blog_image`) VALUES
(2, 'Phantom Fades in Modern Times', 'While the original magic of *The Phantom of the Opera* still lingers, last night’s rendition felt a bit dated. The vocals were powerful, but the pacing dragged. Some modern flair could breathe new life into this classic.', '2025-05-20 17:30:00', 7, 'published', 'theatre.jpeg'),
(3, 'Wickedly Good: A Review of Wicked', 'Wicked delivers yet again with soaring vocals and spectacular visuals. The chemistry between Elphaba and Glinda was palpable. Highly recommend for newcomers and fans alike.', '2025-05-22 19:00:00', 13, 'published', 'theatre.jpeg'),
(5, 'Cats: Claws Out for This One', 'Unfortunately, this production of *Cats* missed the mark. Confusing choreography and lackluster costumes left the audience more puzzled than enchanted.', '2025-05-21 20:15:00', 7, 'published', 'theatre.jpeg'),
(6, 'Behind the Curtain: Sneak Peek at Rent', 'In anticipation of the new *Rent* revival, here’s a look at what’s in store. Exclusive interviews with the cast and directors hint at a modern twist on a beloved classic.', '2025-05-24 09:30:00', 13, 'published', 'theatre.jpeg'),
(7, 'A Chorus Line: Dazzling or Dated', 'This production of *A Chorus Line* proves why it’s still relevant decades later. With high energy, real emotion, and impeccable timing, it’s a must-see for theatre lovers.', '2025-05-26 13:00:00', 13, 'published', 'theatre.jpeg'),
(8, 'The Lion King Roars On', 'Visually stunning and emotionally gripping, *The Lion King* continues to be a theatrical triumph. Perfect for families and first-time theatre-goers.', '2025-05-27 10:45:00', 7, 'published', 'theatre.jpeg'),
(10, 'Chicago’s Sizzling Return to Stage', 'The latest production of the legendary musical Chicago pulsates with wit, glamour, and razor-sharp satire, delivering a stylishly provocative exploration of fame and corruption. Directed with energy and verve, this version of Chicago revels in the dark humor of Maurine Dallas Watkins\'s original story, capturing the jazzy cynicism of Prohibition-era America.\r\n\r\nFrom the opening number, \"All That Jazz,\" the ensemble casts an electrifying spell, showcasing dynamic choreography that combines classic Fosse influences with contemporary flair. The dance routines, meticulously choreographed, brim with precision and sensuality, capturing both the decadence and desperation of its characters.\r\n\r\nIn the central roles, Roxie Hart and Velma Kelly radiate charisma and comic timing. Roxie’s evolution from naive dreamer to manipulative starlet is delivered with playful nuance, capturing both humor and a surprising vulnerability. Velma’s seasoned, hardened stage persona contrasts brilliantly with Roxie\'s wide-eyed ambitions, providing dynamic interplay between these two driven characters.\r\n\r\nThe standout performance, however, belongs to Billy Flynn, whose suave bravado and sly charm dominate each scene. His rendition of \"Razzle Dazzle\" is particularly memorable, perfectly encapsulating the show\'s themes of illusion and deception. Supporting characters like Amos Hart and Mama Morton also offer notable performances, injecting emotional depth and sardonic humor into their portrayals.\r\n\r\nVisually, the production adopts a sleek aesthetic, dominated by stark monochromatic tones that complement the show\'s themes of moral ambiguity and superficial glamour. The minimalist yet effective set design cleverly enhances scene transitions, making the storytelling seamless and engaging. Costumes, combining vintage flair with modern accents, heighten the show\'s decadent atmosphere, reflecting the shallow glamor of its characters’ lives.\r\n\r\nMusically, the orchestra delivers an impeccable performance, bringing out the vibrant jazz rhythms and infectious melodies that define the score. Songs such as \"Cell Block Tango\" and \"When You’re Good to Mama\" are vividly staged and energetically performed, eliciting enthusiastic audience reactions and driving the narrative momentum.\r\n\r\nWhile remaining faithful to its source material, this production injects fresh vitality into the familiar tale. Its sharp critique of celebrity culture and judicial corruption feels strikingly relevant today, underscoring the timeless quality of its satire. The balance of humor, drama, and musical spectacle ensures a thoroughly enjoyable experience.\r\n\r\nIn sum, this rendition of Chicago triumphantly blends style, satire, and sophistication, delivering an irresistibly entertaining night at the theatre. It’s a vibrant, razor-sharp celebration of showbiz excess and moral ambiguity, leaving audiences both entertained and reflective about the enduring nature of fame and scandal.', '2025-05-19 12:10:00', 13, 'pending', ''),
(13, 'Glasgow Theatre Company Opening Times', 'Ticket Office 10:00 - 18:00 (Tuesday - Saturday)', '2025-06-06 11:53:47', 54, 'published', '448924575_10224035182964127_5361330701707424791_n.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `show_name`, `date_shown`, `date_added`, `show_type`, `show_image`, `show_info`) VALUES
(59, 'Annie', '2025-05-30 10:00:00', '2023-03-12 00:00:00', 'Musical', 'annie.jpeg', 'A heartwarming tale about a young orphan who finds a family and love in a world of adversity.'),
(60, 'Dirty Dancing', '2025-05-30 21:00:00', '2023-06-17 23:00:00', 'Musical', 'dirty_dancing.jpeg', 'Dirty Dancing is back for one night only!'),
(61, 'Disney on Ice', '2025-12-28 13:30:00', '2023-08-04 23:00:00', 'Family Show', 'disney_on_ice.jpeg', 'A magical ice-skating extravaganza featuring beloved Disney characters in a spectacular performance.'),
(62, 'Fishermans Friends', '2025-07-14 18:30:00', '2023-09-09 23:00:00', 'Musical', 'fishermans_friends.jpeg', 'A touching and heartwarming story of friendship and laughter set in a seaside village.'),
(63, 'Grease Musical', '2025-08-09 20:00:00', '2023-11-01 00:00:00', 'Musical', 'grease_musical.jpeg', 'A high-energy musical that brings the classic love story and fun dance routines to the stage.'),
(64, 'Life of Pi', '2026-03-14 15:30:00', '2024-01-12 00:00:00', 'Drama', 'life_of_pi.jpeg', 'An emotionally powerful play based on the life-changing adventures of Pi, a young boy stranded at sea.'),
(65, 'Mary Poppins', '2025-09-27 11:30:00', '2024-02-18 00:00:00', 'Musical', 'mary_poppins.jpeg', 'A timeless family story filled with magic, adventure, and heart, as Mary Poppins transforms lives.'),
(66, 'Pretty Woman', '2025-11-14 22:00:00', '2024-04-04 23:00:00', 'Musical', 'pretty_woman.jpeg', 'A glamorous and romantic show where an unlikely couple meets and falls in love in the world of high fashion and wealth.'),
(67, 'Shrek the Musical', '2026-10-17 10:30:00', '2024-05-01 23:00:00', 'Musical', 'shrek_the_musical.jpeg', 'A whimsical and funny musical about the adventures of a young ogre and his friends in a fairy-tale land.'),
(68, 'Steel Magnolias', '2025-08-13 19:30:00', '2024-06-14 23:00:00', 'Drama', 'steel_magnolias.jpeg', 'A heartfelt comedy-drama about the bond between a group of Southern women facing life’s challenges.');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role`, `status`) VALUES
(1, 'john_doe', 'john.doe@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(2, 'jane_smith', 'jane.smith@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(7, 'eva', 'eva.davis@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(8, 'frank_moore', 'frank.moore@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(11, 'isla_clark', 'isla.clark@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(12, 'jackson_walker', 'jackson.walker@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(13, 'karen_hall', 'karen.hall@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(33, 'ella', 'ella.davis@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(34, 'fiona_brooks', 'fiona.brooks@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(35, 'george_douglas', 'george.douglas@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(36, 'hannah_james', 'hannah.james@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(37, 'ian_martin', 'ian.martin@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'active'),
(38, 'jessica_baker', 'jessica.baker@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 'inactive'),
(52, 'JohnC', 'j.coulter.20349389@gmail.com', '$2y$10$crvBQCDNmuJd5VHVCEKND.rjIKQS6N449uml7cOtb9U4.NCWhXVwy', 'admin', 'active'),
(53, 'JohnA', 'j.coulter.2034938@gmail.com', '$2y$10$B/SpeHD5/y/BSv6GZULE2eDddWEAxaHYsdSsclXVrIaP6FlombkFi', 'user', 'active'),
(54, 'jb', 'jb@jb.com', '$2y$10$XHJA5E364d0Bgu4sCnSbqOXCy9vFjifbfwO9CCQiaF2QBlpL9.WUm', 'admin', 'active'),
(55, 'JohnnyB', 'jbsns@lsjd.com', '$2y$10$udHzpuCdNoAT1zKp.1hGgOO9MGLL599hC4HH0tHjG4nwzD1HtmSka', 'user', 'active'),
(56, 'basil_fawlty', 'basil.fawlty@example.com', '7c6a180b36896a0a8c02787eeafb0e4c', 'admin', 'active'),
(57, 'sybil_fawlty', 'sybil.fawlty@example.com', '6cb75f652a9b52798eb6cf2201057c73', 'user', 'active'),
(58, 'manuel', 'manuel@example.com', '819b0643d6b89dc9b579fdfc9094f28e', 'user', 'active'),
(59, 'polly_sherman', 'polly.sherman@example.com', '34cc93ece0ba9e3f6f235d4af979b16c', 'user', 'active'),
(60, 'del_boy', 'del.boy@example.com', 'db0edd04aaac4506f7edab03ac855d56', 'user', 'active'),
(61, 'rodney_trotter', 'rodney.trotter@example.com', '218dd27aebeccecae69ad8408d9a36bf', 'user', 'active'),
(62, 'uncle_albert', 'uncle.albert@example.com', '00cdb7bb942cf6b290ceb97d6aca64a3', 'user', 'active'),
(63, 'roy_trenneman', 'roy.trenneman@example.com', 'b25ef06be3b6948c0bc431da46c2c738', 'user', 'active'),
(64, 'maurice_moss', 'maurice.moss@example.com', '5d69dd95ac183c9643780ed7027d128a', 'user', 'active'),
(65, 'jen_barrow', 'jen.barrow@example.com', '87e897e3b54a405da144968b2ca19b45', 'user', 'active'),
(66, 'jbuser', 'jbuser@gmail.com', '$2y$10$FxuL3S3odq.EFh0lN346..bWBaegTyK5BLS3zMiv2Jheg.P3EanUG', 'user', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `blog_comments_ibfk_1` (`blog_id`),
  ADD KEY `blog_comments_ibfk_2` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `feedback_admin_id` (`feedback_admin_id`);

--
-- Indexes for table `newblogs`
--
ALTER TABLE `newblogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `newblogs`
--
ALTER TABLE `newblogs`
  MODIFY `blog_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `newblogs` (`blog_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`feedback_admin_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `newblogs`
--
ALTER TABLE `newblogs`
  ADD CONSTRAINT `newblogs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
