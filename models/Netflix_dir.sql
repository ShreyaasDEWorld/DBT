{{ config(materialized='table') }}

SELECT show_id, type, title, TRIM(SPLIT_PART(director, ',', 1)) AS director
FROM dev.netflix_titles
UNION ALL
SELECT show_id, type, title, TRIM(SPLIT_PART(director, ',', 2)) AS director
FROM dev.netflix_titles
WHERE director LIKE '%,%' 
