{% macro get_app_session_daily_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt.type_string()},
    {"name": "app_id", "datatype": dbt.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "app_version", "datatype": dbt.type_string()},
    {"name": "device", "datatype": dbt.type_string()},
    {"name": "platform_version", "datatype": dbt.type_string()},
    {"name": "source_type", "datatype": dbt.type_string()},
    {"name": "page_type", "datatype": dbt.type_string()},
    {"name": "app_download_date", "datatype": "date"},
    {"name": "territory", "datatype": dbt.type_string()},
    {"name": "sessions", "datatype": dbt.type_int()},
    {"name": "total_session_duration", "datatype": dbt.type_int()},
    {"name": "unique_devices", "datatype": dbt.type_int()},
    {"name": "source_info", "datatype": dbt.type_string()},
    {"name": "page_title", "datatype": dbt.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}

