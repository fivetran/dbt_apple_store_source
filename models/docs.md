{% docs _fivetran_synced %} Timestamp of when Fivetran synced a record. {% enddocs %}

{% docs account_id %} Sales Account ID associated with the app name or app ID. {% enddocs%}

{% docs account_name %} Sales Account Name associated with the Sales Account ID, app name or app ID. {% enddocs %}

{% docs active_devices %} The count of active_device is the count of devices that ran the app at least one time and for at least two seconds on a given day (User Opt-In only); this metric is presumed to be de-duplicated daily as received from the source data, therefore, aggregating over a span of days is better done in the UI. A value of 0 indicates there were 0 active devices or no value from the source report that day. {% enddocs %}

{% docs active_devices_last_30_days %} The count of active_devices_last_30_days is the count of devices that ran the app at least one time and for at least two seconds on the date_day of the report minus 30 days (User Opt-In only); this metric is presumed to be de-duplicated daily as received from the source data, therefore, aggregating over a span of days is better done in the UI. A value of 0 indicates there were 0 active devices last 30 days or no value from the source report that day.{% enddocs %}

{% docs active_free_trial_introductory_offer_subscriptions %} Total number of introductory offer subscriptions currently in a free trial. {% enddocs %}

{% docs active_pay_as_you_go_introductory_offer_subscriptions %} Total number of introductory offer subscriptions currently with a pay as you go introductory price. {% enddocs %}

{% docs active_pay_up_front_introductory_offer_subscriptions %} Total number of introductory offer subscriptions currently with a pay up front introductory price. {% enddocs %}

{% docs active_standard_price_subscriptions %} Total number of auto-renewable standard paid subscriptions currently active, excluding free trials, 
subscription offers, introductory offers, and marketing opt-ins. Subscriptions are active during the period for which the customer has paid without cancellation. {% enddocs %}

{% docs app_id %} Application ID. {% enddocs%}

{% docs app_name %} Application Name. {% enddocs %}

{% docs app_version %} The app version of the app that the user is engaging with. {% enddocs %}

{% docs country %} The country associated with the subscription event metrics or subscription summary metric(s). {% enddocs %}

{% docs crashes %} The number of recorded crashes experienced (User Opt-In only); a value of 0 indicates there were 0 crash reports or no value from the source report that day. {% enddocs %}

{% docs date_day %} The date of the report and respective recorded metric(s); follows the format `YYYY-MM-DD`. {% enddocs %}

{% docs deletions %} A deletion occurs when a user removes your app from their device (User Opt-In only). Data from resetting or erasing a device’s content and settings is not included. A value of 0 indicates there were 0 deletions or no value from the source report that day. {% enddocs %}

{% docs device %} Device type associated with the respective metric(s). {% enddocs %}

{% docs event %} The subscription event associated with the respective metric(s). {% enddocs %}

{% docs first_time_downloads %} The number of first time downloads for your app; credit is attributed to the referring app, website, or App Clip of the first time download. {% enddocs %}

{% docs impressions %} The number of times the app’s icon was viewed on the App Store at the respective reporting level. {% enddocs %}

{% docs impressions_unique_device %} The number of impressions de-duplicated for unique devices; this metric is presumed to be de-duplicated daily as received from the source data, therefore, aggregating over a span of days is better done in the UI. {% enddocs %}

{% docs installations%} An installation event is when the user opens the App after downloaded it (User Opt-In only). If the App was downloaded but not opened or opened offline, this will not count; if the user opts out of sending data back to Apple, there will also be no data here. A value of 0 indicates there were 0 installations or no value from the source report that day. {% enddocs %}

{% docs page_views %} When a user taps on a link from an app, website or App Clip card that brings them to your App Store product page, the immediate product page_view is attributed to the referring app, website, or App Clip. {% enddocs %}

{% docs page_views_unique_device %} The number of page_views de-duplicated for unique devices; this metric is presumed to be de-duplicated daily as received from the source data, therefore, aggregating over a span of days is better done in the UI. {% enddocs %}

{% docs platform_version %} The platform version of the device engaging with your app. {% enddocs %}

{% docs quantity %} The number of occurrences of a given subscription event. {% enddocs %}

{% docs sessions %} Sessions is the count of the number of times the app has been used for at least two seconds (User Opt-In only). If the app is in the background and is later used again, that counts as another session. A value of 0 indicates there were 0 sessions or no value from the source report that day. {% enddocs %}

{% docs redownloads %} The count of redownloads where a redownload occurs when a user who previously downloaded your app adds it to their device again (User Opt-In only); credit is attributed to the source recorded when a user tapped to download/launch your app for the first time. A value of 0 indicates there were 0 redownloads or no value from the source report that day. {% enddocs %}

{% docs source_type %} A source is counted when a customer follows a link to your App Store product page. 
Source Types include:
- Unavailable: Sales and usage data display sources as unavailable if users downloaded your app before App Analytics started tracking source attribution on April 15, 2017. As users download your app for the first time, you will see more complete sources data. If a user downloads your app using an App Store gift card or promotional code, the source type will also show as unavailable.
- App Store Browse: Users viewed your app or tapped to download it while browsing the App Store (for example, in the Today, Games, or Apps sections).
- App Store Search: Users viewed your app or downloaded it from Search on the App Store. Includes Search Ads in App Store search.
- Institutional Purchase: Users downloaded your app from Apple Business Manager or Apple School Manager.
- App Referrer: Users tapped a link in an app that brought them to your App Store product page. Includes apps using the StoreKit API to load your product page. Includes Apple apps, such as Messages, except Safari.
- App Clip: Users tapped a link in your App Clip that brought them to your App Store product page. If the user then downloaded your app, the resulting Download is attributed to your App Clip as the source.
- Web Referrer: Users tapped a link from a website that brought them to your App Store product page. If a chain of redirects in Safari leads to your App Store product page, the referring website will be the last URL in the chain.
- No Associated Source Type: This source type is created in the Apple App Store package in order to account for crashes and subscription events and is not an official Apple defined source type.
{% enddocs %}

{% docs state %} The state associated with the subscription event metrics or subscription summary metrics. {% enddocs %}

{% docs subscription_name %} The subscription name associated with the subscription event metric or subscription summary metric. {% enddocs %}

{% docs territory %} The territory associated with the report's respective metric(s). {% enddocs %}

{% docs total_downloads %} Total Downloads is the sum of Redownloads and First Time Downloads. {% enddocs %}





