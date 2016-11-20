# Locales

Retrieve the locales that we support to translate your content.

```shell
GET "http://partners.api.skyscanner.net/apiservices/
    reference/v1.0/locales?
    apiKey={apiKey}"
```

*API endpoint*

`/reference/v1.0/locales`

*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```apiKey``` <br><span class="required">REQUIRED</span> | The API Key to identify the customer |

```json
{
  "Locales": [
    {
      "Code": "ar-AE",
      "Name": "العربية (الإمارات العربية المتحدة)"
    },
    {
      "Code": "az-AZ",
      "Name": "Azərbaycan­ılı (Azərbaycan)"
    },
    {
      "Code": "bg-BG",
      "Name": "български (България)"
    },
    {
      "Code": "ca-ES",
      "Name": "català (català)"
    },
  ...
  ]
}
```


*RESPONSE PARAMETERS*

| Parameter | Description |
| --- | --- |
| ```Locales``` | Contains the list of markets (array of countries as name-value pairs). |
