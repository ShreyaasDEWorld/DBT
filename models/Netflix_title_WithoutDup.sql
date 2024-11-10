{{ config(materialized='table') }}
with cte as (
select *,
ROW_NUMBER() over (partition by lower(title),type order by show_id) as rn 
from dev.netflix_titles )
select * from cte where   rn=1