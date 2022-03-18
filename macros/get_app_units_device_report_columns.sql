{% macro get_app_units_device_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "app_id", "datatype": dbt_utils.type_int()},
    {"name": "app_units", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": dbt_utils.type_timestamp()},
    {"name": "device", "datatype": dbt_utils.type_string()},
    {"name": "in_app_purchases", "datatype": dbt_utils.type_int()},
    {"name": "meets_threshold", "datatype": "boolean"},
    {"name": "source_type", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
