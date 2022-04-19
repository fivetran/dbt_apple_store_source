{{ config(enabled=var('apple_store__using_subscriptions', False)) }}

with base as (

    select * 
    from {{ ref('stg_apple_store__sales_subscription_event_summary_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__sales_subscription_event_summary_tmp')),
                staging_columns=get_sales_subscription_event_summary_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        event_date as date_day, 
        account_number as account_id,
        app_name,
        subscription_name,
        event,
        country,
        state,
        sum(quantity) as quantity
    from fields
    {{ dbt_utils.group_by(7) }}
)

select * from final
