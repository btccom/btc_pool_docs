# Miner Group Operation

## Add Grouping

`POST groups/create`

### Parameters

| Name | Type | Description |
|---|----|----|
|group_name|str|must |



##### Return

```

{
    "status": true
}

```



## delete group

`POST groups/delete/{group_id}`

### Parameters

| Name | Type | Description |
|---|----|----|
|group_id|int|Required|



##### Return

```

{
    "status": true
}

```


## Update Group

`POST groups/update/{group_id}`

### Parameters

| Name | Type | Description |
|---|----|----|
|group_id|int|Required|
|name|str| |


##### Return

```

{
    "status": true
}

```

## Get a group details

`GET groups/{group_id}`

### Parameters

| Name | Type | Description |
|---|----|----|
|group_id|int|Required|


##### Return

```

{
    "workers_active": 0,
    "workers_inactive": 0,
    "workers_dead": 0,
    "shares_1m": "0"
    "shares_5m": "0"
    "shares_15m": "0"
    "workers_total": 0,
    "shares_unit": "G",
    "gid": 0,
    "sort_id": "-1",
    "name": "ALL",
    "created_at": 1469604282,
    "updated_at": 1469604282
}

```


## Get Group Information Lite

`GET /groups/simple`

### Parameters

no


##### Return

```

[

    {
        "gid": "-1",
        "name": "DEFAULT"
    },
    {
        "gid": 4,
        "name": "404"
    }

]

```