## 被守护者子账户列表信息


`GET {{base_url}}/v1/guardian/invite/link/subaccounts?access_key={{access_key}}&link_id=8`

### 参数

无


### 返回值
```
{
    "err_no": 0,
    "data": [
        {
            "puid": 115,
            "region_id": 1,
            "name": "tdmgjpm",
            "conf_json": "{\"text_zh-cn\":\"北方联通\",\"text_en\":\"Beijing(China)\", \"uc_service_name\": \"cn\"}",
            "type": "BTC",
            "region_name": "Beijing(China)",
            "coin_type": "Bitcoin  (BTC)",
            "is_guard": true
        }
    ]
}
```

## 获取子账户列表(新版子账户)

`GET {{base_url}}/v1/account/sub-account/morelist?is_guardian=1`

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
        },
        {
            "puid": 88933,
            "region_id": 1,
            "region_text": "中国",
            "name": "wy003",
            "default_url": "http://pool.dev:8080/",
            "region_name": "cn",
            "created_at": "2016-11-30 07:11:58",
            "updated_at": "2016-12-09 02:36:31",
            "shares": 3
            "is_hidden": 0,
            "is_default": 0,
            "is_generate": 0,
            "change_updated_at": "2017-09-11 02:37:10",
            "current_mode": "btc",
            "is_current": 1,
            "current_coin_type": "btc",
            "open_coin_type": [
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
            "name": "wy002",
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


## 获取所有的守护邀请链接


`GET {{base_url}}/v1/guardian/invite/links?access_key={{access_key}}`

### 参数

无


### 返回值
```

{
    "err_no": 0,
    "data": {
        "page": 1,
        "page_size": 10,
        "page_count": 1,
        "total_count": 7,
        "list": [
            {
                "id": 2,
                "link": null,
                "created_at": "2018-03-15 09:40:16",
                "status": 0,
                "used_at": null,
                "defender_note": "1234",
                "defender_uid": null,
                "status_text": "unbounded"
            }
        ]
    }
}

```


## 获取所有的守护者链接


`GET {{base_url}}/v1/guardian/links?access_key={{access_key}}`

### 参数

无


### 返回值
```
{"err_no":0,"data":{"page":1,"page_size":10,"page_count":1,"total_count":7,"list":[]}}

```


## 生成守护邀请链接


`POST {{base_url}}/v1/guardian/invite/link/create?access_key={{access_key}}`

### 参数

```
{
	"note": "note"
}
```


### 返回值
```

{"err_no":0,"data":{"link":"gMRyL7PSDfYmmQwggtxrCgMwun7RdHWxyZwygpq2nf63prdW33YKVTNlTcCIIhM4oi4N0goxIouohXHYusCLI2KkoEBXLY4cg9GKPLq72HNRJGl0FDxoYuHeVIbb6zyG"}}

```


## 生成守护者链接


`POST {{base_url}}/v1/guardian/link/create?access_key={{access_key}}`

### 参数

```
{
	"note": "note",
	"type" : "single"
}
或者
{
    "type" : "multi"
}

```


### 返回值
```

{"err_no":0,"data":{"link":"VsxulOzrJ7yE8wAZqMidf8njomSmxsO4dHL5oVlUQ6jLdaldYzfRAbd9JxUX9ujL42iOFziXgTfsx2PvHKeS4Fu16FwPBD7VLwLgQG0aBfMYzCr4RdidCkd1JdxpwH9C"}}

```


## 删除守护邀请链接


`POST {{base_url}}/v1/guardian/invite/link/delete?access_key={{access_key}}`

### 参数

```
{
	"link_id": 1
}
```


### 返回值
```

{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```


## 守护者删除守护者链接


`POST {{base_url}}/v1/guardian/link/delete?access_key={{access_key}}`

### 参数

```
{
	"link_id": 1
}
```


### 返回值
```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}

```


## 更新守护邀请链接备注


`POST {{base_url}}/v1/guardian/invite/link/note?access_key={{access_key}}`

### 参数

```
{
	"link_id": 2,
	"note": "1234"
}
```


### 返回值
```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```


## 更新守护者链接备注


`POST {{base_url}}/v1/guardian/link/note?access_key={{access_key}}`

### 参数

```
{
	"link_id": 2,
	"note": "1234"
}
```


### 返回值
```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```


## 更新守护者链接状态


`POST {{base_url}}/v1/guardian/link/show?access_key={{access_key}}`

### 参数

```
{
	"link_id": 2,
	"is_show": true
}
```


### 返回值
```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```


## 更新守护者子账户守护状态


`POST {{base_url}}/v1/guardian/invite/link/subaccount?access_key={{access_key}}`

### 参数

```
{
	"link_id": 8,
	"puid": 88970,
	"is_guard": false
}
```


### 返回值
```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```


## 用户绑定初始化


`POST {{base_url}}/v1/guardian/link/bind/init?access_key={{access_key}}`

### 参数

```
{
	"token": "ljpOBESC54Dl0bHRsPq4NT8wRaINMreMv3kxw6SEWGXwkBFHlhCCOSWi2iigvDPHT9nzbPyB3y67lKXPXxSbICYfu7cQnzBcJatyGs1YfTzbQ9CJLRmK1JoXgh3ZK7no"
}
```


### 返回值
```

{"err_no":1,"err_msg":{"link":"The link does not exist."}}

```


## 绑定发送短信验证码


`POST {{base_url}}/v1/guardian/link/bind/send-code/sms?access_key={{access_key}}`

### 参数

无


### 返回值
```

{"err_no":0,"data":{"success":true,"uuid":"xxxxxxxxx","retries_left":60}}

```


## 绑定发送邮箱验证码


`POST {{base_url}}/v1/guardian/link/bind/send-code/email?access_key={{access_key}}`

### 参数

无


### 返回值
```

{"err_no":0,"data":{"success":true,"uuid":"xxxxxxxxx","retries_left":60}}

```


## 用户绑定守护者验证


`POST {{base_url}}/v1/guardian/link/bind?access_key={{access_key}}`

### 参数

```
{
	"token": "token",
    "note": "note",
	"verify_mode": "sms",
	"verify_id": "id",
	"verify_code": "111100"
}
```



## 守护者绑定邀请链接初始化


`POST {{base_url}}/v1/guardian/invite/link/bind/init?access_key={{access_key}}`

### 参数

```
{
	"token": "NrJ19vtsMlhXTSR0OjykydN2rY3r5mhCi0Dg5H05mtQEz0v9VRuhwkE7Rn0HxD0dDXlXUZgqe8Lo9dVvK5lSEvWUNx6pENZuj8FlYHqfX1B4BVau34lHg0hLDodtIMEC"
}
```


### 返回值
```

{"err_no":1,"err_msg":{"link":"You can't bind yourself"}}

```


## 守护者绑定邀请链接


`POST {{base_url}}/v1/guardian/invite/link/bind?access_key={{access_key}}`

### 参数

```
{
	"token": "NrJ19vtsMlhXTSR0OjykydN2rY3r5mhCi0Dg5H05mtQEz0v9VRuhwkE7Rn0HxD0dDXlXUZgqe8Lo9dVvK5lSEvWUNx6pENZuj8FlYHqfX1B4BVau34lHg0hLDodtIMEC",
	"note": "111"
}
```


### 返回值
```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```