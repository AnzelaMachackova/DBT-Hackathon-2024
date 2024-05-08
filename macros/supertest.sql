{% macro supertest(model, contract) %}
    {% set model = ref(model) %}
    {% set ref_table = ref(contract) %}
    {% set query %}
        select COLUMN_NAME, TEST_TYPE, ALLOWED_VALUES from {{ ref(contract) }}
    {% endset %}
    {% set results = run_query(query) %}
        {% if execute %}
            {% set rows = results.rows %}
            {{ log("showing some rows: " ~ rows, info=True) }}
            {% for row in rows %}
                {% set column_name = row[0] %}
                {% set test_name = row[1] %}
                {{ log("Processing column: " ~ column_name ~ " for test: " ~ test_name, info=True) }}
                {% if test_name == 'not_null' %}
                    {% set null_test_sql = not_null_test(model=model, column_name=column_name) %}
                    {{ log("Generated SQL for NOT_NULL test: " ~ null_test_sql, info=True) }}
                    {% set query_result = run_query(null_test_sql) %}
                    {% set rows = query_result.rows %}
                    {{ log("SQL result for NOT_NULL test: " ~ rows[0], info=True) }}
                {% elif test_name == 'unique' %}
                    {% set unique_test_sql = unique_test(model=model, column_name=column_name) %}
                    {{ log("Generated SQL for UNIQUE test: " ~ unique_test_sql, info=True) }}
                    {% set query_result = run_query(unique_test_sql) %}
                    {% set rows = query_result.rows %}
                    {{ log("SQL result for UNIQUE test: " ~ rows, info=True) }}
                {% endif %}
            {% endfor %}
        {% endif %}
{% endmacro %}