# Hotels Live Prices

Bellboy is the service responsible for finding the best hotels with rates around a given entity. It provides endpoints to search prices, a map version of it and a hotel prices one.

## Endpoint

Bellboy provides a global endpoint: https://gateway.skyscanner.net/hotels/

The JSON API by itself is mapped at the following URL https://gateway.skyscanner.net/hotels/v{version}/ where version points to a specific release

## Headers

Bellboy expects some headers and requires some others in order to work properly. All of them are described here:
- **apikey**: Required. This header is required to be on every single request any client does (it could also be accepted via query parameter).
- **x-user-agent**: Required. Indicates which is the device and the platform related to the client. The format for that header is device;platform, where:
    - device can be:
        - T for tablet
        - D for desktop
        - M for mobile
        - N if you are not able to detect the device type
    - platform needs to be:
        - B2B
- **skyscanner-correlation-id**: Optional. This one is intended for enabling tracing across the services.

## Use flow

Every time that a user searches for hotel offers in a city, Bellboy determines if the request belongs to an already created search cycle or it is a new one.
A search cycle can be related to a request and identified univocally using some of the parameters sent along the request.
The request parameters used are entity_id, market, locale, checkin_date, checkout_date, adults and rooms.
The search cycle is not only identified and reused with those query parameters but also with the HTTP header x-user-agent, as it identifies different types of users with specific offers.
Worth mentioning that a search cycle has a limited time of life, it lasts for 15 minutes. Hereby, once this timeout is reached a new search cycle is created.
The search cycle moves from an initially PENDING state till a COMPLETED state meaning that all hotels and prices have been retrieved.
Successive calls to the API using the same parameters that point to the same search cycle will receive the status of the search cycle, this flow can be resumed in the following steps:

All the /prices endpoints are intended to be queried using a polling mechanism. The flow of the service is described below:

1. On the first request that a user does, Bellboy creates a search cycle according to the nature of the request and returns to the user empty results. `Metadata PENDING state`.
2. In the background, bellboy will start retrieving hotels and prices that will be internally stored to be served to the user in the following requests.
3. At this point, the client needs to keep polling the service with the same query while the status attribute inside the meta object in the response is *PENDING*. On each query, the number of results will grow. `Metadata PENDING state, partial results`.
4. The status attribute will eventually change to *COMPLETED*. Meaning that the search cycle has finished. `Metadata COMPLETED state`.
5. Clients should implement a self-healing mechanism that should include:
    - Finish the polling after X seconds in the scenarios of having the status *PENDING* for so long.
    - Retry mechanism in the scenario of a Bellboy failure (Ex: retry after 1 seconds)

## Endpoints

The following sections will give you the necessary information of all the endpoints implemented in Bellboy.

### Search prices

##### /v1/prices/search/entity/{entity_id}

Given an entity_id, this endpoint will give back hotels with prices around the provided entity. The supported entities are any, from cities, islands, nations, places to Hotels.

Bellboy, first of all, tries to search for the hotels related to an entity using an explicit relation - cities, administration zones and nations, and if the results are less than a minimum number of hotels the query turns out in a geographical query.
This geographical query seeks for hotels using different distances, from 500 meters to 50km, till finding this minimum amount or get the maximum distance.

When a Hotel is used as the entity queried for, Bellboy will treat this as an ad-hoc case. The hotel used as an entity will be serialized into the *hotel_pivot* object with its offers. Meanwhile, it will be removed from the results object.

The following URL shows how the search prices endpoint can be used to retrieve prices for those hotels that are placed in Barcelona

https://gateway.skyscanner.net/hbe-bellboy/web/prices/search/entity/27548283?market=ES&locale=es-ES&checkin_date=2017-12-11&checkout_date=2017-12-13&currency=EUR&adults=2&rooms=1&apikey=f0b72de6242211e78e7dacbc32afe6a5

**wip postman link and raml docs**

##### /v1/prices/search/location/{location}

This endpoint gives back hotels with prices too but instead from an entity, around specific coordinates.

Provides the search by current location functionality.

**wip postman link and raml docs**

### Search prices, map version

##### /v1/prices/map/entity/{entity_id}

Given an entity, this endpoint will give you back the hotels with prices around the provided entity, having the same intentions than the regular search prices but modifying the response to suit it in environments where the information has to be rendered in a map.
These differences can be summarized into the following points:

- Every hotel will have one price (the cheapest).
- The default total amount of hotels returned per page will be 100.
- Support for bounding box queries to filter hotels that are inside of an area, the coordinates passed are serialised as *left, bottom, right, top*

The following URL shows how the map prices endpoint can be used to retrieve prices for those hotels that are placed in Barcelona - *entity id* 27548283, *ready to be rendered in a map*.

https://gateway.skyscanner.net/hbe-bellboy/v1/prices/map/entity/27548283?market=ES&locale=es-ES&checkin_date=2017-12-11&checkout_date=2017-12-13&currency=EUR&adults=2&rooms=1&apikey=f0b72de6242211e78e7dacbc32afe6a5&bbox=2.166,41.388,2.17,41.40

**wip postman link and raml docs**

##### /v1/prices/map/location/{location}

This endpoint gives back hotels with prices too with map specific features but instead from an entity, around specific coordinates.

Provides the search by current location functionality.

**wip postman link and raml docs**

### Hotel prices

##### /v1/prices/hotel/{hotel_id}

Given a hotel, this endpoint will give back the hotel with all the information and live prices. To reuse the prices already fetched by previous calls to the search endpoint the parameter *entity_id* must be filled with the same entity id.
Otherwise, the system will start fetching prices from the beginning for this specific hotel.
Is a regular practice following the user flow first of all search for prices using the search prices endpoint and then retrieve more specific information - perhaps the detailed reviews - about one of the hotels using the hotel prices endpoint.

The following URL shows how the hotel prices endpoint can be used to retrieve prices and the detail information for the 47106754 hotel.

http://hbe-bellboy.slingshot.eu-west-1.prod.aws.skyscanner.local/v1/prices/hotel/46947978?entity_id=27539733&market=UK&locale=en-GB&currency=GBP&checkin_date=2017-11-28&checkout_date=2017-11-29&adults=1&rooms=1

**wip postman link and raml docs**
