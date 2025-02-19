{{
    fivetran_utils.union_data(
        table_identifier='app_crash_daily', 
        database_variable='apple_store_database', 
        schema_variable='apple_store_schema', 
        default_database=target.database,
        default_schema='itunes_connect',
        default_variable='app_crash_daily',
        union_schema_variable='apple_store_union_schemas',
        union_database_variable='apple_store_union_databases'
    )
}}
