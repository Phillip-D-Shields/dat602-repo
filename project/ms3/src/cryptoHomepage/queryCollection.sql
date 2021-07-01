
-- insert youtube_collections data
INSERT INTO `ravenbooks`.`youtube_collection` (`id`, `youtube_title`, `youtube_text`, `youtube_url`, `youtube_added_by`) VALUES ('1', '\"Sonic Youth - Dirty Boots\"', '\"official video, 2004\"', '\"https://youtu.be/7XdYnh729IQ\"', '1');
INSERT INTO `ravenbooks`.`youtube_collection` (`id`, `youtube_title`, `youtube_text`, `youtube_url`, `youtube_added_by`) VALUES ('2', '\"Deftones - Passenger\"', '\"official visualizer\"', '\"https://youtu.be/IjainiB8mk4\"', '1');
INSERT INTO `ravenbooks`.`youtube_collection` (`id`, `youtube_title`, `youtube_text`, `youtube_url`, `youtube_added_by`) VALUES ('3', '\"Danny Brown - Dirty Laundry\"', '\"official video, 2019\"', '\"https://youtu.be/1okqvhq7ZaI\"', '1');


-- insert test user into users table
INSERT INTO `ravenbooks`.`users` (`id`, `user_hash`, `date_created`) VALUES ('1', '\"0x986AD23E2542e76c6A0Dd8FA7C0B5f68944AB731\"', '\"07-01-2021');



-- create img_collection
CREATE TABLE `img_collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_title` varchar(45) NOT NULL,
  `img_url` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- create users
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_hash` varchar(50) NOT NULL,
  `date_created` varchar(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- create website_collection
CREATE TABLE `website_collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `website_title` varchar(45) NOT NULL,
  `website_text` text NOT NULL,
  `website_url` varchar(100) NOT NULL,
  `website_added_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_added_by_idx` (`website_added_by`),
  CONSTRAINT `website_added_by` FOREIGN KEY (`website_added_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- create youtube_collection
CREATE TABLE `youtube_collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `youtube_title` varchar(45) NOT NULL,
  `youtube_text` text NOT NULL,
  `youtube_url` varchar(150) NOT NULL,
  `youtube_added_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `youtube_added_by_idx` (`youtube_added_by`),
  CONSTRAINT `youtube_added_by` FOREIGN KEY (`youtube_added_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci