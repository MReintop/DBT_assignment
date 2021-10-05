{% snapshot first_name_count_price_snapshot %}

{{
    config(
        target_database='dellstore',
        target_schema='public',
        strategy='check',
        unique_key='firstname',
        check_cols=['sum', 'no_of_movies']
    )

}}

select * from {{source('movie_dataset', 'first_name_count_price')}}

{% endsnapshot %}
