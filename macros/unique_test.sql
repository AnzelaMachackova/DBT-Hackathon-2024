{% macro unique_test(model, column_name) %}
    select
        {{ column_name }},
        count(*) as occurrences
    from {{ model }}
    group by {{ column_name }}
    having count(*) > 1
{% endmacro %}