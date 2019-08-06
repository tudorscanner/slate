# Authentication

Skyscanner uses API keys to allow access to the APIs. To request an API key please [contact us](https://partners.skyscanner.net/contact/).

You must include the API key in all API requests to the server, either as a parameter in the query or in the query header. Please refer to each endpoint for details.

<aside class="warning">
Be careful when sharing API keys. Do not publish them in public code repositories or add them to client-side API calls. When you need to make a client-side call (e.g. redirect) please insure that you use your short API key (the first 16 characters of you key). Please note that *not* all API endpoints supports short API keys.
</aside>


## Token generation

Get authentication token. Expiration time is 30 minutes.

```shell
GET "http://partners.api.skyscanner.net/apiservices/
	token/v2/gettoken?
    apiKey={apiKey}"
```

*API endpoint*

`GET /token/v2/gettoken`

*REQUEST PARAMETERS*

| Parameter | Description |
| --------- | ------- |
| ```apiKey``` <br><span class="required">REQUIRED</span> | Your API Key. |


### Response

> Example of token result

```shell
	_dR-ShOTX6w2SeENoXhHTsT9Z5N4UNqwReQqU_F8WkbgMDIuZx7ud7boHnngf4fT9bpPDFJh7nxB3hWsAT8x76w==
```

A successful response contains string with token value.

<aside class="warning">
Please don't forget to encode token with URL encoder to escape special characters before sending it as value for apiKey URL paramater.
</aside>

