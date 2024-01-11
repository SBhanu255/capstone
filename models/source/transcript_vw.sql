{{ 
    config(materialized='view') 
}}

with transcript_src  as (
select  
$1:event ::varchar as event, 
$1:person ::varchar as person,
$1:time ::number as time,
$1:value ::variant as value
from  {{ source ('transcript_vw','transcript') }}
)

select * from transcript_src 