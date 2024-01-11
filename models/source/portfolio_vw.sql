{{ 
    config( materialized='view') 
}}

with portfolio_src as (
select  
$1:id ::varchar as id, 
$1:offer_type ::varchar as offer_type,
$1:difficulty ::number as difficulty,
$1:reward ::number as reward,
$1:duration ::number as duration,
$1:channels ::array as channels
from  {{ source ('portfolio_vw','portfolio') }}
)

select * from portfolio_src