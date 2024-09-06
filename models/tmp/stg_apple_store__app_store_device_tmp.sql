{{
    apple_store_source.union_apple_store_connections(
        connection_dictionary=var('apple_store_union_schemas',[]),
        single_source_name='apple_store',
        single_table_name='app_store_source_type_device_report'
    )
}}