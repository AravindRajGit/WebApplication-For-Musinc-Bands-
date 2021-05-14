# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_damaru
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2020-06-05 14:13:33
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_damaru'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_damaru" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_damaru";


#
# Table structure for table 'tbl_addcomponent'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_addcomponent" (
  "component_id" int(11) NOT NULL auto_increment,
  "component_name" varchar(110) NOT NULL,
  "component_rate" varchar(50) NOT NULL,
  "componenttype_id" int(11) NOT NULL,
  "bike_name" varchar(50) NOT NULL,
  "component_image" varchar(100) NOT NULL,
  "shop_id" int(11) NOT NULL,
  PRIMARY KEY  ("component_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_addcomponent'
#

LOCK TABLES "tbl_addcomponent" WRITE;
/*!40000 ALTER TABLE "tbl_addcomponent" DISABLE KEYS;*/
REPLACE INTO "tbl_addcomponent" ("component_id", "component_name", "component_rate", "componenttype_id", "bike_name", "component_image", "shop_id") VALUES
	(1,'0','500',1,'Bullet','photo_1947.jpeg',0);
REPLACE INTO "tbl_addcomponent" ("component_id", "component_name", "component_rate", "componenttype_id", "bike_name", "component_image", "shop_id") VALUES
	(2,'DRL','500',1,'Bullet','photo_1139.jpeg',2);
REPLACE INTO "tbl_addcomponent" ("component_id", "component_name", "component_rate", "componenttype_id", "bike_name", "component_image", "shop_id") VALUES
	(3,'headlight','450',1,'Bullet','photo_1107.jpeg',2);
REPLACE INTO "tbl_addcomponent" ("component_id", "component_name", "component_rate", "componenttype_id", "bike_name", "component_image", "shop_id") VALUES
	(4,'Indicator','600',1,'Duke200','photo_1748.jpeg',2);
REPLACE INTO "tbl_addcomponent" ("component_id", "component_name", "component_rate", "componenttype_id", "bike_name", "component_image", "shop_id") VALUES
	(5,'Breaklight','220',1,'MT','photo_2043.jpeg',2);
REPLACE INTO "tbl_addcomponent" ("component_id", "component_name", "component_rate", "componenttype_id", "bike_name", "component_image", "shop_id") VALUES
	(6,'Reflector','600',1,'DOminar','photo_1971.jpeg',2);
REPLACE INTO "tbl_addcomponent" ("component_id", "component_name", "component_rate", "componenttype_id", "bike_name", "component_image", "shop_id") VALUES
	(7,'HandleLight','300',1,'ALL Bikes','photo_1178.jpeg',2);
/*!40000 ALTER TABLE "tbl_addcomponent" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(11) NOT NULL auto_increment,
  "admin_username" varchar(200) NOT NULL,
  "admin_password" varchar(200) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_username", "admin_password") VALUES
	(1,'admin','admin');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_album'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_album" (
  "album_id" int(10) unsigned NOT NULL auto_increment,
  "album_name" varchar(50) default NULL,
  "album_date" date default NULL,
  "album_time" time default NULL,
  "album_poster" varchar(50) default NULL,
  "album_description" varchar(50) default NULL,
  "album_location" varchar(50) default NULL,
  "album_status" int(3) unsigned default '0',
  "band_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("album_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_album'
#

LOCK TABLES "tbl_album" WRITE;
/*!40000 ALTER TABLE "tbl_album" DISABLE KEYS;*/
REPLACE INTO "tbl_album" ("album_id", "album_name", "album_date", "album_time", "album_poster", "album_description", "album_location", "album_status", "band_id") VALUES
	('3','Namah','2020-02-28','10:00:00','Album1360.jpeg','Album Launch','Bangalore','0','1');
REPLACE INTO "tbl_album" ("album_id", "album_name", "album_date", "album_time", "album_poster", "album_description", "album_location", "album_status", "band_id") VALUES
	('4','vibe','2020-06-02','14:43:00','Album1583.jpg','The freshness inside','kothamangalam','0','1');
/*!40000 ALTER TABLE "tbl_album" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artist'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artist" (
  "artist_id" int(10) unsigned NOT NULL auto_increment,
  "artist_name" varchar(50) default NULL,
  PRIMARY KEY  ("artist_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_artist'
#

LOCK TABLES "tbl_artist" WRITE;
/*!40000 ALTER TABLE "tbl_artist" DISABLE KEYS;*/
REPLACE INTO "tbl_artist" ("artist_id", "artist_name") VALUES
	('2','Composer');
REPLACE INTO "tbl_artist" ("artist_id", "artist_name") VALUES
	('3','Arranger');
/*!40000 ALTER TABLE "tbl_artist" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_artistsubtype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_artistsubtype" (
  "artsub_id" int(10) unsigned NOT NULL auto_increment,
  "artsub_name" varchar(50) default NULL,
  "artist_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("artsub_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_artistsubtype'
#

LOCK TABLES "tbl_artistsubtype" WRITE;
/*!40000 ALTER TABLE "tbl_artistsubtype" DISABLE KEYS;*/
REPLACE INTO "tbl_artistsubtype" ("artsub_id", "artsub_name", "artist_id") VALUES
	('1','bhuu','2');
REPLACE INTO "tbl_artistsubtype" ("artsub_id", "artsub_name", "artist_id") VALUES
	('2','nhhyyy','3');
REPLACE INTO "tbl_artistsubtype" ("artsub_id", "artsub_name", "artist_id") VALUES
	('3','hyy','2');
/*!40000 ALTER TABLE "tbl_artistsubtype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_bandbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_bandbook" (
  "bb_id" int(10) unsigned NOT NULL auto_increment,
  "district_id" int(10) unsigned default NULL,
  "bb_location" varchar(50) default NULL,
  "bb_address" varchar(50) default NULL,
  "bb_date" date default NULL,
  "bb_time" time default NULL,
  "bb_facilities" varchar(50) default NULL,
  "user_id" int(10) unsigned default NULL,
  "bb_pgstatus" tinyint(3) unsigned default '0',
  "band_id" int(10) unsigned default NULL,
  "bb_cstatus" tinyint(3) unsigned default '0',
  "bb_curdate" date default NULL,
  PRIMARY KEY  ("bb_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_bandbook'
#

LOCK TABLES "tbl_bandbook" WRITE;
/*!40000 ALTER TABLE "tbl_bandbook" DISABLE KEYS;*/
REPLACE INTO "tbl_bandbook" ("bb_id", "district_id", "bb_location", "bb_address", "bb_date", "bb_time", "bb_facilities", "user_id", "bb_pgstatus", "band_id", "bb_cstatus", "bb_curdate") VALUES
	('2','9','bdhey','bfhry','2020-02-20','10:00:00','bhr','1',1,'1',1,'2020-02-18');
REPLACE INTO "tbl_bandbook" ("bb_id", "district_id", "bb_location", "bb_address", "bb_date", "bb_time", "bb_facilities", "user_id", "bb_pgstatus", "band_id", "bb_cstatus", "bb_curdate") VALUES
	('3','7','munnar','munnar','2020-06-17','19:07:00','good','8',1,'3',0,'2020-06-05');
/*!40000 ALTER TABLE "tbl_bandbook" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_bandevents'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_bandevents" (
  "bevent_id" int(10) unsigned NOT NULL auto_increment,
  "bevent_name" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  "bevent_location" varchar(50) default NULL,
  "bevent_locaddress" varchar(50) default NULL,
  "bevent_ticketstatus" varchar(10) default '0',
  "bevent_date" date default NULL,
  "bevent_time" time default NULL,
  "bevent_details" varchar(100) default NULL,
  "bevent_banner" varchar(100) default NULL,
  "bevent_astatus" int(10) unsigned default '0',
  "band_id" int(10) unsigned default NULL,
  "bevent_ticketrate" varchar(10) default NULL,
  "bevent_ticketcount" varchar(10) default '0',
  "bevent_ticketsold" int(10) unsigned default '0',
  PRIMARY KEY  ("bevent_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_bandevents'
#

LOCK TABLES "tbl_bandevents" WRITE;
/*!40000 ALTER TABLE "tbl_bandevents" DISABLE KEYS;*/
REPLACE INTO "tbl_bandevents" ("bevent_id", "bevent_name", "district_id", "bevent_location", "bevent_locaddress", "bevent_ticketstatus", "bevent_date", "bevent_time", "bevent_details", "bevent_banner", "bevent_astatus", "band_id", "bevent_ticketrate", "bevent_ticketcount", "bevent_ticketsold") VALUES
	('1','ffhf','2','tjjgg','fnffnfn','No','2020-01-08','01:59:00','details1299.jpg','banner1064.jpg','0','1','','','0');
REPLACE INTO "tbl_bandevents" ("bevent_id", "bevent_name", "district_id", "bevent_location", "bevent_locaddress", "bevent_ticketstatus", "bevent_date", "bevent_time", "bevent_details", "bevent_banner", "bevent_astatus", "band_id", "bevent_ticketrate", "bevent_ticketcount", "bevent_ticketsold") VALUES
	('2','ngy','9','nguty','buuh','No','2020-02-02','18:00:00','details1715.pdf','banner1718.jpg','0','1','','','0');
REPLACE INTO "tbl_bandevents" ("bevent_id", "bevent_name", "district_id", "bevent_location", "bevent_locaddress", "bevent_ticketstatus", "bevent_date", "bevent_time", "bevent_details", "bevent_banner", "bevent_astatus", "band_id", "bevent_ticketrate", "bevent_ticketcount", "bevent_ticketsold") VALUES
	('3','fbht','7','nghty','ngjtu','Yes','2020-01-30','10:00:00','details1056.docx','banner1038.jpg','0','1','100','500','19');
/*!40000 ALTER TABLE "tbl_bandevents" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_bandgallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_bandgallery" (
  "gallery_id" int(10) unsigned NOT NULL auto_increment,
  "band_id" int(10) unsigned default NULL,
  "band_file" varchar(100) default NULL,
  "band_desc" varchar(50) default NULL,
  PRIMARY KEY  ("gallery_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_bandgallery'
#

LOCK TABLES "tbl_bandgallery" WRITE;
/*!40000 ALTER TABLE "tbl_bandgallery" DISABLE KEYS;*/
REPLACE INTO "tbl_bandgallery" ("gallery_id", "band_id", "band_file", "band_desc") VALUES
	('1','1','photo2064.jpg','Oorali Express');
REPLACE INTO "tbl_bandgallery" ("gallery_id", "band_id", "band_file", "band_desc") VALUES
	('2','1','photo1800.webp','Oorali');
REPLACE INTO "tbl_bandgallery" ("gallery_id", "band_id", "band_file", "band_desc") VALUES
	('3','1','photo1971.jpg','Make a way for Oorali');
REPLACE INTO "tbl_bandgallery" ("gallery_id", "band_id", "band_file", "band_desc") VALUES
	('4','3','photo1543.jpg','Avial');
REPLACE INTO "tbl_bandgallery" ("gallery_id", "band_id", "band_file", "band_desc") VALUES
	('5','3','photo1973.jpg','Avial2');
/*!40000 ALTER TABLE "tbl_bandgallery" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_bandmember'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_bandmember" (
  "bandmember_id" int(10) unsigned NOT NULL auto_increment,
  "bandmember_name" varchar(50) default NULL,
  "bandmember_gender" varchar(50) default NULL,
  "bandmember_dob" date default NULL,
  "bandmember_address" varchar(100) default NULL,
  "city_id" int(10) unsigned default NULL,
  "bandmember_contact" bigint(20) unsigned default NULL,
  "bandmember_email" varchar(50) default NULL,
  "band_id" int(10) unsigned default NULL,
  "artsub_id" int(10) unsigned default NULL,
  "bandmember_photo" varchar(100) default NULL,
  "bandmember_username" varchar(50) default NULL,
  "bandmember_password" varchar(50) default NULL,
  PRIMARY KEY  ("bandmember_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_bandmember'
#

LOCK TABLES "tbl_bandmember" WRITE;
/*!40000 ALTER TABLE "tbl_bandmember" DISABLE KEYS;*/
REPLACE INTO "tbl_bandmember" ("bandmember_id", "bandmember_name", "bandmember_gender", "bandmember_dob", "bandmember_address", "city_id", "bandmember_contact", "bandmember_email", "band_id", "artsub_id", "bandmember_photo", "bandmember_username", "bandmember_password") VALUES
	('1','ndhhduu','Male','1980-01-01','bhjidi','1','8081456306','anuvr21@gmail.com','3','3','photo1479.jpg','asd','asd');
REPLACE INTO "tbl_bandmember" ("bandmember_id", "bandmember_name", "bandmember_gender", "bandmember_dob", "bandmember_address", "city_id", "bandmember_contact", "bandmember_email", "band_id", "artsub_id", "bandmember_photo", "bandmember_username", "bandmember_password") VALUES
	('2','ndhhduu','Male','1980-01-01','bhjidi','1','8081456306','anuvr21@gmail.com','3','3','photo2026.jpg','asd','asd');
REPLACE INTO "tbl_bandmember" ("bandmember_id", "bandmember_name", "bandmember_gender", "bandmember_dob", "bandmember_address", "city_id", "bandmember_contact", "bandmember_email", "band_id", "artsub_id", "bandmember_photo", "bandmember_username", "bandmember_password") VALUES
	('3','nbjjk','Female','1999-01-16','mkio','2','9633092708','lal@gmail.com','3','2','photo1008.jpg','mlp','mlp');
REPLACE INTO "tbl_bandmember" ("bandmember_id", "bandmember_name", "bandmember_gender", "bandmember_dob", "bandmember_address", "city_id", "bandmember_contact", "bandmember_email", "band_id", "artsub_id", "bandmember_photo", "bandmember_username", "bandmember_password") VALUES
	('4','nhuj','Female','1998-01-02','ngjtu','1','9567708608','nhu@gmail.com','1','1','photo1236.jpg','nhuj','Nhuj');
REPLACE INTO "tbl_bandmember" ("bandmember_id", "bandmember_name", "bandmember_gender", "bandmember_dob", "bandmember_address", "city_id", "bandmember_contact", "bandmember_email", "band_id", "artsub_id", "bandmember_photo", "bandmember_username", "bandmember_password") VALUES
	('5','surya','Male','2020-06-10','ddddd','1','9605997857','anwarks@gmail.com','3','1','photo1568.jpg','surya','surya');
/*!40000 ALTER TABLE "tbl_bandmember" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_bandmemberbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_bandmemberbook" (
  "bmb_id" int(10) unsigned NOT NULL auto_increment,
  "district_id" int(10) unsigned default NULL,
  "bmb_location" varchar(50) default NULL,
  "bmb_address" varchar(50) default NULL,
  "bmb_date" date default NULL,
  "bmb_time" time default NULL,
  "bmb_facilities" varchar(50) default NULL,
  "user_id" int(10) unsigned default NULL,
  "bandmember_id" int(10) unsigned default NULL,
  "bmb_curdate" date default NULL,
  "bmb_pgstatus" int(10) unsigned default '0',
  PRIMARY KEY  ("bmb_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_bandmemberbook'
#

LOCK TABLES "tbl_bandmemberbook" WRITE;
/*!40000 ALTER TABLE "tbl_bandmemberbook" DISABLE KEYS;*/
REPLACE INTO "tbl_bandmemberbook" ("bmb_id", "district_id", "bmb_location", "bmb_address", "bmb_date", "bmb_time", "bmb_facilities", "user_id", "bandmember_id", "bmb_curdate", "bmb_pgstatus") VALUES
	('1','14','dfghj','gty','2020-02-19','10:00:00','bgtyu','1','4','2020-02-17','1');
/*!40000 ALTER TABLE "tbl_bandmemberbook" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_beventbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_beventbook" (
  "bev_bookid" int(20) unsigned NOT NULL auto_increment,
  "bev_ticketsamount" varchar(50) default NULL,
  "user_id" int(20) unsigned NOT NULL,
  "bevent_id" int(20) unsigned NOT NULL,
  "bev_booktime" time default NULL,
  "bev_bookdate" date default NULL,
  "bev_booktickets" int(50) default NULL,
  "bev_verify" int(3) unsigned default '0',
  PRIMARY KEY  ("bev_bookid")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_beventbook'
#

LOCK TABLES "tbl_beventbook" WRITE;
/*!40000 ALTER TABLE "tbl_beventbook" DISABLE KEYS;*/
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('1','1000','5','3','08:28:58','2020-01-29',10,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('2','1000','5','3','08:29:12','2020-01-29',10,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('3','200','5','3','00:22:26','2020-02-02',2,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('4','200','5','3','00:24:41','2020-02-02',2,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('5','500','5','3','12:01:07','2020-05-05',5,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('6','400','5','3','16:20:08','2020-05-05',4,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('7','100','5','3','19:11:08','2020-05-10',1,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('8','100','5','3','12:35:37','2020-06-05',1,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('9','100','8','3','14:05:28','2020-06-05',1,'0');
REPLACE INTO "tbl_beventbook" ("bev_bookid", "bev_ticketsamount", "user_id", "bevent_id", "bev_booktime", "bev_bookdate", "bev_booktickets", "bev_verify") VALUES
	('10','100','8','3','14:11:23','2020-06-05',1,'0');
/*!40000 ALTER TABLE "tbl_beventbook" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_city'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_city" (
  "city_id" int(10) unsigned NOT NULL auto_increment,
  "city_name" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("city_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_city'
#

LOCK TABLES "tbl_city" WRITE;
/*!40000 ALTER TABLE "tbl_city" DISABLE KEYS;*/
REPLACE INTO "tbl_city" ("city_id", "city_name", "district_id") VALUES
	('1','Kochi','8');
REPLACE INTO "tbl_city" ("city_id", "city_name", "district_id") VALUES
	('2','Muvattupuzha','8');
REPLACE INTO "tbl_city" ("city_id", "city_name", "district_id") VALUES
	('3','guruvayur','9');
REPLACE INTO "tbl_city" ("city_id", "city_name", "district_id") VALUES
	('4','eerattupetta','6');
/*!40000 ALTER TABLE "tbl_city" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaints'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaints" (
  "complaint_id" tinyint(3) unsigned NOT NULL auto_increment,
  "complaint_caption" varchar(50) default NULL,
  "complaint_desc" varchar(50) default NULL,
  "band_id" int(10) unsigned default '0',
  "user_id" int(10) unsigned default '0',
  "musician_id" int(10) unsigned default '0',
  "complaint_reply" varchar(10) default '0',
  "complaint_status" int(10) unsigned default '0',
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_complaints'
#

LOCK TABLES "tbl_complaints" WRITE;
/*!40000 ALTER TABLE "tbl_complaints" DISABLE KEYS;*/
REPLACE INTO "tbl_complaints" ("complaint_id", "complaint_caption", "complaint_desc", "band_id", "user_id", "musician_id", "complaint_reply", "complaint_status") VALUES
	(1,'nbhu','mhuiik','0','1','0','www','1');
REPLACE INTO "tbl_complaints" ("complaint_id", "complaint_caption", "complaint_desc", "band_id", "user_id", "musician_id", "complaint_reply", "complaint_status") VALUES
	(2,'bfhry','ndrju','1','0','0','jjjj','1');
REPLACE INTO "tbl_complaints" ("complaint_id", "complaint_caption", "complaint_desc", "band_id", "user_id", "musician_id", "complaint_reply", "complaint_status") VALUES
	(3,'vafer','adetr','0','0','9','0','0');
REPLACE INTO "tbl_complaints" ("complaint_id", "complaint_caption", "complaint_desc", "band_id", "user_id", "musician_id", "complaint_reply", "complaint_status") VALUES
	(4,'Caption-1','Description-1
','0','7','0','0','0');
/*!40000 ALTER TABLE "tbl_complaints" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  "state_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=18;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('2','Thiruvananthapuram','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('3','Kollam','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('4','Alappuzha','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('5','Pathanamthitta','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('6','Kottayam','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('7','Idukki','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('8','Ernakulam','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('9','Thrissur','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('10','Palakkad','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('11','Malappuram','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('12','Kozhikode','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('13','Wayanad','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('14','Kannur','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('15','Kasaragod','13');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('16','hgfr','3');
REPLACE INTO "tbl_district" ("district_id", "district_name", "state_id") VALUES
	('17','gffdg','2');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_event'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_event" (
  "event_id" int(10) unsigned NOT NULL auto_increment,
  "event_name" varchar(50) default NULL,
  "band_id" int(10) unsigned default NULL,
  "event_date" date default NULL,
  "event_time" time default NULL,
  "city_id" int(10) unsigned default NULL,
  "genre_id" int(10) unsigned default NULL,
  "event_seats" int(10) unsigned default NULL,
  "event_rate" int(10) unsigned default NULL,
  "event_duration" int(50) unsigned default NULL,
  PRIMARY KEY  ("event_id")
);



#
# Dumping data for table 'tbl_event'
#

# No data found.



#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(10) unsigned NOT NULL auto_increment,
  "feedback_caption" varchar(50) default NULL,
  "feedback_content" varchar(50) default NULL,
  "user_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("feedback_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_feedback'
#

LOCK TABLES "tbl_feedback" WRITE;
/*!40000 ALTER TABLE "tbl_feedback" DISABLE KEYS;*/
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_caption", "feedback_content", "user_id") VALUES
	('1','vdgrtu','vdhfruu','1');
/*!40000 ALTER TABLE "tbl_feedback" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_genre'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_genre" (
  "genre_id" int(10) unsigned NOT NULL auto_increment,
  "genre_name" varchar(50) default NULL,
  PRIMARY KEY  ("genre_id")
) AUTO_INCREMENT=52;



#
# Dumping data for table 'tbl_genre'
#

LOCK TABLES "tbl_genre" WRITE;
/*!40000 ALTER TABLE "tbl_genre" DISABLE KEYS;*/
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('1','Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('2','Popular Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('3','Pop Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('4','Punk Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('5','Folk Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('6','Alternative Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('7','Heavy Metal');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('8','Blues');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('9','Country Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('10','Singing');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('11','Funk');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('12','Rhythum and Blues');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('13','Indie Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('14','Progressive Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('15','New Wave');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('16','Orchestra');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('17','Instrumental');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('18','Pop Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('19','Hard Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('20','Soul Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('21','Post Punk');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('22','Experimental Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('23','Reggae');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('24','Grunge');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('25','Hardcore Punk');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('26','Cover Version');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('27','Garage Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('28','Jazz Fushion');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('29','Swing Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('30','Ska');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('31','Psychedelic Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('32','Emo');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('33','Big Band');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('34','Glam Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('35','Blues Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('36','Gothic Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('37','Post-Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('38','Folk Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('39','Industrial Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('40','Independent Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('41','Synth-Pop');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('42','Pop-Punk');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('43','Surf Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('44','Art Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('45','Rockabilly');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('46','Southern Rock');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('47','British Invasion');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('48','Thrash Metal');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('49','Progressive Music');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('50','Death Metal');
REPLACE INTO "tbl_genre" ("genre_id", "genre_name") VALUES
	('51','Nu Metal');
/*!40000 ALTER TABLE "tbl_genre" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_license'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_license" (
  "license_id" int(10) unsigned NOT NULL auto_increment,
  "license_name" varchar(50) default NULL,
  PRIMARY KEY  ("license_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_license'
#

LOCK TABLES "tbl_license" WRITE;
/*!40000 ALTER TABLE "tbl_license" DISABLE KEYS;*/
REPLACE INTO "tbl_license" ("license_id", "license_name") VALUES
	('1','Synchronization License');
REPLACE INTO "tbl_license" ("license_id", "license_name") VALUES
	('2','Mechanical License');
REPLACE INTO "tbl_license" ("license_id", "license_name") VALUES
	('3','Master License');
REPLACE INTO "tbl_license" ("license_id", "license_name") VALUES
	('4','Public Performance License');
REPLACE INTO "tbl_license" ("license_id", "license_name") VALUES
	('5','Print Right License');
REPLACE INTO "tbl_license" ("license_id", "license_name") VALUES
	('6','Theatrical License');
/*!40000 ALTER TABLE "tbl_license" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_membergallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_membergallery" (
  "mgallery_id" int(10) unsigned NOT NULL auto_increment,
  "mgallery_file" varchar(50) default NULL,
  "mgallery_desc" varchar(50) default NULL,
  "bandmember_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("mgallery_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_membergallery'
#

LOCK TABLES "tbl_membergallery" WRITE;
/*!40000 ALTER TABLE "tbl_membergallery" DISABLE KEYS;*/
REPLACE INTO "tbl_membergallery" ("mgallery_id", "mgallery_file", "mgallery_desc", "bandmember_id") VALUES
	('1','photo1663.jpg','njhui','4');
/*!40000 ALTER TABLE "tbl_membergallery" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_mgenre'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_mgenre" (
  "mgenre_id" int(10) unsigned NOT NULL auto_increment,
  "mgenre_name" varchar(50) default NULL,
  PRIMARY KEY  ("mgenre_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_mgenre'
#

LOCK TABLES "tbl_mgenre" WRITE;
/*!40000 ALTER TABLE "tbl_mgenre" DISABLE KEYS;*/
REPLACE INTO "tbl_mgenre" ("mgenre_id", "mgenre_name") VALUES
	('1','Musical Theatre');
REPLACE INTO "tbl_mgenre" ("mgenre_id", "mgenre_name") VALUES
	('3','Jazz');
REPLACE INTO "tbl_mgenre" ("mgenre_id", "mgenre_name") VALUES
	('4','Folk Music');
REPLACE INTO "tbl_mgenre" ("mgenre_id", "mgenre_name") VALUES
	('5','Rock');
REPLACE INTO "tbl_mgenre" ("mgenre_id", "mgenre_name") VALUES
	('6','Techno');
/*!40000 ALTER TABLE "tbl_mgenre" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_musicband'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_musicband" (
  "band_id" int(10) unsigned NOT NULL auto_increment,
  "band_name" varchar(50) default NULL,
  "band_year" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  "band_contact" bigint(20) unsigned default NULL,
  "band_email" varchar(50) default NULL,
  "band_membersnum" int(10) unsigned default NULL,
  "band_logo" varchar(50) default NULL,
  "license_id" int(10) unsigned default NULL,
  "band_lproof" varchar(50) default NULL,
  "band_username" varchar(50) default NULL,
  "band_rating" tinyint(3) unsigned default '0',
  "band_password" varchar(50) default NULL,
  "band_status" int(10) unsigned default '0',
  PRIMARY KEY  ("band_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_musicband'
#

LOCK TABLES "tbl_musicband" WRITE;
/*!40000 ALTER TABLE "tbl_musicband" DISABLE KEYS;*/
REPLACE INTO "tbl_musicband" ("band_id", "band_name", "band_year", "district_id", "band_contact", "band_email", "band_membersnum", "band_logo", "license_id", "band_lproof", "band_username", "band_rating", "band_password", "band_status") VALUES
	('1','Oorali','2003','9','9567708609','oorali@gmail.com','7','logo1645.png','1','proof1256.png','Oorali',4,'oorali','1');
REPLACE INTO "tbl_musicband" ("band_id", "band_name", "band_year", "district_id", "band_contact", "band_email", "band_membersnum", "band_logo", "license_id", "band_lproof", "band_username", "band_rating", "band_password", "band_status") VALUES
	('3','Avial','2014','8','9876543210','avial@gmail.com','5','logo2062.png','4','proof1220.png','avial',5,'avial','1');
/*!40000 ALTER TABLE "tbl_musicband" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_musician'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_musician" (
  "musician_id" int(10) unsigned NOT NULL auto_increment,
  "musician_name" varchar(50) default NULL,
  "musician_gender" varchar(50) default NULL,
  "musician_dob" date default NULL,
  "musician_address" varchar(50) default NULL,
  "city_id" tinyint(3) unsigned default NULL,
  "musician_contact" bigint(20) unsigned default NULL,
  "musician_email" varchar(50) default NULL,
  "artist_id" int(10) unsigned default NULL,
  "musician_photo" varchar(50) default NULL,
  "musician_username" varchar(50) default NULL,
  "musician_password" varchar(50) default NULL,
  "artsub_id" int(10) unsigned default NULL,
  "musician_status" int(10) unsigned default '0',
  PRIMARY KEY  ("musician_id")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_musician'
#

LOCK TABLES "tbl_musician" WRITE;
/*!40000 ALTER TABLE "tbl_musician" DISABLE KEYS;*/
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('1','Siddharth Menon','Male','1989-07-01','Chirackal',1,'9447223998','sid@gmail.com','2','photo1580.jpg','Siddharth','siddharth','1','0');
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('3','Siddharth','Male','1990-12-07','Kochupurackal',2,'9447223008','sid@gmail.com','3','photo1840.jpg','Siddharth','siddharth','2','0');
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('4','asd','Female','1998-12-02','asdfghjkl',1,'9567708608','anuvr21@gmail.com','2','photo1555.jpg','asd','asd','3','0');
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('5','minu','Female','1996-12-04','ngjtuf',2,'8081456306','ambika06@gmail.com','3','photo1409.png','minu','minu','1','0');
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('6','nguth','Male','1997-01-09','mgjtu',2,'9447223998','anu@gmail.com','2','photo1670.png','Vani','vani','3','0');
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('7','Sid Sriram','Male','1996-01-20','Ram Nivas',2,'7510173353','sid@gmail.com','2','photo1386.jpg','1','Sid','2','0');
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('8','Sid Sriram','Male','1990-01-20','Ram Nivas',1,'7510173353','sid@gmail.com','2','photo1808.jpg','1','Sid','3','0');
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('9','Sid Sriram','Male','1990-01-20','Ram Nivas',1,'7510173353','sid@gmail.com','2','photo1913.jpg','Sid','sid','1','2');
REPLACE INTO "tbl_musician" ("musician_id", "musician_name", "musician_gender", "musician_dob", "musician_address", "city_id", "musician_contact", "musician_email", "artist_id", "musician_photo", "musician_username", "musician_password", "artsub_id", "musician_status") VALUES
	('10','Anwar','Male','1999-05-25','adrress',4,'9947074566','anwar@gmail.com','2','photo1756.jpg','anwar','anwar','3','2');
/*!40000 ALTER TABLE "tbl_musician" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_musicianbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_musicianbook" (
  "mb_id" int(10) unsigned NOT NULL auto_increment,
  "district_id" int(10) unsigned default NULL,
  "mb_location" varchar(50) default NULL,
  "mb_address" varchar(50) default NULL,
  "mb_date" date default NULL,
  "mb_time" time default NULL,
  "mb_facilities" varchar(50) default NULL,
  "mb_curdate" date default NULL,
  "user_id" int(10) unsigned default NULL,
  "musician_id" int(10) unsigned default NULL,
  "mb_pgstatus" int(10) unsigned default '0',
  PRIMARY KEY  ("mb_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_musicianbook'
#

LOCK TABLES "tbl_musicianbook" WRITE;
/*!40000 ALTER TABLE "tbl_musicianbook" DISABLE KEYS;*/
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('1','2','fdgh','dfghjk','2020-02-27','12:00:00','wsdfrgthyijukilo','2020-02-17','1','9','1');
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('2','2','ngjt','ngjtu','2020-02-29','21:00:00','ngtju','2020-02-17','1','9','1');
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('3','5','Bangalore','nbhuu','2020-02-27','10:00:00','bhgtu','2020-02-18','1','9','1');
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('4','7','kattappana','ngtu','2020-02-20','10:00:00','bfhru','2020-02-18','1','9','1');
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('5','8','kothamangalam','dddd','2020-06-05','15:23:00','goodcs','2020-06-05','5','7','0');
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('6','8','kothamangalam','dddd','2020-06-05','15:23:00','goodcs','2020-06-05','5','7','0');
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('7','8','kattakkada ','dd','2020-07-02','12:32:00','4rr','2020-06-05','5','7','0');
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('8','7','todupuzha','address','2020-06-24','13:31:00','ffff','2020-06-05','5','8','0');
REPLACE INTO "tbl_musicianbook" ("mb_id", "district_id", "mb_location", "mb_address", "mb_date", "mb_time", "mb_facilities", "mb_curdate", "user_id", "musician_id", "mb_pgstatus") VALUES
	('9','5','ffff','gggg','2020-06-03','14:31:00','good','2020-06-05','5','9','1');
/*!40000 ALTER TABLE "tbl_musicianbook" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_musiciangenre'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_musiciangenre" (
  "musiciangenre_id" int(10) unsigned NOT NULL auto_increment,
  "musician_id" int(10) unsigned default NULL,
  "mgenre_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("musiciangenre_id")
);



#
# Dumping data for table 'tbl_musiciangenre'
#

# No data found.



#
# Table structure for table 'tbl_musicianperformance'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_musicianperformance" (
  "performance_id" int(10) unsigned NOT NULL auto_increment,
  "musician_id" int(10) unsigned default NULL,
  "performance_file" varchar(1000) default NULL,
  "performance_caption" varchar(100) default NULL,
  PRIMARY KEY  ("performance_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_musicianperformance'
#

LOCK TABLES "tbl_musicianperformance" WRITE;
/*!40000 ALTER TABLE "tbl_musicianperformance" DISABLE KEYS;*/
REPLACE INTO "tbl_musicianperformance" ("performance_id", "musician_id", "performance_file", "performance_caption") VALUES
	('1','3','','Nostalgia');
REPLACE INTO "tbl_musicianperformance" ("performance_id", "musician_id", "performance_file", "performance_caption") VALUES
	('2','3','video2008.mp4','Nostalgia');
REPLACE INTO "tbl_musicianperformance" ("performance_id", "musician_id", "performance_file", "performance_caption") VALUES
	('3','6','video1514.mp4','mkil');
REPLACE INTO "tbl_musicianperformance" ("performance_id", "musician_id", "performance_file", "performance_caption") VALUES
	('4','9','video1167.mp4','Cover');
/*!40000 ALTER TABLE "tbl_musicianperformance" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_request'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_request" (
  "request_id" int(10) unsigned NOT NULL auto_increment,
  "musician_id" int(10) unsigned default NULL,
  "band_id" int(10) unsigned default NULL,
  "request_date" date default NULL,
  "request_status" int(10) unsigned default '0',
  PRIMARY KEY  ("request_id")
) AUTO_INCREMENT=27;



#
# Dumping data for table 'tbl_request'
#

LOCK TABLES "tbl_request" WRITE;
/*!40000 ALTER TABLE "tbl_request" DISABLE KEYS;*/
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('13','9','1','2020-01-21','1');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('14','9','3','2020-01-21','1');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('15','9','3','2020-01-21','2');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('17','9','1','2020-01-30','1');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('18','9','1','2020-02-22','0');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('19','1','1','2020-05-05','0');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('20','1','1','2020-05-05','0');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('21','9','1','2020-05-10','0');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('22','9','1','2020-05-27','0');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('23','9','1','2020-05-30','0');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('24','9','1','2020-05-30','0');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('25','9','1','2020-06-05','0');
REPLACE INTO "tbl_request" ("request_id", "musician_id", "band_id", "request_date", "request_status") VALUES
	('26','10','3','2020-06-05','1');
/*!40000 ALTER TABLE "tbl_request" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_state'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_state" (
  "state_id" int(10) unsigned NOT NULL auto_increment,
  "state_name" varchar(50) default NULL,
  PRIMARY KEY  ("state_id")
) AUTO_INCREMENT=30;



#
# Dumping data for table 'tbl_state'
#

LOCK TABLES "tbl_state" WRITE;
/*!40000 ALTER TABLE "tbl_state" DISABLE KEYS;*/
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('1','Andhra Pradesh');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('2','Arunachal Pradesh');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('3','Assam');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('4','Bihar');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('5','Chhattisgarh');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('6','Goa');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('7','Gujarat');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('8','Haryana');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('9','Himachal Pradesh');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('10','Jammu and Kashmir');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('11','Jharkhand');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('12','Karnataka');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('13','Kerala');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('14','Madhya Pradesh');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('15','Maharashtra');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('16','Manipur');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('17','Meghalaya');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('18','Mizoram');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('19','Nagaland');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('20','Odisha');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('21','Punjab');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('22','Rajasthan');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('23','Sikkim');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('24','Tamil Nadu');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('25','Telangana');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('26','Tripura');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('27','Uttar Pradesh');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('28','Uttarakhand');
REPLACE INTO "tbl_state" ("state_id", "state_name") VALUES
	('29','West Bengal');
/*!40000 ALTER TABLE "tbl_state" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_tracks'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_tracks" (
  "track_id" int(10) unsigned NOT NULL auto_increment,
  "track_name" varchar(50) default NULL,
  "genre_id" int(10) unsigned default NULL,
  "band_id" int(10) unsigned default NULL,
  "track_detail" varchar(100) default NULL,
  "track_price" int(10) unsigned default NULL,
  "track_photo" varchar(100) default NULL,
  "track_stock" varchar(50) default '50',
  "track_sold" varchar(50) default '0',
  PRIMARY KEY  ("track_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_tracks'
#

LOCK TABLES "tbl_tracks" WRITE;
/*!40000 ALTER TABLE "tbl_tracks" DISABLE KEYS;*/
REPLACE INTO "tbl_tracks" ("track_id", "track_name", "genre_id", "band_id", "track_detail", "track_price", "track_photo", "track_stock", "track_sold") VALUES
	('2','ngjt','1','3','nfhry','688','photo1160.jpg','10','1');
REPLACE INTO "tbl_tracks" ("track_id", "track_name", "genre_id", "band_id", "track_detail", "track_price", "track_photo", "track_stock", "track_sold") VALUES
	('3','nhdtr','1','3','mchry','100','photo1067.jpg','250','1');
REPLACE INTO "tbl_tracks" ("track_id", "track_name", "genre_id", "band_id", "track_detail", "track_price", "track_photo", "track_stock", "track_sold") VALUES
	('4','nbjgjg','1','3','mbjgtu','300','photo1140.jpg','250','0');
REPLACE INTO "tbl_tracks" ("track_id", "track_name", "genre_id", "band_id", "track_detail", "track_price", "track_photo", "track_stock", "track_sold") VALUES
	('5','mkiu','1','3','mnkgj','50','photo1509.jpg','250','0');
REPLACE INTO "tbl_tracks" ("track_id", "track_name", "genre_id", "band_id", "track_detail", "track_price", "track_photo", "track_stock", "track_sold") VALUES
	('6','bhyu','7','1','njhuu','50','photo2065.png','250','1');
REPLACE INTO "tbl_tracks" ("track_id", "track_name", "genre_id", "band_id", "track_detail", "track_price", "track_photo", "track_stock", "track_sold") VALUES
	('7','bfhry','7','1','bfyt','100','photo1149.png','250','0');
/*!40000 ALTER TABLE "tbl_tracks" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) default NULL,
  "user_gender" varchar(50) default NULL,
  "user_dob" date default NULL,
  "user_address" varchar(50) default NULL,
  "city_id" int(10) unsigned default NULL,
  "user_contact" bigint(20) unsigned default NULL,
  "user_email" varchar(50) default NULL,
  "user_photo" varchar(50) default NULL,
  "user_username" varchar(50) default NULL,
  "user_password" varchar(50) default NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_gender", "user_dob", "user_address", "city_id", "user_contact", "user_email", "user_photo", "user_username", "user_password") VALUES
	('1','Anu Rajan','Female','1998-11-21','Vadaikkara (H) Veettoor Nellad P.O','1','9567708608','anuvr21@gmail.com','User1483.jpg','Anu Rajan','Anu');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_gender", "user_dob", "user_address", "city_id", "user_contact", "user_email", "user_photo", "user_username", "user_password") VALUES
	('5','Sreejith G','Male','1995-02-03','Puthumana (H) Mannoor P.O Kunnatholi','2','9633092708','sreejith@gmail.com','User1002.jpg','sreejith','sreejith');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_gender", "user_dob", "user_address", "city_id", "user_contact", "user_email", "user_photo", "user_username", "user_password") VALUES
	('6','Sharafi','Female','2015-05-06','kkkkk','2','55889963','gh@gmail.com','User1736.jpeg','sharafi','1234');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_gender", "user_dob", "user_address", "city_id", "user_contact", "user_email", "user_photo", "user_username", "user_password") VALUES
	('7','Aravind Raj','Male','2020-02-06','sss','1','9607884784','aravindrajan.in@gmail.com','User1627.png','aravind','a');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_gender", "user_dob", "user_address", "city_id", "user_contact", "user_email", "user_photo", "user_username", "user_password") VALUES
	('8','Ansar','Male','1998-09-15','muvattupuzha','2','9605997857','ans@gmail.com','','ansar','ansar');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
