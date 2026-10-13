
{{config(materialized = 'view',schema = 'raw')}}

select 
   first_name,
   last_name,
   concat(first_name,last_name) as full_name,
   salary,
   salary + 10000 as new_salary
   from raw.employee