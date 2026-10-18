{{
    config(
        materialized = 'incremental',
        alias = 'emp_tgt',
        transient = false,
        unique_key = 'id',
        schema = 'DBT_STAGE_DWH',
        on_schema_change = 'append_new_columns'
        )
        }}

select * from {{source('Ganesh','emp_stg')}}

{% if is_incremental()%}

where updated_at > (select max(updated_at) from {{this}})

{% endif %}