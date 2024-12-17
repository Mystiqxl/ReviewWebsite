-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: accounts
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `joindate` date NOT NULL,
  `pfp` varchar(100) DEFAULT 'Defaultpfp.png',
  `displayname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (21,'\'Kevin\'','\'bb468a5cd02f14d63720f530e982be69b6425dd9\'','2024-12-18','Defaultpfp.png',NULL,NULL,NULL),(22,'\'Jack\'','\'97587ccb31d8260959f73a6dd83a19283a294a43\'','2024-12-18','Defaultpfp.png',NULL,NULL,NULL),(23,'\'John Proctor\'','\'97587ccb31d8260959f73a6dd83a19283a294a43\'','2024-12-18','Defaultpfp.png',NULL,NULL,NULL),(24,'\'Kevboi_101\'','\'97587ccb31d8260959f73a6dd83a19283a294a43\'','2024-12-18','Defaultpfp.png',NULL,NULL,NULL),(25,'\'Mystiqxl\'','\'\'\'f9cf487013370fa0357eabac5710788d23f8c86d\'\'\'','2024-12-18','Hina1.jpg','\'Mystiqxl\'',NULL,NULL),(26,'\'testaccount\'','\'c891fd9cffba4bd4b68bc504496b72d9719a5c46\'','2024-12-18','Defaultpfp.png',NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genres` (
  `movie_id` int DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genres`
--

LOCK TABLES `movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_genres` DISABLE KEYS */;
INSERT INTO `movie_genres` VALUES (1,'Action'),(1,'Adventure'),(1,'Sci-Fi'),(2,'Drama'),(3,'Crime'),(3,'Drama'),(4,'Action'),(4,'Crime'),(4,'Drama'),(5,'Crime'),(5,'Drama'),(6,'Drama'),(7,'Biography'),(7,'Drama'),(7,'History'),(8,'Action'),(8,'Adventure'),(8,'Drama'),(9,'Crime'),(9,'Drama'),(10,'Action'),(10,'Adventure'),(10,'Drama'),(11,'Action'),(11,'Adventure'),(11,'Drama'),(12,'Western'),(13,'Drama'),(14,'Drama'),(14,'Romance'),(15,'Action'),(15,'Adventure'),(15,'Sci-Fi'),(16,'Action'),(16,'Adventure'),(16,'Fantasy'),(17,'Action'),(17,'Sci-Fi'),(18,'Biography'),(18,'Crime'),(18,'Drama'),(19,'Drama'),(20,'Action'),(20,'Drama'),(21,'Crime'),(21,'Drama'),(21,'Mystery'),(22,'Crime'),(22,'Drama'),(23,'Comedy'),(23,'Drama'),(23,'Romance'),(24,'Crime'),(24,'Drama'),(24,'Thriller'),(25,'Drama'),(25,'Family'),(25,'Fantasy'),(26,'Action'),(26,'Adventure'),(26,'Fantasy'),(27,'Drama'),(27,'War'),(28,'Crime'),(28,'Drama'),(28,'Fantasy'),(29,'Animation'),(29,'Adventure'),(29,'Family'),(30,'Action'),(30,'Crime'),(30,'Drama'),(31,'Crime'),(31,'Mystery'),(31,'Thriller'),(32,'Adventure'),(32,'Drama'),(32,'Sci-Fi'),(33,'Drama'),(33,'Mystery'),(33,'Sci-Fi'),(34,'Animation'),(34,'Adventure'),(34,'Drama'),(35,'Crime'),(35,'Drama'),(35,'Thriller'),(36,'Drama'),(36,'Music'),(37,'Action'),(37,'Adventure'),(37,'Drama'),(38,'Adventure'),(38,'Comedy'),(38,'Sci-Fi'),(39,'Biography'),(39,'Comedy'),(39,'Drama'),(40,'Comedy'),(40,'Drama'),(40,'Thriller'),(41,'Action'),(41,'Sci-Fi'),(42,'Drama'),(43,'Drama'),(43,'Romance'),(43,'War'),(44,'Horror'),(44,'Mystery'),(44,'Thriller'),(45,'Action'),(45,'Adventure'),(46,'Drama'),(46,'Horror'),(47,'Biography'),(47,'Drama'),(47,'Music'),(48,'Comedy'),(48,'Drama'),(48,'War'),(49,'Comedy'),(49,'Drama'),(49,'Romance'),(50,'Drama'),(50,'Thriller'),(51,'Biography'),(51,'Drama'),(52,'Drama'),(52,'Thriller'),(53,'Drama'),(53,'Film-Noir'),(54,'Comedy'),(54,'War'),(55,'Drama'),(55,'War'),(56,'Horror'),(56,'Sci-Fi'),(57,'Action'),(57,'Drama'),(57,'Sci-Fi'),(58,'Adventure'),(58,'Comedy'),(58,'Sci-Fi'),(59,'Crime'),(59,'Drama'),(59,'Sci-Fi'),(60,'Biography'),(60,'Comedy'),(60,'Crime'),(61,'Comedy'),(61,'Crime'),(62,'Drama'),(62,'Western'),(63,'Adventure'),(63,'Drama'),(63,'War'),(64,'Drama'),(64,'Romance'),(65,'Action'),(65,'Sci-Fi'),(66,'Adventure'),(66,'Thriller'),(67,'Action'),(67,'Adventure'),(68,'Biography'),(68,'Drama'),(68,'Family'),(69,'Adventure'),(69,'Comedy'),(69,'Drama'),(70,'Mystery'),(70,'Thriller'),(71,'Drama'),(71,'Fantasy'),(72,'Drama'),(73,'Biography'),(73,'Drama'),(74,'Crime'),(74,'Drama'),(75,'Crime'),(75,'Drama'),(76,'Drama'),(77,'Drama'),(77,'War'),(78,'Crime'),(78,'Film-Noir'),(79,'Adventure'),(79,'Family'),(79,'Fantasy'),(80,'Drama'),(81,'Crime'),(81,'Drama'),(81,'Thriller'),(82,'Crime'),(82,'Drama'),(82,'Thriller'),(83,'Biography'),(83,'Drama'),(84,'Drama'),(84,'Mystery'),(85,'Drama'),(85,'Mystery'),(86,'Adventure'),(86,'Drama'),(86,'War'),(87,'Action'),(87,'Adventure'),(87,'Sci-Fi'),(88,'Comedy'),(88,'Drama'),(89,'Biography'),(89,'Comedy'),(89,'Drama'),(90,'Drama'),(91,'Adventure'),(91,'Comedy'),(91,'Family'),(92,'Animation'),(92,'Action'),(92,'Adventure'),(93,'Horror'),(93,'Mystery'),(94,'Crime'),(94,'Drama'),(95,'Crime'),(95,'Film-Noir'),(96,'Comedy'),(96,'Drama'),(96,'Family'),(97,'Drama'),(98,'Animation'),(98,'Family'),(98,'Fantasy'),(99,'Crime'),(99,'Drama'),(100,'Horror'),(101,'Drama'),(101,'Mystery'),(101,'Sci-Fi'),(102,'Action'),(102,'Adventure'),(102,'Sci-Fi');
/*!40000 ALTER TABLE `movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `moviename` varchar(100) DEFAULT NULL,
  `runtime` time DEFAULT NULL,
  `movielink` varchar(1000) DEFAULT NULL,
  `releasedate` date DEFAULT NULL,
  `likes` int DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Endgame','03:02:00','Endgame.jpg','2019-04-26',0),(2,'The Shawshank Redemption','02:22:00','The-Shawshank-Redemption.jpg','1994-09-23',0),(3,'The Godfather','02:55:00','The-Godfather.jpg','1972-03-24',0),(4,'The Dark Knight','02:32:00','The-Dark-Knight.jpg','2008-07-18',0),(5,'The Godfather: Part II','03:22:00','The-Godfather-Part-II.jpg','1974-12-20',0),(6,'12 Angry Men','01:36:00','12-Angry-Men.jpg','1957-04-10',0),(7,'Schindler’s List','03:15:00','Schindlers-List.jpg','1993-12-15',0),(8,'The Lord of the Rings: The Return of the King','03:21:00','The-Lord-of-the-Rings-The-Return-of-the-King.jpg','2003-12-17',0),(9,'Pulp Fiction','02:34:00','Pulp-Fiction.jpg','1994-10-14',0),(10,'The Lord of the Rings: The Fellowship of the Ring','02:58:00','The-Lord-of-the-Rings-The-Fellowship-of-the-Ring.jpg','2001-12-19',0),(11,'The Lord of the Rings: The Two Towers','02:59:00','The-Lord-of-the-Rings-The-Two-Towers.jpg','2002-12-18',0),(12,'The Good, the Bad and the Ugly','02:58:00','The-Good-the-Bad-and-the-Ugly.jpg','1966-12-23',0),(13,'Fight Club','02:19:00','Fight-Club.jpg','1999-10-15',0),(14,'Forrest Gump','02:22:00','Forrest-Gump.jpg','1994-07-06',0),(15,'Inception','02:28:00','Inception.jpg','2010-07-16',0),(16,'Star Wars: Episode V - The Empire Strikes Back','02:04:00','Star-Wars-Episode-V-The-Empire-Strikes-Back.jpg','1980-05-21',0),(17,'The Matrix','02:16:00','The-Matrix.jpg','1999-03-31',0),(18,'Goodfellas','02:28:00','Goodfellas.jpg','1990-09-19',0),(19,'One Flew Over the Cuckoo’s Nest','02:13:00','One-Flew-Over-the-Cuckoos-Nest.jpg','1975-11-19',0),(20,'The Seven Samurai','03:27:00','The-Seven-Samurai.jpg','1954-04-26',0),(21,'Se7en','02:07:00','Se7en.jpg','1995-09-22',0),(22,'City of God','02:10:00','City-of-God.jpg','2002-02-08',0),(23,'Life is Beautiful','01:56:00','Life-is-Beautiful.jpg','1997-12-20',0),(24,'The Silence of the Lambs','01:58:00','The-Silence-of-the-Lambs.jpg','1991-02-14',0),(25,'It’s a Wonderful Life','02:10:00','Its-a-Wonderful-Life.jpg','1946-12-20',0),(26,'Star Wars: Episode IV - A New Hope','02:01:00','Star-Wars-Episode-IV-A-New-Hope.jpg','1977-05-25',0),(27,'Saving Private Ryan','02:49:00','Saving-Private-Ryan.jpg','1998-07-24',0),(28,'The Green Mile','03:09:00','The-Green-Mile.jpg','1999-12-10',0),(29,'Spirited Away','02:05:00','Spirited-Away.jpg','2001-07-20',0),(30,'Léon: The Professional','01:50:00','Leon-The-Professional.jpg','1994-09-14',0),(31,'The Usual Suspects','01:46:00','The-Usual-Suspects.jpg','1995-08-16',0),(32,'Interstellar','02:49:00','Interstellar.jpg','2014-11-07',0),(33,'The Prestige','02:10:00','The-Prestige.jpg','2006-10-20',0),(34,'The Lion King','01:29:00','The-Lion-King.jpg','1994-06-15',0),(35,'The Departed','02:31:00','The-Departed.jpg','2006-10-06',0),(36,'Whiplash','01:47:00','Whiplash.jpg','2014-10-10',0),(37,'Gladiator','02:35:00','Gladiator.jpg','2000-05-05',0),(38,'Back to the Future','01:56:00','Back-to-the-Future.jpg','1985-07-03',0),(39,'The Intouchables','01:52:00','The-Intouchables.jpg','2011-11-02',0),(40,'Parasite','02:12:00','Parasite.jpg','2019-05-30',0),(41,'Terminator 2: Judgment Day','02:17:00','Terminator-2-Judgment-Day.jpg','1991-07-03',0),(42,'American History X','01:59:00','American-History-X.jpg','1998-10-30',0),(43,'Casablanca','01:42:00','Casablanca.jpg','1942-11-26',0),(44,'Psycho','01:49:00','Psycho.jpg','1960-09-08',0),(45,'The Dark Knight Rises','02:44:00','The-Dark-Knight-Rises.jpg','2012-07-20',0),(46,'The Shining','02:26:00','The-Shining.jpg','1980-05-23',0),(47,'The Pianist','02:30:00','The-Pianist.jpg','2002-12-25',0),(48,'The Great Dictator','02:05:00','The-Great-Dictator.jpg','1940-10-15',0),(49,'City Lights','01:27:00','City-Lights.jpg','1931-02-01',0),(50,'The Lives of Others','02:17:00','The-Lives-of-Others.jpg','2006-02-10',0),(51,'The Social Network','02:00:00','The-Social-Network.jpg','2010-10-01',0),(52,'The Hunt','01:55:00','The-Hunt.jpg','2012-01-01',0),(53,'Sunset Blvd.','01:50:00','Sunset-Blvd.jpg','1950-08-10',0),(54,'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb','01:34:00','Dr-Strangelove-or-How-I-Learned-to-Stop-Worrying-and-Love-the-Bomb.jpg','1964-01-29',0),(55,'Apocalypse Now','02:27:00','Apocalypse-Now.jpg','1979-08-15',0),(56,'Alien','01:57:00','Alien.jpg','1979-05-25',0),(57,'Blade Runner 2049','02:44:00','Blade-Runner-2049.jpg','2017-10-06',0),(58,'Back to the Future Part II','01:48:00','Back-to-the-Future-Part-II.jpg','1989-11-22',0),(59,'A Clockwork Orange','01:56:00','A-Clockwork-Orange.jpg','1971-12-19',0),(60,'The Wolf of Wall Street','03:00:00','The-Wolf-of-Wall-Street.jpg','2013-12-25',0),(61,'The Big Lebowski','01:57:00','The-Big-Lebowski.jpg','1998-03-06',0),(62,'Django Unchained','02:45:00','Django-Unchained.jpg','2012-12-25',0),(63,'The Bridge on the River Kwai','02:41:00','The-Bridge-on-the-River-Kwai.jpg','1957-12-14',0),(64,'Good Will Hunting','02:06:00','Good-Will-Hunting.jpg','1997-12-05',0),(65,'The Terminator','01:47:00','The-Terminator.jpg','1984-10-26',0),(66,'Jaws','02:04:00','Jaws.jpg','1975-06-20',0),(67,'Raiders of the Lost Ark','01:58:00','Raiders-of-the-Lost-Ark.jpg','1981-06-12',0),(68,'The Sound of Music','02:54:00','The-Sound-of-Music.jpg','1965-03-02',0),(69,'The Grand Budapest Hotel','01:39:00','The-Grand-Budapest-Hotel.jpg','2014-03-28',0),(70,'Memento','01:53:00','Memento.jpg','2000-10-11',0),(71,'The Seventh Seal','01:37:00','The-Seventh-Seal.jpg','1957-02-18',0),(72,'Requiem for a Dream','01:42:00','Requiem-for-a-Dream.jpg','2000-10-06',0),(73,'A Beautiful Mind','02:15:00','A-Beautiful-Mind.jpg','2001-12-21',0),(74,'The Godfather Part III','02:42:00','The-Godfather-Part-III.jpg','1990-12-25',0),(75,'To Kill a Mockingbird','02:09:00','To-Kill-a-Mockingbird.jpg','1962-12-25',0),(76,'A Separation','01:59:00','A-Separation.jpg','2011-09-30',0),(77,'Paths of Glory','01:28:00','Paths-of-Glory.jpg','1957-11-22',0),(78,'The Maltese Falcon','01:40:00','The-Maltese-Falcon.jpg','1941-10-18',0),(79,'The Wizard of Oz','01:41:00','The-Wizard-of-Oz.jpg','1939-08-15',0),(80,'The Room','01:39:00','The-Room.jpg','2003-06-27',0),(81,'Fargo','01:38:00','Fargo.jpg','1996-04-05',0),(82,'No Country for Old Men','02:02:00','No-Country-for-Old-Men.jpg','2007-11-21',0),(83,'The Elephant Man','02:04:00','The-Elephant-Man.jpg','1980-01-01',0),(84,'Citizen Kane','01:59:00','Citizen-Kane.jpg','1941-05-01',0),(85,'Chinatown','02:11:00','Chinatown.jpg','1974-06-20',0),(86,'Inglourious Basterds','02:33:00','Inglourious-Basterds.jpg','2009-08-21',0),(87,'The Avengers','02:23:00','The-Avengers.jpg','2012-05-04',0),(88,'The Truman Show','01:43:00','The-Truman-Show.jpg','1998-06-05',0),(89,'The Big Short','02:10:00','The-Big-Short.jpg','2015-12-11',0),(90,'Moonlight','01:51:00','Moonlight.jpg','2016-10-21',0),(91,'The Goonies','01:54:00','The-Goonies.jpg','1985-06-07',0),(92,'The Iron Giant','01:26:00','The-Iron-Giant.jpg','1999-08-06',0),(93,'The Cabinet of Dr. Caligari','01:17:00','The-Cabinet-of-Dr-Caligari.jpg','1920-02-26',0),(94,'The Night of the Hunter','01:32:00','The-Night-of-the-Hunter.jpg','1955-06-24',0),(95,'The Big Sleep','01:53:00','The-Big-Sleep.jpg','1946-08-23',0),(96,'The Kid','00:48:00','The-Kid.jpg','1921-02-06',0),(97,'The 400 Blows','01:39:00','The-400-Blows.jpg','1959-04-04',0),(98,'My Neighbor Totoro','01:26:00','My-Neighbor-Totoro.jpg','1988-04-16',0),(99,'On the Waterfront','01:48:00','On-the-Waterfront.jpg','1954-12-07',0),(100,'The Night of the Living Dead','01:40:00','The-Night-of-the-Living-Dead.jpg','1968-10-01',0),(101,'Donnie Darko','01:53:00','Donnie-Darko.jpg','2001-10-26',0),(102,'The Day After Tomorrow','02:04:00','The-Day-After-Tomorrow.jpg','2004-05-27',0);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `moviename` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `review` varchar(10000) NOT NULL,
  `reviewdate` datetime NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `rating` int NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (37,'The Dark Knight','Kevin','An outstanding performance by Heath Ledger. Best superhero movie ever!','2024-12-18 08:01:32',0,5),(38,'Forrest Gump','Jack','A heartwarming story that makes you laugh and cry. Tom Hanks shines!','2024-12-18 08:01:32',0,5),(39,'Inception','Kevboi_101','Mind-bending! I had to watch it twice to fully appreciate it.','2024-12-18 08:01:32',0,5),(40,'The Room','Mystiqxl','So bad it’s good! An unforgettable experience.','2024-12-18 08:01:32',0,2),(41,'The Godfather','Kevin','A cinematic masterpiece. Brilliant storytelling and acting.','2024-12-18 08:01:32',0,5),(42,'Blade Runner 2049','Jack','Visually stunning, but the pacing was too slow for me.','2024-12-18 08:01:32',0,3),(43,'Schindler’s List','Kevboi_101','A deeply moving and emotional movie. Hard to watch but important.','2024-12-18 08:01:32',0,5),(44,'The Shining','Mystiqxl','Creepy, unsettling, and Jack Nicholson’s performance was chilling!','2024-12-18 08:01:32',0,4),(45,'The Avengers','Kevin','An epic movie with all the heroes you love. Action-packed!','2024-12-18 08:01:32',0,5),(46,'Citizen Kane','Jack','A classic, though I didn’t enjoy it as much as others do.','2024-12-18 08:01:32',0,3),(47,'Whiplash','Kevboi_101','Intense and gripping. The ending gave me chills.','2024-12-18 08:01:32',0,5),(48,'The Matrix','Mystiqxl','A game-changer in sci-fi movies. Still holds up after all these years.','2024-12-18 08:01:32',0,5),(49,'The Prestige','Kevin','Brilliantly crafted. The twist blew my mind.','2024-12-18 08:01:32',0,5),(50,'Fargo','Jack','A quirky yet dark crime thriller. The characters are unforgettable.','2024-12-18 08:01:32',0,4),(51,'Jaws','Kevboi_101','Made me scared of the ocean for life. Spielberg nailed it.','2024-12-18 08:01:32',0,4),(52,'Parasite','Mystiqxl','A perfect mix of thriller and social commentary. Brilliant!','2024-12-18 08:01:32',0,5),(53,'The Truman Show','Kevin','A unique concept with a moving performance by Jim Carrey.','2024-12-18 08:01:32',0,4),(54,'The Lion King','Jack','Childhood classic. The music and story are timeless.','2024-12-18 08:01:32',0,5),(55,'Saving Private Ryan','Kevboi_101','The opening scene alone is unforgettable. A powerful war movie.','2024-12-18 08:01:32',0,5),(56,'The Social Network','Mystiqxl','A fascinating look into the birth of Facebook. Well-acted and sharp.','2024-12-18 08:01:32',0,4);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-18  8:09:32
