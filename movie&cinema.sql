CREATE TABLE Movies (
	  Code INTEGER PRIMARY KEY,
	  Title VARCHAR(255) NOT NULL,
	  Rating VARCHAR(255) 
	);
	
	CREATE TABLE MovieTheaters (
	  Code INTEGER PRIMARY KEY,
	  Name VARCHAR(255) NOT NULL,
	  Movie INTEGER,  
	    FOREIGN KEY (Movie) REFERENCES Movies(Code)
	) ENGINE=INNODB;
	
	INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
	 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
	 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
	 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
	 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
	 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
	 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
	 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
	 
	 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
	 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
	 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
	 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
	 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
	 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
     
select title from Movies;
select distinct rating from Movies;
select code,title from Movies where rating is null;
select * from MovieTheaters where movie is null;
select *,title from Movies m,MovieTheaters t where m.code = t.movie;
SELECT * FROM MovieTheaters LEFT JOIN Movies ON MovieTheaters.Movie = Movies.Code;
SELECT * FROM MovieTheaters right JOIN Movies ON MovieTheaters.Movie = Movies.Code;
SELECT Title FROM Movies WHERE Code NOT IN(SELECT Movie FROM MovieTheaters WHERE Movie IS NOT NULL);
INSERT INTO Movies(code,Title,Rating) VALUES(9,'One, Two, Three',NULL);
UPDATE Movies SET rating = 'G' WHERE rating is null; 
delete from MovieTheaters where movie in (select code from Movies where rating ='NC-17');