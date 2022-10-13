{% macro get_date_from_string(string_text) %}
  {{ return(adapter.dispatch('get_date_from_string') (string_text)) }}
{% endmacro %}


{% macro default__get_date_from_string(string_text) %}

    to_date(
      {{ string_text }}, 
      'YYYYMMDD'
    )

{% endmacro %}


{% macro bigquery__get_date_from_string(string_text) %}

    parse_date(
      '%Y%m%d',
      {{ string_text }}
    )

{% endmacro %}


{% macro !!!!!!! REPLACE 'spark' WITH 'spark','databricks' OR EQUIV !!!!!!!__get_date_from_string(string_text) %}

    to_date(
      {{ string_text }},
      'yyyyMMdd'
    )

{% endmacro %}