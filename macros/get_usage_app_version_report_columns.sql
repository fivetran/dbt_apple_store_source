{% macro get_usage_app_version_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "active_devices", "datatype": dbt_utils.type_int()},
    {"name": "active_devices_last_30_days", "datatype": dbt_utils.type_int()},
    {"name": "app_id", "datatype": dbt_utils.type_int()},
    {"name": "app_version", "datatype": dbt_utils.type_string()},
    {"name": "date", "datatype": dbt_utils.type_timestamp()},
    {"name": "deletions", "datatype": dbt_utils.type_int()},
    {"name": "installations", "datatype": dbt_utils.type_int()},
    {"name": "meets_threshold", "datatype": "boolean"},
    {"name": "sessions", "datatype": dbt_utils.type_int()},
    {"name": "source_type", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
