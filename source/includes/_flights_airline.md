## Flights Airline supported parameters Schema

```
/flights/flights-airline
```

| Property                    | Type     | Required     | Nullable | Defined by                                         |
| --------------------------- | -------- | ------------ | -------- | -------------------------------------------------- |
| [airlineCode](#airlinecode) | `string` | **Required** | No       | Flights Airline supported parameters (this schema) |
| [airlineName](#airlinename) | `string` | Optional     | No       | Flights Airline supported parameters (this schema) |
| [currency](#currency)       | `string` | Optional     | No       | Flights Airline supported parameters (this schema) |
| [locale](#locale)           | `string` | Optional     | No       | Flights Airline supported parameters (this schema) |
| [market](#market)           | `string` | Optional     | No       | Flights Airline supported parameters (this schema) |
| `*`                         | any      | Additional   | Yes      | this schema _allows_ additional properties         |

### airlineCode

The airline code.

`airlineCode`

- is **required**
- type: `string`
- defined in this schema

#### airlineCode Type

`string`

### airlineName

The airline name.

`airlineName`

- is optional
- type: `string`
- defined in this schema

#### airlineName Type

`string`

### currency

The desired currency for the page. Examples: GBP, EUR, USD  
Skyscanner will set this parameter based on location, IP and history of the user. Please do not use it unless you are absolutely sure

`currency`

- is optional
- type: `string`
- defined in this schema

#### currency Type

`string`

### locale

The desired locale for the page. Examples: es-ES, en-GB, ru-RU  
Skyscanner will set this parameter based on location, IP and history of the user. Please do not use it unless you are absolutely sure

`locale`

- is optional
- type: `string`
- defined in this schema

#### locale Type

`string`

### market

The market of the user. Examples: UK, US, ES  
Skyscanner will set this parameter based on location, IP and history of the user. Please do not use it unless you are absolutely sure

`market`

- is optional
- type: `string`
- defined in this schema

#### market Type

`string`
