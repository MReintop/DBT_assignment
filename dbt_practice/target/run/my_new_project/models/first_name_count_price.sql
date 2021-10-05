

  create  table "dellstore"."public"."first_name_count_price__dbt_tmp"
  as (
    

select substring(actor, 1, strpos(actor, ' ')) as firstname, sum(price), count(*) no_of_movies FROM "dellstore"."public"."products" GROUP BY firstname
  );