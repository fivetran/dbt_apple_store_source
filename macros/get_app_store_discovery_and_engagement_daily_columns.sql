{% macro get_app_store_discovery_and_engagement_daily_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt.type_string()},
    {"name": "app_id", "datatype": dbt.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "event", "datatype": dbt.type_string()},
    {"name": "page_type", "datatype": dbt.type_string()},
    {"name": "source_type", "datatype": dbt.type_string()},
    {"name": "engagement_type", "datatype": dbt.type_string()},
    {"name": "device", "datatype": dbt.type_string()},
    {"name": "platform_version", "datatype": dbt.type_string()},
    {"name": "territory", "datatype": dbt.type_string()},
    {"name": "counts", "datatype": dbt.type_int()},
    {"name": "unique_counts", "datatype": dbt.type_int()},
    {"name": "page_title", "datatype": dbt.type_string()},
    {"name": "source_info", "datatype": dbt.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}

