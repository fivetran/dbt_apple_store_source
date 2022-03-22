{{ config(enabled=var('apple_store__using_subscriptions', True)) }}

select * from {{ var('sales_subscription_event_summary') }}
