{% macro apple_store_source_relation(connection_dictionary, single_schema, single_database, single_table_identifier) -%}

{{ adapter.dispatch('apple_store_source_relation', 'apple_store_source') (connection_dictionary, single_schema, single_database, single_table_identifier) }}

{%- endmacro %}

{% macro default__apple_store_source_relation(connection_dictionary, single_schema, single_database, single_table_identifier) -%}

{% if connection_dictionary %}
, _dbt_source_relation as source_relation
{% else %}
, '{{ single_database }}' || '.'|| '{{ single_schema }}' || '.'|| '{{ single_table_identifier }}' as source_relation
{% endif %} 

{%- endmacro %}