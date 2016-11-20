# Currencies

Retrieve the currencies that we support.

```shell
GET "http://partners.api.skyscanner.net/apiservices/
    reference/v1.0/currencies?
    apiKey={apiKey}"
```
*API endpoint*

`/reference/v1.0/currencies`

*REQUEST PARAMETERS*

Parameter | Description |
--------- | ------- |
```apiKey``` <br><span class="required">REQUIRED</span> | The API Key to identify the customer |

```json
{
  "Currencies": [
      {
          "Code": "USD",
          "Symbol": "$",
          "ThousandsSeparator": ",",
          "DecimalSeparator": ".",
          "SymbolOnLeft": true,
          "SpaceBetweenAmountAndSymbol": false,
          "RoundingCoefficient": 0,
          "DecimalDigits": 2
      },
  ...
  ]
}
```


*RESPONSE PARAMETERS*

| Parameter | Description |
| --- | --- |
| ```Currencies``` | The list of currencies that we support, with corresponding symbol and formatting information for internationalisation. |
