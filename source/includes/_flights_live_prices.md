# Flights Live Prices

## Creating the session

The Live Pricing Service Session must be created before any pricing data can be obtained. The request contains details of the locations, dates, passengers, cabin class and user details. These parameters define the session, and cannot be changed within the session (with the exception of passenger numbers).

![diagram](/images/Skyscanner_UMLDiagram_v3_EJ-01-01.png)

<aside class="warning">
We do not support client-side implementation of our Live Prices API using CORS requests due to the potential security
risk of exposing account API keys.
</aside>

Request Details

*HEADER VALUES*

| Header | Value |
| --- | --- |
| ```Accept```<br><span class="optional">OPTIONAL</span> | ```application/json``` or ```application/xml```<br>The default response format is XML |
| ```X-Forwarded-For```<br><span class="required">REQUIRED</span> | ```user's IP address ``` |


This is an HTTP POST request.

The following must be specified in the header:

HTTP Content-Type header: ‘application/x-www-form-urlencoded’.
HTTP Accept header: ‘application/json’ or ‘application/xml’.
URL Format

The form should be posted to this URL. The API Key may be specified in the form or the querystring.

```shell
curl -X POST - H "Content-Type: application/x-www-form-urlencoded"
    -d 'cabinclass=Economy
    &country=UK
    &currency=GBP
    &locale=en-GB
    &locationSchema=iata
    &originplace=EDI
    &destinationplace=LHR
    &outbounddate=2017-05-30
    &inbounddate=2017-06-02
    &adults=1
    &children=0
    &infants=0
    &apikey=prtl6749387986743898559646983194'
    "http://partners.api.skyscanner.net/apiservices/pricing/v1.0"
```

Response Details

A successful response contains no content. The URL to poll the booking details is specified in the Location header of the response.

An unsuccessful response will detail the validation failure or state that there was an error.

| Element | Detail |
| ------- | ------ |
| `Location Header` | Contains the URL for polling the newly created session |


> The response header contains the polling url:

```shell
Location → "http://partners.api.skyscanner.net/apiservices/
    pricing/uk1/v1.0/
    162291a498134dbd97d1db3d881f825c_ecilpojl_E99B7A7B8E258EA9AE2AE21956F01677"
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`


## Poll results

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

