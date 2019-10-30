## Cheap Flights To supported parameters Schema

```
/flights/cheap-flights-to
```

| Property                    | Type     | Required     | Nullable | Defined by                                          |
| --------------------------- | -------- | ------------ | -------- | --------------------------------------------------- |
| [currency](#currency)       | `string` | Optional     | No       | Cheap Flights To supported parameters (this schema) |
| [destination](#destination) | `string` | **Required** | No       | Cheap Flights To supported parameters (this schema) |
| [locale](#locale)           | `string` | Optional     | No       | Cheap Flights To supported parameters (this schema) |
| [market](#market)           | `string` | Optional     | No       | Cheap Flights To supported parameters (this schema) |
| `*`                         | any      | Additional   | Yes      | this schema _allows_ additional properties          |

### currency

The desired currency for the page. Examples: GBP, EUR, USD  
Skyscanner will set this parameter based on location, IP and history of the user. Please do not use it unless you are absolutely sure

`currency`

- is optional
- type: `string`
- defined in this schema

#### currency Type

`string`

### destination

Location code for the destination

`destination`

- is **required**
- type: `string`
- defined in this schema

#### destination Type

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
