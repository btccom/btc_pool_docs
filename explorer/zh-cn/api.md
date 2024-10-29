# API 列表

## 区块

### 区块信息

获取单个区块详情。

```
GET /block/{xxx}
```

`xxx`可以是：

  * 块高度
  * 块哈希
  * latest - 最新块
  
#### 示例

  * 返回高度为 3 的块

    <code>[ https://bch-chain.api.cloverpool.com/v3/block/3]( https://bch-chain.api.cloverpool.com/v3/block/3)</code>

  * 返回最新块
    
    <code>[ https://bch-chain.api.cloverpool.com/v3/block/latest]( https://bch-chain.api.cloverpool.com/v3/block/latest)</code>

  * 返回最新块、高度为 3 的块

    <code>[ https://bch-chain.api.cloverpool.com/v3/block/latest,3]( https://bch-chain.api.cloverpool.com/v3/block/latest,3)</code>


### 区块列表

根据日期获取交易列表，按照倒序排列。

```
GET /block/date/{ymd}
```

#### 示例

  * 获取2015年12月15日的区块列表

    <code>[ https://bch-chain.api.cloverpool.com/v3/block/date/20151215]( https://bch-chain.api.cloverpool.com/v3/block/date/20151215)</code>

### 区块交易列表

获取区块交易列表。

注意：该接口不支持批量查询。

```
GET /block/{xxx}/tx
```

参数：

  * `page`，可选，默认为`1`，页码
  * `pagesize`，可选，默认为`50`，可选范围为`1-50`，分页大小

#### 示例

* 返回最新块的交易列表

  <code>[ https://bch-chain.api.cloverpool.com/v3/block/latest/tx]( https://bch-chain.api.cloverpool.com/v3/block/latest/tx)</code>
  
* 返回单个块的交易列表

  <code>[ https://bch-chain.api.cloverpool.com/v3/block/3/tx]( https://bch-chain.api.cloverpool.com/v3/block/3/tx)</code>

## 交易

### 交易详情

获取交易详情。

```
GET /tx/{txhash}
```

在获取多个交易时，如果对应的交易不存在，则为`null`。
      
#### 示例

* 获取单个交易的全部信息

  <code>[ https://bch-chain.api.cloverpool.com/v3/tx/0eab89a271380b09987bcee5258fca91f28df4dadcedf892658b9bc261050d96?verbose=3]( https://bch-chain.api.cloverpool.com/v3/tx/0eab89a271380b09987bcee5258fca91f28df4dadcedf892658b9bc261050d96?verbose=3)</code>

* 获取多个交易

  <code>[ https://bch-chain.api.cloverpool.com/v3/tx/000000000000000005cb6f6e2f09e84a353ab91756a38aa50fbaf25059f76666,0ba9252660a6a5f291a8983092074f9a1da5f6d1c790518d6550f054e60bbab1]( https://bch-chain.api.cloverpool.com/v3/tx/000000000000000005cb6f6e2f09e84a353ab91756a38aa50fbaf25059f76666,0ba9252660a6a5f291a8983092074f9a1da5f6d1c790518d6550f054e60bbab1)</code>

获取多个交易暂不开放，请联系工作人员说明使用范围。

### 未确认交易哈希

获取未确认交易的哈希

```
GET /tx/unconfirmed
```

#### 示例

<code>[ https://bch-chain.api.cloverpool.com/v3/tx/unconfirmed]( https://bch-chain.api.cloverpool.com/v3/tx/unconfirmed)</code>
  
#### 未确认交易信息

获取未确认交易的信息，包括体积和数量。

```
GET /tx/unconfirmed/summary
```

#### 示例

<code>[ https://bch-chain.api.cloverpool.com/v3/tx/unconfirmed/summary]( https://bch-chain.api.cloverpool.com/v3/tx/unconfirmed/summary)</code>

## 地址

### 地址信息

获取地址的信息。

```
GET /address/{address}
```

#### 示例

* 获取单个地址
  
  <code>[ https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew]( https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew)</code>

* 获取多个地址

  <code>[ https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew,1PErRgFdo757pyyMxFiwB326vuymXC3hev]( https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew,1PErRgFdo757pyyMxFiwB326vuymXC3hev)</code>
  
多个地址暂不开放，请联系工作人员说明使用范围。

### 地址交易列表

获取地址的交易列表，按照倒序排列。

注意：该接口不支持批量查询。

```
GET /address/{address}/tx
```

参数：

  * `page`，可选，默认为`1`，页码
  * `pagesize`，可选，默认为`50`，可选范围为`1-50`，分页大小

#### 示例

<code>[ https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/tx]( https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/tx)</code>

### 未花费列表

获取地址的未花费交易列表，按照确认数正序排列。

注意：该接口不支持批量查询。

```
GET /address/{address}/unspent
```

#### 示例

<code>[ https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/unspent]( https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/unspent)</code>

## 工具

使用下面的工具使用 bitcoind 提供的 API。如果在调用时出现错误，会在 `data` 字段内记录错误信息。请联系工作人员说明使用范围。

### 解码交易

解码 transaction 信息。

```
POST /tools/tx-decode

{
    "rawhex": "hex string"
}
```

### 发布交易

向全网广播您的交易。

```
POST /tools/tx-publish

{
    "rawhex": "hex string"
}
```

### 验证签名

```
POST /tools/verify-message

{
    "address": "address",
    "message": "message",
    "signature": "signature"
}
```

如果在调用时出现错误。请联系工作人员说明使用范围。
