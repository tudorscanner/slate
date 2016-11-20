# Flights Cheapest Prices

## Browse Quotes

Retrieve the cheapes quotes from our cache.

```shell
GET "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/{market}/{currency}/{locale}/
{originPlace}/
{destinationPlace}/
{outboundPartialDate}/
{inboundPartialDate}?
apiKey={apiKey}"
```

*API endpoint*

`/browsequotes/v1.0/{market}/{currency}/{locale}/{originPlace}/{destinationPlace}/{outboundPartialDate}/{inboundPartialDate}`

*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```market``` <br><span class="required">REQUIRED</span> | The market/country your user is in |
| ```currency``` <br><span class="required">REQUIRED</span> | The currency you want the prices in |
| ```locale``` <br><span class="required">REQUIRED</span> | The language you want the results in (ISO locale) |
| ```originPlace``` <br><span class="required">REQUIRED</span> | The language you want the results in (ISO locale) |
| ```destinationPlace``` <br><span class="required">REQUIRED</span> | The language you want the results in (ISO locale) |
| ```outboundPartialDate``` <br><span class="required">REQUIRED</span> | The language you want the results in (ISO locale) |
| ```inboundPartialDate``` <br><span class="required">REQUIRED</span> | The language you want the results in (ISO locale) |
| ```apiKey``` <br><span class="required">REQUIRED</span> | The API Key to identify the customer |


```json
{
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
| ```Quotes``` | Contains the list of markets (array of countries as name-value pairs). |
| ```Places``` | Contains the list of markets (array of countries as name-value pairs). |
| ```Carriers``` | Contains the list of markets (array of countries as name-value pairs). |
| ```Currencies``` | Contains the list of markets (array of countries as name-value pairs). |
