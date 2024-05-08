{{
  config(
    materialized = 'table',
    )
}}

with source as (
      select * from {{ source('Team_04', 'METADATA') }}
),

renamed as (
    select
        {{ adapter.quote("DATABASE_NAME") }},
        {{ adapter.quote("SCHEMA_NAME") }},
        {{ adapter.quote("TABLE_NAME") }},
        {{ adapter.quote("COLUMN_NAME") }},
        {{ adapter.quote("TEST_TYPE") }},
        {{ adapter.quote("TEST_NAME") }},
        {{ adapter.quote("ALLOWED_VALUES") }}
        
    from source
)
select * from renamed
  