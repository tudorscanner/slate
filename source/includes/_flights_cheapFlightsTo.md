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

The desired currency for the flights search results

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

The desired locale for the flights search results

`locale`

- is optional
- type: `string`
- defined in this schema

#### locale Type

`string`

### market

The market for which the flights search will be performed.

`market`

- is optional
- type: `string`
- defined in this schema

#### market Type

`string`
