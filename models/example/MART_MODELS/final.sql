{{
    config(
    materialized = 'incremental',
    alias = 'emp_tgt',
    schema = 'DWH',
    transient = false
    )
    }}

select * from {{source('Ganesh','emp_stg')}} 

{% if is_incremental() %}

where not exists (
    select 1
    from  {{this}} as tgt
    where tgt.id = emp_stg.id
)

{% endif %}