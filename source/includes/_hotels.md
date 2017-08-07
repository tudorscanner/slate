# Hotels Live Prices

<aside class="warning">
    Please note that the first Skyscanner Hotels API will be depricated in December 2017.
    Legacy documentation is available <a href="https://support.business.skyscanner.net/hc/en-us/articles/212098705-Hotels-Price-List-and-Hotels-Details-service" target="_blank">here</a> but please insure you migrate your application to the new API before that date.
    All the documentation below is for the new Hotels API.
</aside>

This service responsible for finding the best hotels with rates around a given entity. It provides endpoints to search prices, a map version of it and a hotel prices one.

## Endpoint

The Hotels API provides a global endpoint: https://gateway.skyscanner.net/hotels/v{version}/ where version points to a specific release.

## Headers

The API expects the header:

- **x-user-agent**: Required. Indicates which is the device related to the client. The format for that header is device;B2B, where:
    - device can be: - T for tablet
        - D for desktop
        - M for mobile
        - N if you are not able to detect the device type
    - For example: M;B2B

## Use flow

All the /prices endpoints are intended to be queried using a polling mechanism using the same parameters as the one that started the polling. The flow of the service is described below:

1. On the first request that a user does, the service will reply with empty results and the status attribute inside the meta object set to *PENDING*. `Metadata PENDING state`.
3. The client needs to keep polling the service with the same query while the status attribute inside the meta object in the response is *PENDING*. On each query, the number of results will grow. `Metadata PENDING state, partial results`.
4. The status attribute will eventually change to *COMPLETED*. Meaning that the search cycle has finished. `Metadata COMPLETED state`.
5. Clients should implement a self-healing mechanism that should include:
    - Finish the polling after X seconds in the scenarios of having the status *PENDING* for so long.
    - Retry mechanism in the scenario of a service failure (Ex: retry after 1 seconds)

## Search Prices

### Entity Request

Given an entity_id, this endpoint will give back hotels with prices around the provided entity. The supported entities are any, from cities, islands, nations, places to Hotels.

The Hotels API, first of all, tries to search for the hotels related to an entity using an explicit relation - cities, administration zones and nations, and if the results are less than a minimum number of hotels the query turns out in a geographical query.
This geographical query seeks for hotels using different distances, from 500 meters to 50km, till finding this minimum amount or get the maximum distance.

When a Hotel is used as the entity queried for, the service will treat this as an ad-hoc case. The hotel used as an entity will be serialized into the *hotel_pivot* object with its offers. Meanwhile, it will be removed from the results object.

The following URL shows how the search prices endpoint can be used to retrieve prices for those hotels that are placed in Barcelona

*API endpoint*

`GET /v1/prices/search/entity/{entity_id}`

```shell
GET "https://gateway.skyscanner.net/hotels/v1/prices/search/entity/{entity_id}
  ?market={market}&locale={locale}&checkin_date={checkin_date}&checkout_date={checkout_date}
  &currency={currency}&adults={adults}&rooms={rooms}&images={images}&image_resolution={resolution}
  &image_type={type}&boost_official_partners={boost}&sort={sort_method}&limit={limit}&offset={offset}
  &partners_per_hotel={num_partners}&enhanced={enhanced}"
```

*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/a3262c8af4a48eece516)

*HEADER VALUES*

| Header | Value |
| --- | --- |
| `x-user-agent` <br><span class="required">REQUIRED</span> | Indicates which is the device and the platform related to the client. The format for that header is `device;B2B`, where:<br>Device is:<br>`T` for tablet<br>`D` for desktop<br>`M` for mobile<br>`N` if you are not able to detect the device type |


*URI PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `entity_id` <br><span class="required">REQUIRED</span> | Entity to search for hotels prices in it |
| `version` <br><span class="required">REQUIRED</span> | API version |

*QUERY PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `market` <br><span class="required">REQUIRED</span> | Matching [A-Z]{2} |
| `locale` <br><span class="required">REQUIRED</span> | Matching [a-z]{2}-[A-Z]{2} |
| `currency` <br><span class="required">REQUIRED</span> | Currency code |
| `checkin_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `checkout_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `rooms` <br><span class="required">REQUIRED</span> | Number of rooms<br>default: 1 |
| `adults` <br><span class="required">REQUIRED</span> | Number of adults<br>default: 2 |
| `apikey` <br><span class="required">REQUIRED</span> | This parameter is required to be on every single request any client does |
| `images` <br><span class="optional">OPTIONAL</span> | Maximum number of images to retrieve per each hotel<br>between 1-30, default: 3 |
| `image_resolution` <br><span class="optional">OPTIONAL</span> | Resolution options<br>high or low, default: high |
| `image_type` <br><span class="optional">OPTIONAL</span> | The format of the images<br>thumbnail or gallery |
| `boost_official_partners` <br><span class="optional">OPTIONAL</span> | Indicates whether prices from official partners must be shown in the first place [1] or not [0]<br>default: 0 |
| `sort` <br><span class="optional">OPTIONAL</span> | Sort by a given attribute. By default the relevance sorting is applied<br>One of: relevance, -relevance, price, -price, distance, -distance, rating, -rating, stars, -stars |
| `price_min` <br><span class="optional">OPTIONAL</span> | Filter. Return only hotels where the cheaper price is at least price_min (included). Cannot be used together with price_buckets |
| `price_max` <br><span class="optional">OPTIONAL</span> | Filter. Return only hotels where the cheaper price is at most price_max (included). Cannot be used together with price_buckets |
| `price_buckets` <br><span class="optional">OPTIONAL</span> | OR filter. Return only hotels with offers inside the specified buckets. Cannot be used together with price_min/price_max |
| `district` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a district matches |
| `stars` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a star category matches. The values must be TravelAPI ids |
| `city` <br><span class="optional">OPTIONAL</span> | OR filter. When the search is done for an entity that contains different cities, this filter is available. Returns only results where the cities match. The values must be TravelAPI entity ids |
| `chain` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a hotel chains matches. The values must be TravelAPI ids |
| `amenities` <br><span class="optional">OPTIONAL</span> | AND filter. Return only results where all amenities match. The values must be TravelAPI ids |
| `cancellation` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a cancellation policies matches. Options are:<br>free_cancellation, non_refundable, refundable, special_conditions |
| `meal_plan` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a meal plan matches. Options are:<br>room_only, breakfast_included, half_board, full_board, all_inclusive |
| `property_type` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where an accommodation type matches. The values must be TravelAPI ids |
| `hotel_name` <br><span class="optional">OPTIONAL</span> | Filter. Return only results where hotel name matches |
| `limit` <br><span class="optional">OPTIONAL</span> | Number of results to retrieve<br>between 1-30, default: 30 |
| `offset` <br><span class="optional">OPTIONAL</span> | How many results to skip from the first position. Useful for paginating<br>default: 0 |
| `partners_per_hotel` <br><span class="optional">OPTIONAL</span> | Maximum numbers of partners to retrieve per each hotel. Note that 0 means all the available partners<br>default: 3 |
| `enhanced` <br><span class="optional">OPTIONAL</span> | This parameter allows you to add additional content to the default response. Available options are:<br>filters: Returns extra object in the response including the filters like stars, district, city, etc.<br>price_slider: Return the price_slider.<br>partners: Returns information about the active partners in the system. is_official, the logo, the name and the website_id.<br>images: Returns images for the hotels. With the partner website_id and the urls.<br>amenities: Returns the hotels amenities.<br>query_location: Returns the location (higher level entities according to the searched entity) and map boundary (the coordinates of the search area).<br>extras: Returns the hotel chain of the hotels.<br>translations: Returns a dictionary with all literals and their corresponding translations using the request locale. |

**Note**: The OR and AND filters allow multiple values coma separated. For example: *&amenities=Lift,Bar*

### Response

> Example response:

```json
{
  "correlation_id": "42be633f-edde-4631-ad8f-87e3fd2b4bf4",
  "meta": {
    "total_available": 1675,
    "hotels_filtered": 4406,
    "offers": 34757,
    "total": 4406,
    "status": "COMPLETED",
    "completion_percentage": 100
  },
  "count": 15,
  "results": {
    "filters": {
      "district": [
        {
          "max_price": null,
          "id": "27562177",
          "count": 350,
          "min_price": 20
        },
        ...
      ],
      "meal_plan": [
        {
          "max_price": null,
          "id": "room_only",
          "count": 1391,
          "min_price": 20
        },
        ...
      ],
      "city": [
        {
          "max_price": null,
          "id": "27544008",
          "count": 4406,
          "min_price": 18
        },
        ...
      ],
      "property_type": [
        {
          "max_price": null,
          "id": "Hotel",
          "count": 1754,
          "min_price": 32
        },
        ...
      ],
      "price_buckets": [
        {
          "max_price": 80,
          "id": "PR_BK_0",
          "count": 91,
          "min_price": null
        },
        ...
      ],
      "stars": [
        {
          "max_price": null,
          "id": "4",
          "count": 735,
          "min_price": 124
        },
        ...
      ],
      "cancellation": [
        {
          "max_price": null,
          "id": "non_refundable",
          "count": 1437,
          "min_price": 20
        },
        ...
      ],
      "chain": [
        {
          "max_price": null,
          "id": "Hilton",
          "count": 14,
          "min_price": 241
        },
        ...
      ],
      "amenities": [
        {
          "max_price": null,
          "id": "WifiService",
          "count": 1993,
          "min_price": 18
        },
        ...
      ]
    },
    "partners": [
      {
        "website_id": "h_mb",
        "logo": "www.skyscanner.net/images/websites/220x80/h_mb.png",
        "is_official": true,
        "name": "Marina Bay Sands"
      },
      ...
    ],
    "hotel_pivot": null,
    "entity": {
      "name": "London",
      "official_center": {
        "coordinates": [
          -0.12801,
          51.50813
        ],
        "type": "Point"
      },
      "entity_id": "27544008",
      "entity_type": "City",
      "centroid": {
        "coordinates": [
          -0.09435,
          51.50412
        ],
        "type": "Point"
      }
    },
    "hotels": [
      {
        "district": "[]",
        "city": "27544008",
        "offers": [
          {
            "cancellation": null,
            "meal_plan": "breakfast_included",
            "closed_user_groups": null,
            "is_official": false,
            "room_type": [
              "generic_room"
            ],
            "partner_id": "h_dr",
            "price_gbp": 239,
            "price": 239,
            "strike_through": 286,
            "deeplink": "www.skyscanner.net/hotel_deeplink/4.0/UK/en-GB/GBP/h_dr/137554756/2017-05-07/2017-05-09/hotel/hotel/hotels?q_datetime_utc=2017-04-24T15%3A42%3A50&appVersion=2.0&rooms=1&legacy_provider_id=926990&deeplink_ids=eu-west-1.prod_b332e152f682d33ec1cc4b3ef6c5b4ac&request_id=f6b76e8d-18ed-45d9-95f5-d87d93f44167&guests=1&ticket_price=239&appName=web&max_price=325.0",
            "available": null,
            "cancellation_text": null
          }
        ],
        "images": [
          {
            "thumbnail": "http://d3ba47lalua02r.cloudfront.net/available/66922450/rmt.jpg",
            "provider": "h_dp",
            "gallery": "http://d3ba47lalua02r.cloudfront.net/available/66922450/rmca.jpg"
          }
        ],
        "amenities": [
          "InternetAccessService",
          "CurrencyExchangeService",
          ...
        ],
        "property_type": "Hotel",
        "distance": 1523.6670209587,
        "reviews_count": 129,
        "stars": "3",
        "name": "Imperial",
        "rating": {
          "desc": "rating_good",
          "value": 7
        },
        "hotel_id": "137554756",
        "coordinates": [
          -0.12403,
          51.52162
        ]
      },
      ...
    ],
    "map_boundary": {
      "s_w_lat": 51.49591,
      "n_e_lat": 51.52918,
      "n_e_lng": -0.07762,
      "s_w_lng": -0.19137
    },
    "location": [
      {
        "name": "England",
        "entity_id": "44293288",
        "entity_type": "FirstLevelNationAdministrativeDivision"
      },
      {
        "name": "United Kingdom",
        "entity_id": "29475375",
        "entity_type": "Nation"
      }
    ]
  },
  "translations": {
    "CUG_create_account_to_unlock_deals_msg": "Create an account to unlock exclusive deals",
    "CUG_deal": "DEAL",
    ...
  }
}
```

*RESPONSE PARAMETERS*

| Element | Detail |
| ------- | ------ |
| `correlation_id` | An identifier of the request |
| `meta` | Contains metadata regarding the search cycle such as it's status |
| `count` | Number of hotels |
| `results` | An object containing the hotels and the enhancers if requested |
| `translations` | Only with the `translations` enhanced. Dictionary with all literals that can be translated |


### Location Request

This endpoint gives back hotels with prices too but instead from an entity, around specific coordinates.

Provides the search by current location functionality.

*API endpoint*

`GET /v1/prices/search/location/{lon,lat}`

```shell
GET "https://gateway.skyscanner.net/hotels/v1/prices/search/location/{lon,lat}
  ?market={market}&locale={locale}&checkin_date={checkin_date}&checkout_date={checkout_date}
  &currency={currency}&adults={adults}&rooms={rooms}&images={images}&image_resolution={resolution}
  &image_type={type}&boost_official_partners={boost}&sort={sort_method}&limit={limit}&offset={offset}
  &partners_per_hotel={num_partners}&enhanced={enhanced}"
```

*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/378efb1ead00baf8e120)

*HEADER VALUES*

| Header | Value |
| --- | --- |
| `apikey` <br><span class="required">REQUIRED</span> | This header is required to be on every single request any client does (it could also be accepted via query parameter) |
| `x-user-agent` <br><span class="required">REQUIRED</span> | Indicates which is the device and the platform related to the client. The format for that header is `device;B2B`, where:<br>Device is:<br>`T` for tablet<br>`D` for desktop<br>`M` for mobile<br>`N` if you are not able to detect the device type |

*URI PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `location` <br><span class="required">REQUIRED</span> | Location to search hotels near it. Following the format: lon,lat |
| `version` <br><span class="required">REQUIRED</span> | API version |

*QUERY PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `market` <br><span class="required">REQUIRED</span> | Matching [A-Z]{2} |
| `locale` <br><span class="required">REQUIRED</span> | Matching [a-z]{2}-[A-Z]{2} |
| `currency` <br><span class="required">REQUIRED</span> | Currency code |
| `checkin_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `checkout_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `rooms` <br><span class="required">REQUIRED</span> | Number of rooms<br>default: 1 |
| `adults` <br><span class="required">REQUIRED</span> | Number of adults<br>default: 2 |
| `apikey` <br><span class="required">REQUIRED</span> | This parameter is required to be on every single request any client does |
| `images` <br><span class="optional">OPTIONAL</span> | Maximum number of images to retrieve per each hotel<br>between 1-30, default: 3 |
| `image_resolution` <br><span class="optional">OPTIONAL</span> | Resolution options<br>high or low, default: high |
| `image_type` <br><span class="optional">OPTIONAL</span> | The format of the images<br>thumbnail or gallery |
| `boost_official_partners` <br><span class="optional">OPTIONAL</span> | Indicates whether prices from official partners must be shown in the first place [1] or not [0]<br>default: 0 |
| `sort` <br><span class="optional">OPTIONAL</span> | Sort by a given attribute. By default the relevance sorting is applied<br>One of: relevance, -relevance, price, -price, distance, -distance, rating, -rating, stars, -stars |
| `price_min` <br><span class="optional">OPTIONAL</span> | Filter. Return only hotels where the cheaper price is at least price_min (included). Cannot be used together with price_buckets |
| `price_max` <br><span class="optional">OPTIONAL</span> | Filter. Return only hotels where the cheaper price is at most price_max (included). Cannot be used together with price_buckets |
| `price_buckets` <br><span class="optional">OPTIONAL</span> | OR filter. Return only hotels with offers inside the specified buckets. Cannot be used together with price_min/price_max |
| `district` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a district matches |
| `stars` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a star category matches. The values must be TravelAPI ids |
| `city` <br><span class="optional">OPTIONAL</span> | OR filter. When the search is done for an entity that contains different cities, this filter is available. Returns only results where the cities match. The values must be TravelAPI entity ids |
| `chain` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a hotel chains matches. The values must be TravelAPI ids |
| `amenities` <br><span class="optional">OPTIONAL</span> | AND filter. Return only results where all amenities match. The values must be TravelAPI ids |
| `cancellation` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a cancellation policies matches. Options are:<br>free_cancellation, non_refundable, refundable, special_conditions |
| `meal_plan` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a meal plan matches. Options are:<br>room_only, breakfast_included, half_board, full_board, all_inclusive |
| `property_type` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where an accommodation type matches. The values must be TravelAPI ids |
| `hotel_name` <br><span class="optional">OPTIONAL</span> | Filter. Return only results where hotel name matches |
| `limit` <br><span class="optional">OPTIONAL</span> | Number of results to retrieve<br>between 1-30, default: 30 |
| `offset` <br><span class="optional">OPTIONAL</span> | How many results to skip from the first position. Useful for paginating<br>default: 0 |
| `partners_per_hotel` <br><span class="optional">OPTIONAL</span> | Maximum numbers of partners to retrieve per each hotel. Note that 0 means all the available partners<br>default: 3 |
| `enhanced` <br><span class="optional">OPTIONAL</span> | This parameter allows you to add additional content to the default response. The available options are:<br>filters: Returns extra object in the response including the filters like stars, district, city, etc.<br>price_slider: Return the price_slider.<br>partners: Returns information about the active partners in the system. is_official, the logo, the name and the website_id.<br>images: Returns images for the hotels. With the partner website_id and the urls.<br>amenities: Returns the hotels amenities.<br>query_location: Returns the location (higher level entities according to the searched entity) and map boundary (the coordinates of the search area).<br>extras: Returns the hotel chain of the hotels.<br>translations: Returns a dictionary with all literals and their corresponding translations using the request locale. |

**Note**: The OR and AND filters allow multiple values coma separated. For example: *&amenities=Lift,Bar*

### Response

> The response is the same as the search entity one but without the *hotel_pivot*

*RESPONSE PARAMETERS*

| Element | Detail |
| ------- | ------ |
| `correlation_id` | An identifier of the request |
| `meta` | Contains metadata regarding the search cycle such as it's status |
| `count` | Number of hotels |
| `results` | An object containing the hotels and the enhancers if requested |
| `translations` | Only with the `translations` enhanced. Dictionary with all literals that can be translated |

## Search Prices, map version

### Entity Request

Given an entity, this endpoint will give you back the hotels with prices around the provided entity, having the same intentions than the regular search prices but modifying the response to suit it in environments where the information has to be rendered in a map.
These differences can be summarized into the following points:

- Every hotel will have one price (the cheapest).
- The default total amount of hotels returned per page will be 100.
- Support for bounding box queries to filter hotels that are inside of an area, the coordinates passed are serialised as *left, bottom, right, top*

*API endpoint*

`GET /v1/prices/map/entity/{entity_id}`

```shell
GET "https://gateway.skyscanner.net/hotels/v1/prices/map/entity/{entity_id}
  ?market={market}&locale={locale}&checkin_date={checkin_date}&checkout_date={checkout_date}
  &currency={currency}&adults={adults}&rooms={rooms}&images={images}&image_resolution={resolution}
  &image_type={type}&boost_official_partners={boost}&sort={sort_method}&limit={limit}&offset={offset}
  &partners_per_hotel={num_partners}&enhanced={enhanced}&bbox={left,bottom,right,top}"
```

*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/44864263fb0a0624becf)

*HEADER VALUES*

| Header | Value |
| --- | --- |
| `apikey` <br><span class="required">REQUIRED</span> | This header is required to be on every single request any client does (it could also be accepted via query parameter) |
| `x-user-agent` <br><span class="required">REQUIRED</span> | Indicates which is the device and the platform related to the client. The format for that header is `device;B2B`, where:<br>Device is:<br>`T` for tablet<br>`D` for desktop<br>`M` for mobile<br>`N` if you are not able to detect the device type |

*URI PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `entity_id` <br><span class="required">REQUIRED</span> | Entity to search for hotels prices in it |
| `version` <br><span class="required">REQUIRED</span> | API version |

*QUERY PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `market` <br><span class="required">REQUIRED</span> | Matching [A-Z]{2} |
| `locale` <br><span class="required">REQUIRED</span> | Matching [a-z]{2}-[A-Z]{2} |
| `currency` <br><span class="required">REQUIRED</span> | Currency code |
| `checkin_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `checkout_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `rooms` <br><span class="required">REQUIRED</span> | Number of rooms<br>default: 1 |
| `adults` <br><span class="required">REQUIRED</span> | Number of adults<br>default: 2 |
| `apikey` <br><span class="required">REQUIRED</span> | This parameter is required to be on every single request any client does |
| `images` <br><span class="optional">OPTIONAL</span> | Maximum number of images to retrieve per each hotel<br>between 1-30, default: 3 |
| `image_resolution` <br><span class="optional">OPTIONAL</span> | Resolution options<br>high or low, default: high |
| `image_type` <br><span class="optional">OPTIONAL</span> | The format of the images<br>thumbnail or gallery |
| `boost_official_partners` <br><span class="optional">OPTIONAL</span> | Indicates whether prices from official partners must be shown in the first place [1] or not [0]<br>default: 0 |
| `sort` <br><span class="optional">OPTIONAL</span> | Sort by a given attribute. By default the relevance sorting is applied<br>One of: relevance, -relevance, price, -price, distance, -distance, rating, -rating, stars, -stars |
| `price_min` <br><span class="optional">OPTIONAL</span> | Filter. Return only hotels where the cheaper price is at least price_min (included). Cannot be used together with price_buckets |
| `price_max` <br><span class="optional">OPTIONAL</span> | Filter. Return only hotels where the cheaper price is at most price_max (included). Cannot be used together with price_buckets |
| `price_buckets` <br><span class="optional">OPTIONAL</span> | OR filter. Return only hotels with offers inside the specified buckets. Cannot be used together with price_min/price_max |
| `district` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a district matches |
| `stars` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a star category matches. The values must be TravelAPI ids |
| `city` <br><span class="optional">OPTIONAL</span> | OR filter. When the search is done for an entity that contains different cities, this filter is available. Returns only results where the cities match. The values must be TravelAPI entity ids |
| `chain` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a hotel chains matches. The values must be TravelAPI ids |
| `amenities` <br><span class="optional">OPTIONAL</span> | AND filter. Return only results where all amenities match. The values must be TravelAPI ids |
| `cancellation` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a cancellation policies matches. Options are:<br>free_cancellation, non_refundable, refundable, special_conditions |
| `meal_plan` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a meal plan matches. Options are:<br>room_only, breakfast_included, half_board, full_board, all_inclusive |
| `property_type` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where an accommodation type matches. The values must be TravelAPI ids |
| `hotel_name` <br><span class="optional">OPTIONAL</span> | Filter. Return only results where hotel name matches |
| `limit` <br><span class="optional">OPTIONAL</span> | Number of results to retrieve<br>between 1-100, default: 100 |
| `offset` <br><span class="optional">OPTIONAL</span> | How many results to skip from the first position. Useful for paginating<br>default: 0 |
| `partners_per_hotel` <br><span class="optional">OPTIONAL</span> | Maximum numbers of partners to retrieve per each hotel. Note that 0 means all the available partners. Map only supports 1 partner per hotel<br>default: 1 |
| `enhanced` <br><span class="optional">OPTIONAL</span> | This parameter allows you to add additional content to the default response. The available options are:<br>filters: Returns extra object in the response including the filters like stars, district, city, etc.<br>price_slider: Return the price_slider.<br>query_location: Returns the location (higher level entities according to the searched entity) and map boundary (the coordinates of the search area).<br>translations: Returns a dictionary with all literals and their corresponding translations using the request locale. |
| `bbox` <br><span class="optional">OPTIONAL</span> | Bounding Box coordinates in which to look for hotels as bbox=left,bottom,right,top<br>Example: -4.051,50.478,1.853,52.909 |

**Note**: The OR and AND filters allow multiple values coma separated. For example: *&amenities=Lift,Bar*

### Response

> Example response:

```json
{
  "correlation_id": "d93ddb4d-c97c-4979-9627-e188e02c8409",
  "meta": {
    "status": "COMPLETED",
    "total": 5500,
    "total_available": 4092,
    "completion_percentage": 100,
    "offers": 67275,
    "hotels_filtered": 0
  },
  "count": 15,
  "results": {
    "filters": {
      "district": [
        {
          "id": "27562177",
          "min_price": 45,
          "max_price": null,
          "count": 94
        },
        ...
      ],
      "chain": [
        {
          "id": "Holiday Inn",
          "min_price": 74,
          "max_price": null,
          "count": 74
        },
        ...
      ],
      "cancellation": [
        {
          "id": "free_cancellation",
          "min_price": 36,
          "max_price": null,
          "count": 2207
        },
        ...
      ],
      "city": [
        {
          "id": "27544008",
          "min_price": 32,
          "max_price": null,
          "count": 856
        },
        ...
      ],
      "amenities": [
        {
          "id": "WifiService",
          "min_price": 32,
          "max_price": null,
          "count": 3327
        },
        ...
      ],
      "price_buckets": [
        {
          "id": "PR_BK_0",
          "min_price": null,
          "max_price": 80,
          "count": 130
        },
        ...
      ],
      "stars": [
        {
          "id": "4",
          "min_price": 58,
          "max_price": null,
          "count": 1220
        },
        ...
      ],
      "meal_plan": [
        {
          "id": "room_only",
          "min_price": 32,
          "max_price": null,
          "count": 2060
        },
        ...
      ],
      "property_type": [
        {
          "id": "Hotel",
          "min_price": 32,
          "max_price": null,
          "count": 3486
        },
        ...
      ]
    },
    "map_boundary": {
      "n_e_lng": 1.72864,
      "s_w_lng": -2.04675,
      "s_w_lat": 50.63341,
      "n_e_lat": 52.7619
    },
    "hotel_pivot": null,
    "hotels": [
      {
        "reviews_count": 284,
        "coordinates": [
          1.2961,
          51.12328
        ],
        "hotel_id": "46997257",
        "images": [
          {
            "provider": "h_dp",
            "gallery": "http://d3ba47lalua02r.cloudfront.net/available/50049482/mca.jpg",
            "thumbnail": "http://d3ba47lalua02r.cloudfront.net/available/50049482/mt.jpg"
          }
        ],
        "name": "The West Bank Guest House",
        "offers": [
          {
            "price_gbp": 58,
            "price": 58,
            "deeplink": "www.skyscanner.net/hotel_deeplink/4.0/UK/en-GB/GBP/h_xp/46997257/2017-04-30/2017-05-02/hotel/hotel/hotels?guests=1&ticket_price=58&rooms_left=1&appVersion=2.0&q_datetime_utc=2017-04-25T13%3A37%3A37&rooms=1&deeplink_ids=eu-west-1.prod_ae42baa45b08402e0a109287d1780528&request_id=b745fa26-f166-478f-b52c-2fcee3f413fe&appName=web&legacy_provider_id=1&max_price=132.0",
            "closed_user_groups": null
          }
        ],
        "stars": "4",
        "rating": {
          "value": 7.7,
          "desc": "rating_good"
        }
      },
      ...
    ],
    "location": [
      {
        "name": "United Kingdom",
        "entity_id": "29475375",
        "entity_type": "Nation"
      }
    ]
  },
  "translations": {
    "CUG_create_account_to_unlock_deals_msg": "Create an account to unlock exclusive deals",
    "CUG_deal": "DEAL",
    ...
  }
}
```

*RESPONSE PARAMETERS*

| Element | Detail |
| ------- | ------ |
| `correlation_id` | An identifier of the request |
| `meta` | Contains metadata regarding the search cycle such as it's status |
| `count` | Number of hotels |
| `results` | An object containing the hotels and the enhancers if requested |
| `translations` | Only with the `translations` enhanced. Dictionary with all literals that can be translated |

### Location Request

This endpoint gives back hotels with prices too with map specific features but instead from an entity, around specific coordinates.

Provides the search by current location functionality.

*API endpoint*

`GET /v1/prices/map/location/{lon,lat}`

```shell
GET "https://gateway.skyscanner.net/hotels/v1/prices/map/location/{lon,lat}
  ?market={market}&locale={locale}&checkin_date={checkin_date}&checkout_date={checkout_date}
  &currency={currency}&adults={adults}&rooms={rooms}&images={images}&image_resolution={resolution}
  &image_type={type}&boost_official_partners={boost}&sort={sort_method}&limit={limit}&offset={offset}
  &partners_per_hotel={num_partners}&enhanced={enhanced}&bbox={left,bottom,right,top}"
```

*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/8c06f7a93120a724de16)

*HEADER VALUES*

| Header | Value |
| --- | --- |
| `apikey` <br><span class="required">REQUIRED</span> | This header is required to be on every single request any client does (it could also be accepted via query parameter) |
| `x-user-agent` <br><span class="required">REQUIRED</span> | Indicates which is the device and the platform related to the client. The format for that header is `device;B2B`, where:<br>Device is:<br>`T` for tablet<br>`D` for desktop<br>`M` for mobile<br>`N` if you are not able to detect the device type |

*URI PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `location` <br><span class="required">REQUIRED</span> | Location to search hotels near it. Following the format: lon,lat |
| `version` <br><span class="required">REQUIRED</span> | API version |

*QUERY PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `market` <br><span class="required">REQUIRED</span> | Matching [A-Z]{2} |
| `locale` <br><span class="required">REQUIRED</span> | Matching [a-z]{2}-[A-Z]{2} |
| `currency` <br><span class="required">REQUIRED</span> | Currency code |
| `checkin_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `checkout_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `rooms` <br><span class="required">REQUIRED</span> | Number of rooms<br>default: 1 |
| `adults` <br><span class="required">REQUIRED</span> | Number of adults<br>default: 2 |
| `apikey` <br><span class="required">REQUIRED</span> | This parameter is required to be on every single request any client does |
| `images` <br><span class="optional">OPTIONAL</span> | Maximum number of images to retrieve per each hotel<br>between 1-30, default: 3 |
| `image_resolution` <br><span class="optional">OPTIONAL</span> | Resolution options<br>high or low, default: high |
| `image_type` <br><span class="optional">OPTIONAL</span> | The format of the images<br>thumbnail or gallery |
| `boost_official_partners` <br><span class="optional">OPTIONAL</span> | Indicates whether prices from official partners must be shown in the first place [1] or not [0]<br>default: 0 |
| `sort` <br><span class="optional">OPTIONAL</span> | Sort by a given attribute. By default the relevance sorting is applied<br>One of: relevance, -relevance, price, -price, distance, -distance, rating, -rating, stars, -stars |
| `price_min` <br><span class="optional">OPTIONAL</span> | Filter. Return only hotels where the cheaper price is at least price_min (included). Cannot be used together with price_buckets |
| `price_max` <br><span class="optional">OPTIONAL</span> | Filter. Return only hotels where the cheaper price is at most price_max (included). Cannot be used together with price_buckets |
| `price_buckets` <br><span class="optional">OPTIONAL</span> | OR filter. Return only hotels with offers inside the specified buckets. Cannot be used together with price_min/price_max |
| `district` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a district matches |
| `stars` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a star category matches. The values must be TravelAPI ids |
| `city` <br><span class="optional">OPTIONAL</span> | OR filter. When the search is done for an entity that contains different cities, this filter is available. Returns only results where the cities match. The values must be TravelAPI entity ids |
| `chain` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a hotel chains matches. The values must be TravelAPI ids |
| `amenities` <br><span class="optional">OPTIONAL</span> | AND filter. Return only results where all amenities match. The values must be TravelAPI ids |
| `cancellation` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a cancellation policies matches. Options are:<br>free_cancellation, non_refundable, refundable, special_conditions |
| `meal_plan` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where a meal plan matches. Options are:<br>room_only, breakfast_included, half_board, full_board, all_inclusive |
| `property_type` <br><span class="optional">OPTIONAL</span> | OR filter. Return only results where an accommodation type matches. The values must be TravelAPI ids |
| `hotel_name` <br><span class="optional">OPTIONAL</span> | Filter. Return only results where hotel name matches |
| `limit` <br><span class="optional">OPTIONAL</span> | Number of results to retrieve<br>between 1-100, default: 100 |
| `offset` <br><span class="optional">OPTIONAL</span> | How many results to skip from the first position. Useful for paginating<br>default: 0 |
| `partners_per_hotel` <br><span class="optional">OPTIONAL</span> | Maximum numbers of partners to retrieve per each hotel. Note that 0 means all the available partners. Map only supports 1 partner per hotel<br>default: 1 |
| `enhanced` <br><span class="optional">OPTIONAL</span> | This parameter allows you to add additional content to the default response. The available options are:<br>filters: Returns extra object in the response including the filters like stars, district, city, etc.<br>price_slider: Return the price_slider.<br>query_location: Returns the location (higher level entities according to the searched entity) and map boundary (the coordinates of the search area).<br>translations: Returns a dictionary with all literals and their corresponding translations using the request locale. |
| `bbox` <br><span class="optional">OPTIONAL</span> | Bounding Box coordinates in which to look for hotels as bbox=left,bottom,right,top<br>Example: -4.051,50.478,1.853,52.909 |

**Note**: The OR and AND filters allow multiple values coma separated. For example: *&amenities=Lift,Bar*

### Response

> The response is the same as the search map entity one

*RESPONSE PARAMETERS*

| Element | Detail |
| ------- | ------ |
| `correlation_id` | An identifier of the request |
| `meta` | Contains metadata regarding the search cycle such as it's status |
| `count` | Number of hotels |
| `results` | An object containing the hotels and the enhancers if requested |
| `translations` | Only with the `translations` enhanced. Dictionary with all literals that can be translated |

## Hotel Prices

### Request

Given a hotel, this endpoint will give back the hotel with all the information and live prices. To reuse the prices already fetched by previous calls to the search endpoint the parameter *entity_id* must be filled with the same entity id.
Otherwise, the system will start fetching prices from the beginning for this specific hotel.
Is a regular practice following the user flow first of all search for prices using the search prices endpoint and then retrieve more specific information - perhaps the detailed reviews - about one of the hotels using the hotel prices endpoint.

*API endpoint*

`GET /v1/prices/hotel/{hotel_id}`

```shell
GET "https://gateway.skyscanner.net/hotels/v1/prices/hotel/{hotel_id}
  ?entity_id=27539733&market={market}&locale={locale}&checkin_date={checkin_date}&checkout_date={checkout_date}
  &currency={currency}&adults={adults}&rooms={rooms}&images={images}&image_resolution={resolution}
  &image_type={type}&boost_official_partners={boost}&partners_per_hotel={num_partners}"
```

*TRY IT OUT*

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/235d1617d92d7467ed1b)

*HEADER VALUES*

| Header | Value |
| --- | --- |
| `apikey` <br><span class="required">REQUIRED</span> | This header is required to be on every single request any client does (it could also be accepted via query parameter) |
| `x-user-agent` <br><span class="required">REQUIRED</span> | Indicates which is the device and the platform related to the client. The format for that header is `device;B2B`, where:<br>Device is:<br>`T` for tablet<br>`D` for desktop<br>`M` for mobile<br>`N` if you are not able to detect the device type |

*URI PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `hotel_id` <br><span class="required">REQUIRED</span> | Hotel to search prices for |
| `version` <br><span class="required">REQUIRED</span> | API version |

*QUERY PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| `market` <br><span class="required">REQUIRED</span> | Matching [A-Z]{2} |
| `locale` <br><span class="required">REQUIRED</span> | Matching [a-z]{2}-[A-Z]{2} |
| `currency` <br><span class="required">REQUIRED</span> | Currency code |
| `checkin_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `checkout_date` <br><span class="required">REQUIRED</span> | YYYY-MM-DD |
| `rooms` <br><span class="required">REQUIRED</span> | Number of rooms<br>default: 1 |
| `adults` <br><span class="required">REQUIRED</span> | Number of adults<br>default: 2 |
| `apikey` <br><span class="required">REQUIRED</span> | This parameter is required to be on every single request any client does |
| `images` <br><span class="optional">OPTIONAL</span> | Maximum number of images to retrieve per each hotel<br>between 1-30, default: 3 |
| `image_resolution` <br><span class="optional">OPTIONAL</span> | Resolution options<br>high or low, default: high |
| `image_type` <br><span class="optional">OPTIONAL</span> | The format of the images<br>thumbnail or gallery |
| `boost_official_partners` <br><span class="optional">OPTIONAL</span> | Indicates whether prices from official partners must be shown in the first place [1] or not [0]<br>default: 0 |
| `partners_per_hotel` <br><span class="optional">OPTIONAL</span> | Maximum numbers of partners to retrieve per each hotel. Note that 0 means all the available partners<br>default: 3 |
| `enhanced` <br><span class="optional">OPTIONAL</span> | This parameter allows you to add additional content to the default response. The available options are:<br>location: Returns the higher level entities according to the search entity.<br>translations: Returns a dictionary with all literals and their corresponding translations using the request locale. |
| `entity_id` <br><span class="optional">OPTIONAL</span> | This field should be present when this endpoint has been called when the user has already looked for prices in an upper entity containing the hotel in order to reuse the cached prices.<br>For example: A user searches for prices in Paris (the service stores Paris prices). And then, the user opens a hotel details page. In this case, the request to the service must have the entity_id param fulfilled with the Paris entity_id in order to reuse the prices.|

### Response

> Example response:

```json
{
  "meta": {
    "offers": 2,
    "status": "COMPLETED",
    "completion_percentage": 100
  },
  "results": {
    "location": [
      {
        "name": "Barcelona",
        "entity_id": "27548283",
        "entity_type": "City"
      },
      ...
    ],
    "hotel": {
      "district": "27562628",
      "name_en": "Hotel Via Augusta",
      "name": "Hotel Via Augusta",
      "hotel_id": "46958001",
      "total_rooms": 207,
      "stars": "2",
      "reviews_count": 1496,
      "amenities": [
        "Lift",
        "Laundry",
        "AirConditioning",
        "DailyNewspaperService",
        "Balcony",
        "FrontDesk24hService",
        "SafeDepositBox",
        "WifiService",
        "Parking",
        "DisabledFacility",
        "LuggageStorage",
        "MultilingualStaffService"
      ],
      "city": "27548283",
      "offers": [
        {
          "price_gbp": 1669,
          "closed_user_groups": null,
          "room_type": [
            "triple",
            "triple",
            "triple"
          ],
          "meal_plan": "breakfast_included",
          "strike_through": 1967,
          "deeplink": "www.skyscanner.net/hotel_deeplink/4.0/UK/en-GB/GBP/h_ka/46958001/2017-06-29/2017-07-05/hotel/hotel/hotels?request_id=15834838-f028-400a-bb4f-ed39025cf9e1&deeplink_ids=eu-west-1.prod_092a61636486890f4d9c56373a981f94&appName=web&ticket_price=1669&guests=7&q_datetime_utc=2017-04-24T15%3A15%3A07&legacy_provider_id=249&appVersion=2.0&rooms=3&max_price=1967.0",
          "cancellation": null,
          "partner_id": "h_ka",
          "available": null,
          "cancellation_text": null,
          "is_official": false,
          "price": 1669
        },
        ...
      ],
      "address": {
        "district": "Sant Gervasi",
        "city": "Barcelona",
        "adm1": "Catalonia",
        "nation": "Spain",
        "postcode": "08006",
        "street_address": "Via Augusta, 63"
      },
      "description": "https://d19i3hu78g2w6f.cloudfront.net/75be_HOTEL_18576_148_en-GB",
      "rating": {
        "value": 8.2,
        "desc": "rating_very_good"
      },
      "chain": null,
      "reviews": {
        "guest_types": [
          {
            "value": "couple",
            "score": 82,
            "perc": 51
          },
          ...
        ],
        "count": 1496,
        "summary": "Very good budget hotel. Close to restaurants, bars and public transportation. Popular among solo travelers. “Friendly staff”. “Good breakfast”. ",
        "categories": [
          {
            "entries": [
              "Fantastic service",
              "Friendly staff",
              "Very friendly multilingual staff",
              "Good service"
            ],
            "score": 94,
            "name": "Service"
          },
          ...
        ]
      },
      "property_type": "Hotel",
      "coordinates": [
        2.15145,
        41.40005
      ],
      "images": [
        {
          "provider": "h_dp",
          "thumbnail": "http://d3ba47lalua02r.cloudfront.net/available/47224844/rmt.jpg",
          "gallery": "http://d3ba47lalua02r.cloudfront.net/available/47224844/rmca.jpg"
        },
        ...
      ]
    },
    "partners": [
      {
        "is_official": true,
        "name": "Adagio Access",
        "logo": "www.skyscanner.net/images/websites/220x80/h_as.png",
        "website_id": "h_as"
      },
      ...
    ]
  },
  "translations": {
    "CUG_create_account_to_unlock_deals_msg": "Create an account to unlock exclusive deals",
    "CUG_deal": "DEAL",
    ...
  }
}
```

*RESPONSE PARAMETERS*

| Element | Detail |
| ------- | ------ |
| `meta` | Contains metadata regarding the search cycle such as it's status |
| `results` | An object containing the hotel and the enhancers if requested |
| `translations` | Only with the `translations` enhanced. Dictionary with all literals that can be translated |

## FAQ

**Why amenities is an enhancer and a query parameter too?**

The enhancers, are a way to add extra information to the response. By default, the hotels don't come with the list of their amenities if you don't pass the amenities enhancer.
On the other hand, you can always filter hotels by amenities using the amenities parameter. For example: &amenities=Lift,WifiService where in this case, you would only get hotels that have those two amenities.

**Why is the x-user-agent header mandatory and it's important to pass the correct device?**

The Hotels API provides deals depending on the device the user is using. For this reason, it is mandatory to send the correct x-user-agent in order to provide accurate offers.

**Are the amenities filter returned in any particular order?**

Yes, by default the service returns certain amenities in the first place because are most commonly used for filtering (Wifi Service, Pool, Parking, Air Conditioning, Spa, Airport Shuttle Service).
However, this order can change for different markets.

**Are the meal plan and cancellation policy filters returned in any particular order?**

Yes, by default the service returns both filters in the following way:

- Cancellation policy: The most convenient cancellation policy for the user is prioritised in the following order: Free cancellation, Refundable, Special conditions, Non-refundable
- Meal plan: The more inclusive offers are prioritised in the following order: All inclusive, Full Board, Half Board, Breakfast included, Room only

**How can I translate the id's in the response to localized strings to display to the user?**

If you send the translations enhancer in the request, you will get a translations object in the root level of the response where you will find the translation for any key according to the locale you specified.
