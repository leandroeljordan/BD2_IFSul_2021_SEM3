SELECT * FROM sakila.customer;
SELECT * FROM sakila.store;
SELECT * FROM sakila.inventory;
SELECT * FROM sakila.payment;
SELECT * FROM sakila.rental;
SELECT * FROM sakila.staff;

/*
1. Programe um comando SQL para retornar o código do cliente e a soma do total de
pagamentos realizados. Filtre os clientes pelos códigos 2, 11, 20 e 37.
*/
SELECT customer_id AS "Id Cliente",COUNT(payment_id) AS "Total Pagos Realizados"
 FROM sakila.payment
 WHERE customer_id IN(2,11,20,27)
 GROUP BY customer_id  ;


/*2. Programe um comando SQL que retorne o código do cliente, nome, sobrenome e o total de
pagamentos realizados. Filtre os clientes pelos códigos 2, 11, 20 e 37.*/
SELECT b.customer_id AS "Id Cliente",b.first_name AS "Nombre",b.last_name AS "Apellido",SUM(a.payment_id) AS "Total Pagos Realizados"
FROM sakila.payment a
INNER JOIN sakila.customer b
ON b.customer_id = a.customer_id
WHERE b.customer_id IN(2,11,20,27)
GROUP BY b.customer_id  ;



/*3. Programe um comando SQL que retorne o código do cliente, nome, sobrenome e a soma do
total de pagamentos realizados. Filtre o nome do cliente cujo nome seja igual a ‘ELLEN’. Filtre
o total de pagamentos realizados para retornar apenas os valores entre 100 e 125.*/
SELECT b.customer_id AS "Id Cliente",b.first_name AS "Nombre",b.last_name AS "Apellido",SUM(a.amount) AS "Total Pagos Realizados"
FROM sakila.payment a
INNER JOIN sakila.customer b
ON b.customer_id = a.customer_id
WHERE b.first_name = "ELLEN"
HAVING (SUM(a.amount)) BETWEEN 100 AND 125;




/*4. Programe um comando SQL que retorne o código da categoria, o nome e a média de tempo
dos filmes que a ela pertencem.*/

SELECT a.category_id AS "ID Categoria",a.name AS "Nombre Categoria",AVG(c.length) AS "Media Duración Peliculas"
FROM sakila.category a
INNER JOIN sakila.film_category b
ON a.category_id = b.category_id
INNER JOIN sakila.film c
ON b.film_id = c.film_id
GROUP BY a.category_id;




/*5. Ordene a consulta resultante da questão número 4 por média de tempo em ordem
descendente. Filtre a média de tempo para retornar apenas os filmes com a média entre 120 e
130.*/
SELECT a.category_id AS "ID Categoria",a.name AS "Nombre Categoria",AVG(c.length) AS "Media Duración Peliculas"
FROM sakila.category a
INNER JOIN sakila.film_category b
ON a.category_id = b.category_id
INNER JOIN sakila.film c
ON b.film_id = c.film_id
GROUP BY a.category_id
HAVING AVG(c.length) BETWEEN 120 AND 130
ORDER BY AVG(c.length) DESC;



/*6. Programe um comando SQL para retornar o nome do país, nome da cidade, nome, sobrenome
e e-mail do cliente. Inclua também o endereço, o telefone e o código postal. Retorne apenas os
clientes cujo nome do país inicie com a letra ‘A’ ou que contenha o valor ‘nada’ em qualquer
lugar do nome.*/

SELECT country AS "Pais",
city AS "Ciudad",
first_name AS "Nombre Cliente",
last_name AS "Apellido Cliente",
email,
address AS "Dirección",
phone AS "Teléfono",
postal_code AS "Código Postal"
FROM sakila.customer a
INNER JOIN sakila.address b
ON a.address_id = b.address_id
INNER JOIN sakila.city c
ON b.city_id = c.city_id
INNER JOIN sakila.country d
ON c.country_id = d.country_id;





/*7. Programe um comando SQL para retornar do ator o código, nome, sobrenome e total de filmes
nos quais ele atuou. Retorne apenas o autor com o maior número de filmes.*/

SELECT 	actor_id AS "Codigo Actor",
		first_name AS "Nombre",
		last_name AS "Apellido",
		MAX(cuenta) AS "Cantidad de Peliculas"
FROM (
		SELECT COUNT(af.`film_id`) cuenta ,ac.`first_name` ,ac.`last_name` ,af.`actor_id` 
		FROM
		`sakila`.`film_actor` af
        INNER JOIN `sakila`.`actor` ac
        ON af.actor_id = ac.actor_id
        GROUP BY af.`actor_id`
) AS mycount
;

/*8. Programe um comado SQL para retornar o nome do país, nome da cidade, nome, sobrenome e
email do cliente. Também retorne o endereço, telefone e código postal. Filtre os países que
iniciam com a letra ‘A’ ou que contém ‘nada’ em alguma parte do nome.*/

SELECT 	pais.`country` AS "País", 					/* Selecciones de tabla PAIS*/
		city.`city` AS "Ciudad",  					/*Seleccion de Nombre Ciudad*/
        cus.`first_name` AS "Nombre Cliente",		/**/
        cus.`last_name` AS "Apellido Cliente",		/**/
        cus.`email` AS "Email Cliente", 			/*SELEC DE TABLA CLIENTE*/
		adr.`address` AS "Dirección Cliente", 		/*SELECT Tabla Direcciones*/
        adr.`phone` AS "Teléfono", 					/**/
        adr.`postal_code` AS  "Código Postal"		/**/
        
FROM `sakila`.`customer` cus
INNER JOIN `sakila`.`address` adr
ON cus.`address_id` = adr.`address_id`
INNER JOIN `sakila`.`city` city
ON adr.`city_id` = city.`city_id`
INNER JOIN `sakila`.`country` pais
ON city.`country_id` = pais.`country_id`
WHERE pais.`country` LIKE '%nada%'
   OR pais.`country` LIKE 'A%';

/*9. Programe um comando SQL que sem utilizar o comando inner join faça a junção das tabelas
country e city. Retorne o nome do país e o nome da cidade. Ordene o nome do país de forma
descendentes e o nome da cidade de forma ascendente.*/
SELECT 	country.`country` AS "Nombre Pais",
		city AS "Nombre Ciudad"
FROM `sakila`.`city`, `sakila`.`country`
WHERE city.`country_id` = country.`country_id`
ORDER BY `country` DESC, `city` ASC;


/*10. Utilizando o comando CROSS JOIN calcule o tamanho (em número de registros) do produto
cartesiano obtido a partir das tabelas payment e customer, retorne o valor como resultado da
consulta. */
SELECT COUNT(*) AS "PAGOS X CLIENTES"
FROM (
	SELECT payment.payment_id,customer.`customer_id` FROM
    `sakila`.`payment`
    CROSS JOIN
		`sakila`.`customer`
) AS mycount
;

/*11. Supondo que o tamanho médio dos registros da tabela payment seja de 100 bytes e o da
tabela customer seja de 134 bytes, calcule em MB o tamanho do produto cartesiano entre as
duas tabelas.*/

SELECT table_name AS "Tabla",
ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Tamaño (MB)"
FROM information_schema.TABLES
WHERE table_schema = "sakila"
ORDER BY (data_length + index_length) DESC;

SELECT ROUND(((my.data_length + my.index_length) / 1024 / 1024), 2) AS "Tamaño (MB)"
FROM  (
		SELECT information_schema.TABLES FROM `sakila`.`payment` CROSS JOIN `sakila`.`customer`
) AS my
;

SELECT table_name AS "Tabla",
ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Tamaño (MB)"
FROM information_schema.TABLES
WHERE table_name = "payment";

SELECT SUM(mycount) FROM
(SELECT * FROM `sakila`.`payment` CROSS JOIN `sakila`.`customer`
) mycount


/*12. Programe uma consulta SQL que retorne os seguintes campos respeitando a seguinte ordem:
distrito, endereço, nome e sobrenome do cliente, código postal e telefone. Filtre aos clientes
que moram nas distintas cidades dos Estados Unidos ('United States') registradas na base de
dados. Não utilize junções para formar a consulta e sim subqueries. Ordene o resultado da
consulta por distrito, endereço, nome e sobrenome.*/



/*13. Programe uma consulta SQL que retorne o código do funcionário do staff, nome e o
sobrenome. Também deve ser retornado o total de aluguéis incluídos na base de dados por
cada um. Filtre a data dos aluguéis (rental_date) entre '2005-07-29' e '2021-07-30'.*/



/*14. Programe uma consulta SQL que retorne o código e nome do filme assim como o total de
vezes que foi alugado. Ordene a consulta pelo campo total de forma descendente. 
*/
