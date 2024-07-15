ADD source_relation WHERE NEEDED + CHECK JOINS AND WINDOW FUNCTIONS! (Delete this line when done.)


with base as (

    select * 
    from {{ ref('stg_apple_store__usage_territory_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__usage_territory_tmp')),
                staging_columns=get_usage_territory_columns()
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
        territory,
        active_devices,
        active_devices_last_30_days,
        deletions,
        installations,
        sessions
    from fields
)

select * 
from final
