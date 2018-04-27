## Guardian Sub Account List Information


`GET {{base_url}}/v1/guardian/invite/link/subaccounts?access_key={{access_key}}&link_id=8`

### Parameters

no


### return value
```
{
    "err_no": 0,
    "data": [
        {
            "puid": 115,
            "region_id": 1,
            "name": "tdmgjpm",
            "conf_json": "{\"text_zh-cn\":\"North Unicom\",\"text_en\":\"Beijing(China)\", \"uc_service_name\": \"cn\"}",
            "type": "BTC",
            "region_name": "Beijing(China)",
            "coin_type": "Bitcoin (BTC)",
            "is_guard": true
        }
    ]
}
```

## Get Sub Account List (New Sub Account)

`GET /account/sub-account/morelist?is_guardian=1`

### Parameters


### return value

```

{
    "have_default": false,
    "display": [
        {
            "puid": 88923,
            "region_id": 1,
            "region_text": "China",
            "name": "wy001",
            "default_url": "http://pool.dev:8080/",
            "region_name": "cn",
            "created_at": "2016-11-16 06:54:13",
            "updated_at": "2016-12-08 09:22:33",
            "shares": 3 --- Number of Observers Shared
            "is_hidden": 0,
            "is_default": 0,
            "is_generate": 0,
            "change_updated_at": "2017-09-11 02:37:10",
            "current_mode": "btc", --- Current mode
            "current_mode_text": "btc", --- Current mode (internationalization)
            "is_current": 1, --- Are you mining under this subaccount?
            "current_coin_type": "btc", --- Current currency
            "open_coin_type": [ --- Currency opened by this subaccount
                "btc",
                "bcc"
            ]
        },
        {
            "puid": 88933,
            "region_id": 1,
            "region_text": "China",
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
            "region_text": "China",
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


## Get all guard invitation links


`GET {{base_url}}/v1/guardian/invite/links?access_key={{access_key}}`

### Parameters

no


### return value
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


## Get All Guardian Links


`GET {{base_url}}/v1/guardian/links?access_key={{access_key}}`

### Parameters

no


### return value
```
{"err_no":0,"data":{"page":1,"page_size":10,"page_count":1,"total_count":7,"list":[]}}

```


## Generate Guard Invite Links


`POST {{base_url}}/v1/guardian/invite/link/create?access_key={{access_key}}`

### Parameters

```
{
"note": "note"
}
```


### return value
```

{"err_no":0,"data":{"link":"gMRyL7PSDfYmmQwggtxrCgMwun7RdHWxyZwygpq2nf63prdW33YKVTNlTcCIIhM4oi4N0goxIouohXHYusCLI2KkoEBXLY4cg9GKPLq72HNRJGl0FDxoYuHeVIbb6zyG"}}

```


## Generate Guardian Links


`POST {{base_url}}/v1/guardian/link/create?access_key={{access_key}}`

### Parameters

```
{
"note": "note",
"type" : "single"
}
or
{
    "note": "note",
    "type" : "multi"
}

```


### return value
```

{"err_no":0,"data":{"link":"VsxulOzrJ7yE8wAZqMidf8njomSmxsO4dHL5oVlUQ6jLdaldYzfRAbd9JxUX9ujL42iOFziXgTfsx2PvHKeS4Fu16FwPBD7VLwLgQG0aBfMYzCr4RdidCkd1JdxpwH9C"}}

```


## Remove the guard invitation link


`POST {{base_url}}/v1/guardian/invite/link/delete?access_key={{access_key}}`

### Parameters

```
{
"link_id": 1
}
```


### return value
```

{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```


## Guardian Removes Guardian Links


`POST {{base_url}}/v1/guardian/link/delete?access_key={{access_key}}`

### Parameters

```
{
"link_id": 1
}
```


### return value
```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}

```


## Update Guardian Invitation Link Remarks


`POST {{base_url}}/v1/guardian/invite/link/note?access_key={{access_key}}`

### Parameters

```
{
"link_id": 2,
"note": "1234"
}
```


### return value
```
{
    "err_no": 0,
    "data": {
        "status": true
    }
}
```


## Update Guardian Link Notes


`POST {{base_url}}/v1/guardian/link/note?access_key={{access_key}}`

### Parameters

```
{
"link_id": 2,
"note": "1234"
}
```


### return value
```
{