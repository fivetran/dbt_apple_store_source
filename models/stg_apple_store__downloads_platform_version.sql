with base as (

    select * 
    from {{ ref('stg_apple_store__downloads_platform_version_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__downloads_platform_version_tmp')),
                staging_columns=get_downloads_platform_version_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        cast(date as date) as date_day,
        app_id,
        source_type,
        platform_version,
        first_time_downloads,
        redownloads,
        total_downloads
    from fields
)

select * from final
