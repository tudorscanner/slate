# Getting Started

*Flights Cache Prices*

| API endpoint | Description  |
| --- | ---|
| [Browse Quotes](#cheapest-prices) | Returns a list of the cheapest quotes from our cache data. |
| [Browse Routes](#cheapest-prices) | Returns a list of the cheapest destinations (countries, cities or airports) from cache data. |
| [Browse Dates](#cheapest-prices) | Returns the lowest price on the specified route across either a month / 12 month period. |
| [Browse<br> Grid](#cheapest-prices) | Similar to Browse Dates but outputs a two-dimensional array to be easily displayed as a table. |


*Flights Live Prices*

| API endpoint | Description  |
| --- | ---|
| [Live prices](#flights-live-prices) | Returns live prices for the request flight itinery from all our suppliers (in the selected market). |


*Car Hire Live Prices*

| API endpoint | Description  |
| --- | ---|
| [Live prices](#) | Returns live prices for car hire deals from all our suppliers (in the selected market). |

*Hotels Live Prices*

| API endpoint | Description  |
| --- | ---|
| [Live prices](#)<br><span class="required">PRIVATE BETA</span> | Returns live prices for hotel deals from all our suppliers (in the selected market). |

<aside class="warning">
Given the large number of suppliers that we query for quotes, the Live Pricing may take up to a minute to return all the results.

Unless you require exact prices, we recommend you start with the cache prices API.
</aside>

Before you get started consider how our data fits into your project. Use the Browse Cache Pricing API if your project:

* Requires a single price between specific airports or a list of prices between all airports in a city or country (to another city, country or worldwide)
* Doesn't require any comparison of prices on specific routes
* Requires minimal setup, or if you're new to HTTP APIs, Response Headers and Polling.

<aside class="notice">
We encourage you to start with the Browse Cached Pricing API unless you definitely need Live Pricing and are comfortable with HTTP APIs.
Upgrading from Browse Cached Pricing to Live Pricing can always be done later!
</aside>