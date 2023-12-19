/*******************************
	Exercice Compte Bancaire
********************************/

DROP DATABASE IF EXISTS ma_banque;

CREATE DATABASE IF NOT EXISTS ma_banque ;

USE ma_banque;



CREATE TABLE clients(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first VARCHAR(50),
    last VARCHAR(50)
);

CREATE TABLE comptes(
	num_compte INT AUTO_INCREMENT PRIMARY KEY,
	id_client INT,
	solde DOUBLE DEFAULT 0,
	CONSTRAINT FOREIGN KEY (id_client) REFERENCES clients(id)
);

CREATE TABLE operations(
	id_op INT AUTO_INCREMENT PRIMARY KEY,
    compte int,
	operation VARCHAR(50),
    valeur DOUBLE,
    CONSTRAINT FOREIGN KEY (compte) REFERENCES comptes(num_compte)
);


