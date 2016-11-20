# Markets

Retrieve the market countries that we support.

Most suppliers (airlines, travel agents and car hire dealers) set their fares based on the market (or country of purchase). It is therefore necessary to specify the market country in every query.

```shell
GET "http://partners.api.skyscanner.net/apiservices/
    reference/v1.0/countries/
     `{locale}` ?
    apiKey={apiKey}"
```

*API endpoint*

`/reference/v1.0/countries`

*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```locale``` <br><span class="required">REQUIRED</span> | The language you want the results in (ISO locale) |
| ```apiKey``` <br><span class="required">REQUIRED</span> | The API Key to identify the customer |

```json
{
  "Countries": [
    {
      "Code": "AD",
      "Name": "Andorra"
    },
    {
      "Code": "AE",
      "Name": "United Arab Emirates"
    },
    {
      "Code": "AF",
      "Name": "Afghanistan"
    },
  ...
  ]
}
```


*RESPONSE PARAMETERS*

| Parameter | Description |
| --- | --- |
| ```Countries``` | Contains the list of markets (array of countries as name-value pairs). |
