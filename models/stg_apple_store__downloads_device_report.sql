{{ config(enabled=var('apple_store__using_downloads', True)) }}

with base as (

    select * 
    from {{ ref('stg_apple_store__downloads_device_report_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__downloads_device_report_tmp')),
                staging_columns=get_downloads_device_report_columns()
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
        first_time_downloads,
        redownloads,
        total_downloads
    from fields
)

select * from final
