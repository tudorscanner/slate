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

`GET /carhire/liveprices/v2/{market}/{currency}/{locale}/{pickupplace}/{dropoffplace}/{pickupdatetime}/{dropoffdatetime}/{driverage}`

*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/eb787038fadc6e9607d6)

or go to the [test harness](http://business.skyscanner.net/portal/en-GB/Documentation/CarHireLivePricingQuickStart)

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
| ```pickupPlace``` <br><span class="required">REQUIRED</span> | The pickup location. [IATA code](#schemas) or a latitude,longitude pair formatted as lat,lon-latlong e.g. `/55.95,-3.37-latlong/` |
| ```dropoffPlace``` <br><span class="required">REQUIRED</span> | The dropoff location. [IATA code](#schemas) or a latitude,longitude pair formatted as lat,lon-latlong e.g. `/55.95,-3.37-latlong/` |
| ```pickupDateTime``` <br><span class="required">REQUIRED</span> | Date and time for pickup. Formatted as ISO Date and Time format: `YYYY-MM-DDThh:mm` |
| ```dropoffDateTime``` <br><span class="optional">OPTIONAL</span> | Date and time for dropoff. Formatted as ISO Date and Time format: `YYYY-MM-DDThh:mm` |
| ```driverAge``` <br><span class="required">REQUIRED</span> | Must be between 21 and 75 (inclusive). |
| ```userIp ``` <br><span class="required">REQUIRED</span> | The IP address of the end user (IPv4 only). Format: `188.39.95.93`|
| ```apiKey``` <br><span class="required">REQUIRED</span> | Your API key |

### Response


> Example response with polling url in the header:

```shell
Location "/apiservices/carhire/liveprices/v2/eyJvIjpbImRhdGFhcGkiLCJHQiIsImVuLUdCIiwiR0JQIiwiRURJIiwiMjAxNy0wNy0wMVQxMDowMDowMCIsIjIwMTctMDctMDdUMTc6MDA6MDAiLCJFREkiLDM1LCIxMjcuMC4wLjEiXSwibiI6LTI1OTAzfQ2?apikey=_aiX_D_g9kkg_cu_2ybJepzeH7dUcY0gh8q-oXHKdD0RuHu1itrfqIeyKIaVJ5m8vkR5euhcsN4XDFGFk1ofaDw%3D%3D&deltaExcludeWebsites=easc%2Cecon"
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

Polling the session will return the details of all possible car hire quotes that satisfy the request query parameters. Prices will be obtained for the car hire quotes during the session. The calling application should poll the session in 1-3 second intervals until all updates are complete (all returned websites have inProgress equal to false), and all prices have been populated. This can take from a few seconds to a minute depending on the query.

Please allow at least one second between polls.

A note about delta results

In your polling requests you may specify a parameter called 'deltaExcludeWebsites'. This is a CSV or semicolon-separated list of website IDs. The server will set this in the Location headers to exclude whatever websites have finished sending results (inProgress equal to false). Excluding any given provider will remove its cars and website information from your result. Merely supplying&deltaExcludeWebsites= removes all images, the query, and the car classes lookup. The Location header in the first poll will include this parameter, even if it's an empty string, in order that you don't fetch that information multiple times.


```shell
curl "http://partners.api.skyscanner.net/apiservices/carhire/liveprices/v2/{sessionKey}?apiKey={apiKey}&deltaExcludeWebsites={a,b,c...}""
```

### Request


*API ENDPOINT*

`GET /carhire/liveprices/v2/{sessionKey}`

*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/eb787038fadc6e9607d6)

or go to the [test harness](http://business.skyscanner.net/portal/en-GB/Documentation/CarHireLivePricingQuickStart)


*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```deltaExcludeWebsites ``` <br><span class="optional">OPTIONAL</span> | A list of website IDs whose results you want to discard, or an empty string. CSV or semicolon-separated values. |
| ```apiKey``` <br><span class="required">REQUIRED</span> | Your API key |


> Example response with polling url in the header:

```json
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
      },
      "vendor": {
          "logo_url": "http://logos.skyscnr.com/images/carhire/vendors/675.png",
          "name": "Green Motion",
          "id": 675
      },
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

### Response

| Parameter | Description |
| --- | --- |
| `submitted_query` | Contains the URL for polling the results. |
| `cars` | The list of available cars. See Car Details below. |
| `websites` | A reference list of websites where the cars can be hired, including website logo url. The boolean field "in_progress" indicates whether or not there are still updates pending for that website. |
| `images` | Contains the images of the car types. |
| `car_classes` | Contains the URL for polling the results. |


*CAR DETAILS*

| Parameter | Description |
| --- | --- |
| `sipp` | SIPP code (see codes guide) |
| `image_id` | reference to the images set |
| `price_all_days` | total price |
| `seats` | number of seats |
| `doors` | number of doors |
| `bags` | number of bags |
| `manual` | Boolean |
| `air_conditioning`| Boolean|
| `mandatory_chauffeur`| Boolean. Indicates whether the vehicle comes with a driver. This is particularly frequent in countries like India where it is common for a driver to be supplied with a car.|
| `website_id`| reference to the website set |
| `vehicle`| vehicle (name and type) |
| `deeplink_url`| contains the URL to deeplink through to the partner website. Please add the no-follow attribute when you link to the deeplink. See How do I add the nofollow attribute? in the FAQ section.|
| `car_class_id`| reference to the car_classes set|
| `location`| location containing address, lat/lon and distance to search location for pick up and drop off places (drop off can be not available even though the query contains a drop off place) |
| `value_add`| See below |
| `vendor`| Car vendor information (id, name and logo URL). Unlike `website`, represents not the booking agent, but direct supplier of the car (could be the same). |

*CAR VALUE_ADD* 

| Parameter | Description |
| --- | --- |
| `fuel` | containing 'type' (one of "petrol", "diesel", "lpg", "electric" or null); 'policy' (one of "full_to_full", "quarter_to_quarter", "half_to_half", "free_full_tank", "half_to_empty", "quarter_to_empty" or null); 'fair' (boolean)|
| `free_equipments` | subset of [radio, gps, roof_rack, ski_rack, snow_chains, snow_tyres, baby_seat, child_seat, booster_seat]  |
| `insurance` | containing 'theft_protection' (boolean or null), 'third_party_cover' (boolean or null), 'free_collision_waiver' (boolean or null), 'free_damage_refund' (boolean or null) |
| `young_driver_surcharge` | Boolean or null |
| `one_way_surcharge` | Boolean or null |
| `free_cancellation` | Boolean or null |
| `free_breakdown_assistance` | Boolean or null |
| `additional_drivers` | containing 'free' (int of how many free drivers); paid (containing currency_id and price); original_price (containing currency_id and price) |
| `included_mileage` | containing 'unlimited' (boolean or null); 'unit' (can be "km" or "mile"); 'included' (int how many km/miles included in the booking) |


