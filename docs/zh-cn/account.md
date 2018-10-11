
## 获取用户信息

`GET /account/info`

### 参数

puid 级别

puid

### 返回值

```

{
    "user_id": "66690",
    "user_name": "spica",
    "address": "",
    "nmc_address": "",    --- 域名币地址
    "rebates_address": "",    --- 补贴地址
    "region": "中国",
    "contact": {
        "mail": "xxx@xxx.com",
        "phone": {
            "country": "86",
            "number": "13800000000"
        }
    },
    "alert": {
        "hashrate_max" => "192",        --- 暂废弃
        "hashrate_value" => "180",
        "hashrate_unit" => "T",
        "hashrate_alert" => true,
        "miner_max" => "999",           --- 暂废弃
        "miner_value" => "950",
        "miner_alert" => true,
        "alert_interval" => 6,          --- 报警间隔 小时
    }

}

```


## 变更用户收款地址

`GET /account/address/update`

### 参数

|名称|类型|说明|
|---|----|----|
|new_address|str| |
|verify_mode|str| 目前只有sms和mail可选 |
|verify_id|str| |
|verify_code|str| |

### 返回值

```

{
    "status": true
}

```


## 用户短信邮件验证码

`GET /account/verify-code/{mode}`

### 参数

|名称|类型|说明|
|---|----|----|
|mode|str| 目前有短信和邮件两种下发方式 可选值为`(sms, mail)`|

### 返回值

```

{
    success: true,
    uuid: "67ad5827-0cbc-3015-acd1-42b0c1584817",
    retries_left: 60
}

```

## 用户报警信息设置更新

`POST /account/alert/update`

### 参数

|名称|类型|说明|
|---|----|----|
|hashrate|int|单位为T |
|miner|int| |

### 返回值

```

{
    status: true,
}

```

## 获取子账户列表

`POST /account/sub-account/list`

### 参数

可选参数：

|名称|类型|说明|
|---|----|----|
|puids |string| 多个以逗号相隔，可选 |


### 返回值

```
{
    "err_no": 0,
    "data": [
        {
            "puid": 88961,
            "region_id": 1,
            "region_name": "Beijing(China)",
            "name": "dubuqingfeng",
            "default_url": "http://pool.test",
            "is_current": 0,
            "created_at": "2017-06-01 04:07:39",
            "updated_at": "2017-12-08 10:11:09",
            "change_updated_at": "2017-08-28 03:17:07"
        },
        {
            "puid": 88962,
            "region_id": 1,
            "region_name": "Beijing(China)",
            "name": "teestw",
            "default_url": "http://pool.test",
            "is_current": 1,
            "created_at": "2017-06-06 10:16:33",
            "updated_at": "2017-12-14 15:47:54",
            "change_updated_at": "2017-09-11 02:37:10"
        }
    ]
}
```

## 获取子账户包含算法的详细列表

`GET /account/sub-account/algorithms/morelist`

### 参数

|名称|类型|说明|
|---|----|----|
| is_guardian | boolean | 默认 false |
| is_hidden |boolean| 默认 false |
| order_by | string | in：puid,name |

### 返回值

```
{
    "err_no": 0,
    "data": {
        "have_default": true,
        "account": null,
        "subaccounts": [
            "name": "",
            "region": "",
            "region_text": "",
            // 是否包含其他算法
            "have_other_algorithms": 1,
            "algorithms" : [
                {
                    // 算法名称
                    "algorithm_name": "",
                    // 当前币种
                    "current_coin": "",
                    // 根据 算法 和 地区决定。
                    "support_coins": [],
                    // 当前模式
                    "current_mode": "",
                    // 当前模式翻译
                    "current_mode_text": "",
                    // 该子账户开启的币种，（即不可创建地址的）
                    "open_coin_type": [],
                    // 币种账户
                    "coin_accounts": [
                    ],
                }
            ]
        ]
    }
}
```


## 创建子账户

`POST /account/sub-account/create`

### 参数

注意不可跨区创建

|名称|类型|说明|
|---|----|----|
|region_node|str| 合法节点名 |
| coin_type |str| 币种类型 |
| worker_name | str | 3到20位,全局唯一 |
| bitcoin_address | str | 合法地址 |

当前 设定一个用户子账户不超过50个
返回 状态为字符串，内容为具体错误内容


### 返回值

```

{
    "err_no": 0,
    "data": {
        "status": true,
        "puid": 257680,
        "region_id": 1,
        "region_base_url": "https:\/\/cn.pool.btc.com"
    }
}

```

## 获取子账户列表(新版子账户)

`GET /account/sub-account/morelist`

### 参数


### 返回值

```

{
    "have_default": false,
    "display": [
        {
            "puid": 88923,
            "region_id": 1,
            "region_text": "中国",
            "name": "wy001",
            "default_url": "http://pool.dev:8080/",
            "region_name": "cn",
            "created_at": "2016-11-16 06:54:13",
            "updated_at": "2016-12-08 09:22:33",
            "shares": 3                         --- 分享了的观察者数
            "is_hidden": 0,
            "is_default": 0,
            "is_generate": 0,
            "change_updated_at": "2017-09-11 02:37:10",
            "current_mode": "btc",              --- 当前模式
            "current_mode_text": "btc",              --- 当前模式(国际化)
            "is_current": 1,                    --- 是否在该子账户下挖矿
            "current_coin_type": "btc",         --- 当前币种
            "open_coin_type": [                 --- 该子账户开启的币种
                "btc",
                "bcc"
            ]
        }
    ],
    "hidden": [
        {
            "puid": 88924,
            "region_id": 1,
            "region_text": "中国",
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

## 查询子账户的日算力和活跃,所有矿机数

`GET /account/sub-account/hashrate-miners`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|puids|str| 要查询的子账户puid字符串,英文逗号分隔|

### 返回值

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


## 隐藏子账户

`GET /account/hidden/set`

### 参数

|名称|类型|说明|
|---|----|----|
|hidden_puid|int| 子账户id |

### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```
或
```
{
    "err_no": 2,
    "err_msg": {
        "msg": "操作失败"
    }
}
```


## 恢复子账户

`GET /account/hidden/cancle`

### 参数

|名称|类型|说明|
|---|----|----|
|cancle_hidden_puid|int| 子账户id |

### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```
或
```
{
    "err_no": 2,
    "err_msg": {
        "msg": "操作失败"
    }
}
```

## 设置子账户支付限额

`POST /account/pay/limit`

### 参数

|名称|类型|说明|
|---|----|----|
| amount | 0.1, 0.01, 0.001 | 限额 |
| all_subaccount_limit | boolean | 是否所有比特币子账户使用相同起付金额，默认否 |

### 返回值

```
{
    "err_no":0, 
    "data": {
        "status" : true
    }
}
```
