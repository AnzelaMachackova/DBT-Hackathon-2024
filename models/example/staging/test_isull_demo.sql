
with model as ( 
    select * from {{ ref('base_Hackathon_PIZZA_ORDER_ITEMS') }}
),

contract as (
    select * from {{ ref('base_Team_04_TEMP_TEST') }}
)

{% set column_name = "ID" %}



select
    count(*) as failures
from model
where {{column_name}} is nulld