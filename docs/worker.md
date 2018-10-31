# Miner data

## Get Miner List

`GET /worker?puid={puid}&access_key={access_key}`

### Parameters

| Name | Type | Description |
|---|----|----|
|status|str| active,inactive,dead,all |
|group|int| group id |
|page|int| Page |
|filter|str| Page Numbers |
|order_by|str| worker_id, worker_name, shares_1m, shares_5m, shares_15m, accept_count, reject_percent, last_share_time, shares_1d |
|asc|int| 0 Flashback 1 Positive Sequence |


### return value

```
{
    "page": "6",
    "page_size": "50",
    "page_count": 41,
    "total_count": 2001,
    "data": [
        {
            "gid": -1,
            "group_name": null,
            "worker_id": "5325119314078704790",
            "worker_name": "55x2",
            "shares_1m": "16.41",
            "shares_5m": "16.65",
            "shares_15m": "13.13",
            "accept_count": 235305,
            "last_share_time": 1492566748,
            "last_share_ip": "58.18.54.83",
            "reject_percent": "0.0000",
            "shares_unit": "T",
            "status": "ACTIVE",
            "shares_1d": "11.76",
            "shares_1d_unit": "T"
        },
        {
            "gid": -1,
            "group_name": null,
            "worker_id": "-1956288636539691820",
            "worker_name": "55x19",
            "shares_1m": "11.72",
            "shares_5m": "11.49",
            "shares_15m": "11.33",
            "accept_count": 231437,
            "last_share_time": 1492566750,
            "last_share_ip": "58.18.54.83",
            "reject_percent": "0.0000",
            "shares_unit": "T",
            "status": "ACTIVE",
            "shares_1d": "11.64",
            "shares_1d_unit": "T"
        },
        {
            "gid": -1,
            "group_name": null,
            "worker_id": "4762776105132274421",
            "worker_name": "55x18",
            "shares_1m": "11.72",
            "shares_5m": "9.617",
            "shares_15m": "10.71",
            "accept_count": 233225,
            "last_share_time": 1492566744,
            "last_share_ip": "58.18.54.83",
            "reject_percent": "0.0000",
            "shares_unit": "T",
            "status": "ACTIVE",
            "shares_1d": "11.80",
            "shares_1d_unit": "T"
        }
    ]
}

```

## Get the status of the entire mining machine

`GET /worker/stats?puid={puid}&access_key={access_key}`

### Parameters

no

### return value

```

{
    "workers_active": 0, --- Active Number
    "workers_inactive": 0, --- Inactive
    "workers_dead": 0, --- is invalid
    "shares_1m": "0", --- Scrolling window data
    "shares_5m": "0"
    "shares_15m": "0"
    "workers_total": 0, --- Total number of miners
    "shares_unit": "T", --- Window data unit 1 5 15 use
}

```


## Get the whole miner's status Contains the power data

`GET /worker/full-stats?puid={puid}&access_key={access_key}`

### Parameters

no

### return value

```

{
    "workers_active": 0, --- Active Number
    "workers_inactive": 0, --- Inactive
    "workers_dead": 0, --- is invalid
    "shares_1m": "0", --- Scrolling window data
    "shares_5m": "0"
    "shares_15m": "0"
    "workers_total": 0, --- Total number of miners
    "shares_unit": "T", --- Window data unit 1 5 15 use
    "shares_1d": { --- 24H hourly data
        "size": 0,
        "unit": "T"
    },
    "shares_1h": { --- 1h Scroll window data (currently no underlying data, taken from 15m scroll data)
        "size": "0",
        "unit": "T"
    }
}

```
