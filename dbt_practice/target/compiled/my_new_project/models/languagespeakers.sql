

SELECT RANK() OVER(ORDER BY speakers desc) as ranking,
language,
speakers
FROM(
SELECT cl.language, ROUND(sum(co.population*cl.percentage/100)::decimal, 0) as speakers FROM (
SELECT code, population FROM country
	) co JOIN (
SELECT countrycode, language, percentage FROM "world"."public"."countrylanguage" ) cl
ON co.code = cl.countrycode
GROUP BY cl.language) T
ORDER BY speakers desc