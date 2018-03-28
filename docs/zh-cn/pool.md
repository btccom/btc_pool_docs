# 矿池数据

## 获取矿池爆块数据

`GET /blocks`

### 参数

page

page_size

### 返回值

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

## 获取矿池算力历史数据

`GET /pool/share-history/`

获取矿池算力历史数据。目前可用时间维度为 1 小时, 1 天。

### 参数

|名称|类型|说明|
|---|----|----|
|dimension|str|必须，指定算力数据的时间维度，可选值为`(1h, 1d)`|
|start_ts|int|必须，指定算力数据开始的时间戳|
|count|int|必须，指定最多返回多少个时间点的数据，如果返回值在指定时间点没有数据，则为 null|
|real_point|bool|可选(默认无,建议传入),传入则tickers最后一个点数据是实时数据,不传入则老规则(前15分钟实时,其余时间是统计数据)|

### 返回值

    {
        "unit" : "T",        --- 算力单位
        "tickers": [
            ["{timestamp}", "{accept}", "{reject_percent}"],
            ["{timestamp}", "{accept}", "{reject_percent}"],
            ["{timestamp}", "{accept}", "{reject_percent}"],
        ]
    }



## 获取矿池状态

`GET /pool/status/`


### 参数

无

### 返回值


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

## 获取矿池挖矿地址

`GET /pool/url-config/`


### 参数

|名称|类型|说明|
|---|----|----|
|region|str|非必须，当指定参数时返回指定节点数据， 否则返回全部数据|

### 返回值


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

## 获取节点信息

`GET /pool/node-list`


### 参数

无

### 返回值


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