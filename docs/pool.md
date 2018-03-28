# Mine pool data

## Get Mine Pool Explosion Data

`GET /blocks`

### Parameters

Page

Page_size

### return value

```

{
    "page": 1,
    "page_size": 10,
    "page_count": 5,
    "total_count": "44",
    "blocks_count": "44",
    "rewards_count": "13757544917",
    "hashrate": 567,
    "hashrate_unit": "G",
    "luck" : "1.0345",
    "miners_count": 1000,
    "blocks": [
        {
            "height": 898567,
            "created_at": 1469082030,
            "hash": "00000000017aaf4a874438740a8a12131eec21b0f531f008441b6b367f7b7f32",
            "rewards": 313047911
        },
        {
            "height": 898559,
            "created_at": 1469074087,
            "hash": "00000000016131608a436d605bceac64548ec4f9e502ff3549d1bb1006e475a8",
            "rewards": 312941582
        },
        ...
    ]

}

```

## Get historical data of mining pool

`GET /pool/share-history/`

Get the historical data of mining pool computing power. The current available time dimension is 1 hour, 1 day.

### Parameters

| Name | Type | Description |
|---|----|----|
|dimension|str|must specify the time dimension of the force data. The optional value is `(1h, 1d)`|
|start_ts|int|Required, specifies the timestamp of the start of the force data |
|count|int|Must specify the number of data points to return at most, or null if the return value has no data at the specified time.
|real_point|bool|optional (default is none, it is recommended to pass in), incoming is the last point of the tickers data is real-time data, old rules are not passed in (first 15 minutes real time, remaining time is statistics) |

### return value

    {
        "unit" : "T", --- Force Unit
        "tickers": [
            ["{timestamp}", "{accept}", "{reject_percent}"],
            ["{timestamp}", "{accept}", "{reject_percent}"],
            ["{timestamp}", "{accept}", "{reject_percent}"],
        ]
    }



## Get Mine Pool Status

`GET /pool/status/`


### Parameters

no

### return value


```

{
    "network_hashrate": "3.80",
    "network_hashrate_unit": "E",
    "pool_hashrate": 3.165,
    "pool_hashrate_unit": "P",
    "mining_earnings": "0.00048282",
    "mining_earnings_satoshis": "48282",
    "fpps_mining_earnings": "0.00050421",
    "fpps_mining_earnings_satoshis": "50421",
    "estimated_next_difficulty": "530652761757",
    "difficulty_change": "+1.89%",
    "time_remain": "1493253296",
    "exchange_rate": {
        "BTC2CNY": 7150.92,
        "BTC2USD": 1059.53,
        "BTC2EUR": 1,
        "USD2CNY": 6.89,
        "USD2EUR": 0.93
    },
    "fpps_rate": "0.08781851"
}

```

## Get mining pool mining address

`GET /pool/url-config/`


### Parameters

| Name | Type | Description |
|---|----|----|
|region|str| is not required. Returns the specified node data when the parameter is specified, otherwise returns all data |

### return value


```

{
    {
        "region": "CN",
        "region_name": "China",
        "config": [
            "bj.pool.btc.com: 3333",
            "bj.pool.btc.com: 443",
            "bj.pool.btc.com: 25"
        ]
    },
    {
        "region": "US",
        "region_name": "US",
        "config": [
            "us.pool.btc.com: 3333",
            "us.pool.btc.com: 443",
            "us.pool.btc.com: 25"
        ]
    }
]

```

## Get Node Information

`GET /pool/node-list`


### Parameters

no

### return value


```
{
    {
        "default_url": "https://devpool.btc.com",
        "ping_url": "https://devpool.btc.com/node-ping-test",
        "region_name": "cn",
        "text": "China",
        "stratum": [
            "bj.pool.btc.com: 3333",
            "bj.pool.btc.com: 443",
            "bj.pool.btc.com: 25"
        ]
    },
    {
        "default_url": "https://devpool.btc.com",
        "ping_url": "https://devpool.btc.com/node-ping-test",
        "region_name": "us",
        "text": "China",
        "stratum": [
            "bj.pool.btc.com: 3333",
            "bj.pool.btc.com: 443",
            "bj.pool.btc.com: 25"
        ]
    }
}

```