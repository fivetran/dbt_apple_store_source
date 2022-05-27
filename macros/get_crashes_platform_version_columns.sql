{% macro get_crashes_platform_version_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "app_id", "datatype": dbt_utils.type_int()},
    {"name": "crashes", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": dbt_utils.type_timestamp()},
    {"name": "device", "datatype": dbt_utils.type_string()},
    {"name": "meets_threshold", "datatype": "boolean"},
    {"name": "platform_version", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
