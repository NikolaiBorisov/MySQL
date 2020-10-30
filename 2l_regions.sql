CREATE TABLE `_regions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_id_idx` (`country_id`),
  KEY `regions_title` (`title`),
  CONSTRAINT `fk_country_region_id` FOREIGN KEY (`country_id`) REFERENCES `_countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5468685 DEFAULT CHARSET=utf8;
