# Getting Started

## Flights

*Flights - Browse Prices*

| API endpoint | Description  |
| --- | ---|
| [Browse Quotes](#browse-quotes) | Returns the <b>cheapest quotes</b> that meet your query. The prices come from our cached prices resulting from our users' searches. |
| [Browse Routes](#browse-routes) | Similar to Browse Quotes but with the quotes grouped by routes. This provides the <b>cheapest destinations</b> (countries, cities or airports) from our cached data. |
| [Browse Dates](#browse-dates) | Similar to Browse Quotes but with the quotes grouped by outbound and inbound date. Useful to find the <b>lowest price</b> for a given route, over either a month or a 12 month period. |
| [Browse Grid](#browse-dates-grid) | Similar to Browse Dates but with some pre-processing on our side to output a two-dimensional array to easily display the response in <b>calendar format</b>. |


*Flights - Live Prices*

| API endpoint | Description  |
| --- | ---|
| [Live prices](#flights-live-prices) | Returns live prices from all our suppliers for the requested flight itinerary (in the selected market). |

<aside class="warning">
Given the large number of suppliers that we query for quotes, the Live Pricing may take up to a minute to return all the results.

Unless you require exact prices, we recommend you start with the cache prices API.
</aside>

## Car Hire

*Car Hire Live Prices*

| API endpoint | Description  |
| --- | ---|
| [Live prices](#car-hire-live-prices) | Returns live prices from all our suppliers for car hire deals (in the selected market). |

## Hotels

*Hotels Live Prices*

| API endpoint | Description  |
| --- | ---|
| [Live prices](#hotels-live-prices)<br><span class="required">PRIVATE BETA</span> | Returns live prices from all our suppliers for hotel deals (in the selected market). |

<aside class="warning">
	Please note that the Skyscanner Hotels API is being reworked, and is currently unavailable. Legacy documentation is available <a href="https://support.business.skyscanner.net/hc/en-us/articles/212098705-Hotels-Price-List-and-Hotels-Details-service" target="_blank">here</a>
</aside>
