PRAGMA foreign_keys = ON;

CREATE TABLE movies(
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE visitors(
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE movies_visitors(
  movieId INTEGER NOT NULL REFERENCES movies (id),
  visitorId INTEGER NOT NULL REFERENCES visitors (id),
  PRIMARY KEY (movieId, visitorId)
);



INSERT INTO movies(id, name) VALUES(1, 'Bad Boys');
INSERT INTO movies(id, name) VALUES(2, 'Source Code');
INSERT INTO movies(id, name) VALUES(3, 'The Bourne Ultimatum');

INSERT INTO visitors(id, name) VALUES(1, 'Comedy');
INSERT INTO visitors(id, name) VALUES(2, 'Action');
INSERT INTO visitors(id, name) VALUES(3, 'Thriller');
INSERT INTO visitors(id, name) VALUES(4, 'Science Fiction');

INSERT INTO movies_visitors(movieId, visitorId) VALUES(1, 1);
INSERT INTO movies_visitors(movieId, visitorId) VALUES(1, 2);
INSERT INTO movies_visitors(movieId, visitorId) VALUES(1, 3);
INSERT INTO movies_visitors(movieId, visitorId) VALUES(1, 4);
INSERT INTO movies_visitors(movieId, visitorId) VALUES(2, 2);
INSERT INTO movies_visitors(movieId, visitorId) VALUES(2, 3);
INSERT INTO movies_visitors(movieId, visitorId) VALUES(2, 4);
INSERT INTO movies_visitors(movieId, visitorId) VALUES(3, 2);
INSERT INTO movies_visitors(movieId, visitorId) VALUES(3, 3);

-- Answer B
SELECT movieId, COUNT(*) FROM movies_visitors 
GROUP BY movieId 
HAVING COUNT(*) >= ((SELECT COUNT(*) FROM movies_visitors) * 1.0 / (SELECT COUNT(*) FROM movies));

-- Answer C
SELECT id, COUNT(*) FROM movies 
JOIN movies_visitors ON movieId = id 
GROUP BY id 
HAVING COUNT(*) >= ((SELECT COUNT(*) FROM movies_visitors) * 1.0 / (SELECT COUNT(*) FROM movies));