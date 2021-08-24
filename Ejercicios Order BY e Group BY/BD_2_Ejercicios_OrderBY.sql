/*1. Conte o total de países.*/
SELECT COUNT(*) from `world`.`country`;

/*2. Retorne o nome dos continentes e o total de países que neles existem.*/
SELECT COUNT(*) AS "Cantidad de Paises por continente",`Continent` AS "Continentes"
 FROM
 `world`.`country`
 GROUP BY (`Continent`);

/*3. Retorne o nome dos continentes e o total de países que neles existem. Ordene o resultado em
ordem alfabética pelo nome do continente.*/
SELECT COUNT(*) AS "Cantidad de Paises por continente",`Continent` AS "Continentes"
 FROM
 `world`.`country`
 GROUP BY (`Continent`)
 Order BY (`Continent`) ASC;

/*4. Retorne o nome dos continentes e o total de países que nele existem. Filtre os continentes que
possuem mais que 50 países.*/
SELECT COUNT(*) AS "Cantidad de Paises por continente",`Continent` AS "Continentes" FROM
 `world`.`country` 
 GROUP BY (`Continent`)
 HAVING COUNT(*) > 50;

/*5. Retorne a área do maior país.*/
SELECT `Name`,`SurfaceArea`
 From `world`.`country`
 WHERE `SurfaceArea` = (Select max(`SurfaceArea`) FROM `world`.`country`);


/*6. Retorne a área do menor país.*/
SELECT `Name`,`SurfaceArea` 
FROM `world`.`country` 
WHERE `SurfaceArea` = (SELECT min(`SurfaceArea`) FROM `world`.`country`);



/*7. Retorne a média da área de todos os países.*/
SELECT AVG(`SurfaceArea`) AS "Media de Area de todos los paises" 
FROM `world`.`country`;

/*8. Retorne a média da área dos países da Europa.*/
SELECT AVG(`SurfaceArea`) AS "Media de Area de Paises", `Continent` AS "Continente" 
FROM `world`.`country` 
WHERE `Continent` = "Europe";


/*9. Retorne o nome do continente e a média da área dos países (que fazem parte do continente).*/
SELECT AVG(`SurfaceArea`) AS "Media Area Paises", `Continent` AS "Nombre de Contienente"
 FROM `world`.`country` 
 GROUP BY `Continent`;

/*10. Retorne o nome do continente e a média da área dos países (que fazem parte do continente).
Ordene pela média da área de maior a menor.*/
SELECT AVG(`SurfaceArea`) AS "Media Area Paises", `Continent` AS "Nombre de Contienente"
 FROM `world`.`country` 
 GROUP BY `Continent` 
 ORDER BY `SurfaceArea` DESC;

/*11. Retorne o nome do continente e a área do maior país (do continente).*/
SELECT `Continent` AS "Nombre Contienente", `SurfaceArea` AS "Area Del Mayor pais" ,`Name` AS "Nombre Pais"
 FROM `world`.`country`
 WHERE `SurfaceArea` = (SELECT max(`SurfaceArea`) from `world`.`country`);

/*12. Retorne o nome do continente e a área do maior país (do continente). Ordene o resultado pela
a área de maior a menor.*/
SELECT MAX(`SurfaceArea`) FROM `world`.`country` GROUP BY `Continent` ;
SELECT `SurfaceArea`,`Name`,`Continent` FROM `world`.`country` GROUP BY `Continent` HAVING MAX(`SurfaceArea`); 
SELECT MAX(`SurfaceArea`),`Continent`,`Name` FROM `world`.`country` GROUP BY `Continent`;
SELECT `Continent`,MAX(`SurfaceArea`) FROM `world`.`country` GROUP BY `Continent`;


/* SELECT brand_name, MAX(list_price) max_list_price
FROM production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
GROUP BY brand_name
ORDER BY brand_name;
*/

/*13. Retorne o nome do país e o total de idiomas que nele se falam.*/
SELECT COUNT(distinct`Language`) AS "Cantidad de Idiomas",`Name` AS "Nombre Pais",`Continent` AS "Continente"
FROM `world`.`countrylanguage` a 
INNER JOIN `world`.`country` b 
ON b.Code = a.CountryCode 
GROUP BY `CountryCode`;


/*14. Retorne o nome do país e o total de idiomas que nele se falam. Limite o resultado apenas aos
países nos quais se fala mais que 10 idiomas.*/
SELECT COUNT(distinct`Language`)AS "Cantidad de Idiomas",`Name` AS "Nombre Pais",`Continent`AS "Continente"
 FROM `world`.`countrylanguage` a
 INNER JOIN `world`.`country` b 
 ON b.Code = a.CountryCode 
 GROUP BY `CountryCode` 
 HAVING COUNT(`Language`)>10;


/*15. Retorne o nome do país e o total de cidades que nele existem.*/
SELECT  b.`Name` AS "Nombre Pais", COUNT(DISTINCT a.`Name`) AS "Cantidad de Ciudades" 
FROM `world`.`country` b 
INNER JOIN `world`.`city` a 
ON a.CountryCode = b.Code 
GROUP BY b.`Name`;

/*16. Retorne o nome do país em conjunto com a média de população das cidades (do país).*/
SELECT a.`Name`AS "Nombre Pais", AVG(b.`Population`) AS "Media de Pobleacion"
FROM `world`.`country` a 
INNER JOIN `world`.`city` b 
ON a.Code = b.CountryCode 
GROUP BY b.`CountryCode`;

/*17. Retorne o nome do país em conjunto com a média de população das cidades (do país). Ordene
da menor a maior pela média da população.*/
SELECT a.`Name`AS "Nombre Pais", AVG(b.`Population`) AS "Media de Poblacion"
FROM `world`.`country` a 
INNER JOIN `world`.`city` b 
ON a.Code = b.CountryCode 
GROUP BY b.`CountryCode` 
ORDER BY (AVG(`Population`)) ASC ;


/*18. Retorne o nome do país em conjunto com a média de população das cidades (do país). Limite
o resultado apenas pelos países cuja média de população das cidades seja maior que 70000.
Ordene o resultado de forma ascendente.*/
SELECT a.`Name` AS "Nombre Pais", AVG(b.`Population`) AS "Media de Poblacion" 
FROM `world`.`country` a 
INNER JOIN `world`.`city` b 
ON a.Code = b.CountryCode 
GROUP BY b.`CountryCode` 
HAVING (AVG(b.Population) > 70000) 
ORDER BY (AVG(`Population`)) ASC ;

/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/*Utilizando a base de dados SAKILA, resolva os seguintes exercícios.*/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/
/*19. Some o total de pagamentos realizados.*/
SELECT SUM(`amount`) AS "Total de Pagos realizados" 
FROM `sakila`.`payment`;


/*20. Calcula a média dos pagamentos realizados.*/
SELECT AVG(`amount`) AS "Media de Pagos Realizados" 
FROM `sakila`.`payment`;

/*21. Retorne o id, nome e sobrenome do cliente (customer), em conjunto com a soma do total de
pagamentos realizados (payment.amout).*/
SELECT a.`customer_id`AS "ID Customer",a.`first_name`AS "Nombre",a.`last_name`AS"Apellido",SUM(b.`amount`) AS "Suma de Pagos"
FROM `sakila`.`customer` a 
INNER JOIN `sakila`.`payment` b 
ON a.customer_id = b.customer_id 
GROUP BY a.`customer_id`;

/*22. Retorne o id, nome e sobrenome do cliente (customer), em conjunto com a soma do total de
pagamentos realizados (payment.amout). Ordene o resultado pelo nome e sobrenome.*/
SELECT a.`customer_id`AS "ID Customer",a.`first_name`AS "Nombre",a.`last_name`AS"Apellido",SUM(b.`amount`) AS "Suma de Pagos"
FROM `sakila`.`customer` a 
INNER JOIN `sakila`.`payment` b 
ON a.customer_id = b.customer_id 
GROUP BY a.`customer_id` 
ORDER BY a.`first_name`,a.`last_name`;


/*23. Retorne o id, nome e sobrenome do cliente (customer), em conjunto com o total de
pagamentos realizados (payment.amout). Ordene o resultado pelo valor dos pagamentos.
Limite o resultado apenas aos clientes que tenham um montante maior que 100.*/
SELECT a.`customer_id`AS "ID Customer",a.`first_name`AS "Nombre",a.`last_name`AS"Apellido",SUM(b.`amount`) AS "Suma de Pagos"
FROM `sakila`.`customer` a 
INNER JOIN `sakila`.`payment` b 
ON a.customer_id = b.customer_id 
GROUP BY a.`customer_id` 
HAVING (SUM(b.`amount`)>100)
ORDER BY (SUM(b.`amount`));



/*24. Retorne do staff o id, nome, sobrenome além do total de cobranças (payment) feitas por cada
integrante.*/
SELECT a.`staff_id`AS "Id Staff",a.`first_name`AS "Nombre",a.`last_name`AS "Apellido", SUM(b.`amount`)AS "Total Cobrado" 
FROM `sakila`.`staff` a 
INNER JOIN `sakila`.`payment` b 
ON a.`staff_id` = b.`staff_id`
GROUP BY a.`staff_id`;


/*25. Retorne do staff o id, nome e sobrenome além do total de cobranças (payment) feitas por cada
integrante. Limite a data (payment_date) dos pagamentos entre '2005-05-25' e '2005-08-23'.*/
SELECT a.`staff_id`AS "Id Staff",a.`first_name`AS "Nombre",a.`last_name`AS "Apellido", SUM(b.`amount`)AS "Total Cobrado" 
FROM `sakila`.`staff` a 
INNER JOIN `sakila`.`payment` b 
ON a.`staff_id` = b.`staff_id`
WHERE b.`payment_date`
BETWEEN  '2005-05-25' AND '2005-08-23'
GROUP BY a.`staff_id`;


/*26. Retorne o id, nome e sobrenome dos autores além do total de filmes dos quais cada um já
participou.*/
SELECT a.`actor_id`AS "ID AUTOR",`first_name`AS "Nombre",`last_name`AS "Apellido", COUNT(b.`actor_id`) AS "Cantidad de Peliculas"
FROM `sakila`.`actor` a
INNER JOIN `sakila`.`film_actor` b
ON a.`actor_id` = b.`actor_id`
GROUP BY b.`actor_id`;


/*27. Retorne o id, nome e sobrenome dos autores além do total de filmes dos quais cada um já
participou. Ordene pelo total de filme de menor a maior.*/
SELECT a.`actor_id`AS "ID AUTOR",`first_name`AS "Nombre",`last_name`AS "Apellido", COUNT(b.`actor_id`) AS "Cantidad de Peliculas"
FROM `sakila`.`actor` a
INNER JOIN `sakila`.`film_actor` b
ON a.`actor_id` = b.`actor_id`
GROUP BY b.`actor_id`
ORDER BY (COUNT(b.`actor_id`))ASC;



/*28. Retorne o id, nome e sobrenome dos autores além do total de filmes dos quais cada um já
participou. Filtre pelo id de autor número 100.*/
SELECT a.`actor_id`AS "ID AUTOR",`first_name`AS "Nombre",`last_name`AS "Apellido", COUNT(b.`actor_id`) AS "Cantidad de Peliculas"
FROM `sakila`.`actor` a
INNER JOIN `sakila`.`film_actor` b
ON a.`actor_id` = b.`actor_id`
Where a.`actor_id` = 100;




/*29. Conte o total de filmes por categoria. */
SELECT a.`name`AS"Nombre Categoria",COUNT(`film_id`) AS "Cantidad de Peliculas"
FROM `sakila`.`category` a
INNER JOIN `sakila`.`film_category` b
ON a.`category_id` = b.`category_id`
GROUP BY (b.`category_id`);