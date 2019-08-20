## Hotels Home View supported query parameters Schema

```
/hotels/home-view
```

A schema definition for the hotels home-view microsite supported query parameters

| Abstract | Extensible | Status       | Identifiable | Custom Properties | Additional Properties | Defined In                     |
| -------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | ------------------------------ |
| Can be instantiated | No         | Experimental | No           | Forbidden         | Permitted             |  |

## Hotels Home View supported query parameters Properties

| Property                                      | Type      | Required   | Nullable | Defined by                                                |
| --------------------------------------------- | --------- | ---------- | -------- | --------------------------------------------------------- |
| [adults](#adults)                             | `integer` | Optional   | No       | Hotels Home View supported query parameters (this schema) |
| [checkin](#checkin)                           | `string`  | Optional   | No       | Hotels Home View supported query parameters (this schema) |
| [checkout](#checkout)                         | `string`  | Optional   | No       | Hotels Home View supported query parameters (this schema) |
| [rooms](#rooms)                               | `integer` | Optional   | No       | Hotels Home View supported query parameters (this schema) |
| [skyscanner_node_code](#skyscanner_node_code) | `string`  | Optional   | No       | Hotels Home View supported query parameters (this schema) |
| `*`                                           | any       | Additional | Yes      | this schema _allows_ additional properties                |

### adults

Number of adults

`adults`

- is optional
- type: `integer`
- defined in this schema

#### adults Type

`integer`

### checkin

Checkin date in the format YYYY-MM-DD

`checkin`

- is optional
- type: `string`
- defined in this schema

#### checkin Type

`string`

### checkout

Checkout date in the format YYYY-MM-DD

`checkout`

- is optional
- type: `string`
- defined in this schema

#### checkout Type

`string`

### rooms

Number of rooms

`rooms`

- is optional
- type: `integer`
- defined in this schema

#### rooms Type

`integer`

### skyscanner_node_code

The IATA code of the destination

`skyscanner_node_code`

- is optional
- type: `string`
- defined in this schema

#### skyscanner_node_code Type

`string`
