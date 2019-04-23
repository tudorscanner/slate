
## Carhire Day View supported query parameters Schema

```
/cars/day-view
```

A schema definition for the carhire day-view microsite supported query parameters

| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Permitted | [dayView.json](dayView.json) |

## Carhire Day View supported query parameters Properties

| Property | Type | Required | Nullable | Defined by |
|----------|------|----------|----------|------------|
| [currency](#currency) | `string` | Optional  | No | Carhire Day View supported query parameters (this schema) |
| [driverAge](#driverage) | `integer` | Optional  | No | Carhire Day View supported query parameters (this schema) |
| [dropoffPlace](#dropoffplace) | `string` | Optional  | No | Carhire Day View supported query parameters (this schema) |
| [dropoffTime](#dropofftime) | `string` | Optional  | No | Carhire Day View supported query parameters (this schema) |
| [locale](#locale) | `string` | Optional  | No | Carhire Day View supported query parameters (this schema) |
| [market](#market) | `string` | Optional  | No | Carhire Day View supported query parameters (this schema) |
| [pickupPlace](#pickupplace) | `string` | Optional  | No | Carhire Day View supported query parameters (this schema) |
| [pickupTime](#pickuptime) | `string` | Optional  | No | Carhire Day View supported query parameters (this schema) |
| `*` | any | Additional | Yes | this schema *allows* additional properties |

### currency

The desired currency for the carhire search results

`currency`

* is optional
* type: `string`
* defined in this schema

#### currency Type


`string`







### driverAge

Driver age

`driverAge`

* is optional
* type: `integer`
* defined in this schema

#### driverAge Type


`integer`







### dropoffPlace

Dropoff place id

`dropoffPlace`

* is optional
* type: `string`
* defined in this schema

#### dropoffPlace Type


`string`







### dropoffTime

Dropoff time in the format: YYYY-MM-DDTHH:MM

`dropoffTime`

* is optional
* type: `string`
* defined in this schema

#### dropoffTime Type


`string`







### locale

The desired locale for the carhire search results

`locale`

* is optional
* type: `string`
* defined in this schema

#### locale Type


`string`







### market

The market for which the carhire search will be performed.

`market`

* is optional
* type: `string`
* defined in this schema

#### market Type


`string`







### pickupPlace

Pickup place id

`pickupPlace`

* is optional
* type: `string`
* defined in this schema

#### pickupPlace Type


`string`







### pickupTime

Pickup time in the format: YYYY-MM-DDTHH:MM

`pickupTime`

* is optional
* type: `string`
* defined in this schema

#### pickupTime Type


`string`






