{{ 
    config(target_schema = 'raw', materialized='view') 
}}

with profile_src as (
select  
$1:id ::varchar as id,
$1:age ::number as age, 
$1:became_member_on ::number as became_member_on,
$1:gender ::varchar as gender,
$1:income ::float as income
from  {{ source ('profile_vw','profile') }}
)

select * from profile_src