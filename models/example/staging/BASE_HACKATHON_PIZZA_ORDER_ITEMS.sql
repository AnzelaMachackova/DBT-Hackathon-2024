with source as (
      select * from {{ source('Hackathon', 'PIZZA_ORDER_ITEMS') }}
),
renamed as (
    select
        {{ adapter.quote("ID") }},
        {{ adapter.quote("ORDER_ID") }},
        {{ adapter.quote("PRODUCT_ID") }},
        {{ adapter.quote("PRODUCT_NAME") }},
        {{ adapter.quote("PRODUCT_CATEGORY_ID") }},
        {{ adapter.quote("CATEGORY_NAME") }},
        {{ adapter.quote("ITEM_TYPE") }},
        {{ adapter.quote("QUANTITY") }},
        {{ adapter.quote("ORDER_ITEM_TOPPINGS_TOTAL_PRICE_CZK_WITHOUT_VAT") }},
        {{ adapter.quote("ORDER_ITEM_TOTAL_PRICE_CZK_WITHOUT_VAT") }},
        {{ adapter.quote("PRODUCT_IMAGE") }},
        {{ adapter.quote("PRODUCT_DESCRIPTION") }}

    from source
)
select * from renamed
  