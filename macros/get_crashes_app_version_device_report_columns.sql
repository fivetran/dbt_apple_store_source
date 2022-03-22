{% macro get_crashes_app_version_device_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "app_id", "datatype": dbt_utils.type_int()},
    {"name": "app_version", "datatype": dbt_utils.type_string()},
    {"name": "crashes", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": dbt_utils.type_timestamp()},
    {"name": "device", "datatype": dbt_utils.type_string()},
    {"name": "meets_threshold", "datatype": "boolean"}
] %}

{{ return(columns) }}

{% endmacro %}
