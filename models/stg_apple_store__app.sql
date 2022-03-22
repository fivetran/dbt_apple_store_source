
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
        
    from base
),

final as (
    
    select 
        id as app_id,
        name as app_name,
        is_enabled
    from fields
)

select * from final
