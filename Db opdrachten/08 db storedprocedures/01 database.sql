USE `m5prog`;

DROP TABLE IF EXISTS `webbookmarks`;
CREATE TABLE `webbookmarks` (
  `bookmarkid` INT UNSIGNED AUTO_INCREMENT NOT NULL,
  `sitename` VARCHAR(45) NOT NULL,
  `link` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`bookmarkid`),
  UNIQUE KEY `bookmarkid_UNIQUE` (`bookmarkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `webbookmarks` (`sitename`, `link`) VALUES
  ('ign.com', 'https://ign.com'),
  ('media college', 'https://ma-web.nl');
