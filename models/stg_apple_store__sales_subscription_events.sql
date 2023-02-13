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
        
    from base
),

final as (
    
    select 
        cast(event_date as date) as date_day,
        account_number as account_id,
        app_name,
        subscription_name,
        event,
        country,
        case
            when replace(state, ' ', '') = '' then cast(null as {{ dbt.type_string() }}) else state
        end as state,
        case 
            when lower(device) like 'ipod%' then 'iPod' else device
        end as device,
        sum(quantity) as quantity
    from fields
    {{ dbt_utils.group_by(8) }}
)

select * 
from final
