# 矿机数据

## 获取矿机列表

`GET /worker`

### 参数

|名称|类型|说明|
|---|----|----|
|status|str| active,inactive,dead,all |
|group|int| group id |
|page|int| 页码 |
|filter|str| 页码 |
|order_by|str| worker_id,worker_name,shares_1m,shares_5m,shares_15m,accept_count,reject_percent,last_share_time,shares_1d |
|asc|int| 0倒叙 1正序 |


### 返回值

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

## 获取整体矿机状态

`GET /worker/stats`

### 参数

无

### 返回值

```

{
    "workers_active": 0,        --- 活跃数
    "workers_inactive": 0,      --- 不活跃
    "workers_dead": 0,          --- 无效
    "shares_1m": "0",           --- 滚动窗口数据
    "shares_5m": "0",
    "shares_15m": "0",
    "workers_total": 0,         --- 矿机总数
    "shares_unit": "T",         --- 窗口数据单位 1 5 15用
}

```


## 获取整体矿机状态 包含算力数据

`GET /worker/full-stats`

### 参数

无

### 返回值

```

{
    "workers_active": 0,        --- 活跃数
    "workers_inactive": 0,      --- 不活跃
    "workers_dead": 0,          --- 无效
    "shares_1m": "0",           --- 滚动窗口数据
    "shares_5m": "0",
    "shares_15m": "0",
    "workers_total": 0,         --- 矿机总数
    "shares_unit": "T",         --- 窗口数据单位 1 5 15用
    "shares_1d": {              --- 24H整小时数据
        "size": 0,
        "unit": "T"
    },
    "shares_1h": {              --- 1h 滚动窗口数据（目前无底层数据，取自15m滚动数据）
        "size": "0",
        "unit": "T"
    }
}

```