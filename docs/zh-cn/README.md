# BTC.com 矿池API文档

使用 BTC 矿池提供的 API，实时获取矿池运行状态及用户帐号信息。

## API 结构

调用路径如下：

`https://${Endpoint}/${Version}/${Path}`

其中：

* Endpoint：
`pool.api.btc.com`

* Version： `v1`
* Path: 具体的 API 路径，参见下文定义。

## 鉴权

* 调用用户相关接口时需要在 querystring 或者是 body 提供 `access_key` 和 `puid` 鉴权。
    * AccessKey 是用户身份凭据，对应一个账户， 请用户保管好自己的AccessKey。
    * puid 是矿池子帐户id， 用来区分一个帐户下的多个子帐户。
* AccessKey 和 puid 可以到 pool.btc.com 登录账户，在子账户管理页获取。

## 响应

所有的响应类型均为`application/json`，如下：

``` json
{
    "data": ...,
    "err_no": 0,
    "err_msg": null 
}
```

响应体中的`data`、`err_no` 为固定字段，含义如下：
* `data`，具体 API 响应的数据。
* `err_no`，错误码，`0`为正常，非`0`为错误，具体查看`err_msg` 字段。
* `err_msg`，错误信息，供调试使用。如果没有错误，则此字段不出现。

## 常见错误

| Error No  | Title        | Description |
| ------ | ------------------ | ------------- |
| 20001 | access_key 和 puid 不匹配 | access_key 和 puid ，与实际环境不匹配，或者观察者模式过期  |
| 20002 | 观察者和实际 puid 不匹配 | 观察者和实际 puid 不匹配 或者 观察者没有相关权限  |
| 401 | Unauthorized | Unauthorized |
