[![Apache License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 
![dbt-core](https://img.shields.io/badge/dbt_core-version_>=1.0.0_<2.0.0-orange.svg)

# Apple App Store Source dbt Package
# 📣 What does this dbt package do?
This package cleans, tests, and preps Apple App Store (formerly iTunes Connect) data from [Fivetran's connector](https://fivetran.com/docs/applications/apple-app-store). It uses data in the format described by [this ERD](https://docs.google.com/presentation/d/1zeV9F1yakOQbgx-L0xQ7h8I3KRuJL_tKc7srX_ctaYw/edit?usp=sharing). 

This package will materialize the following staging models in your warehouse:

| **Fivetran Source Table**                  | **Materialized Staging Model**   | **Description** |
| -------------------------- | ------------------------------------------------------------------------------ | -------------|
|app| [stg_apple_store__app](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__app) | Table containing data about your application(s). |
|app_store_platform_version_source_type_report|[stg_apple_store__app_store_platform_version_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__app_store_platform_version_report)| Daily app store metrics (impressions, impressions_unique_device, page_views and page_views_unique_device) by platform version and source type. |
|app_store_source_type_device_report|[stg_apple_store__app_store_device_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__app_store_device_report)| Daily app store metrics (impressions, impressions_unique_device, page_views and page_views_unique_device) by device and source type. |
|app_store_territory_source_type_report|[stg_apple_store__app_store_territory_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__app_store_territory_report)| Daily app store metrics (impressions, impressions_unique_device, page_views and page_views_unique_device) by territory and source type. |
|crashes_app_version_device_report|[stg_apple_store__crashes_app_version_device_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__crashes_app_version_device_report)| Daily crashes by app version and device. |
|crashes_platform_version_device_report|[stg_apple_store__crashes_platform_version_device_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__crashes_platform_version_device_report)| Daily crashes by platform version and device. |
|downloads_platform_version_source_type_report|[stg_apple_store__downloads_platform_version_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__downloads_platform_version_report)| Daily downloads metrics (first time downloads, redownloads and total downloads) by platform version and source type. |
|downloads_source_type_device_report|[stg_apple_store__downloads_device_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__downloads_device_report)| Daily downloads metrics (first time downloads, redownloads and total downloads) by device and source type. |
|downloads_territory_source_type_report|[stg_apple_store__downloads_territory_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__downloads_territory_report)| Daily downloads metrics (first time downloads, redownloads and total downloads) by territory and source type. |
|sales_account|[stg_apple_store__sales_account](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__sales_account) | Table containing sales account data. |
|sales_subscription_event_summary|[stg_apple_store__sales_subscription_event_summary](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__sales_subscription_event_summary)| Daily subscription event report by account ID, app name, subscription name, event, country, state and device. |
|sales_subscription_summary|[stg_apple_store__sales_subscription_summary](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__sales_subscription_summary)| Daily subscription summary report by account ID, app name, country, state and subscription name. |
|usage_app_version_source_type_report|[stg_apple_store__usage_app_version_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__usage_app_version_report)| Daily usage metrics (active devices, active devices last 30 days, deletions, installations, sessions) by app version and source type. |
|usage_platform_version_source_type_report|[stg_apple_store__usage_platform_version_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__usage_platform_version_report)| Daily usage metrics (active devices, active devices last 30 days, deletions, installations, sessions) by platform version and source type. |
|usage_source_type_device_report|[stg_apple_store__usage_device_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__usage_device_report)| Daily usage metrics (active devices, active devices last 30 days, deletions, installations, sessions) by device and source type. |
|usage_territory_source_type_report|[stg_apple_store__usage_territory_report](https://fivetran.github.io/dbt_apple_store_source/#!/model/model.apple_store_source.stg_apple_store__usage_territory_report)| Daily usage metrics (active devices, active devices last 30 days, deletions, installations, sessions) by territory and source type. |
# 🤔 Who is the target user of this dbt package?
- You use Fivetran's [Apple App Store connector](https://fivetran.com/docs/applications/apple-app-store)
- You use dbt
- You want a staging layer that cleans, tests, and prepares your Apple App Store data
- (Optional) You want to make use of the [Apple App Store Modeling dbt Package](https://github.com/fivetran/dbt_apple_store)
# 🎯 How do I use the dbt package?
To effectively install this package and leverage the pre-made models, you will follow the below steps:
## Step 1: Requirements 
You will need to ensure you have the following requirements before leveraging the dbt package.
- **Connector**: Have the Fivetran Apple App Store connector syncing data into your warehouse. 
- **Database support**: This package has been tested on BigQuery, Snowflake and Redshift. Ensure you are using one of these supported databases.
- **dbt Version**: This dbt package requires you have a functional dbt project that utilizes a dbt version within the respective range `>=1.0.0, <2.0.0`.
## Step 2: Installing the Package
Include the following apple_store_source package version in your `packages.yml`
> Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/apple_store_source
    version: [">=0.1.0", "<0.2.0"]
```
## Step 3: Configure Your Variables
### Database and Schema Variables
By default, this package will run using your target database, the `itunes_connect` schema and the default Fivetran Source Tables names for Apple App Store listed above. If this is not where your Apple App Store data is (perhaps your Apple App Store schema is `itunes_connect_fivetran` your `app` table is named `usa_app`), add the following configuration to your `dbt_project.yml` file:

```yml
vars:
  apple_store_source:
    apple_store_database: your_database_name
    apple_store_schema: your_schema_name 
    <default_source_table_name>_identifier: your_table_name
```
### Disabling Model Variables
Your Apple App Store connector might not sync every table that this package expects. If you use subscriptions and do have the `sales_subscription_event_summary` and `sales_subscription_summary` tables synced, add the following variable to your `dbt_project.yml` file:

```yml
vars:
  apple_store__using_subscriptions: true # by default this is assumed to be false
```
## (Optional) Step 4: Additional Configurations
### Change the Build Schema
By default, this package builds the Apple App Store staging models within a schema titled (<target_schema> + `_stg_apple_store`) in your target database. If this is not where you would like your Apple App Store staging data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
models:
    apple_store_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

## Step 5: Finish Setup
Your dbt project is now setup to successfully run the dbt package models! You can now execute `dbt run` and `dbt test` to have the models materialize in your warehouse and execute the data integrity tests applied within the package.

## (Optional) Step 6: Orchestrate your package models with Fivetran
Fivetran offers the ability for you to orchestrate your dbt project through the [Fivetran Transformations for dbt Core](https://fivetran.com/docs/transformations/dbt) product. Refer to the linked docs for more information on how to setup your project for orchestration through Fivetran. 

# 🔍 Package Dependency Matrix
This dbt package is dependent on the following dbt packages. For more information on the below packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> **If you have any of these dependent packages in your own `packages.yml` I highly recommend you remove them to ensure there are no package version conflicts.**
```
packages:
  - package: fivetran/fivetran_utils
    version: [">=0.3.0", "<0.4.0"]
  - package: dbt-labs/dbt_utils
    version: [">=0.8.0", "<0.9.0"]
```
# 🙌 Contributions and Maintenance
## Package Maintenance
The Fivetran team maintaining this package **only** maintains the latest version of the package. We highly recommend you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/apple_store_source/latest/) of the package and refer to the [CHANGELOG](/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
These dbt packages are developed by a small team of analytics engineers at Fivetran. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Please refer to the [CONTRIBUTING.md](/CONTRIBUTING.md) doc for details on how to effectively contribute to this open source project!

# 🏪 Resources and Feedback
- If you encounter any questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_apple_store_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran, or would like to request a future dbt package to be developed, then feel free to fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).