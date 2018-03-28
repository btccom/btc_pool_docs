# 用户数据

## 获取用户收益概况

`GET /account/earn-stats`

### 参数

无

### 返回值

```

{
    "total_paid": "81687163",           --- 总共支付的
    "pending_payouts": "209698",        --- 延迟发放的
    "earnings_yesterday": "81687163",   --- 昨日支付
    "last_payment_time": 1492482988,    --- 最后支付时间
    "earnings_today": 0,                --- 今日收益（还未结算-估算值）
    "unpaid": 209698,                   --- 余额 所有未支付的（包括今日收益）
    "relative_pps_rate": 106.0938,      --- 相对pps比例
    "amount_100t": 5122425,             --- 每100T收益
    "hashrate_yesterday": {             --- 昨日算力
        "size": "1.59",
        "unit": "P"
    },
    "shares_1d": {                      --- 24H 算力
        "size": 0,
        "unit": "T"
    }
}

```

## 获取用户收益历史数据

`GET /account/earn-history`

### 参数

|名称|类型|说明|
|---|----|----|
|page|int| |
|page_size|int| |

### 返回值

```

    {
        "page": "1",
        "page_size": "10",
        "page_count": 2,
        "total_count": 12,
        "list": [
            {
                "date": "20160724",
                'diff': 22222,
                'diff_rate': 0    --- 百分数,难度变化率,该key不存在则表示难度没变化
                "earnings": 43957232146804320,
                "earnings_rate": 123.321    --- 百分数,收益变化率,该key不存在则表示上一收益为空,无法计算
                "payment_time": "0",
                "payment_tx": "",
                "address": "",
                "paid_amount": 0
            },
            {
                "date": "20160725",
                'diff': 22222,
                "earnings": 1829543482510,
                "payment_time": "0",
                "payment_tx": "",
                "address": "",
                "paid_amount": 0
            },
            ...
        ]
    }

}


```
