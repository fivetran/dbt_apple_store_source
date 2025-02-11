{{ config(enabled=var('apple_store__using_subscriptions', False)) }}

with base as (

    select * 
    from {{ ref('stg_apple_store__sales_subscription_events_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__sales_subscription_events_tmp')),
                staging_columns=get_sales_subscription_events_columns()
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
        cast(event_date as date) as date_day,
        cast(_fivetran_id as {{ dbt.type_string() }}) as _fivetran_id,
        cast(vendor_number as {{ dbt.type_int() }}) as vendor_number,
        cast(app_apple_id as {{ dbt.type_int() }}) as app_apple_id,
        cast(app_name as {{ dbt.type_string() }}) as app_name,
        cast(event as {{ dbt.type_string() }}) as event,
        cast(subscription_name as {{ dbt.type_string() }}) as subscription_name,
        cast(subscription_apple_id as {{ dbt.type_int() }}) as subscription_apple_id,
        cast(subscription_group_id as {{ dbt.type_int() }}) as subscription_group_id,
        cast(standard_subscription_duration as {{ dbt.type_string() }}) as standard_subscription_duration,
        cast(subscription_offer_type as {{ dbt.type_string() }}) as subscription_offer_type,
        cast(subscription_offer_duration as {{ dbt.type_string() }}) as subscription_offer_duration,
        cast(marketing_opt_in as {{ dbt.type_string() }}) as marketing_opt_in,
        cast(marketing_opt_in_duration as {{ dbt.type_string() }}) as marketing_opt_in_duration,
        cast(preserved_pricing as {{ dbt.type_string() }}) as preserved_pricing,
        cast(proceeds_reason as {{ dbt.type_string() }}) as proceeds_reason,
        cast(promotional_offer_name as {{ dbt.type_string() }}) as promotional_offer_name,
        cast(promotional_offer_id as {{ dbt.type_string() }}) as promotional_offer_id,
        cast(consecutive_paid_periods as {{ dbt.type_int() }}) as consecutive_paid_periods,
        cast(original_start_date as date) as original_start_date,
        cast(device as {{ dbt.type_string() }}) as device,
        cast('' as {{ dbt.type_string() }}) as source_type, -- adding source_type in order to join with other models downstream
        cast(client as {{ dbt.type_string() }}) as client,
        cast(case
            when replace(state, ' ', '') = '' then cast(null as {{ dbt.type_string() }}) else state
        end as {{ dbt.type_string() }}) as state,
        cast(country as {{ dbt.type_string() }}) as country,
        cast(previous_subscription_name as {{ dbt.type_string() }}) as previous_subscription_name,
        cast(previous_subscription_apple_id as {{ dbt.type_int() }}) as previous_subscription_apple_id,
        cast(days_before_canceling as {{ dbt.type_int() }}) as days_before_canceling,
        cast(cancellation_reason as {{ dbt.type_string() }}) as cancellation_reason,
        cast(days_canceled as {{ dbt.type_int() }}) as days_canceled,
        cast(quantity as {{ dbt.type_int() }}) as quantity,
        cast(paid_service_days_recovered as {{ dbt.type_int() }}) as paid_service_days_recovered
    from fields
)

select * 
from final