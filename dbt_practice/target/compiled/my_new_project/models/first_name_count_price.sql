

select substring(actor, 1, strpos(actor, ' ')) as firstname, sum(price), count(*) no_of_movies FROM "dellstore"."public"."products" GROUP BY firstname