# Places

Places can be of 3 different types:

1. country
2. city
3. airport

Our Autosuggest endpoint can be used to obtain:

* a list of places and corresponding IDs that match a query string

* information about a specific place given its ID (for example city name and country name for an airport)

The country and language must be included in the query so that the most relevant results can be returned, in the correct language.


## List of places

Get a list of places that match a query string.

```shell
GET "http://partners.api.skyscanner.net/apiservices/
    autosuggest/v1.0/{market}/{currency}/{locale}?
    query={query}&
    apiKey={apiKey}"
```
*API endpoint*

`GET /autosuggest/v1.0/{market}/{currency}/{locale}`

*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```market``` <br><span class="required">REQUIRED</span> | The [market/country](#markets) your user is in |
| ```currency``` <br><span class="required">REQUIRED</span> | The [currency](#currencies) you want the prices in |
| ```locale``` <br><span class="required">REQUIRED</span> | The [locale](#locales) you want the results in (ISO locale) |
| ```query``` <br><span class="required">REQUIRED</span> | The query string, must be at least 2 characters long. |
| ```apiKey``` <br><span class="required">REQUIRED</span> | Your API Key. |

> Example response for query=pari

```json
{
  "Places": [
    {
      "PlaceId": "PARI-sky",
      "PlaceName": "Paris",
      "CountryId": "FR-sky",
      "RegionId": "",
      "CityId": "PARI-sky",
      "CountryName": "France"
    },
    {
      "PlaceId": "CDG-sky",
      "PlaceName": "Paris Charles de Gaulle",
      "CountryId": "FR-sky",
      "RegionId": "",
      "CityId": "PARI-sky",
      "CountryName": "France"
    },
    {
      "PlaceId": "ORY-sky",
      "PlaceName": "Paris Orly",
      "CountryId": "FR-sky",
      "RegionId": "",
      "CityId": "PARI-sky",
      "CountryName": "France"
    },
  ...
  ]
}
```


*RESPONSE PARAMETERS*

| Parameter | Description |
| --- | --- |
| ```Places``` | Contains the list of places that match the query string. The places can be countries, cities or airports. |


## Place Information

Get information about a country, city or airport using its ID.

*API endpoint*

`GET /autosuggest/v1.0/{market}/{currency}/{locale}`

```shell
GET "http://partners.api.skyscanner.net/apiservices/
    autosuggest/v1.0/{market}/{currency}/{locale}?
    id={place_id}&
    apiKey={apiKey}"
```

*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```market``` <br><span class="required">REQUIRED</span> | The [market/country](#markets) your user is in |
| ```currency``` <br><span class="required">REQUIRED</span> | The [currency](#currencies) you want the prices in |
| ```locale``` <br><span class="required">REQUIRED</span> | The [locale](#locales) you want the results in (ISO locale) |
| ```id``` <br><span class="required">REQUIRED</span> | The place id. |
| ```apiKey``` <br><span class="required">REQUIRED</span> | Your API Key |

> Example response for United Kingdom: id=uk

```json
{
  "Places": [
    {
      "PlaceId": "UK-sky",
      "PlaceName": "United Kingdom",
      "CountryId": "UK-sky",
      "CityId": "-sky",
      "CountryName": "United Kingdom"
    }
  ]
}
```

> Example response for Charles de Gaulle airport: id=cdg

```json
{
  "Places": [
    {
      "PlaceId": "CDG-sky",
      "PlaceName": "Paris Charles de Gaulle",
      "CountryId": "FR-sky",
      "CityId": "PARI-sky",
      "CountryName": "France"
    }
  ]
}
```


*RESPONSE PARAMETERS*

| Parameter | Description |
| --- | --- |
| ```Places``` | Contains the information about the place such as name (in chosen locale), city, country. |


## Schemas

> Example place codes:

```shell
EDIN-sky
```
```shell
CDG-iata
```

Each place can be referred to via different schemas, described below.

*SCHEMAS*

| Parameter | Description |
| --- | --- |
| sky | Skyscanner code. The response from [Autosuggest](#place-information) provides these ids. |
| iata / iso | Airports and cities often use the internationally recognized IATA and ISO schemas.<br>Although we support these schemas we recommend that you use the Skyscanner code which is very similar but solves ambiguous cases where a city and one of its airports share the same code.|
| latlong |	Latitude and longitude of the place in the following form: "latitude,longitude". The nearest city with airport will be used. |
| ip | IP of a user. The nearest city with airport will be used. |
| rnid | A unique ID for a location in Skyscanner. For example EDIN is the Skyscanner code for Edinburgh City and its Rnid is 2343. |
| GeoNameCodes | GeoNameCodes from the GeoNames schema (see [geonames.org](www.geonames.org))|
| GeoNameIDs | GeoNameIDs from the GeoNames schema (see [geonames.org](www.geonames.org))|


If the default Skyscanner schema is not used, the schema name must be appended to the place id as follows:
`placeCode-locationSchema`



