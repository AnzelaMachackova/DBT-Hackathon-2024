{% macro logging(table_name, column_name, test_name, result, validation) %}

    INSERT INTO Log_Table (table_name, column_name, test_name, result, validation, Timestamp)
    VALUES ( {{ table_name }}, {{ column_name }}, {{ test_name }}, {{ result }}, {{ validation }}, CURRENT_TIMESTAMP());

{% endmacro %}