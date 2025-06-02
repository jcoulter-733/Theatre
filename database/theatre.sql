-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 10:56 AM
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

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `blog_title`, `blog_content`, `user_id`, `blog_created`, `show_id`, `blog_image`, `blog_status`) VALUES
(2, 'Behind the Scenes of Les Misérables', 'An insightful look into the making of this timeless musical...', 2, '2025-03-26 14:30:00', 2, 'theatre.png', NULL),
(3, 'Hamilton: A Revolutionary Experience', 'The storytelling and choreography were revolutionary. A must-see show...', 3, '2025-03-27 12:15:00', 3, 'theatre.png', NULL),
(4, 'Romeo and Juliet - A Timeless Tragedy', 'The raw emotion of the actors made this show unforgettable...', 4, '2025-03-28 16:45:00', 4, 'theatre.png', NULL),
(5, 'A Midsummer Nights Dream: Magic on Stage', 'The whimsical costumes and delightful performances brought Shakespeare\'s play to life...', 5, '2025-03-29 11:30:00', 5, 'theatre.png', NULL),
(6, 'The Lion King: A Jungle Adventure', 'The animal costumes and puppet work were astonishing. A beautiful performance...', 6, '2025-03-30 12:00:00', 6, 'theatre.png', NULL),
(7, 'Wicked - A Wicked Good Time', 'An enchanting performance with incredible vocal performances and stunning visuals...', 7, '2025-03-31 17:00:00', 7, 'theatre.png', NULL),
(8, 'Chicago: A Night of Jazz and Drama', 'A thrilling show filled with stunning choreography and unforgettable music...', 8, '2025-04-01 16:45:00', 8, 'theatre.png', NULL),
(9, 'Cats: A Feline Fantasy', 'The energy and passion of the dancers made this performance truly magical...', 9, '2025-04-02 18:00:00', 9, 'theatre.png', NULL),
(11, 'Othello: A Story of Jealousy and Betrayal', 'The performances were intense, and the themes were beautifully portrayed...', 11, '2025-04-04 13:15:00', 11, 'theatre.png', NULL),
(12, 'A Chorus Line: Dance and Dreams', 'A captivating show about the hopes and struggles of dancers...', 12, '2025-04-05 20:00:00', 12, 'theatre.png', NULL),
(13, 'The Wizard of Oz: Journey to the Emerald City', 'A colorful and fun-filled adventure that captured the magic of Oz...', 13, '2025-04-06 14:45:00', 13, 'theatre.png', NULL),
(14, 'The Sound of Music: A Classic Reimagined', 'This show brought the beloved musical to life with fresh energy and heart...', 14, '2025-04-07 18:15:00', 14, 'theatre.png', NULL),
(15, 'The Book of Mormon: Hilarious and Provocative', 'An uproariously funny musical with a clever storyline and catchy tunes...', 15, '2025-04-08 15:30:00', 15, 'theatre.png', NULL),
(16, 'Hairspray: A Dance Party for the Ages', 'The show was full of energy, incredible music, and inspiring messages...', 16, '2025-04-09 12:45:00', 16, 'theatre.png', NULL),
(17, 'Sweeney Todd: A Musical Thriller', 'A chilling and dramatic performance with standout performances...', 17, '2025-04-10 17:00:00', 17, 'theatre.png', NULL),
(18, 'The Crucible: Witch Hunts and Mass Hysteria', 'A powerful, haunting show with a strong message about fear and persecution...', 18, '2025-04-11 19:15:00', 18, 'theatre.png', NULL),
(19, 'Jersey Boys: The Story of Frankie Valli and The Four Seasons', 'A fantastic journey through the music of one of the greatest pop groups of all time...', 19, '2025-04-12 16:00:00', 19, 'theatre.png', NULL),
(20, 'The Tempest: Magic and Revenge', 'A fantastical show full of magic, mystery, and stunning visuals...', 20, '2025-04-13 13:00:00', 20, 'theatre.png', NULL),
(21, 'Fiddler on the Roof: A Family Musical', 'A heartwarming and thought-provoking story with timeless music...', 21, '2025-04-14 18:30:00', 21, 'theatre.png', NULL),
(22, 'Mamma Mia! The Abba Musical', 'A fun-filled show full of laughter, energy, and, of course, ABBA music...', 22, '2025-04-15 15:00:00', 22, 'theatre.png', NULL),
(23, 'The Nutcracker: A Holiday Tradition', 'The ballet was stunning, with beautiful choreography and costumes...', 23, '2025-04-16 19:30:00', 23, 'theatre.png', NULL),
(24, 'The Seagull: A Study in Desperation', 'A powerful, dramatic show that explores the complexities of human emotions...', 24, '2025-04-17 17:15:00', 24, 'theatre.png', NULL),
(25, 'King Lear: A Tragedy of Power', 'An intense and emotional performance with a standout lead actor...', 25, '2025-04-18 20:00:00', 25, 'theatre.png', NULL),
(26, 'Beauty and the Beast: A Fairytale Musical', 'A beautiful, magical performance that took us back to our childhood...', 26, '2025-04-19 16:45:00', 26, 'theatre.png', NULL),
(27, 'Waiting for Godot: A Play About Nothing', 'A mind-bending play that made us question the meaning of life and existence...', 27, '2025-04-20 19:00:00', 27, 'theatre.png', NULL),
(28, 'Porgy and Bess: A Musical Masterpiece', 'A stunning production of the American opera filled with soulful music...', 28, '2025-04-21 13:30:00', 28, 'theatre.png', NULL),
(29, 'Fences: A Family Drama', 'A gripping story about family dynamics, race, and ambition...', 29, '2025-04-22 18:00:00', 29, 'theatre.png', NULL),
(30, 'The Glass Menagerie: A Tragic Family Story', 'A poignant, emotional show with incredible performances...', 30, '2025-04-23 17:30:00', 30, 'theatre.png', NULL),
(31, 'Little Shop of Horrors: A Dark Comedy', 'A funny and creepy musical with great songs and quirky characters...', 31, '2025-04-24 16:30:00', 31, 'theatre.png', NULL),
(32, 'The Merry Wives of Windsor: A Comedic Delight', 'Shakespeare at its best, filled with laughter and witty exchanges...', 32, '2025-04-25 18:00:00', 32, 'theatre.png', NULL),
(33, 'West Side Story: Love and Gang Wars', 'A heartbreaking and powerful performance with a stunning score...', 33, '2025-04-26 20:00:00', 33, 'theatre.png', NULL),
(34, 'A Streetcar Named Desire: Desire and Delusion', 'A haunting performance that delves deep into the mind of its lead character...', 34, '2025-04-27 17:45:00', 34, 'theatre.png', NULL),
(35, 'The Tempest: Shakespeare in the Islands', 'A mystical, visually striking performance that left the audience in awe...', 35, '2025-04-28 19:00:00', 35, 'theatre.png', NULL),
(36, 'The Importance of Being Earnest: A Comedy of Manners', 'A hilarious and brilliantly written play about mistaken identities and love...', 36, '2025-04-29 15:30:00', 36, 'theatre.png', NULL),
(37, 'The Rocky Horror Show: A Cult Classic', 'A fun, energetic show that had the audience on their feet the entire time...', 37, '2025-04-30 18:30:00', 37, 'theatre.png', NULL),
(38, 'Noises Off: A Farcical Delight', 'A chaotic, laugh-out-loud comedy that left the audience in stitches...', 38, '2025-05-01 19:00:00', 38, 'theatre.png', NULL),
(39, 'Rent: A Heartfelt Musical', 'A passionate and emotional musical that tackles tough themes...', 39, '2025-05-02 17:30:00', 39, 'theatre.png', NULL),
(40, 'The Marriage of Figaro: A Brilliant Opera', 'An elegant and witty performance that was nothing short of captivating...', 40, '2025-05-03 18:00:00', 40, 'theatre.png', NULL),
(41, 'Macbeth: Ambition and Guilt', 'A powerful rendition of the Shakespearean tragedy with a chilling lead performance...', 41, '2025-05-04 13:00:00', 41, 'theatre.png', NULL),
(42, 'Evita: A Story of Power and Betrayal', 'An intense and riveting musical about the life of Eva Perón...', 42, '2025-05-05 16:00:00', 42, 'theatre.png', NULL),
(43, 'Kinky Boots: A Fun-Filled Show', 'A bright and colorful musical with a message about love and acceptance...', 43, '2025-05-06 19:30:00', 43, 'theatre.png', NULL),
(44, 'The Phantom of the Opera: A Grand Spectacle', 'A majestic and grand performance with hauntingly beautiful music...', 44, '2025-05-07 20:15:00', 44, 'theatre.png', NULL),
(45, 'The Book of Mormon: Satirical and Hilarious', 'A side-splitting, laugh-out-loud show with clever dialogue and unforgettable music...', 45, '2025-05-08 18:00:00', 45, 'theatre.png', NULL),
(46, 'The Hunchback of Notre-Dame: A Dark Fairytale', 'A moving and emotional performance with incredible visuals and performances...', 46, '2025-05-09 17:00:00', 46, 'theatre.png', NULL),
(47, 'A Little Night Music: A Musical Celebration', 'A beautiful and melancholic musical with delightful melodies...', 47, '2025-05-10 19:30:00', 47, 'theatre.png', NULL),
(48, 'The Wizard of Oz: Classic Reimagined', 'A charming performance filled with magical moments and childhood nostalgia...', 48, '2025-05-11 14:45:00', 48, 'theatre.png', NULL),
(49, 'Into the Woods: A Dark Fairytale', 'A clever and enchanting production that captured the complexity of its characters...', 49, '2025-05-12 19:00:00', 49, 'theatre.png', NULL),
(50, 'Sweeney Todd: Dark and Gripping', 'A chilling and thrilling musical with incredible performances...', 50, '2025-05-13 17:30:00', 50, 'theatre.png', NULL);

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

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_id`, `comment_title`, `comment_content`, `comment_created`, `blog_id`, `user_id`) VALUES
(3, 'Couldn\'t agree more, it was fantastic!', 'I absolutely loved this show. The music, the actors, the stage design – everything was on point!', '2025-03-25 12:00:00', 2, 4),
(4, 'I loved the costumes, but the music was too loud', 'The costumes were beautiful, but the volume of the music made it hard to hear the dialogue at times.', '2025-03-26 14:30:00', 2, 5),
(5, 'Incredible choreography, but I didn\'t like the plot', 'The choreography was mind-blowing, but the story itself didn\'t really engage me like I had hoped.', '2025-03-26 16:45:00', 3, 6),
(6, 'Best show I\'ve seen in years', 'It was a perfect blend of humor, drama, and amazing performances. I will definitely see it again!', '2025-03-27 12:30:00', 3, 7),
(7, 'I found it a bit too long', 'While the performances were great, I felt the show could have been shorter and more to the point.', '2025-03-27 14:45:00', 4, 8),
(8, 'The acting was superb!', 'The lead actor was phenomenal! The passion they brought to the role really stood out.', '2025-03-27 16:00:00', 4, 9),
(10, 'A delightful performance, loved every second of it', 'This show was a joy to watch from start to finish. The cast\'s chemistry made it even more enjoyable.', '2025-03-28 19:30:00', 5, 11),
(11, 'The set design was breathtaking', 'The stage design was absolutely stunning. The attention to detail was incredible, creating such an immersive experience.', '2025-03-29 20:00:00', 6, 12),
(12, 'I didn\'t enjoy it as much as I hoped', 'I had high expectations, but the show didn\'t live up to them. Some parts were slow and predictable.', '2025-03-29 21:30:00', 6, 13),
(13, 'Amazing visuals, but the plot was confusing', 'The visuals were amazing, but the story was all over the place. I had trouble following it at times.', '2025-03-30 09:15:00', 7, 14),
(14, 'Such an energetic performance!', 'The energy in this show was contagious! The performers were so full of life and made the show unforgettable.', '2025-03-30 11:45:00', 7, 15),
(15, 'I loved the cast, but the stage could use some improvements', 'The cast did a wonderful job, but I felt that the stage setup could have been more dynamic to match the energy of the show.', '2025-03-31 12:30:00', 8, 16),
(16, 'The storyline was touching, I teared up', 'The emotional depth of the story really got to me. It\'s one of those shows that stays with you long after the curtain falls.', '2025-03-31 14:00:00', 8, 17),
(17, 'Fantastic show, the music was incredible!', 'The music was phenomenal. It really elevated the whole experience. The orchestra deserves a standing ovation.', '2025-04-01 13:30:00', 9, 18),
(18, 'It wasn\'t what I expected', 'I thought it would be more dramatic, but it leaned a lot more into humor. Still, I had fun watching it.', '2025-04-01 15:00:00', 9, 19),
(21, 'Such a moving story', 'The story was so poignant, and the performances really brought the characters’ emotions to the forefront. A truly moving experience.', '2025-04-03 17:45:00', 11, 22),
(22, 'The performances were captivating', 'Every performer in this show was captivating, especially the lead who gave such a raw and authentic portrayal of the character.', '2025-04-03 19:00:00', 11, 23),
(23, 'The direction could use some work', 'While the performances were great, I felt like the direction didn\'t quite capture the full potential of the show.', '2025-04-04 15:30:00', 12, 24),
(24, 'A musical masterpiece', 'I am in awe of this show. The music was stunning, and the way it was integrated into the story was perfect.', '2025-04-04 17:15:00', 12, 25),
(25, 'I felt like I was really part of the story', 'The immersive set and outstanding performances made me feel like I was part of the action. Truly an unforgettable experience.', '2025-04-05 16:00:00', 13, 26),
(26, 'The lighting was perfect for the mood', 'The lighting choices helped set the perfect mood for every scene. It really enhanced the emotional impact of the show.', '2025-04-05 17:30:00', 13, 27),
(27, 'This was an emotional rollercoaster', 'I went through every emotion possible during this show. It was powerful, heartfelt, and emotional from start to finish.', '2025-04-06 13:00:00', 14, 28),
(28, 'I couldn\'t stop thinking about it for days', 'I couldn’t get the show out of my head for days. The characters were so well developed, and the plot was so intricate.', '2025-04-06 14:30:00', 14, 29),
(29, 'So much talent on stage!', 'The talent in this show was overwhelming. Each performer brought something special to the stage, making it a must-see performance.', '2025-04-07 12:15:00', 15, 30),
(30, 'Could\'ve been better if it was shorter', 'The show was great, but it felt a bit too long. A shorter runtime might have made it more impactful.', '2025-04-07 13:30:00', 15, 31),
(31, 'I loved the humor in this one', 'The humor was sharp and witty, and it gave the show a unique feel. I laughed so much, and the cast was fantastic at delivering punchlines.', '2025-04-08 18:30:00', 16, 32),
(32, 'The emotional depth of the characters was incredible', 'The characters’ emotional journeys were so well written and performed. I really connected with the story on a deeper level.', '2025-04-08 20:00:00', 16, 33),
(33, 'The plot twists were so unexpected', 'I did not see the twists coming at all! The show kept me on the edge of my seat the entire time.', '2025-04-09 09:00:00', 17, 34),
(34, 'What an unforgettable experience!', 'This show was unforgettable in every way. The performances, the set, the music—it was all perfect.', '2025-04-09 10:15:00', 17, 35),
(35, 'The music was beautiful, but the acting wasn\'t great', 'The music was beautiful, but I didn’t connect with the acting. Some performances were weak, which affected the overall experience.', '2025-04-10 14:45:00', 18, 36),
(36, 'The plot was a bit predictable', 'The plot had potential, but I saw the ending coming from a mile away. Still, it was a fun show to watch.', '2025-04-10 16:00:00', 18, 37),
(37, 'I loved the dark humor', 'The dark humor added a unique edge to this performance. It was witty and made the audience think while laughing.', '2025-04-11 13:30:00', 19, 38),
(38, 'A unique experience that I won\'t forget', 'This show offered something totally unique. It was quirky, strange, and unlike anything I had seen before.', '2025-04-11 15:00:00', 19, 39),
(39, 'This show was a masterpiece from start to finish', 'Everything about this show was top-notch—brilliant performances, excellent set, and music that still resonates with me.', '2025-04-12 17:15:00', 20, 40),
(40, 'So much talent and passion on display', 'The talent on display was undeniable. Every actor poured their heart and soul into the performance.', '2025-04-12 19:00:00', 20, 41),
(41, 'The choreography was so well executed', 'The choreography was flawless, and it really helped elevate the show to another level of excellence.', '2025-04-13 18:00:00', 21, 42),
(42, 'I didn\'t really connect with the characters', 'While the show was impressive, I didn’t feel a strong connection to the characters, which made it hard to engage with the story.', '2025-04-13 19:30:00', 21, 43),
(43, 'It was a beautiful rendition of the classic', 'The classic story was reimagined beautifully, and it brought a fresh take to the original material.', '2025-04-14 09:00:00', 22, 44),
(44, 'The costumes were out of this world!', 'The costumes were some of the best I’ve ever seen. They truly brought the characters to life in a visually stunning way.', '2025-04-14 10:30:00', 22, 45),
(45, 'It was a bit slow in the middle', 'While the start and end were great, the middle portion of the show dragged on a bit too much for my taste.', '2025-04-15 16:15:00', 23, 46),
(46, 'A perfect balance of humor and drama', 'The balance between humor and drama was just right. It kept the audience engaged without ever feeling too heavy or too light.', '2025-04-15 17:30:00', 23, 47),
(47, 'The actors gave stellar performances', 'The performances were amazing. Every actor brought their A-game, and it really showed throughout the performance.', '2025-04-16 13:00:00', 24, 48),
(48, 'I didn\'t like the ending', 'I really enjoyed most of the show, but the ending left me feeling unsatisfied. It just didn’t wrap things up properly.', '2025-04-16 14:15:00', 24, 49),
(49, 'Such an energetic show from start to finish', 'The energy never dipped! This was a high-octane show that kept me engaged from beginning to end.', '2025-04-17 19:00:00', 25, 50),
(50, 'The whole cast gave an outstanding performance', 'Everyone in the cast gave their best performance. It was a joy to watch each actor bring something unique to the role.', '2025-04-17 20:30:00', 25, 1),
(51, 'I enjoyed the show, but the plot was a bit weak', 'I had fun watching the show, but the plot didn’t hold up as well as I’d hoped. It needed more depth.', '2025-04-18 18:00:00', 26, 2),
(52, 'A beautiful story, but the pacing was off', 'The story was lovely, but it felt like it dragged at times. If the pacing had been tighter, it would have been perfect.', '2025-04-18 19:30:00', 26, 3),
(53, 'I would love to see this show again', 'This show was so good, I wouldn’t hesitate to see it again! The performances were outstanding, and the story was really touching.', '2025-04-19 12:15:00', 27, 4),
(54, 'It didn\'t live up to my expectations', 'I was expecting more, but unfortunately, the show didn’t quite meet my expectations. It felt a bit underwhelming.', '2025-04-19 13:45:00', 27, 5),
(55, 'Fantastic direction and set design', 'The direction was spot on, and the set design was gorgeous. It really set the tone for the whole show.', '2025-04-20 16:30:00', 28, 6),
(56, 'The music was wonderful, but the acting could have been better', 'The music was beautiful, but I found the acting lacking in some areas. It could have been stronger to match the amazing music.', '2025-04-20 18:00:00', 28, 7),
(57, 'A heartwarming show', 'This show was so warm and heartfelt. It really resonated with me, and I left feeling uplifted.', '2025-04-21 13:30:00', 29, 8),
(58, 'The ending was so moving', 'The ending left me in tears. It was such an emotional and moving conclusion to an already incredible show.', '2025-04-21 15:00:00', 29, 9),
(60, 'A delightful experience', 'Such a delightful show with a perfect balance of comedy, drama, and music. It’s worth seeing!', '2025-04-22 19:00:00', 30, 11);

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

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `review_title`, `review_content`, `created_at`, `user_id`, `show_id`) VALUES
(1, 'Incredible Performance', 'The show was an absolute masterpiece. The performances were stellar, and the set design was breathtaking.', '2025-03-25 10:00:00', 1, 1),
(2, 'A bit too long', 'I enjoyed the performance, but it felt like it dragged in the middle. Could have been more concise.', '2025-03-25 11:30:00', 2, 1),
(3, 'Outstanding Cast', 'The cast did an amazing job, each actor brought so much energy to the stage, making it a memorable experience.', '2025-03-25 13:00:00', 3, 2),
(4, 'A Delightful Show', 'From start to finish, the show was absolutely delightful. The humor and drama balanced perfectly.', '2025-03-26 09:30:00', 4, 2),
(5, 'Not What I Expected', 'I thought it was going to be more of a drama, but it turned out to be quite comedic. Still, enjoyable!', '2025-03-26 11:00:00', 5, 3),
(6, 'A Beautiful Story', 'The storyline was very emotional, and I loved how it kept me engaged throughout the entire show.', '2025-03-27 15:00:00', 6, 3),
(7, 'The Music Was Great', 'The orchestra was phenomenal, and the music really added to the emotional depth of the performance.', '2025-03-27 16:30:00', 7, 4),
(8, 'Couldn\'t Keep My Eyes Off the St', 'The acting was so intense that I couldn’t take my eyes off the stage for a second. Truly mesmerizing!', '2025-03-28 18:45:00', 8, 4),
(9, 'Amazing Visuals', 'The set design and visuals were out of this world. The atmosphere they created was incredible.', '2025-03-28 20:00:00', 9, 5),
(11, 'Shakespeare Done Right', 'A fantastic rendition of Shakespeare’s play. The actors brought a new life to the classic that was simply brilliant.', '2025-03-29 14:00:00', 11, 6),
(12, 'A Journey of Emotions', 'This show took me on an emotional rollercoaster. I laughed, cried, and left with so many feelings.', '2025-03-30 15:45:00', 12, 6),
(13, 'The Plot Was Predictable', 'While the performances were great, I saw the plot twists coming a mile away. Would have liked more surprises.', '2025-03-30 17:15:00', 13, 7),
(14, 'Great for Families', 'A great show to take the family to. Fun, light-hearted, and with a good moral message at the end.', '2025-03-31 12:30:00', 14, 7),
(15, 'A Show with Heart', 'This show had a lot of heart. The performances were emotionally raw and real, and I loved every minute of it.', '2025-03-31 14:00:00', 15, 8),
(16, 'Visually Stunning', 'The stage design was visually stunning, and the way they used lighting was perfect for setting the mood.', '2025-04-01 13:30:00', 16, 8),
(17, 'Bit of a Slow Start', 'The beginning of the show was slow, but it picked up after the first 30 minutes. Definitely worth watching till the end.', '2025-04-01 15:00:00', 17, 9),
(18, 'Memorable Performances', 'The performances from the lead actors were unforgettable. They gave it their all and it showed.', '2025-04-02 10:00:00', 18, 9),
(19, 'Couldn\'t Stop Thinking About It', 'The show stuck with me for days. It was so thought-provoking and beautifully executed.', '2025-04-02 11:30:00', 19, 10),
(20, 'Lackluster Ending', 'The show was great, but the ending was a bit lackluster for me. It didn’t quite wrap things up in a satisfying way.', '2025-04-03 13:45:00', 20, 10),
(21, 'An Artistic Triumph', 'A true artistic triumph. Every aspect, from the acting to the music, came together perfectly.', '2025-04-03 15:15:00', 1, 11),
(22, 'I Want to See It Again!', 'This show was so good that I would love to see it again. There’s so much to appreciate, and I’m sure I missed some things.', '2025-04-04 17:00:00', 2, 11);

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
  `show_image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `show_name`, `date_shown`, `date_added`, `show_type`, `show_image`) VALUES
(1, 'The Phantom of the Opera', '2025-03-25 19:30:00', '2025-03-22 12:00:00', 'Musical', NULL),
(2, 'Les Misérables', '2025-03-26 20:00:00', '2025-03-22 12:10:00', 'Musical', NULL),
(3, 'Hamilton', '2025-03-27 19:00:00', '2025-03-22 12:20:00', 'Musical', NULL),
(4, 'Romeo and Juliet', '2025-03-28 18:30:00', '2025-03-22 12:30:00', 'Drama', NULL),
(5, 'A Midsummer Night\'s Dream', '2025-03-29 19:45:00', '2025-03-22 12:40:00', 'Comedy', NULL),
(6, 'The Lion King', '2025-03-30 14:00:00', '2025-03-22 12:50:00', 'Musical', NULL),
(7, 'Wicked', '2025-03-31 19:15:00', '2025-03-22 13:00:00', 'Musical', NULL),
(8, 'Chicago', '2025-04-01 18:30:00', '2025-03-22 13:10:00', 'Musical', NULL),
(9, 'Cats', '2025-04-02 19:00:00', '2025-03-22 13:20:00', 'Musical', NULL),
(10, 'Macbeth', '2025-04-03 17:30:00', '2025-03-22 13:30:00', 'Tragedy', NULL),
(11, 'Othello', '2025-04-04 19:15:00', '2025-03-22 13:40:00', 'Tragedy', NULL),
(12, 'A Chorus Line', '2025-04-05 18:00:00', '2025-03-22 13:50:00', 'Musical', NULL),
(13, 'The Wizard of Oz', '2025-04-06 14:30:00', '2025-03-22 14:00:00', 'Musical', NULL),
(14, 'The Sound of Music', '2025-04-07 19:30:00', '2025-03-22 14:10:00', 'Musical', NULL),
(15, 'The Book of Mormon', '2025-04-08 18:45:00', '2025-03-22 14:20:00', 'Musical', NULL),
(16, 'Hairspray', '2025-04-09 19:00:00', '2025-03-22 14:30:00', 'Musical', NULL),
(17, 'Sweeney Todd', '2025-04-10 18:00:00', '2025-03-22 14:40:00', 'Musical', NULL),
(18, 'The Crucible', '2025-04-11 17:15:00', '2025-03-22 14:50:00', 'Drama', NULL),
(19, 'Jersey Boys', '2025-04-12 19:00:00', '2025-03-22 15:00:00', 'Musical', NULL),
(20, 'The Tempest', '2025-04-13 18:30:00', '2025-03-22 15:10:00', 'Comedy', NULL),
(21, 'Fiddler on the Roof', '2025-04-14 19:00:00', '2025-03-22 15:20:00', 'Musical', NULL),
(22, 'Mamma Mia!', '2025-04-15 18:30:00', '2025-03-22 15:30:00', 'Musical', NULL),
(23, 'The Nutcracker', '2025-04-16 14:00:00', '2025-03-22 15:40:00', 'Ballet', NULL),
(24, 'The Seagull', '2025-04-17 19:00:00', '2025-03-22 15:50:00', 'Drama', NULL),
(25, 'King Lear', '2025-04-18 18:15:00', '2025-03-22 16:00:00', 'Tragedy', NULL),
(26, 'Beauty and the Beast', '2025-04-19 19:30:00', '2025-03-22 16:10:00', 'Musical', NULL),
(27, 'Waiting for Godot', '2025-04-20 17:30:00', '2025-03-22 16:20:00', 'Comedy', NULL),
(28, 'Porgy and Bess', '2025-04-21 18:45:00', '2025-03-22 16:30:00', 'Opera', NULL),
(29, 'Fences', '2025-04-22 19:15:00', '2025-03-22 16:40:00', 'Drama', NULL),
(30, 'The Glass Menagerie', '2025-04-23 17:30:00', '2025-03-22 16:50:00', 'Drama', NULL),
(31, 'Little Shop of Horrors', '2025-04-24 19:00:00', '2025-03-22 17:00:00', 'Musical', NULL),
(32, 'The Merry Wives of Windsor', '2025-04-25 18:30:00', '2025-03-22 17:10:00', 'Comedy', NULL),
(33, 'West Side Story', '2025-04-26 19:00:00', '2025-03-22 17:20:00', 'Musical', NULL),
(34, 'A Streetcar Named Desire', '2025-04-27 17:45:00', '2025-03-22 17:30:00', 'Drama', NULL),
(35, 'The Tempest', '2025-04-28 18:15:00', '2025-03-22 17:40:00', 'Comedy', NULL),
(36, 'The Importance of Being Earnest', '2025-04-29 19:00:00', '2025-03-22 17:50:00', 'Comedy', NULL),
(37, 'The Rocky Horror Show', '2025-04-30 19:30:00', '2025-03-22 18:00:00', 'Musical', NULL),
(38, 'Noises Off', '2025-05-01 18:30:00', '2025-03-22 18:10:00', 'Comedy', NULL),
(39, 'Rent', '2025-05-02 19:00:00', '2025-03-22 18:20:00', 'Musical', NULL),
(40, 'The Marriage of Figaro', '2025-05-03 18:00:00', '2025-03-22 18:30:00', 'Opera', NULL),
(41, 'Macbeth', '2025-05-04 19:15:00', '2025-03-22 18:40:00', 'Tragedy', NULL),
(42, 'Evita', '2025-05-05 18:45:00', '2025-03-22 18:50:00', 'Musical', NULL),
(43, 'Kinky Boots', '2025-05-06 19:00:00', '2025-03-22 19:00:00', 'Musical', NULL),
(44, 'The Phantom of the Opera', '2025-05-07 18:30:00', '2025-03-22 19:10:00', 'Musical', NULL),
(45, 'The Book of Mormon', '2025-05-08 17:30:00', '2025-03-22 19:20:00', 'Musical', NULL),
(46, 'The Hunchback of Notre-Dame', '2025-05-09 19:00:00', '2025-03-22 19:30:00', 'Musical', NULL),
(47, 'A Little Night Music', '2025-05-10 18:30:00', '2025-03-22 19:40:00', 'Musical', NULL),
(48, 'The Wizard of Oz', '2025-05-11 14:00:00', '2025-03-22 19:50:00', 'Musical', NULL),
(49, 'Into the Woods', '2025-05-12 18:45:00', '2025-03-22 20:00:00', 'Musical', NULL),
(50, 'Sweeney Todd', '2025-05-13 19:15:00', '2025-03-22 20:10:00', 'Musical', NULL),
(51, 'The Nutcracker', '2025-05-14 17:00:00', '2025-03-22 20:20:00', 'Ballet', NULL),
(52, 'The Sound of Music', '2025-05-15 19:30:00', '2025-03-22 20:30:00', 'Musical', NULL),
(53, 'West Side Story', '2025-05-16 19:00:00', '2025-03-22 20:40:00', 'Musical', NULL),
(54, 'Annie', '2025-05-17 18:30:00', '2025-03-22 20:50:00', 'Musical', NULL),
(55, 'Les Misérables', '2025-05-18 19:00:00', '2025-03-22 21:00:00', 'Musical', NULL),
(56, 'Wicked', '2025-05-19 18:00:00', '2025-03-22 21:10:00', 'Musical', NULL);

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
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
