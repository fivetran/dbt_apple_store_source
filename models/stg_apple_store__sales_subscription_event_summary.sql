
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
        event_date as day, 
        account_number,
        app_name,
        subscription_name,
        event,
        country,
        state,
        quantity
    from fields
)

select * from final
