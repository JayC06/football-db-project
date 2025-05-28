SELECT * FROM players;

-- Checking duplicates
SELECT first_name, last_name, COUNT(*) AS count
FROM players
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- Checking duplicate records
SELECT *
FROM players
WHERE first_name = 'Joshua' AND last_name = 'King';

SET SQL_SAFE_UPDATES = 0;

-- deleting duplicate entry
DELETE FROM players WHERE player_id = 478;

SET SQL_SAFE_UPDATES = 1;

-- testing squad list queries
SELECT p.player_id, p.first_name, p.last_name, c.club_name
FROM players p
INNER JOIN clubs c ON p.current_club_id = c.club_id
WHERE c.club_id = 17;

SELECT p.player_id, p.first_name, p.last_name, c.club_name
FROM players p
INNER JOIN clubs c ON p.current_club_id = c.club_id
WHERE c.club_id = 5;