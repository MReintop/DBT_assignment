
      update "dellstore"."public"."first_name_count_price_snapshot"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "first_name_count_price_snapshot__dbt_tmp151220077898" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "dellstore"."public"."first_name_count_price_snapshot".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      and "dellstore"."public"."first_name_count_price_snapshot".dbt_valid_to is null;

    insert into "dellstore"."public"."first_name_count_price_snapshot" ("firstname", "sum", "no_of_movies", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."firstname",DBT_INTERNAL_SOURCE."sum",DBT_INTERNAL_SOURCE."no_of_movies",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "first_name_count_price_snapshot__dbt_tmp151220077898" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  