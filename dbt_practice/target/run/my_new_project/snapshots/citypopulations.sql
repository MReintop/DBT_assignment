
      

  create  table "world"."public"."citypopulations_snapshot"
  as (
    

    select *,
        md5(coalesce(cast(id as varchar ), '')
         || '|' || coalesce(cast('2021-10-05 08:54:24.181281'::timestamp without time zone as varchar ), '')
        ) as dbt_scd_id,
        '2021-10-05 08:54:24.181281'::timestamp without time zone as dbt_updated_at,
        '2021-10-05 08:54:24.181281'::timestamp without time zone as dbt_valid_from,
        nullif('2021-10-05 08:54:24.181281'::timestamp without time zone, '2021-10-05 08:54:24.181281'::timestamp without time zone) as dbt_valid_to
    from (
        



SELECT * FROM citypopulations

    ) sbq


  );
  