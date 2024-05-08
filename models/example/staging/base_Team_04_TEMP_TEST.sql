with source as (
      select * from {{ source('Team_04', 'TEMP_TEST') }}
),
renamed as (
    select
        {{ adapter.quote("COLUMN_NAME") }},
        {{ adapter.quote("TEST_TYPE") }},
        {{ adapter.quote("TEST_NAME") }},
        {{ adapter.quote("ALLOWED_VALUES") }}

    from source
)
select * from renamed
  