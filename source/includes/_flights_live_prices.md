# Flights Live Prices

The Live Pricing Service Session must be created before any pricing data can be obtained. The request contains details of the locations, dates, passengers, cabin class and user details. These parameters define the session, and cannot be changed within the session (with the exception of passenger numbers).

![diagram](/images/Skyscanner_UMLDiagram_v3_EJ-01-01.png)

<aside class="warning">
We do not support client-side implementation of our Live Prices API using CORS requests due to the potential security
risk of exposing account API keys.
</aside>

## Creating the session

```shell
curl "http://partners.api.skyscanner.net/apiservices/pricing/v1.0"
    -X POST
    -H "Content-Type: application/x-www-form-urlencoded"
    -d 'cabinclass=Economy
    &country=UK
    &currency=GBP
    &locale=en-GB
    &locationSchema=iata
    &originplace=EDI
    &destinationplace=LHR
    &outbounddate=2017-05-30
    &inbounddate=2017-06-02
    &adults=1
    &children=0
    &infants=0
    &apikey=prtl6749387986743898559646983194'

```

*API endpoint*

`POST /pricing/v1.0`

*HEADER VALUES*

| Header | Value |
| --- | --- |
| `Content-Type header` <br><span class="required">REQUIRED</span> | `application/x-www-form-urlencoded` |
| `X-Forwarded-For` <br><span class="required">REQUIRED</span> | user's IP address |
| `Accept` <br><span class="optional">OPTIONAL</span> | `application/json` or `application/xml` <br>The default response format is XML |

*REQUEST PARAMETERS (FORM)*

| Parameter | Description |
| --------- | ------- |
| ```market``` <br><span class="required">REQUIRED</span> | The [market/country](#markets) your user is in |
| ```currency``` <br><span class="required">REQUIRED</span> | The [currency](#currencies) you want the prices in |
| ```locale``` <br><span class="required">REQUIRED</span> | The [locale](#locales) you want the results in (ISO locale) |
| ```originPlace``` <br><span class="required">REQUIRED</span> | The origin place (see [places](#places)) |
| ```destinationPlace``` <br><span class="required">REQUIRED</span> | The destination place (see [places](#places)) |
| ```outboundDate``` <br><span class="required">REQUIRED</span> | The outbound date. Format "yyyy-mm-dd". |
| ```inboundDate``` <br><span class="optional">OPTIONAL</span> | The return date. Format "yyyy-mm-dd". Use empty string for oneway trip. |
| ```cabinClass``` <br><span class="optional">OPTIONAL</span> | The cabin class  |
| ```adults``` <br><span class="required">REQUIRED</span> | Number between 1 and 8.  |
| ```children``` <br><span class="optional">OPTIONAL</span> | Number between 0 and 8.  |
| ```infants``` <br><span class="optional">OPTIONAL</span> | Number between 0 and 8.  |
| ```apiKey``` <br><span class="required">REQUIRED</span> | Your API Key. |


> Example response with polling url:

```shell
Location "http://partners.api.skyscanner.net/apiservices/pricing/uk1/v1.0/{sessionID}"
```

*RESPONSE PARAMETERS*

| Element | Detail |
| ------- | ------ |
| `Location Header` | Contains the URL for polling the results in the newly created session |

A successful response contains no content. The URL to poll the booking details is specified in the Location header of the response.

Please refer to our [response codes](#response-codes) in case of unsuccessful response.

## Polling the results

## Get booking details

## Polling the booking details