{% macro validate_values(result, expected_value) %}

    {% if result == expected_value %}
        {{ return("SUCCESS") }}
    {% else %}
        {{ return("FAILED") }}
    {% endif %}

{% endmacro %}