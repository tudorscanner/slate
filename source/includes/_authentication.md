# Authentication

Skyscanner uses API keys to allow access to the APIs. To request an API key please [contact us](https://partners.skyscanner.net/contact/).

You must include the API key in all API requests to the server, either as a parameter in the query or in the query header. Please refer to each endpoint for details.

<aside class="warning">
Be careful when sharing API keys. Do not publish them in public code repositories or add them to client-side API calls. When you need to make a client-side call (e.g. redirect) please insure that you use your short API key (the first 16 characters of you key).
</aside>