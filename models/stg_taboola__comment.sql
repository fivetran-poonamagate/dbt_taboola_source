
with base as (

    select *
    from {{ ref('stg_taboola__comment_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__comment_tmp')),
                staging_columns = get_comment_columns()
            )
        }}
    from base
),

final as (

    select
        account_id,
        campaign_id,
        index,
        comment

        {{ fivetran_utils.fill_pass_through_columns('taboola__comment_passthrough_columns') }}

    from fields
)

select *
from final