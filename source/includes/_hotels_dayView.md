
## Hotels Day View supported query parameters Schema

```
/hotels/day-view
```

A schema definition for the hotels day-view microsite supported query parameters

| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Permitted | [dayView.json](dayView.json) |

## Hotels Day View supported query parameters Properties

| Property | Type | Required | Nullable | Defined by |
|----------|------|----------|----------|------------|
| [adults](#adults) | `string` | **Required**  | No | Hotels Day View supported query parameters (this schema) |
| [checkin](#checkin) | `string` | **Required**  | No | Hotels Day View supported query parameters (this schema) |
| [checkout](#checkout) | `string` | **Required**  | No | Hotels Day View supported query parameters (this schema) |
| [currency](#currency) | `string` | Optional  | No | Hotels Day View supported query parameters (this schema) |
| [entity_id](#entity_id) | `string` | **Required**  | No | Hotels Day View supported query parameters (this schema) |
| [locale](#locale) | `string` | Optional  | No | Hotels Day View supported query parameters (this schema) |
| [market](#market) | `string` | Optional  | No | Hotels Day View supported query parameters (this schema) |
| [rooms](#rooms) | `string` | **Required**  | No | Hotels Day View supported query parameters (this schema) |
| `*` | any | Additional | Yes | this schema *allows* additional properties |

### adults

Number of adults

`adults`

* is **required**
* type: `string`
* defined in this schema

#### adults Type


`string`







### checkin

Date in the format YYYY-MM-DD

`checkin`

* is **required**
* type: `string`
* defined in this schema

#### checkin Type


`string`







### checkout

Date in the format YYYY-MM-DD

`checkout`

* is **required**
* type: `string`
* defined in this schema

#### checkout Type


`string`







### currency

The desired currency for the hotels search results

`currency`

* is optional
* type: `string`
* defined in this schema

#### currency Type


`string`







### entity_id

The id of the geo location for which the search will be performed.

`entity_id`

* is **required**
* type: `string`
* defined in this schema

#### entity_id Type


`string`







### locale

The desired locale for the hotels search results

`locale`

* is optional
* type: `string`
* defined in this schema

#### locale Type


`string`







### market

The market for which the hotels search will be performed.

`market`

* is optional
* type: `string`
* defined in this schema

#### market Type


`string`







### rooms

Number of rooms

`rooms`

* is **required**
* type: `string`
* defined in this schema

#### rooms Type


`string`






