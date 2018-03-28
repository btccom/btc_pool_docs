## 观察者账户列表

`GET /account/watcher/list`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 子账户id |

### 返回值

```
{
    {
        "id": 2,
        "uid": 66690,
        "puid": 88933,
        "watcher_key": "r_1234567891234",
        "note": "王杨",
        "created_at": "2016-12-08 03:06:01",
        "updated_at": "2016-12-08 03:06:02"
    },
    {
        "id": 3,
        "uid": 66690,
        "puid": 88933,
        "watcher_key": "r_1231231231234",
        "note": "秋秋",
        "created_at": "2016-12-08 03:10:20",
        "updated_at": "2016-12-08 03:10:21"
    },
}
```

## 分享观察者账户

`POST /account/watcher/create`

### 参数

|名称|类型|说明|
|---|----|----|
|note|str| 2-20长度的备注 |
|puid|int| 要被分享的子账户id |

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
    "err_no": 1,
    "err_msg": {
        "note": [
            "note 的最小长度为 2 字符"
        ]
    }
}
```

## 查看别人的观察者信息

`GET /account/watcher/others-list`

### 参数

|名称|类型|说明|
|---|----|----|
|watcher_token|string| 观察者token,多个的话 逗号 分割 |

### 返回值

```
{
    "err_no": 0,
    "data": [
        {
            "token": "r_1234567890123",
            "puid": 66666,
            "name": "矿工1", --- 子账户名称
            "region_id": 1,
            "hashrate_value" => "180",
            "hashrate_unit" => "T",
            "miners": "10",
            "miners_active": "8",
        },
        {
            "token": "r_1234567890123",
            "puid": 66666,
            "name": "矿工2",
            "region_id": 1,
            "hashrate_value" => "180",
            "hashrate_unit" => "T",
            "miners": "10",
            "miners_active": "8",
        },
    ]
}
```
或
```
{
    "err_no": 0,
    "data": []
}
```

## 删除观察者账户

`POST /account/watcher/delete`

### 参数

|名称|类型|说明|
|---|----|----|
|watcher_id|int| 要删除的watcher主键id |
|puid|int| 对应的子账户id |

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
    "err_no": 1,
    "err_msg": {
        "watcher_id": [
            "watcher_id 必须为数字"
        ]
    }
}
```