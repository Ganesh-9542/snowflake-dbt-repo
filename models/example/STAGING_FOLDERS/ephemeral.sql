{{config(materialized = 'ephemeral')}}

select ENAME,
       JOB,
       HIREDATE
from {{source('siva','EMP')}}



