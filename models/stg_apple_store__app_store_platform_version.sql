with base as (

    select * 
    from {{ ref('stg_apple_store__app_store_platform_version_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__app_store_platform_version_tmp')),
                staging_columns=get_app_store_platform_version_columns()
            )
        }}
        
    
        {{ fivetran_utils.source_relation(
            union_schema_variable='apple_store_union_schemas', 
            union_database_variable='apple_store_union_databases') 
        }}

    from base
),

final as (

    select
        source_relation, 
        cast(date as date) as date_day,
        app_id,
        source_type,
        platform_version,
        impressions,
        impressions_unique_device,
        page_views,
        page_views_unique_device
    from fields
)

select * 
from final
