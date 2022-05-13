<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_apple_store_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="Fivetran-Release"
        href="https://fivetran.com/docs/getting-started/core-concepts#releasephases">
        <img src="https://img.shields.io/badge/Fivetran Release Phase-_Beta-orange.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.0.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

# Apple App Store Source dbt Package ([Docs](https://fivetran.github.io/dbt_apple_store_source/))
# 📣 What does this dbt package do?
- Materializes [Apple App Store staging tables](https://fivetran.github.io/dbt_apple_store_source/#!/overview/github_source/models/?g_v=1) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/apple_store/#schemainformation). These staging tables clean, test, and prepare your Apple App Store data from [Fivetran's connector](https://fivetran.com/docs/applications/apple-app-store) for analysis by doing the following:
  - Name columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Apple App Store data through the [dbt docs site](https://fivetran.github.io/dbt_apple_store_source/).
- These tables are designed to work simultaneously with our [Apple App Store transformation package](https://github.com/fivetran/dbt_apple_store).

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Apple App Store connector syncing data into your destination. 
- A **BigQuery**, **Snowflake**, **Redshift**, or **PostgreSQL** destination.

## Step 2: Install the package
Include the following apple_store_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/apple_store_source
    version: [">=0.5.0", "<0.6.0"]
```
## Step 3: Define database and schema variables
By default, this package runs using your destination and the `apple_store` schema. If this is not where your apple_store data is (for example, if your apple_store schema is named `apple_store_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    apple_store_database: your_destination_name
    apple_store_schema: your_schema_name 
```
## Step 4: Disable models for non-existent sources
Your Apple App Store connector may not sync every table that this package expects. If you use subscriptions and have the `sales_subscription_event_summary` and `sales_subscription_summary` tables synced, add the following variable to your `dbt_project.yml` file:

```yml
vars:
  apple_store__using_subscriptions: true # by default this is assumed to be false
```

## (Optional) Step 5: Additional configurations
<details><summary>Expand to view configurations</summary>

### Defining subscription events
By default, `Subscribe`, `Renew` and `Cancel` subscription events are included and required in this package for downstream usage. If you would like to add additional subscription events, please add the below to your `dbt_project.yml`:

```yml
    apple_store__subscription_events:
    - 'Renew'
    - 'Cancel'
    - 'Subscribe'
    - '<additional_event_name>'
    - '<additional_event_name>'
```

### Change the build schema
By default, this package builds the Apple App Store staging models within a schema titled (<target_schema> + `_apple_store_source`) in your target database. If this is not where you would like your Apple App Store staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    apple_store_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```
    
### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_apple_store_source/blob/main/dbt_project.yml) variable declarations to see the expected names.
    
```yml
vars:
    apple_store_<default_source_table_name>_identifier: your_table_name 
```
    
</details>

## (Optional) Step 6: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand to view details</summary>
<br>
    
Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core™ setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
</details>
    
# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.3.0", "<0.4.0"]

    - package: dbt-labs/dbt_utils
      version: [">=0.8.0", "<0.9.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/apple_store_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_apple_store_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_apple_store_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Have questions or want to just say hi? Book a time during our office hours [on Calendly](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or email us at solutions@fivetran.com.
