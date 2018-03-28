# 矿工组操作

## 新增分组

`POST groups/create`

### 参数

|名称|类型|说明|
|---|----|----|
|group_name|str|必须|



##### 返回

```

{
    "status": true
}

```



## 删除分组

`POST groups/delete/{group_id}`

### 参数

|名称|类型|说明|
|---|----|----|
|group_id|int|必须|



##### 返回

```

{
    "status": true
}

```


## 更新分组

`POST groups/update/{group_id}`

### 参数

|名称|类型|说明|
|---|----|----|
|group_id|int|必须|
|name|str| |


##### 返回

```

{
    "status": true
}

```

## 获取某一分组详情

`GET groups/{group_id}`

### 参数

|名称|类型|说明|
|---|----|----|
|group_id|int|必须|


##### 返回

```

{
    "workers_active": 0,
    "workers_inactive": 0,
    "workers_dead": 0,
    "shares_1m": "0",
    "shares_5m": "0",
    "shares_15m": "0",
    "workers_total": 0,
    "shares_unit": "G",
    "gid": 0,
    "sort_id": "-1",
    "name": "ALL",
    "created_at": 1469604282,
    "updated_at": 1469604282
}

```


## 获取分组信息精简版

`GET /groups/simple`

### 参数

无


##### 返回

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