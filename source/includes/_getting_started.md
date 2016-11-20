# Getting Started

The APIs we provide are:

*Flights Cheapest Prices*

| API endpoint | Description  |
| --- | ---|
| [Browse Quotes](#cheapest-prices) | Returns a list of the cheapest destinations (countries, cities or airports) from cache data. |
| [Browse Routes](#cheapest-prices) | Returns a view of flights  the level of precision. |
| [Browse Dates](#cheapest-prices) | Returns the lowest price on the specified route across either a month / 12 month period. |
| [Browse<br> Grid](#cheapest-prices) | Similar to Browse Dates but outputs a two-dimensional array to be easily displayed as a table. |


*Flights Live Prices*

| API endpoint | Description  |
| --- | ---|
| [Live prices](#flights-live-prices) | Returns live prices from all our suppliers (in the selected market) for the requested route. May take up to a minute |

<aside class="warning">
The Live Pricing API requires a good handling of APIs. You must first create a session and then poll for results. Given the volume of suppliers that we query, it may take up to a minute to retrieve all the results.
</aside>

*Car Hire*

| API endpoint | Description  |
| --- | ---|
| [Live prices](#flights-live-prices) | Returns live prices from all our suppliers (in the selected market). May take up to a minute |

Before you get started consider how our data fits into your project. Use the Browse Cache Pricing API if your project:

* Requires a single price between specific airports or a list of prices between all airports in a city or country (to another city, country or worldwide)
* Doesn't require any comparison of prices on specific routes
* Requires minimal setup, or if you're new to HTTP APIs, Response Headers and Polling.

<aside class="notice">
We encourage you to start with the Browse Cached Pricing API unless you definitely need Live Pricing and are comfortable with HTTP APIs.
Upgrading from Browse Cached Pricing to Live Pricing can always be done later!
</aside>