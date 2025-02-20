{{ config(enabled=var('apple_store__using_subscriptions', False)) }}

with base as (

    select * 
    from {{ ref('stg_apple_store__sales_subscription_summary_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__sales_subscription_summary_tmp')),
                staging_columns=get_sales_subscription_summary_columns()
            )
        }}
        
    
        {{ fivetran_utils.source_relation(
            union_schema_variable='apple_store_union_schemas', 
            union_database_variable='apple_store_union_databases') 
        }}

    from base
),

final as (

    select
        cast(source_relation as {{ dbt.type_string() }}) as source_relation, 
        cast(date as date) as date_day,
        cast(_fivetran_id as {{ dbt.type_string() }}) as _fivetran_id,
        cast(vendor_number as {{ dbt.type_int() }}) as vendor_number,
        cast(app_apple_id as {{ dbt.type_int() }}) as app_apple_id,
        cast(app_name as {{ dbt.type_string() }}) as app_name,
        cast(subscription_name as {{ dbt.type_string() }}) as subscription_name,
        cast(subscription_apple_id as {{ dbt.type_int() }}) as subscription_apple_id,
        cast(subscription_group_id as {{ dbt.type_int() }}) as subscription_group_id,
        cast(standard_subscription_duration as {{ dbt.type_string() }}) as standard_subscription_duration,
        cast(customer_price as {{ dbt.type_float() }}) as customer_price,
        cast(customer_currency as {{ dbt.type_string() }}) as customer_currency,
        cast(developer_proceeds as {{ dbt.type_float() }}) as developer_proceeds,
        cast(proceeds_currency as {{ dbt.type_string() }}) as proceeds_currency,
        cast(preserved_pricing as {{ dbt.type_string() }}) as preserved_pricing,
        cast(proceeds_reason as {{ dbt.type_string() }}) as proceeds_reason,
        cast(subscription_offer_name as {{ dbt.type_string() }}) as subscription_offer_name,
        cast(promotional_offer_id as {{ dbt.type_string() }}) as promotional_offer_id,
        cast(case
            when replace(state, ' ', '') = '' then cast(null as {{ dbt.type_string() }}) else state
        end as {{ dbt.type_string() }}) as state,
        cast(country as {{ dbt.type_string() }}) as country,
        cast(device as {{ dbt.type_string() }}) as device,
        cast('' as {{ dbt.type_string() }}) as source_type, -- adding source_type in order to join with other models downstream
        cast(client as {{ dbt.type_string() }}) as client,
        cast(active_standard_price_subscriptions as {{ dbt.type_int() }}) as active_standard_price_subscriptions,
        cast(active_free_trial_introductory_offer_subscriptions as {{ dbt.type_int() }}) as active_free_trial_introductory_offer_subscriptions,
        cast(active_pay_up_front_introductory_offer_subscriptions as {{ dbt.type_int() }}) as active_pay_up_front_introductory_offer_subscriptions,
        cast(active_pay_as_you_go_introductory_offer_subscriptions as {{ dbt.type_int() }}) as active_pay_as_you_go_introductory_offer_subscriptions,
        cast(free_trial_promotional_offer_subscriptions as {{ dbt.type_int() }}) as free_trial_promotional_offer_subscriptions,
        cast(pay_up_front_promotional_offer_subscriptions as {{ dbt.type_int() }}) as pay_up_front_promotional_offer_subscriptions,
        cast(pay_as_you_go_promotional_offer_subscriptions as {{ dbt.type_int() }}) as pay_as_you_go_promotional_offer_subscriptions,
        cast(marketing_opt_ins as {{ dbt.type_int() }}) as marketing_opt_ins,
        cast(billing_retry as {{ dbt.type_int() }}) as billing_retry,
        cast(grace_period as {{ dbt.type_int() }}) as grace_period,
        cast(free_trial_offer_code_subscriptions as {{ dbt.type_int() }}) as free_trial_offer_code_subscriptions,
        cast(pay_up_front_offer_code_subscriptions as {{ dbt.type_int() }}) as pay_up_front_offer_code_subscriptions,
        cast(pay_as_you_go_offer_code_subscriptions as {{ dbt.type_int() }}) as pay_as_you_go_offer_code_subscriptions,
        cast(subscribers as {{ dbt.type_int() }}) as subscribers
    from fields
)

select * 
from final