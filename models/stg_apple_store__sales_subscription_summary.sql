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
        source_relation, 
        {{ get_date_from_string( dbt.split_part(string_text='_filename', delimiter_text="'_'", part_number=3) ) }} as date_day, 
        app_name,
        account_number as account_id,
        country,
        case
            when replace(state, ' ', '') = '' then cast(null as {{ dbt.type_string() }})  else state
        end as state,
        subscription_name,
        case 
            when lower(device) like 'ipod%' then 'iPod' else device
        end as device,
        sum(active_free_trial_introductory_offer_subscriptions) as active_free_trial_introductory_offer_subscriptions,
        sum(active_pay_as_you_go_introductory_offer_subscriptions) as active_pay_as_you_go_introductory_offer_subscriptions,
        sum(active_pay_up_front_introductory_offer_subscriptions) as active_pay_up_front_introductory_offer_subscriptions,
        sum(active_standard_price_subscriptions) as active_standard_price_subscriptions
    from fields
    {{ dbt_utils.group_by(7) }}
)

select * 
from final