## Watcher Account List

`GET /account/watcher/list`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Sub-account id |

### return value

```
{
    {
        "id": 2,
        "uid": 66690,
        "puid": 88933,
        "watcher_key": "r_1234567891234",
        "note": "Wang Yang,"
        "created_at": "2016-12-08 03:06:01",
        "updated_at": "2016-12-08 03:06:02"
    },
    {
        "id": 3,
        "uid": 66690,
        "puid": 88933,
        "watcher_key": "r_1231231231234",
        "note": "Autumn,"
        "created_at": "2016-12-08 03:10:20",
        "updated_at": "2016-12-08 03:10:21"
    },
}
```

## Sharing Watcher Accounts

`POST /account/watcher/create`

### Parameters

| Name | Type | Description |
|---|----|----|
|note|str| Remarks of 2-20 length |
|puid|int|Subaccount id to be shared |

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
    "err_no": 1,
    "err_msg": {
        "note": [
            "note has a minimum length of 2 characters"
        ]
    }
}
```

## Viewing Watcher Information for Others

`GET /account/watcher/others-list`

### Parameters

| Name | Type | Description |
|---|----|----|
|watcher_token|string| observer token, multiple words Comma Split |

### return value

```
{
    "err_no": 0,
    "data": [
        {
            "token": "r_1234567890123",
            "puid": 66666,
            "name": "Miner 1", --- Sub-account name
            "region_id": 1,
            "hashrate_value" => "180",
            "hashrate_unit" => "T",
            "miners": "10",
            "miners_active": "8",
        },
        {
            "token": "r_1234567890123",
            "puid": 66666,
            "name": "Miner 2"
            "region_id": 1,
            "hashrate_value" => "180",
            "hashrate_unit" => "T",
            "miners": "10",
            "miners_active": "8",
        },
    ]
}
```
or
```
{
    "err_no": 0,
    "data": []
}
```

## Delete Watcher Account

`POST /account/watcher/delete`

### Parameters

| Name | Type | Description |
|---|----|----|
|watcher_id|int|Watcher primary key id to be removed |
|puid|int| corresponding subaccount id |

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
    "err_no": 1,
    "err_msg": {
        "watcher_id": [
            "watcher_id must be a number"
        ]
    }
}
```