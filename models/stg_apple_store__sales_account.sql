
with base as (

    select * 
    from {{ ref('stg_apple_store__sales_account_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_store__sales_account_tmp')),
                staging_columns=get_sales_account_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id as account_id,
        name as account_name
    from fields
)

select * from final
