with base as (

    select * 
    from {{ ref('stg_apple_store__downloads_territory_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__downloads_territory_tmp')),
                staging_columns=get_downloads_territory_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        cast(date as date) as date_day,
        app_id,
        source_type,
        territory,
        first_time_downloads,
        redownloads,
        total_downloads
    from fields
)

select * from final
