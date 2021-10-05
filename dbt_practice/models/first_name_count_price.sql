{{
    config(materialized="table")
}}

select substring(actor, 1, strpos(actor, ' ')) as firstname, sum(price), count(*) no_of_movies FROM {{source("movie_dataset", "products")}} GROUP BY firstname
