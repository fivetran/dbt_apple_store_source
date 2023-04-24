# dbt_apple_store_source v0.UPDATE.UPDATE

 ## Under the Hood:

- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job.
- Updated the pull request [templates](/.github).
# dbt_apple_store_source v0.2.1

## Bug Fixes
[PR #7](https://github.com/fivetran/dbt_apple_store_source/pull/7) includes the following breaking changes:
- Column `date_day` of `stg_apple_store__sales_subscription_events` model is now casted to `date` type. This change might affect downstream models.

## Contributors
- [@lch88](https://github.com/lch88) ([#7](https://github.com/fivetran/dbt_apple_store_source/pull/7))

# dbt_apple_store_source v0.2.0

## 🚨 Breaking Changes 🚨:
[PR #6](https://github.com/fivetran/dbt_google_play/pull/6) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- `packages.yml` has been updated to reflect new default `fivetran/fivetran_utils` version, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.

# dbt_apple_store_source v0.1.0

## Initial Release
This is the initial release of this package. 

__What does this dbt package do?__
- Cleans, tests, and prepares your GitHub data from [Fivetran's connector](https://fivetran.com/docs/applications/apple-app-store) for analysis.
- Generates a comprehensive data dictionary of your Apple Store data via the [dbt docs site](https://fivetran.github.io/dbt_apple_store_source/)
- Materializes staging tables which leverage data in the format described by [this ERD](https://docs.google.com/presentation/d/1zeV9F1yakOQbgx-L0xQ7h8I3KRuJL_tKc7srX_ctaYw/edit?usp=sharing) and is intended to work simultaneously with our [Apple Store modeling package](https://github.com/fivetran/dbt_apple_store)
- Refer to our [Docs site](https://fivetran.github.io/dbt_apple_store_source/#!/overview/apple_store_source/models/?g_v=1) for more details about these materialized models. 

__References__
- [lukes/ISO-3166-Countries-with-Regional-Codes](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes) for the foundation of our `country_codes` mapping table

For more information refer to the [README](/README.md).
