## Flights Home Page supported parameters Schema

```
/flights/home
```

| Property              | Type     | Required   | Nullable | Defined by                                           |
| --------------------- | -------- | ---------- | -------- | ---------------------------------------------------- |
| [currency](#currency) | `string` | Optional   | No       | Flights Home Page supported parameters (this schema) |
| [locale](#locale)     | `string` | Optional   | No       | Flights Home Page supported parameters (this schema) |
| [market](#market)     | `string` | Optional   | No       | Flights Home Page supported parameters (this schema) |
| `*`                   | any      | Additional | Yes      | this schema _allows_ additional properties           |

### currency

The desired currency for the page.

`currency`

- is optional
- type: `string`
- defined in this schema

#### currency Type

`string`

### locale

The desired locale for the page.

`locale`

- is optional
- type: `string`
- defined in this schema

#### locale Type

`string`

### market

The market of the user.

`market`

- is optional
- type: `string`
- defined in this schema

#### market Type

`string`
