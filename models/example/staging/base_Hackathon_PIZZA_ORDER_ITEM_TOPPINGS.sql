with source as (
      select * from {{ source('Hackathon', 'PIZZA_ORDER_ITEM_TOPPINGS') }}
),
renamed as (
    select
        {{ adapter.quote("ID") }},
        {{ adapter.quote("ORDER_ITEM_ID") }},
        {{ adapter.quote("TOPPING_PRICE_CZK_WITHOUT_VAT") }},
        {{ adapter.quote("IS_ACTIVE") }},
        {{ adapter.quote("TOPPING_ID") }},
        {{ adapter.quote("TOPPING_CATEGORY") }},
        {{ adapter.quote("TOPPING_NAME") }}

    from source
)
select * from renamed
  