{{
    config(
        materialized='view',
        query_tag = "DBT",
        secure = true
    )
}}
with source_data as (

    select 1 as id
    union all
    select null as id

),

filtered_data as (
    select *
    from source_data
),

transformed_data as (
    select id, 
           case when id is not null then 'Present' else 'NotPresent' end as id_status
    from filtered_data
)

select *
from transformed_data