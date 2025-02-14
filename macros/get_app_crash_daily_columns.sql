{% macro get_app_crash_daily_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt.type_string()},
    {"name": "app_id", "datatype": dbt.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "app_version", "datatype": dbt.type_string()},
    {"name": "device", "datatype": dbt.type_string()},
    {"name": "platform_version", "datatype": dbt.type_string()},
    {"name": "crashes", "datatype": dbt.type_int()},
    {"name": "unique_devices", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}