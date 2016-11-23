# Flights Cache Prices

## Browse Quotes

Retrieve the cheapest quotes from our cache.

```shell
curl "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/{market}/{currency}/{locale}/
  {originPlace}/
  {destinationPlace}/
  {outboundPartialDate}/
  {inboundPartialDate}?
  apiKey={apiKey}"
  -X GET
  -H "Accept: application/json"

```

*API endpoint*

GET `/browsequotes/v1.0/{market}/{currency}/{locale}/{originPlace}/{destinationPlace}/{outboundPartialDate}/{inboundPartialDate}`

*HEADER VALUES*

| Header | Value |
| --- | --- |
| ```Accept```<br><span class="optional">OPTIONAL</span> | ```application/json``` or ```application/xml```<br>The default response format is XML |

*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```market``` <br><span class="required">REQUIRED</span> | The [market/country](#markets) your user is in |
| ```currency``` <br><span class="required">REQUIRED</span> | The [currency](#currencies) you want the prices in |
| ```locale``` <br><span class="required">REQUIRED</span> | The [locale](#locales) you want the results in (ISO locale) |
| ```originPlace``` <br><span class="required">REQUIRED</span> | The origin place (see [places](#places)) |
| ```destinationPlace``` <br><span class="required">REQUIRED</span> | The destination place (see [places](#places)) |
| ```outboundPartialDate``` <br><span class="required">REQUIRED</span> | The outbound date. Format "yyyy-mm-dd", "yyyy-mm" or "anytime". |
| ```inboundPartialDate``` <br><span class="optional">OPTIONAL</span> | The return date. Format "yyyy-mm-dd", "yyyy-mm" or "anytime". Use empty string for oneway trip. |
| ```apiKey``` <br><span class="required">REQUIRED</span> | The API Key to identify the customer |


> Example response from US to anywhere:

```json
{
  "Routes": [
    {
      "OriginId": 1811,
      "DestinationId": 1845,
      "QuoteIds": [
        1,
        2
      ],
      "Price": 326,
      "QuoteDateTime": "2016-11-13T01:30:00"
    },
    {
      "OriginId": 1811,
      "DestinationId": 929,
      "QuoteIds": [
        3
      ],
      "Price": 150,
      "QuoteDateTime": "2016-11-09T17:44:00"
    },
  ...
  ],
  "Quotes": [
    {
      "QuoteId": 1,
      "MinPrice": 381,
      "Direct": true,
      "OutboundLeg": {
        "CarrierIds": [
          470
        ],
        "OriginId": 68033,
        "DestinationId": 42833,
        "DepartureDate": "2017-02-03T00:00:00"
      },
      "InboundLeg": {
        "CarrierIds": [
          470
        ],
        "OriginId": 42833,
        "DestinationId": 68033,
        "DepartureDate": "2017-02-06T00:00:00"
      },
      "QuoteDateTime": "2016-11-09T21:20:00"
    },
  ...
  ],
  "Places": [
    {
      "PlaceId": 837,
      "Name": "United Arab Emirates",
      "Type": "Country",
      "SkyscannerCode": "AE"
    },
  ...
  ],
  "Carriers": [
    {
      "CarrierId": 29,
      "Name": "Mombasa Air Safari"
    },
    {
      "CarrierId": 173,
      "Name": "Silver Airways"
    },
  #...#
  ],
  "Currencies": [
    {
      "Code": "EUR",
      "Symbol": "€",
      "ThousandsSeparator": " ",
      "DecimalSeparator": ",",
      "SymbolOnLeft": false,
      "SpaceBetweenAmountAndSymbol": true,
      "RoundingCoefficient": 0,
      "DecimalDigits": 2
    }
  ]
}
```


*RESPONSE PARAMETERS*

| Parameter | Description |
| --- | --- |
| `Routes`| Contains the routes which are assembled from the individual quotes. |
| ```Quotes``` | Contains the list of markets (array of countries as name-value pairs). |
| ```Places``` | Contains the list of markets (array of countries as name-value pairs). |
| ```Carriers``` | Contains the list of markets (array of countries as name-value pairs). |
| ```Currencies``` | Contains the list of markets (array of countries as name-value pairs). |

