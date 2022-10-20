SELECT * FROM actors;
SELECT * FROM directors;
SELECT * FROM directors_genres;
SELECT * FROM movies;
SELECT * FROM movies_directors;
SELECT * FROM movies_genre;
SELECT * FROM roles;

SELECT TOP 2 * FROM actors;
SELECT TOP 10 * FROM actors;

SELECT FirstName, LastName FROM actors WHERE FirstName = 'scarlett';

INSERT INTO actors (FirstName, LastName, Gender)
VALUES ('Tom', 'Hanks', 'Male');

SELECT DISTINCT FirstName, LastName FROM actors;

SELECT FirstName, LastName FROM actors WHERE FirstName = 'Tom' AND LastName = 'Hanks';
SELECT FirstName, LastName FROM actors WHERE NOT FirstName = 'Tom';

SELECT * FROM actors WHERE FirstName = 'Tom' AND NOT Id = 1; 


SELECT * FROM directors WHERE FirstName IN ('George', 'Robert'); 

SELECT * FROM movies WHERE Rank BETWEEN 500 AND 1000;

SELECT 
MAX(Rank) AS 'Max Rank', 
MIN(Rank) AS 'Min Rank',
AVG(Rank) AS 'Average Rank',
COUNT(*) AS 'Total Movies',
Count(Rank) AS 'All Movie Records'
FROM Movies

INSERT INTO movies (Name, Year)
VALUES ('A Bugs Life', 1998)

--Practice Joins

INSERT INTO directors_genres (DirectorId, Genre)
VALUES 
	(3, 'Action'),
	(2, 'Adventure'),
	(2, 'Fantasy'),
	(1, 'Romance'); 

SELECT d.FirstName, d.LastName, dg.Genre 
FROM Directors d
INNER JOIN directors_genres dg
ON d.Id = dg.DirectorId;

INSERT INTO directors (FirstName, LastName)
VALUES ('Ron', 'Howard');

SELECT d.FirstName, d.LastName, dg.Genre 
FROM Directors d
LEFT JOIN directors_genres dg
ON d.Id = dg.DirectorId;

SELECT d.FirstName, d.LastName, dg.Genre 
FROM Directors d
RIGHT JOIN directors_genres dg
ON d.Id = dg.DirectorId;

SELECT d.FirstName, d.LastName, dg.Genre 
FROM Directors d
FULL OUTER JOIN directors_genres dg
ON d.Id = dg.DirectorId;

SELECT d.FirstName, d.LastName, COUNT(dg.Genre) AS 'Number of Genres'
FROM Directors d
INNER JOIN directors_genres dg
ON d.Id = dg.DirectorId
GROUP BY FirstName, LastName
HAVING COUNT (dg.Genre) > 2;

SELECT d.FirstName, d.LastName, COUNT(dg.Genre) AS 'Number of Genres'
FROM Directors d
INNER JOIN directors_genres dg
ON d.Id = dg.DirectorId
GROUP BY FirstName, LastName
ORDER BY 3 DESC

SELECT m.Id, m.Name, mg.Genre, m.Rank 
FROM movies m
INNER JOIN movies_genre mg
ON m.Id = mg.MovieId
WHERE m.Rank > 
	(
		SELECT AVG(Rank)
		FROM movies
	);