/**********************
     exo4 livre
**********************/


CREATE DATABASE IF NOT EXISTS exo_livre;

USE exo_livre;

CREATE TABLE IF NOT EXISTS livre( 
	id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(150),
    auteur VARCHAR(50),
    editeur VARCHAR(50),
    date_publication DATE,
    isbn_10 VARCHAR(10),
    isbn_13 VARCHAR(15)
);

SELECT 
    *
FROM
    livre;

SELECT 
    *
FROM
    livre
ORDER BY date_publication
LIMIT 10;

SELECT 
    date_publication, auteur, titre
FROM
    livre
ORDER BY date_publication
LIMIT 10;

SELECT 
    *
FROM
    livre
WHERE
    auteur = 'Agatha Christie';

SELECT 
    COUNT(*) AS nb_livre
FROM
    livre
WHERE
    auteur = 'Agatha Christie';

UPDATE livre 
SET 
    auteur = 'Agatha Christie'
WHERE
    auteur = 'Agatha Christies';

INSERT INTO livre (titre,auteur,editeur,date_publication,isbn_10,isbn_13)
	VALUE ("L'étranger",'Albert Camus','Livre de Poche','2008-12-1','2008120145','152-2008120145');

SELECT 
    *
FROM
    livre
WHERE
    auteur LIKE 'Julie%' ;
    
-- DELETE FROM (select * from livre WHERE auteur like 'Julie%') as "julie" WHERE titre like 'Trans%' ;

DELETE FROM livre 
WHERE
    auteur LIKE 'Julie%'
    AND titre LIKE 'Trans%'

