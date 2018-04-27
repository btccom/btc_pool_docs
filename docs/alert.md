# alarm system

## Get my alarm classification information

`GET /alert/get`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |

### return value

```
{
    "err_no": 0,
    "data": [
        {
            "id": 2, --- log_id log id, set to read when required to be uploaded
            "uid": 66690,
            "puid": 88923,
            "type": "miners",
            "expect": "100",
            "actual": "99",
            "unit": null,
            "created_at": 1484907239,
            "is_read": 0,
            "interval": 3, --- Period when this alarm was generated
            "now_interval": 6 --- The user's current alarm period. The period value displayed when this alarm is turned off.
            "region_id": 1,
            "puid_name": "wy001", --- Sub-account name
            "is_default": 0,
            "is_hidden": 0
        },
        {
            "id": 3,
            "uid": 66690,
            "puid": 88923,
            "type": "hashrate",
            "expect": "10",
            "actual": "7",
            "unit": "T",
            "created_at": 1484907252,
            "is_read": 0,
            "interval": 3,
            "region_id": 1,
            "puid_name": "wy001",
            "is_default": 0,
            "is_hidden": 0
        }
    ]
}

```

## Get my alarm classification information

`GET /alert/read`

### Parameters

| Name | Type | Description |
|---|----|----|
|log_id|int| Sub-account id |

### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
or
{
    "err_no": 1,
    "err_msg": {
        "status": [
            "operation failed"
        ]
    }
}

```

## Modify the alarm cycle

`POST /alert/setting/update`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |
|interval|int| 2-24 hours |
|hashrate|int| 算力 |
|unit|int| Force unit, currently only T |
|hashrate_enabled|int| Whether to open the force alarm 0 off, 1 on |
|miners|int| number of alarm mining machines |
|miners_enabled|int| Whether to open miner alarm 0 off, 1 on |


### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
or
{
    "err_no": 1,
    "err_msg": {
        "hashrate": [
            "The minimum length of hashrate is 0"
        ],
        "unit": [
            "The selected unit is invalid"
        ]
    }
}

```

## Modify the alarm cycle

`POST /alert/setting/interval`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |
|interval|int| 2-24 hours |


### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
or
{
    "err_no": 1,
    "err_msg": {
        "interval": [
            "The minimum length of interval is 2"
        ]
    }
}

```

## Modify alarm hashrate

`POST /alert/setting/hashrate`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |
|hashrate|float| 算力 |
|enabled|int| is on, 1 on 0 off |
|unit|string| Optional: Manipulator unit, default T |


### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
or
{
    "err_no": 1,
    "err_msg": {
        "enabled": [
            "enabled is required"
        ]
    }
}

```

## Modify the number of alarm mining machines

`POST /alert/setting/miners`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |
|miners|int| Number of mining machines |
|enabled|int| is on, 1 on 0 off |


### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
or
{
    "err_no": 1,
    "err_msg": {
        "miners": [
            "Miners have a minimum length of 0"
        ]
    }
}

```

## Get my alarm contact

`GET /alert/contacts/my`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |


### return value

```
{
    "err_no": 0,
    "data": [
        {
            "id": 1, --- Contact id
            "uid": 66690,
            "puid": 88923,
            "note": "Default", --- Name
            "email": "yang.wang@bitmain.com",
            "region_code": "", --- Phone area such as 86
            "phone": null,
            "is_default": 1, --- User-initialized data, which is not allowed to be added subsequently
            "created_at": "2017-01-10 18:03:12",
            "updated_at": "2017-01-10 18:03:13"
        },
        {
            "id": 2,
            "uid": 66690,
            "puid": 88923,
            "note": "Little Tang,"
            "email": null,
            "region_code": "86",
            "phone": "13881963797",
            "is_default": 0,
            "created_at": "2017-01-10 18:03:53",
            "updated_at": "2017-01-10 18:03:54"
        },
    ]
}
or
{
    "err_no": 20001,
    "err_msg": "permissions denied"
}

```

## Get an alarm contact

`GET /alert/contacts/get`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |
|id|int| Contact id |


### return value

```
{
    "err_no": 0,
    "data": {
        "id": 2,
        "uid": 66690,
        "puid": 88923,
        "note": "Little Tang,"
        "email": null,
        "region_code": "86",
        "phone": "13881963797",
        "is_default": 0,
        "created_at": "2017-01-10 18:03:53",
        "updated_at": "2017-01-10 18:03:54"
    }
}
or
{
    "err_no": 0,
    "data": null
}

```


## Adding an Alarm Contact

`POST /alert/contacts/create`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |
|note|string| contact name |
|email|string| Mail: and phone at least 2 select 1 |
|region_code|int| Phone country code such as 86, phone has a value must have a value |
|phone|int| phone number and email at least 2 choose 1 |

### return value

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
or
{
    "err_no": 1,
    "err_msg": {
        "region_code": [
            "The region code field is required when email is not present"
        ]
    }
}
```


## Update Alert Contact

`POST /alert/contacts/update`

### Parameters

| Name | Type | Description |
|--