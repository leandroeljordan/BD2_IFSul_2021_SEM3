/*1. Conte o total de países.*/
SELECT COUNT(*) from `world`.`country`;

/*2. Retorne o nome dos continentes e o total de países que neles existem.*/
SELECT COUNT(*) AS "Cantidad de Paises por continente",`Continent` AS "Continentes" FROM `world`.`country` GROUP BY (`Continent`);

/*3. Retorne o nome dos continentes e o total de países que neles existem. Ordene o resultado em
ordem alfabética pelo nome do continente.*/
SELECT COUNT(*) AS "Cantidad de Paises por continente",`Continent` AS "Continentes" FROM `world`.`country` GROUP BY (`Continent`) Order BY (`Continent`) ASC;

/*4. Retorne o nome dos continentes e o total de países que nele existem. Filtre os continentes que
possuem mais que 50 países.*/
SELECT COUNT(*) AS "Cantidad de Paises por continente",`Continent` AS "Continentes" FROM `world`.`country` GROUP BY (`Continent`) HAVING COUNT(*) > 50;

/*5. Retorne a área do maior país.*/
SELECT `Name`,`SurfaceArea` From `world`.`country` WHERE `SurfaceArea` = (Select max(`SurfaceArea`) FROM `world`.`country`);


/*6. Retorne a área do menor país.*/
SELECT `Name`,`SurfaceArea` FROM `world`.`country` WHERE `SurfaceArea` = (SELECT min(`SurfaceArea`) FROM `world`.`country`);



/*7. Retorne a média da área de todos os países.*/
SELECT AVG(`SurfaceArea`) AS "Media de Area de todos los paises" FROM `world`.`country`;

/*8. Retorne a média da área dos países da Europa.*/
SELECT AVG(`SurfaceArea`) AS "Media de Area de Paises", `Continent` AS "Continente" FROM `world`.`country` WHERE `Continent` = "Europe";


/*9. Retorne o nome do continente e a média da área dos países (que fazem parte do continente).*/
SELECT AVG(`SurfaceArea`) AS "Media Area Paises", `Continent` AS "Nombre de Contienente" FROM `world`.`country` GROUP BY `Continent`;

/*10. Retorne o nome do continente e a média da área dos países (que fazem parte do continente).
Ordene pela média da área de maior a menor.*/
SELECT AVG(`SurfaceArea`) AS "Media Area Paises", `Continent` AS "Nombre de Contienente" FROM `world`.`country` GROUP BY `Continent` ORDER BY `SurfaceArea` DESC;

/*11. Retorne o nome do continente e a área do maior país (do continente).*/
SELECT `Continent` AS "Nombre Contienente", `SurfaceArea` AS "Area Del Mayor pais" ,`Name` AS "Nombre Pais" FROM `world`.`country` WHERE `SurfaceArea` = (SELECT max(`SurfaceArea`) from `world`.`country`);

/*12. Retorne o nome do continente e a área do maior país (do continente). Ordene o resultado pela
a área de maior a menor.*/
SELECT `Continent`,`Name`,MAX(`SurfaceArea`) FROM `world`.`country` INNER JOIN `world`.`country` ON `Continent` = `Contient` group by `Continent`;
SELECT * FROM `world`.`country`;

/* SELECT brand_name, MAX(list_price) max_list_price
FROM production.products p
INNER JOIN production.brands b ON b.brand_id = p.brand_id
GROUP BY brand_name
ORDER BY brand_name;
*/

/*13. Retorne o nome do país e o total de idiomas que nele se falam.*/


/*14. Retorne o nome do país e o total de idiomas que nele se falam. Limite o resultado apenas aos
países nos quais se fala mais que 10 idiomas.*/


/*15. Retorne o nome do país e o total de cidades que nele existem.*/


/*16. Retorne o nome do país em conjunto com a média de população das cidades (do país).*/


/*17. Retorne o nome do país em conjunto com a média de população das cidades (do país). Ordene
da menor a maior pela média da população.*/


/*18. Retorne o nome do país em conjunto com a média de população das cidades (do país). Limite
o resultado apenas pelos países cuja média de população das cidades seja maior que 70000.
Ordene o resultado de forma ascendente.
Utilizando a base de dados SAKILA, resolva os seguintes exercícios.*/


/*19. Some o total de pagamentos realizados.*/


/*20. Calcula a média dos pagamentos realizados.*/


/*21. Retorne o id, nome e sobrenome do cliente (customer), em conjunto com a soma do total de
pagamentos realizados (payment.amout).*/


/*22. Retorne o id, nome e sobrenome do cliente (customer), em conjunto com a soma do total de
pagamentos realizados (payment.amout). Ordene o resultado pelo nome e sobrenome.*/


/*23. Retorne o id, nome e sobrenome do cliente (customer), em conjunto com o total de
pagamentos realizados (payment.amout). Ordene o resultado pelo valor dos pagamentos.
Limite o resultado apenas aos clientes que tenham um montante maior que 100.*/


/*24. Retorne do staff o id, nome, sobrenome além do total de cobranças (payment) feitas por cada
integrante.*/


/*25. Retorne do staff o id, nome e sobrenome além do total de cobranças (payment) feitas por cada
integrante. Limite a data (payment_date) dos pagamentos entre '2005-05-25' e '2005-08-23'.*/


/*26. Retorne o id, nome e sobrenome dos autores além do total de filmes dos quais cada um já
participou.*/


/*27. Retorne o id, nome e sobrenome dos autores além do total de filmes dos quais cada um já
participou. Ordene pelo total de filme de menor a maior.*/


/*28. Retorne o id, nome e sobrenome dos autores além do total de filmes dos quais cada um já
participou. Filtre pelo id de autor número 100.*/


/*29. Conte o total de filmes por categoria. */