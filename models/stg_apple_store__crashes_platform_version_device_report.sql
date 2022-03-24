
with base as (

    select * 
    from {{ ref('stg_apple_store__crashes_platform_version_device_report_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__crashes_platform_version_device_report_tmp')),
                staging_columns=get_crashes_platform_version_device_report_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        date as date_day,
        app_id,
        device,
        platform_version,
        crashes
    from fields
)

select * from final
