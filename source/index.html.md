---
title: API Reference

toc_footers:
  - <a href='http://portal.business.skyscanner.net/en-gb/accounts/login/'>Sign in to your Skyscanner account</a>
  - <a href='https://support.business.skyscanner.net/hc/en-us'>FAQ and Support</a>
includes:
  - currencies
  - errors

search: false
---

# API Reference



Skyscanner Travel APIs connect you to all the data you need to build an innovative website or app.
Your customers will be able to take advantage of the best flights and
car hire deals, from wherever they are in the world - either as independent travel solutions or integrated together.

<pre><strong>API endpoint</strong>
<code>
http://partners.api.skyscanner.net/apiservices/
</code>
</pre>

# Authentication

> To authorize, use this code:

```python
from skyscanner.skyscanner import Flights
flights_service = Flights('<Your API Key>')
```

```shell
# You can pass your API key as a parameter in the POST form with each request
curl "api_endpoint_here"
  -H "Authorization: <apiKey>"
```

> Make sure to replace `<apiKey>` with your API key.

Skyscanner uses API keys to allow access to the APIs. You can register a new Skyscanner API key at our [developer portal](http://portal.business.skyscanner.net/en-gb/accounts/login/).

The API key needs to be included in all API requests as a parameter:

Parameter | Description | Data Type |
--------- | ------- | ----------- |
apiKey | The API Key to identify the customer | String |

<aside class="notice">
You must replace <code>akiKey</code> with your personal API key.
</aside>

# Flights Live Prices

## Creating the session

The Live Pricing Service Session must be created before any pricing data can be obtained. The request contains details of the locations, dates, passengers, cabin class and user details. These parameters define the session, and cannot be changed within the session (with the exception of passenger numbers).
![diagram](/images/Skyscanner_UMLDiagram_v3_EJ-01-01.png)
<aside class="success">
Note
We do not support client-side implementation of our Live Prices API using CORS requests due to the potential security
risk of exposing account API keys.
</aside>

Request Details

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
| Location Header | Contains the URL for polling the newly created session |


> The response header contains the polling url:

```shell
Location → "http://partners.api.skyscanner.net/apiservices/
    pricing/uk1/v1.0/
    162291a498134dbd97d1db3d881f825c_ecilpojl_E99B7A7B8E258EA9AE2AE21956F01677"
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

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

