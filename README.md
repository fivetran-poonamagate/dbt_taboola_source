<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_recharge_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

# Taboola Source dbt package ([Docs](Placeholder))
# 📣 What does this dbt package do?
- Materializes [Taboola staging tables](Placeholder), which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/taboola#schemainformation). These staging tables clean, test, and prepare your Taboola data from [Fivetran's connector](https://fivetran.com/docs/applications/taboola) for analysis by doing the following:
  - Naming columns for consistency across all packages and easier analysis
  - Adding freshness tests to source data
  - Adding column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Taboola data through the [dbt docs site](Placeholder).
- These tables are designed to work simultaneously with our [Taboola transformation package](Placeholder).

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Taboola connector syncing data into your destination
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, or **Databricks** destination

### Databricks dispatch configuration
If you are using a Databricks destination with this package, you must add the following dispatch configuration (or a variation of thereof) within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` package, then within the `dbt-labs/dbt_utils` package, respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

## Step 2: Install the package (skip if also using the `taboola` transformation package)
If you are **not** using the [Taboola transformation package](Placeholder), include the following package version in your `packages.yml` file. If you are installing the transform package, the source package is automatically installed as a dependency.

Include the following taboola_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read dbt's Package Management documentation](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yml
packages:
  - package: fivetran/taboola_source
    version: [">=0.1.0", "<0.2.0"] # we recommend using ranges to capture non-breaking changes automatically
```

## Step 3: Define database and schema variables
By default, this package runs using your destination and the `taboola` schema. If this is not where your Taboola data is (for example, if your Taboola schema is named `taboola_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
  taboola_database: your_database_name
  taboola_schema: your_schema_name 
```

## Step 4: Disable models for non-existent sources
Your Taboola connector may not sync every table that this package expects.

## (Optional) Step 5: Additional configurations
<details><summary>Expand for configurations</summary>

### Passing Through Additional Columns
This package includes all source columns defined in the macros folder. If you would like to pass through additional columns to the staging models, add the following configurations to your `dbt_project.yml` file. These variables allow for the pass-through fields to be aliased (`alias`) and casted (`transform_sql`) if desired, but not required. Datatype casting is configured via a SQL snippet within the `transform_sql` key. You may add the desired SQL while omitting the `as field_name` at the end, and your custom pass-though fields will be casted accordingly. Use the below format for declaring the respective pass-through variables in your root `dbt_project.yml`.
```yml
vars:
    taboola__address_passthrough_columns: 
      - name: "new_custom_field"
        alias: "custom_field_name"
        transform_sql:  "cast(custom_field_name as int64)"
      - name: "a_second_field"
        transform_sql:  "cast(a_second_field as string)"
    # a similar pattern can be applied to the rest of the following variables.
```

### Changing the Build Schema
By default, this package will build the Taboola staging models within a schema titled (<target_schema> + `taboola_source`) in your destination. If this is not where you would like your Taboola staging data written, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    taboola_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:

> IMPORTANT: See this project's [`dbt_project.yml`](Placeholder) variable declarations to see the expected names.

```yml
vars:
    taboola_<default_source_table_name>_identifier: your_table_name 
```
#### 🚨 Snowflake Users 🚨
You may need to provide the case-sensitive spelling of your source tables that are also Snowflake reserved words.
</details>

## (Optional) Step 6: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand for more details</summary>

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core™ setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
    
</details>

# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/taboola_source/latest/) of the package and refer to the [CHANGELOG](Placeholder) and release notes for more information on changes across versions.

## Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_microsoft_ads/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Have questions or want to be part of the community discourse? Create a post in the [Fivetran community](https://community.fivetran.com/t5/user-group-for-dbt/gh-p/dbt-user-group) and our team along with the community can join in on the discussion!