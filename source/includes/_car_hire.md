# Car Hire Live Prices

Retrieve live prices for car hire providers.

The live updates are performed asynchronously so you need to create a session and then poll for updates.
Please note that it may take up to a minute to update all the results. After you create a session, you will immediately get the results of the first poll.

The Create Session request (HTTP GET) contains all query parameters, such as pickup and dropoff locations. The URL which should be used to poll the session is returned in the HTTP Response Header "Location".

The Poll Session (HTTP GET) should be used to poll the session at a suitable interval (e.g. every 1-3 seconds) whilst there are still updates pending.


## Creating the session

```shell
curl "http://partners.api.skyscanner.net/apiservices/carhire/liveprices/v2/
  {market}/{currency}/{locale}/
  {pickupplace}/{dropoffplace}/
  {pickupdatetime}/{dropoffdatetime}/
  {driverage}?apiKey={apiKey}&userip={userip}}"
  -X GET
  -H "Content-Type: application/x-www-form-urlencoded"
  -H "Accept: application/jsonp"

```

### Request

*API endpoint*

GET `/carhire/liveprices/v2/{market}/{currency}/{locale}/{pickupplace}/{dropoffplace}/{pickupdatetime}/{dropoffdatetime}/{driverage}`

*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/eb787038fadc6e9607d6)

*HEADER VALUES*

| Header | Value |
| --- | --- |
| `Content-Type` <br><span class="required">REQUIRED</span> | `application/x-www-form-urlencoded` |
| ```Accept```<br><span class="optional">OPTIONAL</span> | ```application/json```, ```application/jsonp``` or ```application/xml```<br>The default response format is XML |

*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```country``` <br><span class="required">REQUIRED</span> | The [market country](#markets) your user is in |
| ```currency``` <br><span class="required">REQUIRED</span> | The [currency](#currencies) you want the prices in |
| ```locale``` <br><span class="required">REQUIRED</span> | The [locale](#locales) you want the results in (ISO locale) |
| ```pickupPlace``` <br><span class="required">REQUIRED</span> | The pickup location. IATA code or autosuggest place ID or a latitude,longitude pair formatted like this: lat,lon-latlong e.g. /55.95,-3.37-latlong/ |
| ```dropoffPlace``` <br><span class="required">REQUIRED</span> | The dropoff location. IATA code or autosuggest place ID or a latitude,longitude pair formatted like this: lat,lon-latlong e.g. /55.95,-3.37-latlong/ |
| ```pickupDateTime``` <br><span class="required">REQUIRED</span> | Date and time for pickup. Formatted as ISO Date and Time format (YYYY-MM-DDThh:mm) |
| ```dropoffDateTime``` <br><span class="optional">OPTIONAL</span> | Date and time for dropoff. Formatted as ISO Date and Time format (YYYY-MM-DDThh:mm) |
| ```driverAge``` <br><span class="required">REQUIRED</span> | Must be between 21 and 75 (inclusive). |
| ```userIp ``` <br><span class="required">REQUIRED</span> | The IP address of the end user (IPv4 only) |
| ```apiKey``` <br><span class="required">REQUIRED</span> | Your API key |

### Response


> Example response from US to anywhere:

```json
{
  {
  "submitted_query": {
    "market": "GB",
    "currency": "GBP",
    "locale": "en-GB",
    "pickup_place": "EDI",
    "dropoff_place": "EDI",
    "pickup_date_time": "2017-07-01T10:00",
    "drop_off_date_time": "2017-07-07T17:00",
    "driver_age": "35"
  },
  "cars": [
    {
      "sipp": "CDMD",
      "image_id": 523911,
      "price_all_days": 262.6,
      "seats": 5,
      "doors": 5,
      "bags": 3,
      "manual": true,
      "air_conditioning": true,
      "mandatory_chauffeur": false,
      "website_id": "argu",
      "vehicle": "Opel Astra or similar",
      "deeplink_url": "http://partners.api.skyscanner.net/apiservices/deeplink/v2?_c[...]",
      "car_class_id": 3,
      "location": {
        "pick_up": {
          "address": "CAR RENTAL CENTRE EDINBURGH APT 176 JUBILEE ROAD, EDINBURGH, EH12 9FT",
          "distance_to_search_location_in_km": 0.0992002183,
          "geo_info": [
            55.95,
            -3.362
          ]
        }
      },
      "value_add": {
        "fuel": {
          "type": "diesel",
          "policy": "full_to_full",
          "fair": true
        },
        "insurance": {
          "theft_protection": true,
          "third_party_cover": true,
          "free_collision_waiver": true
        },
        "free_cancellation": true,
        "free_breakdown_assistance": true,
        "additional_drivers": {
          "paid": {
            "currency_id": "GBP",
            "price": 84
          }
        },
        "included_mileage": {
          "unlimited": true
        }
      }
    },
  ...
  ],
  "websites": [
    {
      "id": "erac",
      "name": "Enterprise",
      "image_url": "http://logos.skyscnr.com/images/websites/erac.png",
      "in_progress": false,
      "optimised_for_mobile": true
    },
  ...
  ],
  "images": [
    {
      "id": 356029,
      "url": "http://logos.skyscnr.com/images/carhire/sippmaps/citroen_berlingo.jpg"
    },
  ...
  ],
  "car_classes": [
    {
      "id": 1,
      "sort_order": 0,
      "name": "Mini"
    },
    ...
  ]
}
```


A successful session creation will immediately 302 to the first poll. This poll will respond as follows, with the URL to subsequently poll the session included in the Location header.
<aside class="warning">
Please refer to our <a href="#response-codes">response codes</a> in case of unsuccessful response.
</aside>

*RESPONSE PARAMETERS*

| Element | Detail |
| ------- | ------ |
| `Location Header` | Contains the URL for polling the results. |


## Polling the results

### Request


### Response

