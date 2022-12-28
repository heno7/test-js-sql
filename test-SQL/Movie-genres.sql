PRAGMA foreign_keys = ON;

CREATE TABLE genres (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE moviesGenres (
  movieId INTEGER REFERENCES movies(id),
  genreId INTEGER REFERENCES genres(id),
  PRIMARY KEY(movieId, genreId),
  FOREIGN KEY (movieId) REFERENCES movies(id)
  FOREIGN KEY (genreId) REFERENCES genres(id)
);

INSERT INTO genres(id, name) VALUES(1, 'Comedy');
INSERT INTO genres(id, name) VALUES(2, 'Action');
INSERT INTO genres(id, name) VALUES(3, 'Thriller');
INSERT INTO genres(id, name) VALUES(4, 'Science Fiction');

INSERT INTO movies(id, name) VALUES(1, 'Bad Boys');
INSERT INTO movies(id, name) VALUES(2, 'Source Code');
INSERT INTO movies(id, name) VALUES(3, 'The Bourne Ultimatum');

INSERT INTO moviesGenres(movieId, genreId) VALUES(1, 1);
INSERT INTO moviesGenres(movieId, genreId) VALUES(1, 2);
INSERT INTO moviesGenres(movieId, genreId) VALUES(1, 3);
INSERT INTO moviesGenres(movieId, genreId) VALUES(1, 4);
INSERT INTO moviesGenres(movieId, genreId) VALUES(2, 2);
INSERT INTO moviesGenres(movieId, genreId) VALUES(2, 3);
INSERT INTO moviesGenres(movieId, genreId) VALUES(2, 4);
INSERT INTO moviesGenres(movieId, genreId) VALUES(3, 2);
INSERT INTO moviesGenres(movieId, genreId) VALUES(3, 3);



SELECT movies.name As movieName, COUNT(genres.name) AS noOfGenres
FROM movies RIGHT JOIN moviesGenres 
ON movies.id = moviesGenres.movieId
LEFT JOIN genres
ON moviesGenres.genreid = genres.id
WHERE movies.id  NOT IN (SELECT movieId from moviesGenres WHERE genreId = 1)
GROUP BY movieName
HAVING COUNT(genres.name) > 2