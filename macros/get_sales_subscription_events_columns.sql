{% macro get_sales_subscription_events_columns() %}

{% set columns = [
    {"name": "_filename", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "_index", "datatype": dbt_utils.type_int()},
    {"name": "account_number", "datatype": dbt_utils.type_int()},
    {"name": "app_apple_id", "datatype": dbt_utils.type_int()},
    {"name": "app_name", "datatype": dbt_utils.type_string()},
    {"name": "cancellation_reason", "datatype": dbt_utils.type_string()},
    {"name": "consecutive_paid_periods", "datatype": dbt_utils.type_int()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "days_before_canceling", "datatype": dbt_utils.type_string()},
    {"name": "days_canceled", "datatype": dbt_utils.type_string()},
    {"name": "device", "datatype": dbt_utils.type_string()},
    {"name": "event", "datatype": dbt_utils.type_string()},
    {"name": "event_date", "datatype": dbt_utils.type_string()},
    {"name": "marketing_opt_in_duration", "datatype": dbt_utils.type_string()},
    {"name": "original_start_date", "datatype": dbt_utils.type_string()},
    {"name": "previous_subscription_apple_id", "datatype": dbt_utils.type_string()},
    {"name": "previous_subscription_name", "datatype": dbt_utils.type_string()},
    {"name": "proceeds_reason", "datatype": dbt_utils.type_string()},
    {"name": "promotional_offer_id", "datatype": dbt_utils.type_string()},
    {"name": "promotional_offer_name", "datatype": dbt_utils.type_string()},
    {"name": "quantity", "datatype": dbt_utils.type_int()},
    {"name": "standard_subscription_duration", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "subscription_apple_id", "datatype": dbt_utils.type_int()},
    {"name": "subscription_group_id", "datatype": dbt_utils.type_int()},
    {"name": "subscription_name", "datatype": dbt_utils.type_string()},
    {"name": "subscription_offer_duration", "datatype": dbt_utils.type_string()},
    {"name": "subscription_offer_type", "datatype": dbt_utils.type_string()},
    {"name": "vendor_number", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
