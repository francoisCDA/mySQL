/*********************************
     TP ENTREPRISE COMMERCIALE
**********************************/

USE `ClassicModels` ;

-- 1 - Afficher les noms, prénoms et titres de l’ensemble des employées en les ordonnant par leurs noms de famille.

SELECT lastName,firstName,jobTitle FROM employees ORDER BY lastname;

-- 2 – Afficher les noms des employées en supprimant les doublons.

SELECT DISTINCT lastname FROM employees;

-- 3 - Sélectionner et afficher le nom de la société, le prénom et le nom du contact des clients qui habitent aux USA.

SELECT customerName,contactLastName,contactFirstName FROM customers WHERE country = 'USA';

-- 4 - Sélectionner les emails des employées qui ont un firstname qui se termine par 'y' et qui ont un reportsTo qui commence par '105'.

SELECT email FROM employees WHERE firstName LIKE "%y"  AND reportsTo LIKE "105%" ;

-- 5 - Sélectionner les noms et emails des employees qui ont un firstname qui commence par un L.

SELECT  lastName, email FROM employees WHERE firstName LIKE "L%";

-- 6 - Trier la table customers par ordre alphabétique à partir du contactLastName 

SELECT * FROM customers ORDER BY contactLAstName;

-- 7 - Trier la table employées par ordre croissant en se basant officeCode 

SELECT * FROM employees ORDER BY officeCode;

-- 8 - Sélectionner les clients qui ont payé pour plus de 100000 euros.

-- SELECT customerNumber FROM (SELECT customerNumber,SUM(amount) AS ttal FROM payments GROUP BY customerNumber) as selection WHERE ttal > 10000;

SELECT * FROM customers JOIN (SELECT customerNumber FROM (SELECT customerNumber,SUM(amount) AS ttal FROM payments GROUP BY customerNumber) as selection WHERE ttal > 100000) AS trie ON customers.customerNumber = trie.customerNumber ;

-- solution Christophe
select distinct (select customerName from customers where customernumber = pay.customerNumber)
from payments as pay
where amount > 100000;

-- solution Loïc
select cu.customerName,sum(amount) as payment
from customers cu
inner join payments pay on cu.customerNumber = pay.customerNumber
group by cu.customerName
having payment > 100000;

-- 9 - Afficher le total des ventes par 'orderNumber' et 'status' ?

SELECT * from orders ;
select * from orderdetails;

-- Incomplète : select orders.orderNumber, (priceEach * orderLineNumber) as total, status from orderdetails join orders on orderdetails.orderNumber = orders.orderNumber;

select ttaux.orderNumber, status, sum(total) as totaux from (select orders.orderNumber, (quantityOrdered * priceEach) as total, status from orderdetails join orders on orderdetails.orderNumber = orders.orderNumber) as ttaux group by orderNumber ORDER BY orderNumber;

-- solution Christophe
SELECT T1.orderNUMBER, status, SUM(quantityOrdered * priceEach) total 
FROM orders AS T1
INNER JOIN orderdetails AS T2 ON T1.orderNumber = T2.orderNumber
GROUP BY orderNumber;


-- 10 – Afficher les “orderNumber”, “productName”, “msrp”, “priceEach” des produits qui ont un productcode = ‘S10_1678’ et ont un msrp supérieur au priceEach.

select * from products ;
select * from orderdetails ;

SELECT products.productCode, orderNumber,productName,msrp,priceEach from products join orderdetails on products.productCode = orderdetails.productCode where products.productCode = "S10_1678" and msrp > priceEach ; 

-- 11 - Sélectionner les emails des employées qui ont un firstname qui se termine par 'y' ou qui appartiennent à au bureau de San Francisco.

select * from employees ;
select * from offices;


SELECT email from employees JOIN offices on employees.officeCode = offices.officeCode where firstname like "%y" or city = 'San Francisco'; 

-- 12 - Donner le nombre de client qui sont gérés par Leslie Jennings.
select * from customers;

select employeeNumber from employees where firstName = "Leslie" and lastName= "Jennings";

select * from customers where salesRepEmployeeNumber = (select employeeNumber from employees where firstName = "Leslie" and lastName= "Jennings" ) ;

-- 13 - Afficher le nom et prénom de la personne qui a le jobTitle de Président

select firstName, lastName from employees where jobTitle = "president" ;

-- 14 - Donner la somme des montants des paiements reçu pendant le mois de Mars 2005.

select * from payments where paymentDate like "2005-03-%"  ;

select SUM(amount) from (select * from payments where paymentDate like "2005-03-%" ) as mars;

-- 15 - Afficher le total des paiements par nom des clients.

select * from payments;
select * from customers;

select customerName, total from customers join (select customerNumber, sum(amount) as total from payments group by customerNumber) as var on customers.customerNumber = var.customerNumber ;

-- 16 - Afficher la date de commande et le numéro client des commandes annulées 

SELECT * from orders  ;

select customerName,orderDate,customers.customerNumber from orders join customers on orders.customerNumber = customers.customerNumber where status = "cancelled";


-- 17 - Afficher la liste (prénom et nom ) des subordonnées de Bow Anthony

select * from employees ;

select employeeNumber from employees where lastName = "Bow" and firstName = "Anthony";

select firstName,lastName from employees where reportsTo = (select employeeNumber from employees where lastName = "Bow" and firstName = "Anthony");

-- 18 - Afficher le nom et le prénom du ou des employés qui n'ont pas de supérieur hiérarchique.

select firstName,lastName from employees where reportsTo is null;

-- 19 - Dans le detail des commandes afficher la commande avec la plus petite quantité.

select * from orderdetails order by quantityOrdered limit 1;

-- 20 - Afficher le detail de la commande qui est datée du 21-04-2003

select * from orders where orderDate = "2003-04-21%";

-- 21 – Afficher la liste des managers avec les employées qu’ils managent. Le nom de la colonne s’appellera ‘Manager’ pour la colonne des managers, elle 
--      regroupera leurs noms et prénoms. Idem pour la colonne employée, elle s’appellera ‘Employée’, elle affichera le nom et prénom des employés.

select * from employees where jobTitle like "%manager%" ;



-- 22 – Afficher le nom des managers et le nombre d’employé qu’ils managent
