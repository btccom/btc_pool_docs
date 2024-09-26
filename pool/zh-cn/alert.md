# 报警系统

## 获取我的报警分类信息

`GET /alert/get`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |

### 返回值

```
{
    "err_no": 0,
    "data": [
        {
            "id": 2,                    --- log_id 日志id,设置为已读的时候需要上传
            "uid": 66690,
            "puid": 88923,
            "type": "miners",
            "expect": "100",
            "actual": "99",
            "unit": null,
            "created_at": 1484907239,
            "is_read": 0,
            "interval": 3,              --- 该条报警生成时的周期
            "now_interval": 6           --- 用户的当前报警周期.关闭该报警提示的时候,显示的周期值
            "region_id": 1,
            "puid_name": "wy001",       --- 子账户名称
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

## 获取我的报警分类信息

`GET /alert/read`

### 参数

|名称|类型|说明|
|---|----|----|
|log_id|int| 子账户id |

### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
或者
{
    "err_no": 1,
    "err_msg": {
        "status": [
            "操作失败"
        ]
    }
}

```

## 修改报警周期

`POST /alert/setting/update`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|interval|int| 2-24小时 |
|hashrate|int| 算力 |
|unit|int| 算力单位,目前仅T |
|hashrate_enabled|int| 是否打开算力报警 0关,1开 |
|miners|int| 报警矿机数 |
|miners_enabled|int| 是否打开矿机报警 0关,1开 |


### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
或
{
    "err_no": 1,
    "err_msg": {
        "hashrate": [
            "hashrate 的最小长度为 0 位"
        ],
        "unit": [
            "选定的 unit 是无效的"
        ]
    }
}

```

## 修改报警周期

`POST /alert/setting/interval`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|interval|int| 2-24小时 |


### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
或
{
    "err_no": 1,
    "err_msg": {
        "interval": [
            "interval 的最小长度为 2 位"
        ]
    }
}

```

## 修改报警算力

`POST /alert/setting/hashrate`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|hashrate|float| 算力 |
|enabled|int| 是否开启,1开启 0关闭 |
|unit|string| 可选:算力单位,默认T |


### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
或
{
    "err_no": 1,
    "err_msg": {
        "enabled": [
            "enabled 是必须的"
        ]
    }
}

```

## 修改报警矿机数

`POST /alert/setting/miners`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|miners|int| 矿机数 |
|enabled|int| 是否开启,1开启 0关闭 |


### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
或
{
    "err_no": 1,
    "err_msg": {
        "miners": [
            "miners 的最小长度为 0 位"
        ]
    }
}

```

## 获取我的报警联系人

`GET /alert/contacts/my`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |


### 返回值

```
{
    "err_no": 0,
    "data": [
        {
            "id": 1,                        --- 联系人id
            "uid": 66690,
            "puid": 88923,
            "note": "默认",                  --- 名称
            "email": "yang.wang@bitmain.com",
            "region_code": "",              --- 电话区域 如 +86 则存的86
            "phone": null,
            "is_default": 1,                --- 用户初始化的一条数据,后续不允许添加
            "created_at": "2017-01-10 18:03:12",
            "updated_at": "2017-01-10 18:03:13"
        },
        {
            "id": 2,
            "uid": 66690,
            "puid": 88923,
            "note": "小唐",
            "email": null,
            "region_code": "86",
            "phone": "13881963797",
            "is_default": 0,
            "created_at": "2017-01-10 18:03:53",
            "updated_at": "2017-01-10 18:03:54"
        },
    ]
}
或
{
    "err_no": 20001,
    "err_msg": "permissions denied"
}

```

## 获取某个报警联系人

`GET /alert/contacts/get`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|id|int| 联系人id |


### 返回值

```
{
    "err_no": 0,
    "data": {
        "id": 2,
        "uid": 66690,
        "puid": 88923,
        "note": "小唐",
        "email": null,
        "region_code": "86",
        "phone": "13881963797",
        "is_default": 0,
        "created_at": "2017-01-10 18:03:53",
        "updated_at": "2017-01-10 18:03:54"
    }
}
或
{
    "err_no": 0,
    "data": null
}

```


## 添加报警联系人

`POST /alert/contacts/create`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|note|string| 联系人名称 |
|email|string| 邮件:和phone至少2选1 |
|region_code|int| 手机国家代码 如 86,phone有值是 必须有值 |
|phone|int| 手机号码 和email至少2选1 |

### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
或
{
    "err_no": 1,
    "err_msg": {
        "region_code": [
            "region code 字段是必须的当 email 是不存在的"
        ]
    }
}
```


## 更新报警联系人

`POST /alert/contacts/update`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|id|int| 联系人id |
|note|string| 联系人名称 |
|email|string| 邮件:和phone至少2选1 |
|region_code|int| 手机国家代码 如 86,phone有值是 必须有值 |
|phone|int| 手机号码 和email至少2选1 |

### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
或
{
    "err_no": 1,
    "err_msg": {
        "status": [
            "操作失败"          --- status 操作失败 .是数据不存或者DB错误统一的显示,其他接口也可能都会返回这种信息.
        ]
    }
}
```


## 删除报警联系人

`POST /alert/contacts/delete`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |
|id|int| 联系人id |

### 返回值

```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
或
{
    "err_no": 1,
    "err_msg": {
        "status": [
            "操作失败"
        ]
    }
}
```