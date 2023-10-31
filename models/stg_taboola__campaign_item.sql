
with base as (

    select *
    from {{ ref('stg_taboola__campaign_item_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__campaign_item_tmp')),
                staging_columns = get_campaign_item_columns()
            )
        }}
    from base
),

final as (

    select
        id as campaign_item_id,
        approval_state,
        campaign_id,
        is_active,
        status,
        thumbnail_url,
        title,
        type,
        url

        {{ fivetran_utils.fill_pass_through_columns('taboola__campaign_item_passthrough_columns') }}

    from fields
)

select *
from final