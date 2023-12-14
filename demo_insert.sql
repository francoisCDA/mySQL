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
    
UPDATE
	service
SET
	libelle = 'IT-CREW',
    date_modification = NOW()
WHERE
	libelle = 'IT';


-- SELECT

-- toutes les colonnes
SELECT * FROM service;

-- selectionner une colonne
SELECT libelle FROM service;

-- selectionner plusieurs colonnes
SELECT libelle,service_id FROM service;

-- préfixer les colonnes du nom de la table
SELECT service.service_id, service,libelle FROM service;

SELECT * from salarie;

INSERT INTO salarie (prenom,nom,age,salaire,service_id)
	VALUES
    ('bill','gate',68,1253,1),
    ('billa','gata',58,6553,2),
    ('steeve','jobs',63,3253,5),
    ('elon','musk',55,2252,5),
    ('steve','wozniak',72,6253,3),
    ('billou','gateeau',67,1953,5),
    ('billo','gute',68,1253,1),
    ('billu','gote',68,1253,1);
    

SELECT nom,prenom FROM salarie WHERE salaire > 1500;

SELECT nom,prenom FROM salarie WHERE salaire > 3000 AND age > 33;
SELECT nom,prenom FROM salarie WHERE salaire < 2000 OR age > 63;
SELECT nom,prenom FROM salarie WHERE salaire BETWEEN 60 AND 70;

-- LIMIT
SELECT DISTINCT salaire FROM salarie;

-- LIMIT
SELECT * FROM service LIMIT 2;

-- ORDER BY
SELECT * FROm service ORDER BY libelle; -- ASC par defautl
SELECT * FROm service ORDER BY libelle DESC; 






