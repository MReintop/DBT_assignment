SELECT CONCAT(country_name, '|', city_name) id , country_name
, city_name
, ROUND(city_pop/country_pop::decimal, 3)*100 percent_of_country_pop
, RANK() OVER (PARTITION BY country_name ORDER BY city_pop DESC) city_rank_in_country FROM
(
SELECT name city_name, countrycode, population city_pop from city
) c1
JOIN
(
SELECT name country_name, code, population country_pop from country
) co
ON c1.countrycode = co.code