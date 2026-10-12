{{config(materialized = 'view')}}


select * from raw.employee
where department = 'Engineering'