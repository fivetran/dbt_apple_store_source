{% macro get_app_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "app_opt_in_rate", "datatype": dbt_utils.type_int()},
    {"name": "asset_token", "datatype": dbt_utils.type_string()},
    {"name": "icon_url", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "ios", "datatype": "boolean"},
    {"name": "is_bundle", "datatype": "boolean"},
    {"name": "is_enabled", "datatype": "boolean"},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "pre_order_info", "datatype": dbt_utils.type_string()},
    {"name": "tvos", "datatype": "boolean"}
] %}

{{ return(columns) }}

{% endmacro %}
