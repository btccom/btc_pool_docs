# 切换

## 切换算力(需登录)

`POST /change/hashrate`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 合法子账户id |
|source|str| 切换源币种 |
|dest|str| 切换目的币种 |


返回 目的子账户的id，如有错误，内容为具体错误内容

目前已关闭自动切换。

address可传json字符串，如{\"btc\":\"\"}

```
{
	"puid":123,
	"puid_name":"1234",
	"source":"btc",
	"dest":"bcc",
	"address":"3NA8hsjfdgVkmmVS9moHmkZsVCoLxUkvvv",
	"region_id":1
}
```

### 返回值

正常返回值：
dest_puid指目的币种对应的puid

```
{
    "err_no":0,
    "data": {
        "dest_puid":88968,
        "dest_region_id":6,
        "dest_puid_name":"1234",
        "region_name":"Beijing(China)",
        "region_url":"http://pool.dev"
    }
}
```

错误返回值：

source和dest参数为矿池不支持切换的币种，source和dest参数相同时，以及无目的矿池货币节点时。

## 获取用户可以切换的币种(需登录)

`GET /change/support-type/get`

### 参数

|名称|类型|说明|
|---|----|----|
|puid|int| 合法子账户id |


```
GET /change/support-type/get?puid=66666
```

### 返回值

```
{
    "err_no":0,
    "data":[
        {
            "currency":"btc",
            "is_first":false,
            "need_create_coins":[
                "btc"
            ]
        }
    ]
}
```

错误返回值：

无目的矿池货币节点时。

## 获取所有的可供切换的模式(无需登陆)

### 参数

```
GET /pool/get-all-mode
```

### 返回值

```
{
    "err_no": 0,
    "data": {
        "btc": "btc",
        "bch": "bch"
    }
}
```