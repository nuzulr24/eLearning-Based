/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.4.11-MariaDB : Database - tellme_basdat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tellme_basdat` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `tellme_basdat`;

/*Table structure for table `td_sub_topik` */

DROP TABLE IF EXISTS `td_sub_topik`;

CREATE TABLE `td_sub_topik` (
  `td_sub_topik_id` int(10) unsigned NOT NULL,
  `td_sub_topik_title` varchar(64) DEFAULT NULL,
  `td_sub_topik_content` text DEFAULT NULL,
  `td_sub_topik_create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tm_pegawai_id` int(10) unsigned NOT NULL,
  `tm_topik_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`td_sub_topik_id`),
  KEY `subtopik_to_topik` (`tm_topik_id`),
  KEY `subtopik_to_pegawai` (`tm_pegawai_id`),
  CONSTRAINT `subtopik_to_pegawai` FOREIGN KEY (`tm_pegawai_id`) REFERENCES `tm_pegawai` (`tm_pegawai_id`),
  CONSTRAINT `subtopik_to_topik` FOREIGN KEY (`tm_topik_id`) REFERENCES `tm_topik` (`tm_topik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_forgot_password` */

DROP TABLE IF EXISTS `tm_forgot_password`;

CREATE TABLE `tm_forgot_password` (
  `tm_forgot_password_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tm_forgot_password_link` varchar(255) DEFAULT NULL,
  `tm_forgot_password_is_active` tinyint(1) DEFAULT NULL,
  `tm_forgot_password_create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tm_login_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tm_forgot_password_id`),
  KEY `forgot_to_login` (`tm_login_id`),
  CONSTRAINT `forgot_to_login` FOREIGN KEY (`tm_login_id`) REFERENCES `tm_login` (`tm_pegawai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_jawaban` */

DROP TABLE IF EXISTS `tm_jawaban`;

CREATE TABLE `tm_jawaban` (
  `tm_jawaban_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tm_jawaban_kode` varchar(32) DEFAULT NULL,
  `tm_jawaban_label` varchar(128) DEFAULT NULL,
  `tm_jawaban_point` int(11) DEFAULT NULL,
  `tm_jawaban_keterangan` varchar(128) DEFAULT NULL,
  `tm_jawaban_create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tm_pertanyaan_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tm_jawaban_id`),
  KEY `jawaban_to_pertanyaan` (`tm_pertanyaan_id`),
  CONSTRAINT `jawaban_to_pertanyaan` FOREIGN KEY (`tm_pertanyaan_id`) REFERENCES `tm_pertanyaan` (`tm_pertanyaan_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_level` */

DROP TABLE IF EXISTS `tm_level`;

CREATE TABLE `tm_level` (
  `tm_level_id` tinyint(3) unsigned NOT NULL,
  `tm_level_nama` varchar(32) DEFAULT NULL,
  `tm_level_create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`tm_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_login` */

DROP TABLE IF EXISTS `tm_login`;

CREATE TABLE `tm_login` (
  `tm_login_id` int(10) unsigned NOT NULL,
  `tm_login_username` varchar(32) NOT NULL,
  `tm_login_password` varchar(255) NOT NULL,
  `tm_login_create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tm_login_update_at` datetime DEFAULT NULL,
  `tm_user_access_id` tinyint(3) unsigned NOT NULL,
  `tm_pegawai_id` int(3) unsigned DEFAULT NULL,
  `tm_mahasiswa_id` int(3) unsigned DEFAULT NULL,
  KEY `login_to_access` (`tm_user_access_id`),
  KEY `login_to_pegawai` (`tm_pegawai_id`),
  KEY `login_to_mahasiswa` (`tm_mahasiswa_id`),
  CONSTRAINT `login_to_access` FOREIGN KEY (`tm_user_access_id`) REFERENCES `tm_user_access` (`tm_user_access_id`) ON DELETE CASCADE,
  CONSTRAINT `login_to_mahasiswa` FOREIGN KEY (`tm_mahasiswa_id`) REFERENCES `tm_mahasiswa` (`tm_mahasiswa_id`) ON DELETE CASCADE,
  CONSTRAINT `login_to_pegawai` FOREIGN KEY (`tm_pegawai_id`) REFERENCES `tm_pegawai` (`tm_pegawai_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_mahasiswa` */

DROP TABLE IF EXISTS `tm_mahasiswa`;

CREATE TABLE `tm_mahasiswa` (
  `tm_mahasiswa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tm_mahasiswa_nim` varchar(12) NOT NULL,
  `tm_mahasiswa_nama` varchar(64) NOT NULL,
  `tm_mahasiswa_jurusan` varchar(64) NOT NULL,
  `tm_mahasiswa_prodi` varchar(64) NOT NULL,
  `tm_mahasiswa_semester` tinyint(4) NOT NULL,
  `tm_mahasiswa_tanggal_lahir` date NOT NULL,
  `tm_mahasiswa_email` varchar(64) NOT NULL,
  `tm_mahasiswa_point` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`tm_mahasiswa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_pegawai` */

DROP TABLE IF EXISTS `tm_pegawai`;

CREATE TABLE `tm_pegawai` (
  `tm_pegawai_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tm_pegawai_nip` bigint(20) unsigned NOT NULL,
  `tm_pegawai_nama` varchar(64) NOT NULL,
  `tm_pegawai_email` varchar(64) NOT NULL,
  `tm_pegawai_no_telp` varchar(16) NOT NULL,
  `tm_pegawai_alamat` varchar(32) DEFAULT NULL,
  `tm_staff_id` tinyint(3) unsigned NOT NULL,
  `tm_pegawai_create_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tm_pegawai_id`),
  KEY `tr_staff_pegawai` (`tm_staff_id`),
  CONSTRAINT `tr_staff_pegawai` FOREIGN KEY (`tm_staff_id`) REFERENCES `tm_staff` (`tm_staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_pertanyaan` */

DROP TABLE IF EXISTS `tm_pertanyaan`;

CREATE TABLE `tm_pertanyaan` (
  `tm_pertanyaan_id` int(10) unsigned NOT NULL,
  `tm_pertanyaan_kode` varchar(32) DEFAULT NULL,
  `tm_pertanyaan_label` varchar(128) DEFAULT NULL,
  `tm_pertanyaan_create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tm_quiz_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tm_pertanyaan_id`),
  KEY `pertanyaan_to_quiz` (`tm_quiz_id`),
  CONSTRAINT `pertanyaan_to_quiz` FOREIGN KEY (`tm_quiz_id`) REFERENCES `tm_quiz` (`tm_quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_quiz` */

DROP TABLE IF EXISTS `tm_quiz`;

CREATE TABLE `tm_quiz` (
  `tm_quiz_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tm_quiz_kode` varchar(32) DEFAULT NULL,
  `tm_quiz_label` varchar(64) DEFAULT NULL,
  `tm_quiz_poin_unlock` int(11) DEFAULT NULL,
  `tm_quiz_date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tm_topik_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tm_quiz_id`),
  KEY `quiz_to_topik` (`tm_topik_id`),
  CONSTRAINT `quiz_to_topik` FOREIGN KEY (`tm_topik_id`) REFERENCES `tm_topik` (`tm_topik_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_staff` */

DROP TABLE IF EXISTS `tm_staff`;

CREATE TABLE `tm_staff` (
  `tm_staff_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `tm_staff_label` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tm_staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Administrator,\r\nTeknisi,\r\nDosen';

/*Table structure for table `tm_topik` */

DROP TABLE IF EXISTS `tm_topik`;

CREATE TABLE `tm_topik` (
  `tm_topik_id` int(10) unsigned NOT NULL,
  `tm_topik_nama` varchar(64) DEFAULT NULL,
  `tm_topik_create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tm_pegawai_id` int(10) unsigned NOT NULL,
  `tm_level_id` tinyint(10) unsigned NOT NULL,
  `tm_topik_poin_open` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tm_topik_id`),
  KEY `topik_to_level` (`tm_level_id`),
  KEY `topik_to_pegawai` (`tm_pegawai_id`),
  CONSTRAINT `topik_to_level` FOREIGN KEY (`tm_level_id`) REFERENCES `tm_level` (`tm_level_id`),
  CONSTRAINT `topik_to_pegawai` FOREIGN KEY (`tm_pegawai_id`) REFERENCES `tm_pegawai` (`tm_pegawai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_trial_topik` */

DROP TABLE IF EXISTS `tm_trial_topik`;

CREATE TABLE `tm_trial_topik` (
  `tm_trial_topik_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tm_trial_topik_soal` varchar(255) NOT NULL,
  `tm_trial_topik_deskripsi` varchar(255) DEFAULT NULL,
  `tm_trial_topik_count_try` int(11) DEFAULT NULL,
  `tm_trial_topik_point` int(11) DEFAULT NULL,
  `tm_trial_topik_create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tm_topik_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tm_trial_topik_id`),
  KEY `trialtopik_to_topik` (`tm_topik_id`),
  CONSTRAINT `trialtopik_to_topik` FOREIGN KEY (`tm_topik_id`) REFERENCES `tm_topik` (`tm_topik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tm_user_access` */

DROP TABLE IF EXISTS `tm_user_access`;

CREATE TABLE `tm_user_access` (
  `tm_user_access_id` tinyint(3) unsigned NOT NULL,
  `tm_user_access_nama` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tm_user_access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tr_jawaban_mahasiswa` */

DROP TABLE IF EXISTS `tr_jawaban_mahasiswa`;

CREATE TABLE `tr_jawaban_mahasiswa` (
  `tr_jawaban_mahasiswa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tr_jawaban_mahasiswa_point` int(11) DEFAULT NULL,
  `tr_jawaban_mahasiswa_create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tm_jawaban_id` int(10) unsigned NOT NULL,
  `tm_mahasiswa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tr_jawaban_mahasiswa_id`),
  KEY `trjawabanmahasiswa_to_tmmahasiswa` (`tm_mahasiswa_id`),
  KEY `trjawabanmahasiswa_to_tmjawaban` (`tm_jawaban_id`),
  CONSTRAINT `trjawabanmahasiswa_to_tmjawaban` FOREIGN KEY (`tm_jawaban_id`) REFERENCES `tm_jawaban` (`tm_jawaban_id`),
  CONSTRAINT `trjawabanmahasiswa_to_tmmahasiswa` FOREIGN KEY (`tm_mahasiswa_id`) REFERENCES `tm_mahasiswa` (`tm_mahasiswa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tr_result_trial` */

DROP TABLE IF EXISTS `tr_result_trial`;

CREATE TABLE `tr_result_trial` (
  `tr_result_trial_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tr_result_trial_create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tr_result_trial_is_success` tinyint(1) DEFAULT NULL,
  `tm_mahasiswa_id` int(10) unsigned NOT NULL,
  `tm_trial_topik_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tr_result_trial_id`),
  KEY `resulttrial_to_tmtrial` (`tm_trial_topik_id`),
  KEY `resulttrial_to_mahasiswa` (`tm_mahasiswa_id`),
  CONSTRAINT `resulttrial_to_mahasiswa` FOREIGN KEY (`tm_mahasiswa_id`) REFERENCES `tm_mahasiswa` (`tm_mahasiswa_id`) ON DELETE CASCADE,
  CONSTRAINT `resulttrial_to_tmtrial` FOREIGN KEY (`tm_trial_topik_id`) REFERENCES `tm_trial_topik` (`tm_trial_topik_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
