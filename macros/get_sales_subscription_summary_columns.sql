{% macro get_sales_subscription_summary_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "vendor_number", "datatype": dbt.type_int()},
    {"name": "active_free_trial_introductory_offer_subscriptions", "datatype": dbt.type_int()},
    {"name": "active_pay_as_you_go_introductory_offer_subscriptions", "datatype": dbt.type_int()},
    {"name": "active_pay_up_front_introductory_offer_subscriptions", "datatype": dbt.type_int()},
    {"name": "active_standard_price_subscriptions", "datatype": dbt.type_int()},
    {"name": "app_apple_id", "datatype": dbt.type_int()},
    {"name": "app_name", "datatype": dbt.type_string()},
    {"name": "billing_retry", "datatype": dbt.type_int()},
    {"name": "client", "datatype": dbt.type_string()},
    {"name": "country", "datatype": dbt.type_string()},
    {"name": "customer_currency", "datatype": dbt.type_string()},
    {"name": "customer_price", "datatype": dbt.type_float()},
    {"name": "date", "datatype": "date"},
    {"name": "developer_proceeds", "datatype": dbt.type_float()},
    {"name": "device", "datatype": dbt.type_string()},
    {"name": "free_trial_offer_code_subscriptions", "datatype": dbt.type_int()},
    {"name": "free_trial_promotional_offer_subscriptions", "datatype": dbt.type_int()},
    {"name": "grace_period", "datatype": dbt.type_int()},
    {"name": "marketing_opt_ins", "datatype": dbt.type_int()},
    {"name": "pay_as_you_go_offer_code_subscriptions", "datatype": dbt.type_int()},
    {"name": "pay_as_you_go_promotional_offer_subscriptions", "datatype": dbt.type_int()},
    {"name": "pay_up_front_offer_code_subscriptions", "datatype": dbt.type_int()},
    {"name": "pay_up_front_promotional_offer_subscriptions", "datatype": dbt.type_int()},
    {"name": "preserved_pricing", "datatype": dbt.type_string()},
    {"name": "proceeds_currency", "datatype": dbt.type_string()},
    {"name": "proceeds_reason", "datatype": dbt.type_string()},
    {"name": "promotional_offer_id", "datatype": dbt.type_string()},
    {"name": "standard_subscription_duration", "datatype": dbt.type_string()},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "subscription_apple_id", "datatype": dbt.type_int()},
    {"name": "subscription_group_id", "datatype": dbt.type_int()},
    {"name": "subscription_name", "datatype": dbt.type_string()},
    {"name": "subscription_offer_name", "datatype": dbt.type_string()},
    {"name": "subscribers", "datatype": dbt.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}