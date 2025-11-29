-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2025 at 05:47 PM
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
-- Create and select database
--

CREATE DATABASE IF NOT EXISTS `bookflix`;
USE `bookflix`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `due_date` date NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `book_id`, `booking_date`, `due_date`, `duration`, `created_at`) VALUES
(66, 49, 102, '2025-09-04', '2025-09-07', '3', '2025-09-03 15:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `synopsis` text DEFAULT NULL,
  `cover_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `year`, `rating`, `genre`, `synopsis`, `cover_path`) VALUES
(101, 'Night of the Living Dead', 'John Russo, based on film by George A. Romero', '1974', '4.5/5', 'Horror', 'The novelization of the classic 1968 zombie film that started it all. When the dead rise and attack the living, a group of strangers barricade themselves in a rural farmhouse as the hordes of flesh-eating undead grow larger by the hour.', 'Horror/1.jpg'),
(102, 'Corner', 'Unknown Author', '2020', '4.1/5', 'Horror', 'A terrifying tale of supernatural horror where an ordinary corner becomes the gateway to unimaginable terror that preys on the darkest fears of those who encounter it.', 'Horror/2.jpg'),
(103, 'Host', 'Sarah Tarrs', '2018', '4.0/5', 'Horror', 'A psychological horror story about a woman who becomes the unwilling host to a malevolent entity that slowly takes control of her life and body.', 'Horror/3.jpg'),
(104, 'The Coven', 'Ollie Sanford', '2019', '4.3/5', 'Horror', 'When a group of modern witches accidentally awaken an ancient evil, they must confront both the darkness within themselves and the terrifying force they\'ve unleashed.', 'Horror/4.jpg'),
(105, 'Creepy Cat', 'Cotton Valent', '2017', '4.2/5', 'Horror', 'A chilling graphic novel about a seemingly ordinary cat that brings supernatural horror into the lives of its owners, with deadly consequences.', 'Horror/5.jpg'),
(106, 'Stephen King\'s Horror Novel', 'Stephen King', '1980', '4.7/5', 'Horror', 'A classic horror novel from the master of the genre, featuring ordinary people facing extraordinary evil in a small American town.', 'Horror/6.jpg'),
(107, 'The Graveyard Apartment', 'Mariko Koike', '2016', '4.4/5', 'Horror', 'A family moves into an apartment building next to a graveyard, only to discover that their new home is haunted by malevolent spirits with a deadly agenda.', 'Horror/7.jpg'),
(108, 'The Island', 'T.M. Wright', '2009', '4.0/5', 'Horror', 'A group of people stranded on a mysterious island discover they\'re not alone, as the island itself seems to be alive and hungry.', 'Horror/8.jpg'),
(109, 'Confessions', 'Minato Kanae', '2008', '4.6/5', 'Horror', 'A psychological horror novel about a teacher\'s elaborate revenge plot against the students responsible for her daughter\'s death.', 'Horror/9.jpg'),
(110, 'Dartsong', 'Jean Simon', '2015', '4.3/5', 'Horror', 'A haunted radio broadcasts messages from beyond the grave, drawing listeners into a nightmare world where the dead refuse to stay silent.', 'Horror/10.jpg'),
(201, '5 Mansion', 'Chonam-Joo', '2017', '4.2/5', 'Thriller', 'A psychological thriller about five people trapped in a mysterious mansion with deadly secrets.', 'Thriller/1.jpg'),
(202, 'Black Showman and the Murder in Nameless Town', 'Keigo Higashino', '2020', '4.5/5', 'Thriller', 'A detective investigates a series of bizarre murders in a small town with no name, where a mysterious circus performer seems to be connected to all the deaths.', 'Thriller/2.jpg'),
(203, 'Pembunuhan di Nihonbashi', 'Keigo Higashino', '2020', '4.5/5', 'Thriller', 'Detective Kaga investigates a murder in a quiet Tokyo neighborhood, uncovering secrets hidden beneath the surface of ordinary lives.', 'Thriller/3.jpg'),
(204, 'The Tokyo Zodiac Murders', 'Soji Shimada', '2020', '4.6/5', 'Thriller', 'A classic locked-room mystery involving a series of gruesome murders based on zodiac signs, with an impossible crime that has baffled readers for decades.', 'Thriller/4.jpg'),
(205, 'The Strange House (Teka-Teki Rumah Aneh)', 'Uketu', '2020', '4.4/5', 'Thriller', 'A family moves into a new home only to discover it\'s filled with deadly puzzles and traps, each more elaborate than the last.', 'Thriller/5.jpg'),
(206, 'The Devotion of Suspect X', 'Keigo Higashino', '2020', '4.7/5', 'Thriller', 'A mathematics genius helps his neighbor cover up a murder, leading to a brilliant battle of wits with an equally brilliant detective.', 'Thriller/6.jpg'),
(207, 'Second Sister', 'Chan Ho-Kei', '2022', '4.4/5', 'Thriller', 'A woman investigates her sister\'s mysterious suicide and uncovers a web of cyber crimes and dark secrets in Hong Kong\'s underworld.', 'Thriller/8.jpg'),
(208, 'A Good Girl\'s Guide to Murder', 'Jackson', '2020', '4.0/5', 'Thriller', 'A disturbing story about seemingly perfect children who commit the perfect murders, leaving no trace of their crimes.', 'Thriller/9.jpg'),
(209, 'Those Eyes', 'Raymond Beckham & Darius Cook', '-', '-', 'Thriller', 'A photographer discovers that his subjects are dying after he takes their portraits, and must uncover the supernatural force behind the deaths.', 'Thriller/10.jpg'),
(301, 'Antares', 'Rweinda', '2021', '4.8/5', 'Romance', 'Cerita berkisah tentang kehidupan remaja di lingkungan geng motor yang saling bermusuhan, namun tetap menumbuhkan solidaritas dan nilai kekeluargaan yang kuat antar anggotanya. Rweinda membalut kisah ini dengan gaya yang cukup ringan, namun sarat konflik remaja dan cinta..', 'Romance/1.jpg'),
(302, 'Galaksi', 'Poppi Pertiwi', '2018', '3.8/5', 'Romance', 'Orientasi cerita dimulai di SMA Ganesha, memperkenalkan tokoh utama: Galaksi Aldebaran, ketua geng Ravispa Ã¢â‚¬" geng paling ditakuti dan dianggap keluarga oleh Galaksi. Hidup dalam keluarga broken home membuat Galaksi menjadi sosok yang keras dan dingin. Suatu hari, ia bertemu dengan Kejora Ayodhya, siswi paskibra cerdas dan disiplin. Awalnya mereka berada di dunia yang berbeda, namun sebuah insiden membuat hubungan mereka mulai terbentuk..', 'Romance/2.jpg'),
(303, 'Mozachiko', 'Poppi Pertiwi', '2019', '4.2/5', 'Romance', 'Orientasi cerita dimulai ketika Chiko Gadangga, siswa SMA Rajawali terkenal keras kepala dan bermasalah, bertemu dengan Moza Adisti, siswi ceria, polos, dan penuh semangat. Suatu hari, Chiko menolong Moza, dan sejak itu Moza bertekad menaklukkan hati Chiko dengan tantangan: mohon dijadikan pacarnya selama sebulan. .', 'Romance/3.jpg'),
(304, 'Abi Ghea', 'Chelsea Karina', '2021', '4.6/5', 'Romance', 'Orientasi cerita AbiGhea dimulai saat Abi, siswa kelas sebelas, menyatakan perasaan cintanya kepada GheaÃ¢â‚¬"temannya sendiri yang sudah punya pacar, yaitu Rafa, sahabat Abi. Meskipun Ghea awalnya menolak karena hubungan dengan Rafa, lama-lama ia membuka hati juga kepada Abi karena kecocokan dan perhatian Abi yang berbeda dibanding Rafa..', 'Romance/4.jpg'),
(305, 'Septihan', 'Poppi Pertiwi', '2020', '4.4/5', 'Romance', 'Orientasi cerita Septihan berkisah tentang Septian Aidan Nugroho, murid SMA Ganesha yang dikenal pintar, pendiam, dan dingin. Ia bukan hanya menjadi kebanggaan sekolah, tetapi juga bendahara geng nakal Ravispa. Di sisi lain ada Jihan Halana, siswi ceriwis, ekspresif, dan memiliki tekad besar untuk menaklukkan hati Septian yang dingin sejak tiga tahun..', 'Romance/5.jpg'),
(306, 'Mariposa', 'Hidayatul Fajriyah', '2018', '4.9/5', 'Romance', 'Orientasi cerita Mariposa dimulai dari kehidupan Natasha Kay Loovi, biasa dipanggil Acha, yang pindah ke sekolah baru demi kesempatan semakin dekat dengan Iqbal, siswa pria yang dingin dan sulit didekati. Acha bertemu Iqbal saat mengikuti olimpiade sains dan langsung tertarik kepadanya meski tidak berasal dari sekolah yang sama.', 'Romance/6.jpg'),
(307, 'Ancika: Dia yang Bersamaku Tahun 1995', 'Pidi Baiq', '2021', '4.7/5', 'Romance', 'Orientasi novel dimulai pada masa setelah Dilan berpisah dari Milea. Ceritanya berlangsung di tahun 1995, ketika Dilan sudah menjadi mahasiswa di ITB, dan ia bertemu dengan Ancika Mehrunisa Rabu, siswi SMA berusia 17 tahun yang berpikiran keras dan sangat memfokuskan dirinya pada pendidikan..', 'Romance/7.jpg'),
(308, 'Milea: Suara Dari Dilan', 'Pidi Baiq', '2020', '4.5/5', 'Romance', 'Suara dari Dilan berfokus pada sudut pandang Dilan dalam menceritakan kembali kisah cintanya bersama Milea. Setelah sebelumnya kisah mereka dikisahkan dari sisi Milea, kali ini Dilan menyampaikan isi hatinya dan menjelaskan segala hal yang selama ini tidak sempat ia katakan.', 'Romance/8.jpg'),
(309, 'Dilan: Dia adalah Dilanku Tahun 1991', 'Pidi Baiq', '2016', '4.6/5', 'Romance', 'Orientasi novel Dilan 1991 berfokus pada kelanjutan kisah cinta Dilan dan Milea setelah mereka resmi berpacaran. Keduanya masih duduk di bangku SMA di Bandung, dan hubungan mereka tampak semakin dekat dan romantis.', 'Romance/9.jpg'),
(310, 'Dilan : Dia Adalah Dilanku Tahun 1990', 'Pidi Baiq', '2016', '4.4/5', 'Romance', 'Dilan 1990 berpusat pada kisah Dilan, siswa SMA di Bandung, dan Milea, siswi pindahan dari Jakarta. Sejak pertemuan pertama, Dilan mulai menunjukkan ketertarikannya dan mendekati Milea dengan cara yang tidak biasa.', 'Romance/10.jpg'),
(401, 'BUMI', 'Tere Liye', '2015', '3.8/5', 'Fantasy', 'Apa pun yang terlihat, boleh jadi tidak seperti yang kita lihat. Apa pun yang hilang, tidak selalu lenyap seperti yang kita duga. Ada banyak sekali jawaban dari tempat-tempat yang hilang.', 'Fantasi/10.jpeg'),
(402, 'BULAN', 'Tere Liye', '2015', '4/5', 'Fantasy', 'Petualangan  berlanjut di buku Bulan di mana Raib, Seli, dan Ali melakukan perjalanan ke klan matahari untuk melakukan diplomasi demi membuka kembali portal antara dua klan yang sudah ditutup selama ribuan tahun. .', 'Fantasi/9.jpeg'),
(403, 'MATAHARI', 'Tere Liye', '2015', '3.7/5', 'Fantasy', 'Matahari adalah judul novel ketiga dari serial Bumi, yakni seri dunia paralel dan masih mengisahkan petualangan serta penjelajahan tiga sekawan di dunia paralel.', 'Fantasi/8.jpeg'),
(404, 'BINTANG', 'Tere Liye', '2017', '3.4/5', 'Fantasy', 'Setelah sebelumnya Miss Selena dan para petinggi Klan Bulan lainnya mendiskusikan permasalahan ini dengan ketua konsil Klan Matahari, akhirnya diputuskan bahwa mereka akan mengadakan sebuah misi untuk mencari pasak bumi yang akan dihancurkan oleh Sekretaris Dewan Kota.', 'Fantasi/6.jpeg'),
(405, 'CEROS BATOZAR', 'Tere Liye', '2018', '3.7/5', 'Fantasy', 'Karena rasa bersalahnya yang besar atas paksaan yang sedari awal di lakukannya, Batozar pun mencari cara agar Raib dapat kembali pulang bersama teman-temannya. Batozar kemudian, mengaktifkan kembali pelacak yang pernah Ali lekatkan di tubuhnya.', 'Fantasi/5.jpeg'),
(406, 'KOMET', 'Tere Liye', '2018', '3.5/5', 'Fantasy', 'Sebuah persahabatan yang tulus, penuh pengorbanan, mengharukan, berani, dan bernas akan kebaikan sebab memang hal-hal demikianlah yang menjadi sumber kekuatan terbesar dalam dunia paralel.', 'Fantasi/4.jpeg'),
(407, 'KOMET MINOR', 'Tere Liye', '2019', '3.8/5', 'Fantasy', 'Mereka bertualang ke dunia paralel lain yang bemama komet minor untuk mencegah tokoh antagoni discri ini, yakni Si Tanpa Mahkota untuk menguasai senjata terhebar yang pernah diciptakan.', 'Fantasi/3.jpeg'),
(408, 'SELENA', 'Tere Liye', '2020', '3.9/5', 'Fantasy', 'Tapi petualangan itu berakhir buruk, saat persahabatan mereka diuji dengan rasa suka egoisme, dan pengkhianatan Ada banyak karakter baru, tempat-tempat baru, juga sejarah dunia paralel yang diungkap.', 'Fantasi/2.jpeg'),
(409, 'NEBULA', 'Tere Liye', '2020', '4.4/5', 'Fantasy', 'Di dua buku ini kalian akan berkenalan dengan salah satu karakter paling kuat di dunia paralel sejauh ini. Tapi itu jika kalian bisa menebaknya. Dua buku ini bukan akhir. Justru awal terbukanya kembali portal menuju Klan Aldebaran.', 'Fantasi/1.jpeg'),
(410, 'LUMPU', 'Tere Liye', '2020', '3.8/5', 'Fantasy', 'Apakah Raib bisa melupakan masa lalu itu dengan memaafkan Miss Selena? Bagaimana dengan Tazk? Apakah Raib bisa bertemu lagi dengan ayahnya, atau itu masih menjadi misteri? .', 'Fantasi/11.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `my_lists`
--

CREATE TABLE `my_lists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `my_lists`
--

INSERT INTO `my_lists` (`id`, `user_id`, `book_id`, `added_date`) VALUES
(21, 49, 102, '2025-09-03 23:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nis` int(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `email`, `nis`, `password`, `profile_pic_path`) VALUES
(49, 'Indy Baan', 'indybot', 'indybot@gmail.com', 1111111, '123', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_lists`
--
ALTER TABLE `my_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `my_lists`
--
ALTER TABLE `my_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Constraints for table `my_lists`
--
ALTER TABLE `my_lists`
  ADD CONSTRAINT `my_lists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `my_lists_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
