USE m5prog;

-- adres
CREATE TABLE IF NOT EXISTS adres (
  adresID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  straat VARCHAR(100) NOT NULL,
  huisnummer INT UNSIGNED NOT NULL,
  huisnummertoevoeging VARCHAR(10) NOT NULL,
  postcode CHAR(6) NOT NULL,
  plaats VARCHAR(80) NOT NULL,
  provincie VARCHAR(80) NOT NULL,
  land VARCHAR(80) NOT NULL
);

-- persoon
CREATE TABLE IF NOT EXISTS persoon (
  persoonID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  telefoon VARCHAR(20) NOT NULL,
  voornaam VARCHAR(80) NOT NULL,
  achternaam VARCHAR(120) NOT NULL,
  geboortedatum DATE NOT NULL,
  geslacht ENUM('man','vrouw','anders') NOT NULL,
  geboortestad VARCHAR(120) NOT NULL,
  nationaliteit VARCHAR(80) NOT NULL,
  adresID INT UNSIGNED NOT NULL,
  CONSTRAINT fk_persoon_adres
    FOREIGN KEY (adresID) REFERENCES adres(adresID)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);
