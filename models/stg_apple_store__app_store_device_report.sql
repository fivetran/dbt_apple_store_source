
with base as (

    select * 
    from {{ ref('stg_apple_store__app_store_device_report_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__app_store_device_report_tmp')),
                staging_columns=get_app_store_device_report_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        date as date_day,
        app_id,
        source_type,
        device,
        impressions,
        impressions_unique_device,
        page_views,
        page_views_unique_device
    from fields
)

select * from final
