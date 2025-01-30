{% docs _fivetran_synced %} Timestamp of when Fivetran synced a record. {% enddocs %}

{% docs active_devices %} This represents the number of devices with at least one session during a selected period. In the UI, to calculate this, you can query the session data for your app over the desired timeframe and count the unique devices that initiated at least one session. However, in the models here, this is deduplicated across the given grain. {% enddocs %}

{% docs active_devices_last_30_days %} This metric indicates the number of devices with at least one session during the previous 30 days. To obtain this, you would analyze the session data for the past 30 days and count the unique devices that had at least one session in that period. In the models, this is deduplicated across the given grain. {% enddocs %}

{% docs active_free_trial_introductory_offer_subscriptions %} Total number of introductory offer subscriptions currently in a free trial. {% enddocs %}

{% docs active_pay_as_you_go_introductory_offer_subscriptions %} Total number of introductory offer subscriptions currently with a pay as you go introductory price. {% enddocs %}

{% docs active_pay_up_front_introductory_offer_subscriptions %} Total number of introductory offer subscriptions currently with a pay up front introductory price. {% enddocs %}

{% docs active_standard_price_subscriptions %} Total number of auto-renewable standard paid subscriptions currently active, excluding free trials, 
subscription offers, introductory offers, and marketing opt-ins. Subscriptions are active during the period for which the customer has paid without cancellation. {% enddocs %}

{% docs alternative_country_name %} Due to differences in the official ISO country names and Apple's naming convention, we've added an alternative territory name that will allow us to join reports and infer ISO fields. {% enddocs %}

{% docs app_id %} Application ID. {% enddocs%}

{% docs app_name %} Application Name. {% enddocs %}

{% docs app_version %} The app version of the app that the user is engaging with. {% enddocs %}

{% docs country %} The country associated with the subscription event metrics and subscription summary metric(s). This country code maps to ISO-3166 Alpha-2. {% enddocs %}

{% docs country_code_alpha_2 %} The 2 character ISO-3166 country code. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs%}

{% docs country_code_alpha_3 %} The 3 character ISO-3166 country code. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs%}

{% docs country_code_numeric %} The 3 digit ISO-3166 country code. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs%}

{% docs country_name %} The ISO-3166 English country name. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs%}

{% docs crashes %} The number of recorded crashes experienced (User Opt-In only); a value of 0 indicates there were 0 crash reports or no value from the source report that day. {% enddocs %}

{% docs date_day %} The date of the report and respective recorded metric(s); follows the format `YYYY-MM-DD`. {% enddocs %}

{% docs deletions %} A deletion occurs when a user removes your app from their device (User Opt-In only). Data from resetting or erasing a device’s content and settings is not included. A value of 0 indicates there were 0 deletions or no value from the source report that day. {% enddocs %}

{% docs device %} Device type associated with the respective metric(s). {% enddocs %}

{% docs event %} The type of usage event that occurred. {% enddocs %}

{% docs first_time_downloads %} The number of first time downloads for your app. {% enddocs %}

{% docs impressions %} The number of times a user viewed your app icon in a list alongside other apps, including in search results, charts, and the Today, Apps, and Games tabs. Page views are not included in these counts. {% enddocs %}

{% docs impressions_unique_device %} The number of unique devices that viewed your app icon in a list alongside other apps, including in search results, charts, and the Today, Apps, and Games tabs. Page views are not included in these counts. In the models, this is deduplicated across the given grain. {% enddocs %}

{% docs installations %} The number of time your app is installed on a device. {% enddocs %}

{% docs page_views %} The number of times a user was presented with a dedicated page for your app or in-app event. {% enddocs %}

{% docs page_views_unique_device %} The number of unique devices that viewed dedicated page for your app or in-app event. In the models, this is deduplicated across the given grain.  {% enddocs %}

{% docs platform_version %} The platform version of the device engaging with your app. {% enddocs %}

{% docs quantity %} Number of events with the same values for the other fields. {% enddocs %}

{% docs sessions %} The number of sessions. Based on users who have agreed to share their data with Apple and developers. {% enddocs %}

{% docs redownloads %} A subsequent installation of an app onto a device by an Apple ID account. Counted when a user taps the redownload button on the App Store. {% enddocs %}

{% docs region %} The UN Statistics region name assignment. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs %}

{% docs region_code %} The UN Statistics region numerical code assignment. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs %}

{% docs source_type %} Where the user discovered the app, for example: App Store Browse, App Store Search, App Referrers, Web Referrers, App Clips, Unavailable,and Null. Null is the default value for data that does not provide source types, including: crashes, subscription events and subscription summary.
{% enddocs %}

{% docs state %} The state associated with the subscription event metrics or subscription summary metrics. {% enddocs %}

{% docs sub_region %} The UN Statistics sub-region name. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs%}

{% docs sub_region_code %} The UN Statistics sub-region numerical code. ([Original Source](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/blob/master/all/all.csv)) {% enddocs %}

{% docs subscription_name %} The subscription name associated with the subscription event metric or subscription summary metric. {% enddocs %}

{% docs territory %} The territory (aka country) full name associated with the report's respective metric(s). {% enddocs %}

{% docs total_downloads %} Total Downloads is the sum of Redownloads and First Time Downloads. {% enddocs %}

{% docs territory_long %} Either the alternative country name, or the country name if the alternative doesn't exist. {% enddocs %}

{% docs source_relation %}The source of the record if the unioning functionality is being used. If it is not this field will be empty.{% enddocs %}

{% docs download_type %}
The type of download event that occurred. Possible values include:
- **First-Time Download**: The user downloaded the app for the first time.
- **Redownload**: The user reinstalled the app after having downloaded it previously.
- **Auto-Download**: The app was automatically downloaded on another device using the same Apple ID.
- **Manual Update**: The user manually updated the app from the App Store.
- **Restore**: The app was restored from a backup.
- **Unavailable**: The download type is unknown or not reported.
{% enddocs %}

{% docs pre_order %}
Indicates whether the download was a result of a pre-order. If `true`, the user had pre-ordered the app before its release and it was automatically downloaded upon availability.
{% enddocs %}

{% docs total_session_duration %}
The total amount of time, in seconds, that users spent in sessions with your app on a given day.
{% enddocs %}

{% docs unique_counts %}
The total number of unique users that performed the event.
{% enddocs %}

{% docs unique_devices %}
The number of unique devices on which events were generated, based on users who have agreed to share their data with Apple and developers.
{% enddocs %}

{% docs page_title %}
The name of the product page or in-app event page where the user interaction occurred.
{% enddocs %}

{% docs page_type %}
The page type which led the user to discover your app.
{% enddocs %}

{% docs app_download_date %}
The date when the user originally downloaded the app on their device.
{% enddocs %}

{% docs _fivetran_id %}
A Fivetran-generated key that is unique to each record for a given date and app.
{% enddocs %}

{% docs engagement_type %}
The type of user engagement action (e.g., Tap, Scroll).
{% enddocs %}

{% docs counts %}
The total count of events, based on users who have agreed to share their data with Apple and developers.
{% enddocs %}

{% docs source_info %}
Additional information about the source that referred users to your app's product page, such as the referring app or website.
{% enddocs %}