with source as (
      select * from {{ source('Hackathon', 'PIZZA_ORDERS') }}
),
renamed as (
    select
        {{ adapter.quote("ID") }},
        {{ adapter.quote("CUSTOMER_ID") }},
        {{ adapter.quote("ORDER_CREATED") }},
        {{ adapter.quote("ORDER_DELIVERED") }},
        {{ adapter.quote("CUSTOMER_ORDER_NUMBER") }},
        {{ adapter.quote("ORDER_STATUS") }},
        {{ adapter.quote("IS_CANCELED") }},
        {{ adapter.quote("DELIVERY_TYPE") }},
        {{ adapter.quote("ORDER_SOURCE") }},
        {{ adapter.quote("FINAL_ORDER_PRICE_AFTER_DISCOUNT_CZK_WITHOUT_VAT") }},
        {{ adapter.quote("ORDER_TOTAL_PRICE_BEFORE_DISCOUNT_CZK_WITHOUT_VAT") }},
        {{ adapter.quote("ORDER_ITEMS_TOTAL_CZK_WITHOUT_VAT") }},
        {{ adapter.quote("ORDER_TOPPINGS_TOTAL_CZK_WITHOUT_VAT") }},
        {{ adapter.quote("DELIVERY_CHARGE_CZK") }},
        {{ adapter.quote("DISCOUNT_SUM_CZK") }},
        {{ adapter.quote("NUMBER_OF_ITEMS") }},
        {{ adapter.quote("AVG_ITEM_TOTAL") }}

    from source
)
select * from renamed
  