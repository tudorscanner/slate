# Referrals

The [Referrals-api Service](https://github.skyscannertools.net/partnerinsights/referrals-api) is used to provide 
partner redirects to Skyscanner site based to provided request parameters.

*API endpoint*

`GET /{vertical}/{pagetype}?associateid={{ associateId }}`


*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/31ff523d2ff9186107e1)


*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```vertical``` <br><span class="required">REQUIRED</span> | Your Vertical. Allowed values: flights, hotels, cars|
| ```pagetype``` <br><span class="required">OPTIONAL</span> | Your page type|
| ```associateid``` <br><span class="required">OPTIONAL</span> | Associate partner id to attribute traffic to|

Specific request query parameters are provided in tables below.

*RESPONSE PARAMETERS*

A successful response contains no content and returns [HTTP 301](https://en.wikipedia.org/wiki/HTTP_301).
The URL to redirect to is provided in the Location header of the response.

<aside class="warning">
Please refer to our <a href="#response-codes">response codes</a> in case of unsuccessful response.
</aside>

## Flights Query Parameters

*Flights - API*

| API endpoint | Description  |
| --- | ---|
| [Flights Day View supported query parameters Schema](#flights-day-view-supported-query-parameters-schema) | Schema and Query Parameters Properties for Flights DayView|
| [Flights Calendar Month View supported parameters Schema](#flights-calendar-month-view-supported-query-parameters-schema) | Schema and Query Parameters Properties for Flights MonthView|
| [Flights Browse View supported parameters Schema](#flights-browse-view-supported-parameters-schema) | Schema and Query Parameters Properties for Flights BrowseView |
| [Flights Day View for multicity search Schema](#flights-day-view-for-multicity-search-schema) | Schema and Query Parameters Properties for Flights Multicity</b>. |




## Hotels Query Parameters

*Hotels - API*

| API endpoint | Description  |
| --- | ---|
| [Hotels Day View supported query parameters Schema](#hotels-day-view-supported-query-parameters-schema) | Schema and Query Parameters Properties for Hotels DayView</b>. |



## Cars Query Parameters

*Cars - API*

| API endpoint | Description  |
| --- | ---|
| [Carhire Day View supported query parameters Schema](#carhire-day-view-supported-query-parameters-schema) | Schema and Query Parameters Properties for CarHire DayView</b>. |


