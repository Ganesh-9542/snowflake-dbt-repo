{{config(materialized = 'table',schema = 'raw',alias = 'common_table',transient = 'false')}}

with emp as(
    select * from {{source('siva','EMP')}}
),

dept as(
    select * from {{source('siva','DEPT')}}
)

select e.ename,e.job,e.hiredate,e.sal,d.dname,d.loc from emp as e left join dept as d on e.deptno=d.deptno