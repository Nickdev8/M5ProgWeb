USE m5prog;

-- -------------------------
DROP TABLE IF EXISTS Crew_Missions;
DROP TABLE IF EXISTS Missions;
DROP TABLE IF EXISTS Crew;

-- Table: Crew
CREATE TABLE Crew (
  crew_id    INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100),
  species    VARCHAR(50),
  `rank`     VARCHAR(50),
  birth_year INT
);

-- Table: Missions
CREATE TABLE Missions (
  mission_id   INT AUTO_INCREMENT PRIMARY KEY,
  mission_name VARCHAR(100),
  destination  VARCHAR(100),
  start_date   DATE,
  end_date     DATE
);

-- Table: Crew_Missions (many-to-many)
CREATE TABLE Crew_Missions (
  crew_id   INT,
  mission_id INT,
  role      VARCHAR(50),
  FOREIGN KEY (crew_id)   REFERENCES Crew(crew_id),
  FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);

-- -------------------------
INSERT INTO Crew (crew_id, name, species, `rank`, birth_year) VALUES
  (1, 'Talla Shren', 'Andoriaan', 'Commander', 2368),
  (2, 'Mira Kade',   'Human',     'Lieutenant', 2380),
  (3, 'Vorak',       'Vulcan',    'Ensign',     2390);

INSERT INTO Missions (mission_id, mission_name, destination, start_date, end_date) VALUES
  (10, 'Aurora Run',   'Proxima b', '2398-01-12', '2398-06-30'),
  (11, 'Nebula Sweep', 'NGC 1976',  '2399-03-02', '2399-09-15');

INSERT INTO Crew_Missions (crew_id, mission_id, role) VALUES
  (1, 10, 'Science Officer'),
  (2, 10, 'Pilot'),
  (3, 11, 'Engineer'),
  (1, 11, 'XO');

-- -------------------------
SELECT * FROM Crew;

SELECT *
FROM Crew
WHERE species = 'Andoriaan' AND birth_year > 2300;

-- -------------------------
SELECT c.name, cm.role
FROM Crew AS c
JOIN Crew_Missions AS cm ON cm.crew_id = c.crew_id;

SELECT c.name, cm.role, m.mission_name
FROM Crew AS c
JOIN Crew_Missions AS cm ON cm.crew_id = c.crew_id
JOIN Missions AS m       ON m.mission_id = cm.mission_id;

-- -------------------------
SELECT m.mission_name, c.name
FROM Missions AS m
JOIN Crew_Missions AS cm ON cm.mission_id = m.mission_id
JOIN Crew AS c           ON c.crew_id     = cm.crew_id
WHERE m.mission_id = 10;

SELECT m.mission_name, c.name
FROM Missions AS m
JOIN Crew_Missions AS cm ON cm.mission_id = m.mission_id
JOIN Crew AS c           ON c.crew_id     = cm.crew_id
WHERE m.mission_id = 11;

-- -------------------------
SELECT name, birth_year
FROM Crew
ORDER BY birth_year DESC
LIMIT 2;

-- -------------------------
SELECT name, (2400 - birth_year) AS leeftijd
FROM Crew;

-- -------------------------
INSERT INTO Crew (crew_id, name, species, `rank`, birth_year) VALUES
  (4, 'Kara Thren',   'Andoriaan', 'Lieutenant', 2387),
  (5, 'Jax Monroe',   'Human',     'Chief',      2365),
  (6, 'Sera T’Lir',   'Vulcan',    'Lieutenant', 2378);

INSERT INTO Crew_Missions (crew_id, mission_id, role) VALUES
  (4, 10, 'Tactical'),
  (5, 11, 'Navigator'),
  (6, 10, 'Science Officer');

-- -------------------------
SELECT species, COUNT(*) AS aantal
FROM Crew
GROUP BY species
ORDER BY aantal DESC, species ASC;
