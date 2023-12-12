/**********************
     demo insert
**********************/

USE entreprise_demo;

-- Methode 1
-- sans préciser les colonnes

INSERT INTO service
	VALUES (NULL,'COMPTA','2023-12-11');
 
 
-- Methode 2
-- à préférer

INSERT INTO service (libelle,date_modification)
	VALUES
    ('IT','2023-12-10'),
    ('Direction', '2023-12-01');

-- Methode 3
-- via requète imbriquée
INSERT INTO service (libelle,date_modification)
	SELECT
    'R&D' as libelle,
    '2023-12-13' as date_modification;
    
SELECT * FROM service;

-- DELETE FROM

-- Supprimer tous les enregistrements d'une table
DELETE FROM service
	WHERE libelle = 'Direction';
