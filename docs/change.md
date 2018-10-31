# Switch

## Switching Hashrate (Requires Login)

`POST /change/hashrate`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Legal Subaccount id |
|source|str| Switch source currency |
|dest|str| Switch destination currency |

Return The id of the destination subaccount. If there is any error, the content is the specific error content.

Address can pass json string, such as {\"btc\":\"\"}

```
{
	"puid": 123,
	"puid_name":"1234",
	"source":"btc",
	"dest":"bcc",
	"address":"3NA8hsjfdgVkmmVS9moHmkZsVCoLxUkvvv",
	"region_id": 1
}
```

### return value

Normal return value:
Dest_puid refers to the puid of the destination currency

```
{
    "err_no":0,
    "data": {
        "dest_puid": 88968,
        "dest_region_id": 6,
        "dest_puid_name":"1234",
        "region_name":"Beijing(China)",
        "region_url":"http://pool.dev"
    }
}
```

Error return value:

The source and dest parameters are the currencies for which the mine pool does not support switching, when the source and dest parameters are the same, and when there is no destination mine currency node.

## Get the currency the user can switch (Login required)

`GET /change/support-type/get`

### Parameters

| Name | Type | Description |
|---|----|----|
|puid|int| Legal Subaccount id |


```
GET /change/support-type/get?puid={puid}&access_key={access_key}
```

### return value

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

## Get all modes available for switching (no login required)

### Parameters

```
GET /pool/get-all-mode
```

### return value

```
{
    "err_no": 0,
    "data": {
        "btc": "btc",
        "bcc": "bcc"
    }
}
```
