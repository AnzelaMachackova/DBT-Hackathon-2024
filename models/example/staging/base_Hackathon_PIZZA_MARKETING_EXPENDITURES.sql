with source as (
      select * from {{ source('Hackathon', 'PIZZA_MARKETING_EXPENDITURES') }}
),
renamed as (
    select
        {{ adapter.quote("EXPENDITURE_DATE") }},
        {{ adapter.quote("EXPENDITURES_SUM") }}

    from source
)
select * from renamed
  