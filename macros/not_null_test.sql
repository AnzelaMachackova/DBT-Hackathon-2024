{% macro not_null_test(model, column_name) %}
    select
        count(*) as failures
    from {{ model }}
    where {{ column_name }} is null
{% endmacro %}