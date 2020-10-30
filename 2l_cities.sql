
CREATE TABLE `_cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `important` tinyint(1) DEFAULT NULL,
  `region_id` int DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_id_idx` (`country_id`),
  KEY `fk_region_id_idx` (`region_id`),
  KEY `title` (`title`),
  CONSTRAINT `fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `_countries` (`id`),
  CONSTRAINT `fk_region_id` FOREIGN KEY (`region_id`) REFERENCES `_regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5469360 DEFAULT CHARSET=utf8;
