#  HTTPS migration guide

As of April 2020 in order to improve the security of the Skyscanner APIs we're requiring all partners to **only** use 
the `https` protocol for making requests to any of the APIs.

## What will change?

The fields of requests and responses will remain the same. The only change is that partners should always use the TLS `https` protocol for making requests to the APIs.

## What needs to be done?

Partners should replace all references of the `http` protocol with `https` in all API's urls in their codebases.

## When should partners migrate?

Partners should migrate as soon as possible. The official deadline will be **30th April 2020**.

## Need help?

Partners can raise support tickets [here](https://skyscannerpartnersupport.zendesk.com/hc/en-us/requests/new)