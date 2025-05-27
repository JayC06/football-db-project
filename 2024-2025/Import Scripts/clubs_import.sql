SELECT * FROM clubs;

-- Attempt to load in data via SQL script.
LOAD DATA INFILE "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\clubs.csv"
INTO TABLE clubs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '/n'
IGNORE 1 ROWS;

-- Security error on upload
SHOW VARIABLES LIKE 'secure_file_priv';

-- Attempting to bypass SQLs security settings - this worked but the file would not upload due to errors in CSV file.
SET GLOBAL local_infile = 1;
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clubs.csv"
INTO TABLE clubs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '/n'
IGNORE 1 ROWS;

-- Year founded was too early for YEAR type
ALTER TABLE clubs
MODIFY COLUMN year_founded SMALLINT;

-- Making sure NULL is allowed
ALTER TABLE clubs
MODIFY COLUMN stadium_id INT NULL;

-- Making sure NULL is allowed
ALTER TABLE clubs
MODIFY COLUMN manager_id INT NULL;

-- Checking upload
SELECT * FROM clubs;

-- finding the duplicate entries
SELECT club_name, COUNT(*) AS count
FROM clubs
GROUP BY club_name
HAVING COUNT(*) > 1;

-- Deleting duplicates
DELETE c1 FROM clubs c1
JOIN clubs c2 ON c1.club_name = c2.club_name
AND c1.club_id > c2.club_id;

-- turning safe update off
SET SQL_SAFE_UPDATES = 0;

-- deleting duplicates
DELETE c1 FROM clubs c1
JOIN clubs c2 ON c1.club_name = c2.club_name
AND c1.club_id > c2.club_id;

-- turning safe update back on
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM CLUBS;

-- Checked correct amount of clubs
SELECT COUNT(club_id)
FROM CLUBS;