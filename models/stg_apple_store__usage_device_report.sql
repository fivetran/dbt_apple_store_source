
with base as (

    select * 
    from {{ ref('stg_apple_store__usage_device_report_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__usage_device_report_tmp')),
                staging_columns=get_usage_device_report_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    -- rename here
    from fields
)

select * from final
