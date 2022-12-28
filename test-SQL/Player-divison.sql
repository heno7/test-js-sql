CREATE TABLE playerData(
    username VARCHAR(20) UNIQUE,
    rating INT
);

INSERT INTO playerData (username, rating) VALUES ('hohnovda',872);
INSERT INTO playerData (username, rating) VALUES ('fo',1758);
INSERT INTO playerData (username, rating) VALUES ('kikoer',2101);
INSERT INTO playerData (username, rating) VALUES ('lugi',1880);
INSERT INTO playerData (username, rating) VALUES ('kopmade',1487);
INSERT INTO playerData (username, rating) VALUES ('nebuom',1762);
INSERT INTO playerData (username, rating) VALUES ('liri',1023);
INSERT INTO playerData (username, rating) VALUES ('hifho',null);
INSERT INTO playerData (username, rating) VALUES ('togrut',1362);


SELECT username, rating, Case  
WHEN nextRating =  0 THEN 0
ELSE nextRating - rating
END AS ratingGap

FROM (SELECT *, CASE
    WHEN rating < 1000 THEN 1000
    WHEN rating < 1300 THEN 1300
    WHEN rating < 1600 THEN 1600
    when rating < 2000 THEN 2000
    ELSE 0
END AS nextRating
FROM playerData )