with base as (

    select * 
    from {{ ref('stg_apple_store__app_store_device_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__app_store_device_tmp')),
                staging_columns=get_app_store_device_columns()
            )
        }}
        
    
        {{ apple_store_source.apple_store_source_relation(
                connection_dictionary=var('apple_store_union_schemas'),
                single_schema=var('apple_store_union_schemas', 'apple_store'),
                single_database=var('apple_store_union_databases', target.database),
                single_table_identifier=var("apple_store_app_store_source_type_device_report_identifier", "app_store_source_type_device_report")
            ) 
        }}

    from base
),

final as (

    select
        cast(source_relation as {{ dbt.type_string() }}) as source_relation, 
        cast(date as date) as date_day,
        cast(app_id as {{ dbt.type_bigint() }}) as app_id,
        cast(source_type as {{ dbt.type_string() }}) as source_type,
        cast(device as {{ dbt.type_string() }}) as device,
        cast(impressions as {{ dbt.type_bigint() }}) as impressions,
        cast(impressions_unique_device as {{ dbt.type_bigint() }}) as impressions_unique_device,
        cast(page_views as {{ dbt.type_bigint() }}) as page_views,
        cast(page_views_unique_device as {{ dbt.type_bigint() }}) as page_views_unique_device
    from fields
)

select * 
from final
