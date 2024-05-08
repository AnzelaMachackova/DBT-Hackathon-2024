{% macro supertest2(model, column_name, contract) %}

select * from {{ contract }}

{% set get_column_id %}
  select * from {{contract}}
{% endset %}

{% set results = run_query(get_column_id) %}
{{ log(results, info=True) }}

{% if execute and results %}
    
    {#- Extract the distinct values from the first column of the results -#}
    {% set value_rows = results.columns[0].values() %}
    
    {#- Convert these values into a list -#}
    {% set value_list = [] %}
    {% for row in results %}
      {% do value_list.append(row) %}
      {{ log(row, info=True) }}
      select * from {{row}}
    {% endfor %}
    
    {#- Return the list of values -#}
    {{ return("select 1 as id") }}
    
  {% else %}
    {#- Return an empty list if no results are available -#}
    {{ return([]) }}
  {% endif %}

{{ log(results, info=True) }}

{%  endmacro %}