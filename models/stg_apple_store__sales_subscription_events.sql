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
        source_relation, 
        cast(event_date as date) as date_day,
        cast(account_number as {{ dbt.type_bigint() }}) as account_id,
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
        sum(cast(quantity as {{ dbt.type_bigint() }})) as quantity
    from fields
    {{ dbt_utils.group_by(9) }}
)

select * 
from final
