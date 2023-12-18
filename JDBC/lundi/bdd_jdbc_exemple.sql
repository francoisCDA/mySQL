CREATE DATABASE IF NOT EXISTS jdbc_exemple ;

USE jdbc_exemple ;

DROP TABLE person;

CREATE TABLE person (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

SELECT * FROM person;