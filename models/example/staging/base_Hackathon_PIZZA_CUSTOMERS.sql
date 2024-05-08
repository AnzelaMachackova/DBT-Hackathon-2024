with source as (
      select * from {{ source('Hackathon', 'PIZZA_CUSTOMERS') }}
),
renamed as (
    select
        {{ adapter.quote("ID") }},
        {{ adapter.quote("CUSTOMER_STATUS") }},
        {{ adapter.quote("CUSTOMER_TYPE") }},
        {{ adapter.quote("CUSTOMER_CREATED") }},
        {{ adapter.quote("FIRST_NAME_HASH") }},
        {{ adapter.quote("SEX") }},
        {{ adapter.quote("CUSTOMER_EMAIL_HASH") }},
        {{ adapter.quote("CUSTOMER_PHONE_HASH") }},
        {{ adapter.quote("LAST_ORDER_DATE") }},
        {{ adapter.quote("RECENCY_DAYS") }},
        {{ adapter.quote("TRANSACTION_COUNT") }},
        {{ adapter.quote("TOTAL_ORDERED_AMOUNT") }},
        {{ adapter.quote("RECENCY_SCORE") }},
        {{ adapter.quote("FREQUENCY_SCORE") }},
        {{ adapter.quote("MONETARY_SCORE") }},
        {{ adapter.quote("RFM_SCORE") }}

    from source
)
select * from renamed
  