
with base as (

    select *
    from {{ ref('stg_taboola__campaign_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__campaign_tmp')),
                staging_columns = get_campaign_columns()
            )
        }}
    from base
),

final as (

    select
        account_id,
        id as campaign_id,
        approval_state,
        cpc,
        daily_ad_delivery_model,
        daily_cap,
        cast(end_date as {{ dbt.type_timestamp() }}) as end_date,
        name as campaign_name,
        spending_limit,
        spending_limit_model,
        spent,
        cast(start_date as {{ dbt.type_timestamp() }}) as start_date,
        status,
        tracking_code,
        traffic_allocation_model

        {{ fivetran_utils.fill_pass_through_columns('taboola__campaign_passthrough_columns') }}

    from fields
)

select *
from final