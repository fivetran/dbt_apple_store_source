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
        
    from base
),

final as (
    
    select 
        {{ get_date_from_string( dbt_utils.split_part(string_text='_filename', delimiter_text="'_'", part_number=3) ) }} as date_day, 
        app_name,
        account_number as account_id,
        country,
        state,
        subscription_name,
        sum(active_free_trial_introductory_offer_subscriptions) as active_free_trial_introductory_offer_subscriptions,
        sum(active_pay_as_you_go_introductory_offer_subscriptions) as active_pay_as_you_go_introductory_offer_subscriptions,
        sum(active_pay_up_front_introductory_offer_subscriptions) as active_pay_up_front_introductory_offer_subscriptions,
        sum(active_standard_price_subscriptions) as active_standard_price_subscriptions
    from fields
    {{ dbt_utils.group_by(6) }}
)

select * from final