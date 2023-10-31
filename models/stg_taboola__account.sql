
with base as (

    select *
    from {{ ref('stg_taboola__account_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__account_tmp')),
                staging_columns = get_account_columns()
            )
        }}
    from base
),

final as (

    select
        id as account_id,
        account_id as account_id_value,
        is_active,
        language,
        name as account_name,
        parent_network,
        timezone,
        type

        {{ fivetran_utils.fill_pass_through_columns('taboola__account_passthrough_columns') }}

    from fields
)

select *
from final