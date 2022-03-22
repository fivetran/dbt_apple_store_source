{% macro get_downloads_device_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "app_id", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": dbt_utils.type_timestamp()},
    {"name": "device", "datatype": dbt_utils.type_string()},
    {"name": "first_time_downloads", "datatype": dbt_utils.type_int()},
    {"name": "meets_threshold", "datatype": "boolean"},
    {"name": "redownloads", "datatype": dbt_utils.type_int()},
    {"name": "source_type", "datatype": dbt_utils.type_string()},
    {"name": "total_downloads", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
