
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
        
    from base
),

final as (
    
    select 
        {{ get_date_from_string( {{ dbt_utils.split_part(_filename, '_', 3) }} ) }} as day,
        app_name,
        account_name,
        country,
        state,
        subscription_name,
        active_free_trial_introductory_offer_subscriptions,
        active_pay_as_you_go_introductory_offer_subscriptions,
        active_pay_up_front_introductory_offer_subscriptions,
        active_standard_price_subscriptions
    from fields
)

select * from final
