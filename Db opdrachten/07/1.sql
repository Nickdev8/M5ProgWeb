CREATE TABLE `m5prog`.`leerlingen` (
  `idleerlingen` INT NOT NULL,
  `naam` VARCHAR(50) NOT NULL,
  `leeftijd` INT NOT NULL,
  `klas` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idleerlingen`));




--   ai
INSERT INTO `m5prog`.`leerlingen` (`idleerlingen`, `naam`, `leeftijd`, `klas`) VALUES
(1, 'Emma de Vries', 16, '5A'),
(2, 'Noah Janssen', 17, '5B'),
(3, 'Liam van Dijk', 15, '4C'),
(4, 'Sophie Bakker', 16, '5A'),
(5, 'Lucas Visser', 18, '6B'),
(6, 'Mila Smit', 17, '5C'),
(7, 'Daan Mulder', 15, '4A'),
(8, 'Zoë Meijer', 16, '5B'),
(9, 'Finn de Boer', 17, '5C'),
(10, 'Lotte Willems', 18, '6A');
(11, 'mario', 2, '5Q'),
(11, 'sonic', 161, '5V')