CREATE TABLE a ( 
	id INTEGER PRIMARY KEY, 
	val TEXT 
);
INSERT INTO a (id, val) VALUES (1, 'val1'), (2, 'val2');

CREATE TABLE b ( 
	n INTEGER 
) INHERITS (a); 

INSERT INTO b (id, val, n) VALUES (3, 'val3', 5000);

SELECT * FROM b;

SELECT * FROM a;

CREATE TYPE address AS
(STREET     VARCHAR(30),
 CITY       VARCHAR(30),
 STATE      VARCHAR(10));

CREATE TYPE name AS
(First_Name	VARCHAR(30),
 Last_Name      VARCHAR(30));

CREATE TYPE DOB AS
(Day_DOB	INT,
 Month_DOB 	INT,
 Year_DOB	INT);

CREATE TABLE Professor
 (ProfID	INT NOT NULL PRIMARY KEY,
 Prof_Name	name,
 Prof_DOB	DOB,
 Prof_Address	address
 );

INSERT INTO Professor VALUES
(1000, ROW('Alan','Tang'),
ROW(2,6,1960),
ROW('Jalan Satu','Cyberjaya','Selangor'));

select * from professor;