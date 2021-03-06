-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: tutoron
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` float(15,11) DEFAULT NULL,
  `longtitude` float(15,11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locations_users1_idx` (`users_id`),
  CONSTRAINT `fk_locations_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,47.84999847412,-122.23956298828,'2015-10-01 22:19:15',5,NULL),(2,47.84999847412,-122.23956298828,'2015-10-01 22:19:15',5,NULL),(3,47.60970687866,-122.19633483887,'2015-10-02 08:52:51',1,'2015-10-01 22:22:44'),(4,47.84999847412,-122.23958587646,'2015-10-01 23:03:52',7,'2015-10-01 23:03:52'),(5,47.60971069336,-122.19627380371,'2015-10-02 08:49:40',2,'2015-10-02 07:14:28');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_reviews`
--

DROP TABLE IF EXISTS `student_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `tutors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_reviews_students1_idx` (`student_id`),
  KEY `fk_student_reviews_tutors1_idx` (`tutors_id`),
  CONSTRAINT `fk_student_reviews_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_reviews_tutors1` FOREIGN KEY (`tutors_id`) REFERENCES `tutors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_reviews`
--

LOCK TABLES `student_reviews` WRITE;
/*!40000 ALTER TABLE `student_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_students_users1_idx` (`user_id`),
  CONSTRAINT `fk_students_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'2015-10-01 19:01:33','2015-10-01 19:01:33',1),(2,'2015-10-01 19:08:22','2015-10-01 19:08:22',3),(3,'2015-10-01 20:41:52','2015-10-01 20:41:52',4),(4,'2015-10-01 22:17:18','2015-10-01 22:17:18',5),(5,'2015-10-01 23:03:48','2015-10-01 23:03:48',7);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_subjects`
--

DROP TABLE IF EXISTS `study_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_study_subjects_students1_idx` (`student_id`),
  KEY `fk_study_subjects_subjects1_idx` (`subject_id`),
  CONSTRAINT `fk_study_subjects_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_study_subjects_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_subjects`
--

LOCK TABLES `study_subjects` WRITE;
/*!40000 ALTER TABLE `study_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `subject_title` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach_subjects`
--

DROP TABLE IF EXISTS `teach_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teach_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `tutor_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teach_subjects_tutors1_idx` (`tutor_id`),
  KEY `fk_teach_subjects_subjects1_idx` (`subject_id`),
  CONSTRAINT `fk_teach_subjects_tutors1` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teach_subjects_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach_subjects`
--

LOCK TABLES `teach_subjects` WRITE;
/*!40000 ALTER TABLE `teach_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `teach_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_requests`
--

DROP TABLE IF EXISTS `tutor_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tutor_requests_students1_idx` (`student_id`),
  KEY `fk_tutor_requests_tutors1_idx` (`tutor_id`),
  CONSTRAINT `fk_tutor_requests_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tutor_requests_tutors1` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_requests`
--

LOCK TABLES `tutor_requests` WRITE;
/*!40000 ALTER TABLE `tutor_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_reviews`
--

DROP TABLE IF EXISTS `tutor_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `tutor_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tutor_reviews_tutors_idx` (`tutor_id`),
  KEY `fk_tutor_reviews_students1_idx` (`student_id`),
  CONSTRAINT `fk_tutor_reviews_tutors` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tutor_reviews_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_reviews`
--

LOCK TABLES `tutor_reviews` WRITE;
/*!40000 ALTER TABLE `tutor_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tutors_users1_idx` (`user_id`),
  CONSTRAINT `fk_tutors_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutors`
--

LOCK TABLES `tutors` WRITE;
/*!40000 ALTER TABLE `tutors` DISABLE KEYS */;
INSERT INTO `tutors` VALUES (1,'2015-10-01 19:02:31','2015-10-01 19:02:31',2),(2,'2015-10-01 23:02:01','2015-10-01 23:02:01',6),(3,'2015-10-01 23:41:36','2015-10-01 23:41:36',8);
/*!40000 ALTER TABLE `tutors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sung','kang','$2a$12$HEX/Br0ChRF6hSM1WgP35uGefTa1cdE74OEl1j92dRt7g.l9TRZHG','sungjk@msn.com','2015-10-01 19:01:33','2015-10-01 19:01:33'),(2,'sung','kang','$2a$12$KFGuNhJIlfzwHQCt/UIymOshPc/dfjPR5XHPSBQpEOKqFtPUpVqbq','sungjk@msn.com','2015-10-01 19:02:31','2015-10-01 19:02:31'),(3,'sdfjidsfdiokf','eswhnfikudskfdnsf','$2a$12$vXbDejmfjuLfouQOOcy/vuN2qgcGtcsZy67eiiW4w8Ev07.YyiSE6','sygdsgu@fgsd.con','2015-10-01 19:08:22','2015-10-01 19:08:22'),(4,'sdfdsfds','sdfdsfdsfds','$2a$12$ByYKHDxMT6dtheN765KAr.slbrWR5rNeDwR4qDkk77TJlkpko2zH6','dfdsfdfdf@fonf.com','2015-10-01 20:41:52','2015-10-01 20:41:52'),(5,'young','kang','$2a$12$cs4V/BrIxM/dcnj2fCkXB.xs2YT3YwuU07vOn4i0zCMk8p/Mp5Ree','youngjun@msn.com','2015-10-01 22:17:18','2015-10-01 22:17:18'),(6,'dfsdfdf','dsfdsfdsf','$2a$12$eFmn2pdnKNMkSrGeU0rYV.0hHKDKgU/JUOlVqTjtlZjbYnpfseRfS','dfdsfdsfs@fsdf.com','2015-10-01 23:02:01','2015-10-01 23:02:01'),(7,'sdfjksldfd','fsdjflksdjfkd','$2a$12$M18Lj4cyAe5zPhayl3nUM.LuYq68CvEOvyYpXORtrm6tBXZxR85w2','sdfjdsioufd@fsfsdf.com','2015-10-01 23:03:48','2015-10-01 23:03:48'),(8,'sudfjsdkf','sdfjkdslfjdsklf','$2a$12$IM717cLpGyyog3lzdMiFcu01VpJ63xVnQbJ6/I1P8LR5y6Y6rynXC','sdfjsldkjfkdl@fsdf.com','2015-10-01 23:41:36','2015-10-01 23:41:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-02 11:11:17
