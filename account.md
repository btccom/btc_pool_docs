## Get User Information

`GET /account/info`

### Parameters

no

### return value

```

{
    "user_id": "66690",
    "user_name": "spica",
    "address": "",
    "nmc_address": "", --- Domain currency address
    "rebates_address": "", --- Subsidy Address
    "region": "China",
    "contact": {
        "mail": "xxx@xxx.com",
        "phone": {
            "country": "86",
            "number": "13800000000"
        }
    },
    "alert": {
        "hashrate_max" => "192", --- Obsolete
        "hashrate_value" => "180",
        "hashrate_unit" => "T",
        "hashrate_alert" => true,
        "miner_max" => "999", --- Obsolete
        "miner_value" => "950",
        "miner_alert" => true,
        "alert_interval" => 6, --- Alarm Interval Hours
    }

}

```


## Change user payment address

`GET /account/address/update`

### Parameters

| Name | Type | Description |
|---|----|----|
|new_address|str| |
|verify_mode|str| Currently only sms and mail are optional |
|verify_id|str| |
|verify_code|str| |

### return value

```

{
    "status": true
}

```


## User SMS verification code

`GET /account/verify-code/{mode}`

### Parameters

| Name | Type | Description |
|---|----|----|
|mode|str| There are currently two delivery modes for SMS and email. The optional value is `(sms, mail)`|

### return value

```

{
    Success: true,
    Uuid: "67ad5827-0cbc-3015-acd1-42b0c1584817",
    Retries_left: 60
}

```

## User Alarm Information Settings Update

`POST /account/alert/update`

### Parameters

| Name | Type | Description |
|---|----|----|
|hashrate|int|The unit is T |
|miner|int| |

### return value

```

{
    Status: true,
}

```

## Get Subaccount List

`POST /account/sub-account/list`

### Parameters


### return value

```

{
    {
        "created_at": "2016-08-19 13:03:08",
        "name": "111",
        "puid": 88923,
        "region_id": 1,
        "region_name": "China",
        "updated_at": "2016-08-19 13:03:08",
        "is_current": true
    },
    {
        "created_at": "2016-08-19 13:03:37",
        "name": "222",
        "puid": 88924,
        "region_id": 2,
        Region_name: "United States",
        "updated_at": "2016-08-19 13:03:37"
    }
}

```


## Create a Subaccount

`POST /account/sub-account/create`

### Parameters

| Name | Type | Description |
|---|----|----|
|region_node|str| legal node name |
|worker_name|str| 3 to 20, globally unique |
|bitcoin_address|str| Legal address |

Currently set up no more than 50 user sub-accounts
The return status is a string and the content is the specific error content


### return value

```

{
    Status: true,
}

```

## Get Sub Account List (New Sub Account)

`GET /account/sub-account/morelist`

### Parameters


### return value

```

{
    "have_default": false,
    "display": [
        {
            "puid": 88923,
            "region_id": 1,
            "region_text": "China",
            "name": "wy001",
            "default_url": "http://pool.dev:8080/",
            "region_name": "cn",
            "created_at": "2016-11-16 06:54:13",
            "updated_at": "2016-12-08 09:22:33",
            "shares": 3 --- Number of Observers Shared
            "is_hidden": 0,
            "is_default": 0,
            "is_generate": 0,
            "change_updated_at": "2017-09-11 02:37:10",
            "current_mode": "btc", --- Current mode
            "current_mode_text": "btc", --- Current mode (internationalization)
            "is_current": 1, --- Are you mining under this subaccount?
            "current_coin_type": "btc", --- Current currency
            "open_coin_type": [ --- Currency opened by this subaccount
                "btc",
                "bcc"
            ]
        }
    ],
    "hidden": [
        {
            "puid": 88924,
            "region_id": 1,
            "region_text": "China",
            "name": "xxx",
            "default_url": "http://pool.dev:8080/",
            "region_name": "cn",
            "created_at": "2016-11-16 06:55:34",
            "updated_at": "2016-12-08 09:22:08",
            "shares": 0
            "is_hidden": 1,
            "is_default": 0,
            "is_generate": 0
        }
    ]
}

```

## Query the sub-account's daily calculation and active, all mining machines

`GET /account/sub-account/hashrate-miners`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |
|puids|str| Sub-account puid strings to be queried, separated by commas |

### return value

```

{
    {
        "88923": {
            "puid": "88923",
            "workers": 0,
            "workers_active": 0,
            "shares_1d": 0,
            "shares_1d_unit": "T"
        }
    },
    {
        "88933": {
            "puid": "88923",
            "workers": 2,
            "workers_active": 0,
            "shares_1d": 0,
            "shares_1d_unit": "T"
        }
    }
}

```


## Set as default subaccount

`GET /account/default/set`

### Parameters

| Name | Type | Description |
|---|----|----|
|default_puid|int| Subaccount id |

### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```
or
```
{
    "err_no": 2,
    "err_msg": {
        "msg": "Operation failed"
    }
}
```

## Cancel default

`GET /account/default/cancle`

### Parameters

| Name | Type | Description |
|---|----|----|
|cancle_default_puid|int| Subaccount id |

### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```
or
```
{
    "err_no": 2,
    "err_msg": {
        "msg": "Operation failed"
    }
}
```

## Hide Subaccounts

`GET /account/hidden/set`

### Parameters

| Name | Type | Description |
|---|----|----|
|hidden_puid|int| Sub-account id |

### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```
or
```
{
    "err_no": 2,
    "err_msg": {
        "msg": "Operation failed"
    }
}
```


## Recover sub accounts

`GET /account/hidden/cancle`

### Parameters

| Name | Type | Description |
|---|----|----|
|