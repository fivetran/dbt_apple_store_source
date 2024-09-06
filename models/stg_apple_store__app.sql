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
        
    
        {{ apple_store_source.apple_store_source_relation(
                connection_dictionary=var('apple_store_sources', []),
                single_schema=var('apple_store_schema', 'apple_store'),
                single_database=var('apple_store_database', target.database),
                single_table_identifier=var("apple_store_app_identifier", "app")
            ) 
        }}

    from base
),

final as (

    select
        cast(source_relation as {{ dbt.type_string() }}) as source_relation, 
        cast(id as {{ dbt.type_bigint() }}) as app_id,
        cast(name as {{ dbt.type_string() }}) as app_name,
        is_enabled
    from fields
)

select * 
from final
