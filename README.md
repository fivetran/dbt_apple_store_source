# Apple App Store Source dbt Package ([Docs](https://fivetran.github.io/dbt_apple_store_source/))

<p align="left">
    <a alt="License"
        href="https://github.com/fivetran/dbt_apple_store_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

## What does this dbt package do?
- Materializes [Apple App Store staging tables](https://fivetran.github.io/dbt_apple_store_source/#!/overview/github_source/models/?g_v=1) which leverage data in the format described by [this ERD](https://fivetran.com/docs/connectors/applications/apple-app-store#schemainformation). These staging tables clean, test, and prepare your Apple App Store data from [Fivetran's connector](https://fivetran.com/docs/applications/apple-app-store) for analysis by doing the following:
  - Name columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
    - dbt Core >= 1.9.6 is required to run freshness tests out of the box.
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Apple App Store data through the [dbt docs site](https://fivetran.github.io/dbt_apple_store_source/).
- These tables are designed to work simultaneously with our [Apple App Store transformation package](https://github.com/fivetran/dbt_apple_store).

## How do I use the dbt package?
### Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Apple App Store connection syncing data into your destination.
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, or **Databricks** destination.

### Step 2: Install the package (skip if also using the `apple_store` transformation package)
Include the following apple_store_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/apple_store_source
    version: [">=0.5.0", "<0.6.0"] # we recommend using ranges to capture non-breaking changes automatically
```
### Step 3: Define database and schema variables
By default, this package runs using your destination and your Apple Store schema (default `itunes_connect`). If this is not where your Apple Store data is (for example, if your Apple Store schema is named `apple_store_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    apple_store_database: your_destination_name
    apple_store_schema: your_schema_name 
```
### Step 4: Enabling additional models
Your Apple App Store connection may not sync every table that this package expects. If you use subscriptions and have the `sales_subscription_event_summary` and `sales_subscription_summary` tables synced, add the following variable to your `dbt_project.yml` file:

```yml
vars:
  apple_store__using_subscriptions: true # by default this is assumed to be false
```

### Step 5: Seed `country_codes` mapping table (once)

In order to map longform territory names to their ISO country codes, we have adapted the CSV from [lukes/ISO-3166-Countries-with-Regional-Codes](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes) to align with Apple's country output [format](https://developer.apple.com/help/app-store-connect/reference/app-store-localizations/).

You will need to `dbt seed` the `apple_store_country_codes` [file](https://github.com/fivetran/dbt_apple_store_source/blob/main/seeds/apple_store_country_codes.csv) just once.

### (Optional) Step 6: Additional configurations
<details open><summary>Expand/collapse configurations</summary>

#### Union multiple connections
If you have multiple apple_store connections in Fivetran and would like to use this package on all of them simultaneously, we have provided functionality to do so. The package will union all of the data together and pass the unioned table into the transformations. You will be able to see which source it came from in the `source_relation` column of each model. To use this functionality, you will need to set either the `apple_store_union_schemas` OR `apple_store_union_databases` variables (cannot do both) in your root `dbt_project.yml` file:

```yml
vars:
    apple_store_union_schemas: ['apple_store_usa','apple_store_canada'] # use this if the data is in different schemas/datasets of the same database/project
    apple_store_union_databases: ['apple_store_usa','apple_store_canada'] # use this if the data is in different databases/projects but uses the same schema name
```
> NOTE: The native `source.yml` connection set up in the package will not function when the union schema/database feature is utilized. Although the data will be correctly combined, you will not observe the sources linked to the package models in the Directed Acyclic Graph (DAG). This happens because the package includes only one defined `source.yml`.

To connect your multiple schema/database sources to the package models, follow the steps outlined in the [Union Data Defined Sources Configuration](https://github.com/fivetran/dbt_fivetran_utils/tree/releases/v0.4.latest#union_data-source) section of the Fivetran Utils documentation for the union_data macro. This will ensure a proper configuration and correct visualization of connections in the DAG.

#### Defining subscription events
By default, `Subscribe`, `Renew` and `Cancel` subscription events are included and required in this package for downstream usage. If you would like to add additional subscription events, please add the below to your `dbt_project.yml`:

```yml
    apple_store__subscription_events:
    - 'Renew'
    - 'Cancel'
    - 'Subscribe'
    - '<additional_event_name>'
    - '<additional_event_name>'
```

#### Change the build schema
By default, this package builds the Apple App Store staging models within a schema titled (<target_schema> + `_apple_store_source`) in your target database. If this is not where you would like your Apple App Store staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    apple_store_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```
    
#### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_apple_store_source/blob/main/dbt_project.yml) variable declarations to see the expected names.
    
```yml
vars:
    apple_store_<default_source_table_name>_identifier: your_table_name 
```
    
</details>

### (Optional) Step 7: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand to view details</summary>
<br>
    
Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core™ setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
</details>
    
## Does this package have dependencies?
This dbt package is dependent on the following dbt packages. These dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]
```
          
## How is this package maintained and can I contribute?
### Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/apple_store_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_apple_store_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

### Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions.

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package.

## Are there any resources available?
- If you have questions or want to reach out for help, see the [GitHub Issue](https://github.com/fivetran/dbt_apple_store_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
