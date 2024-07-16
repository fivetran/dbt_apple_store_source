with base as (

    select * 
    from {{ ref('stg_apple_store__app_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__app_tmp')),
                staging_columns=get_app_columns()
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
        cast(id as {{ dbt.type_bigint() }}) as app_id,
        name as app_name,
        is_enabled
    from fields
)

select * 
from final
