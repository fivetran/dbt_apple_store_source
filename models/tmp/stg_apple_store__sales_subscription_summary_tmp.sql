{{ config(enabled=var('apple_store__using_subscriptions', False)) }}

select * from {{ var('sales_subscription_summary') }}
