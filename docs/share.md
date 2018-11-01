# Computing data

## Get a list of groups

`GET /worker/groups?access_key={access_key}&puid={any valid puid}`

### Parameters

Page

Page_size

### return value

```

{
  "page": 1,
  "page_size": 10,
  "page_count": 1,
  "total_count": 1,
  "list": [
    -1: {
      "gid": -1,
      "sort_id": "-1", --- Web Sorting Use
      "name": "DEFAULT", --- Group name, default grouped as DEFAULT
      "created_at": 1468225322,
      "updated_at": 1468225322,
      "workers_active": 10,
      "workers_inactive": 11,
      "workers_dead": 3,
      "workers_total": 24,
      "shares_1m": "1.466", --- 1 minute calculation
      "shares_5m": "2.140", --- 5 minutes
      "shares_15m": "2.345", --- 15 minutes
      "shares_unit": "G", --- unit of force
      "shares_1d": "23.32" --- 24-Hour Force
      "shares_1d_unit": "T" --- 24-hour force unit
}
]
}

```

## Get real-time computing power

`GET /worker/stats?access_key={access_key}&puid={any valid puid}`

Get real-time power data. If you are considering writing a computing power monitoring system, consider using this API.
Get current user information, including 1 minute, 5 minutes, 15 minutes, force, miners, active, non-active

### Parameters

no

### return value

```
{
    "shares_1m": "111", --- The last 1 minute
    "shares_5m": "222", --- last 5 minutes
    "shares_15m": "333", --- Last 15 minutes
"shares_unit": "G", --- unit of force
"workers_active": 1,
"workers_inactive": 2,
"workers_dead" : 0,
"workers_total": 3
}
```

## Get User History Data

`GET /worker/share-history?access_key={access_key}&puid={puid}`

Get historical data on user power. The current available time dimension is 1 hour and 1 day.

### Example
`GET /worker/share-history?access_key={access_key}&puid={puid}&dimension=1d&count=1&start_ts=1540983315`

### Parameters

| Name | Type | Description |
|---|----|----|
|dimension|str|must specify the time dimension of the force data. The optional value is `(1h, 1d)`|
|start_ts|int|Required, specifies the timestamp of the start of the force data |
|count|int|Must specify the number of data points to return at most, or null if the return value has no data at the specified time.
|real_point|bool|optional (default is none, it is recommended to pass in), the last point of the incoming tickers is real-time data, old rules are not passed in (the first 5 minutes are not displayed, the remaining time is statistical data, will be more than average Low value)|

### return value

    {
        "shares_unit" : "T", --- unit of force
        "tickers": [
            ["{timestamp}", "{accept}", "{reject_percent}"],
            ["{timestamp}", "{accept}", "{reject_percent}"],
            ["{timestamp}", "{accept}", "{reject_percent}"],
        ]
    }


## Get Mining Machine List

`GET /worker?access_key={access_key}&puid={puid}`

Get a list of mining machines to which a user belongs.

### Parameters

| Name | Type | Description |
|---|----|----|
|status|str| Optional, specifies the miner classification, the default is ʻall`, and the optional value is `active/inactive/dead/all`|
|group|int|Optional, grouping number, default is all grouping|
|page|int|Optional, page number, default is 1|
|page_size|int|optional, page size, default is 10|
|filter|str|optional, filtered by name, empty by default |
|order_by|str| Optional, sorting field, defaults to `worker_id`. Optional values ​​are <br>`worker_id, worker_name,shares_1m,shares_5m,shares_15m,accept_count,reject_percent,last_share_time`|
|asc|int| Optional, specifies the sorting method; must specify the sorting method when specifying the sort field; the default is `0`, and the optional value is `0/1`|


### return value

    {
        "page": 1,
        "page_size": 10,
        "page_count": 1,
        "total_count": 1,
        "data": [
            {
                "gid": "-1",
                "group_name": "DEFAULT",
                "worker_id": "40",
                "worker_name": "km",
                "shares_1m": "439.8",
                "shares_5m": "674.3",
                "shares_15m": "733.0",
                "shares_unit": "G", --- unit of force
                "accept_count": "36395008",
                "last_share_time": "1468393691",
                "last_share_ip": "192.168.1.254",
                "reject_percent": "3.05",
                "shares_1d": "23.32" --- 24-Hour Force
                "shares_1d_unit": "T" --- 24-hour force unit
                "status": "DEAD"
            },
            {
                "gid": "-1",
                "group_name": "DEFAULT",
                "worker_id": "40",
                "worker_name": "km",
                "shares_1m": "439.8",
                "shares_5m": "674.3",
                "shares_15m": "733.0",
                "shares_unit": "G", --- unit of force
                "total_accept": "36395008",
                "last_share_time": "2015-02-09 06:46:17",
                "last_ip": "192.168.1.254",
                "reject_percent": "3.05",
                "shares_1d": "23.32" --- 24-Hour Force
                "shares_1d_unit": "T" --- 24-hour force unit
                "status": "ACTIVE"
            }
        ]
    }





## details of a single mining machine

`GET /worker/{worker_id}?access_key={access_key}&puid={puid}`

  * worker_id

    Mine machine id, available from Miner List API.

### Parameters

no

### return value

    {
    "worker_id": 10,
    "worker_name": "woca",
        "shares_1m": "1111",
        "shares_5m": "3333",
        "shares_15m": "4444",
        "shares_unit": "G", --- unit of force
        "shares_1d": "123.2" --- 1 day calculation
        "shares_1d_unit": "G" --- 1 day computing unit
    "accept_count": "1111",
    "accept_percent": 0.985,
    "reject_percent" : "0.01",
    "last_share_ip": "1.2.3.4",
        "ip2location" : "China, Henan, Amsterdam",
    "last_share_time": 1468226849,
    "worker_status": "DEAD"
    }





## Manpower data of a single miner

`GET /worker/{worker_id}/share-history?access_key={access_key}&puid={puid}`

  * worker_id

    Mine machine id, available from Miner List API.

### Parameters

| Name | Type | Description |
|---|----|----|
|dimension|str|must specify the time dimension of the force data. The optional value is `(1h/1d)`|
|start_ts|int|Must specify the timestamp of the start of the force data. If it is negative, subtract the value from the call time as the start time of the returned data |
|count|int|Must specify the number of data points to return at most, or null if the return value has no data at the specified time.
|real_point|bool|optional (default is none, it is recommended to pass in), the last point of the incoming tickers is real-time data, old rules are not passed in (the first 5 minutes are not displayed, the remaining time is statistical data, will be more than average Low value)|

### return value

    {
            "shares_unit" : "T", --- unit of force
            "tickers": [
                ["{timestamp}", "{accept}", "{reject_percent}"],
                ["{timestamp}", "{accept}", "{reject_percent}"],
                ["{timestamp}", "{accept}", "{reject_percent}"],
            ]
    }



## Mining Machine Information Update

`POST /worker/update`

Currently only
