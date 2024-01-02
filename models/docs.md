
# dimensions

{% docs _fivetran_id %} Unique primary key for the given table. {% enddocs %}

{% docs account_id %} Alphanumeric string for the account id. {% enddocs %}

{% docs campaign_id %} Numeric ID of the campaign. {% enddocs %}

{% docs campaign_name %} The descriptive name for the campaign. {% enddocs %}

{% docs date_time %} The reporting date for the associated metrics. {% enddocs %}

{% docs date %} The reporting date for the associated metrics. {% enddocs %}

{% docs approval_state %} Indicates if the item has been approved by Taboola and is ready to be served (approval_state) = APPROVED. {% enddocs %}

{% docs currency %} The currency for columns of type "money". {% enddocs %}

{% docs timezone %} The time zone used for the campaign scheduling rules. {% enddocs %}

# metrics

{% docs spent %} Total amount spent. {% enddocs %}

{% docs campaigns_num %} Number of campaigns for that advertiser. {% enddocs %}

{% docs impressions %} Total number of impressions. {% enddocs %}

{% docs clicks %} Total number of clicks. {% enddocs %}

{% docs conversions %} Total number of conversions. {% enddocs %}

{% docs conversions_value %} Total revenue from conversions. {% enddocs %}

{% docs cpm %} Cost per 1000 impressions. {% enddocs %}

{% docs cpc %} Average cost per click (= spent / clicks) {% enddocs %}

{% docs ctr %} Click-through rate. {% enddocs %}

{% docs cpa %} Cost per action (= spent / clicks) {% enddocs %}

{% docs roas %} Return on ad spend (%) (= conversions_value / spent) {% enddocs %}

{% docs cpa_actions_num %} Total number of actions. (conversions) {% enddocs %}

{% docs cpa_actions_num_from_clicks %} Total number of actions from clicks (conversions) {% enddocs %}

{% docs cpa_actions_num_from_views %} Total number of actions from views (conversions) {% enddocs %}

{% docs cpa_conversion_rate %} Conversion rate (%) (= conversions / clicks) - considers all conversions. {% enddocs %}

{% docs visible_impressions %} Total number of viewable impressions. {% enddocs %}

{% docs vcpm %} Average cost per 1000 viewable impressions (= spent / visible impressions * 1000) {% enddocs %}

{% docs vctr %} Average viewable click-through rate (= clicks / visible impressions) {% enddocs %}