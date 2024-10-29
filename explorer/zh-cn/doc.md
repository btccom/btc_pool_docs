# CloverPool API V3

您的应用可以使用 CloverPool 提供的区块链数据 API，实时获取比特币网络数据。

联系方式如下：

+ Telegram: https://t.me/btccomchinese
+ Twitter: https://twitter.com/btccom_official
+ Discord: https://discord.com/invite/R8HzUvg2eR
+ Wechat: BTCDOTCOM
+ Mail: support@connectbtc.com

## 支持的币种
+ BTC
   https://tools.api.cloverpool.com/docs/#overview
+ BCH
   https://bch-chain.api.cloverpool.com
+ LTC
   https://ltc-chain.api.cloverpool.com
## 请求

部分接口支持批量请求，如：

```
GET /block/1
GET /block/2
GET /block/3
```

如果想用以下请求代替，请使用以下联系方式：

```
GET /block/1,2,3
```

在使用批量请求时，返回的结果为数组。

批量获取时，如果对应的值不存在，则为`null`。

如无特别说明，批量请求的最大数量为 50。

对于 POST 请求，均使用 JSON 编码。

## 请求速率限制

目前对外公开的API速率限制为 `每分钟6次`。如需更高调用频率请联系工作人员说明使用范围。

## 响应类型

所有的响应类型均为`application/json`，如下：

```
{
    "data": ...,        -- 具体的 API 响应结果
    "err_no": 0,
    "err_msg": null 
}
```

响应体中的`data`、`err_no`和`err_msg`为固定字段，含义如下：

  * `data`，具体 API 响应的数据
  * `error_no`，错误码，`0`为正常，非`0`为错误，具体的错误码对照如下：
      * 0 正常
      * 1 找不到该资源
      * 2 参数错误
  * `error_msg`，错误信息，供调试使用。如果没有错误，则此字段不出现。

注意：

  * 在表示金额时，为避免浮点数产生精度问题，所有的金额单位均为`聪`。
  
## API 响应类型

下面是各种响应类型的定义。各接口的返回数据是各种类型的组合。

### Block

```
Block {
    height: int 块高度
    version: int 块版本
    mrkl_root: string Merkle Root
    curr_max_timestamp: int 块最大时间戳
    timestamp: int 块时间戳
    bits: int bits
    nonce: int nonce
    hash: string 块哈希
    prev_block_hash: string 前向块哈希，如不存在，则为 null
    next_block_hash: string 后向块哈希，如不存在，则为 null
    size: int 块体积
    pool_difficulty: int 矿池难度
    difficulty: int 块难度
    tx_count: int 块奖励
    reward_block: int 块奖励
    reward_fees: int 块手续费
    created_at: int 该记录系统处理时间，无业务含义
    confirmations: int 确认数
    extras: {
        relayed_by: string 块播报方
    }
}
```

块中记录的`timestamp`不是随着高度严格递增的。在这里，我们添加了`curr_max_timestamp`块最大时间戳字段，它是指在该块产生时，所有块的最大时间戳，保证严格大于或等于上一个块时间。一些接口会使用该字段记录的日期，如按照日期获取块列表的接口。

### Transaction

```
Transaction {
    block_height: int 所在块高度
    block_time: int 所在块时间
    created_at: int 该记录系统处理时间，没有业务含义
    fee: int 该交易的手续费
    hash: string 交易哈希
    inputs: [ 输入
        {
            "prev_addresses": Array<String> 输入地址 
            "prev_position": int 前向交易的输出位置
            "prev_tx_hash": string 前向交易哈希
            "prev_value": int 前向交易输入金额
            "script_asm": string Script Asm
            "script_hex": string Script Hex
            "sequence": int Sequence
        },
    ],
    inputs_count: int 输入数量
    inputs_value: int 输入金额
    is_coinbase: boolean 是否为 coinbase 交易
    lock_time: int lock time
    outputs: [ 输出
        {
            addresses: Array<String> 输出地址
            value: int 输出金额
        }
    ],
    outputs_count: int 输出数量
    outputs_value: int 输出金额
    size: int 交易体积
    version: int 交易版本号
}
```

由于部分交易体积很大，为提高传输效率，所有涉及到交易的接口，均支持交易信息的分级输出，如` https://bch-chain.api.cloverpool.com/v3/block/latest/tx?verbose=2`。

`verbose`，可选，默认为2，选择输出内容等级，含义分别如下：

  * 等级 1，包含交易信息；
  * 等级 2，包含等级 1、交易的输入、输出地址与金额；
  * 等级 3，包含等级 2、交易的输入、输入 script 等信息。

### Address

```
{
    address: string 地址
    received: int 总接收
    sent: int 总支出
    balance: int 当前余额
    tx_count: int 交易数量
    unconfirmed_tx_count: int 未确认交易数量
    unconfirmed_received: int 未确认总接收
    unconfirmed_sent: int 未确认总支出
    unspent_tx_count: int 未花费交易数量
}
```

### Unspent

```
{
    tx_hash: string 未花费的交易哈希
    tx_output_n: int 未花费在交易输出中的纵向排序*
    tx_output_n2: int 未花费在交易输出中的横向排序*
    value: int 未花费金额
    confirmations: int 确认数
}
```

## API 列表

### 区块

#### 区块信息

获取单个区块详情。

```
GET /block/{xxx}
```

`xxx`可以是：

  * 块高度
  * 块哈希
  * latest - 最新块
  
##### 示例

  * 返回高度为 3 的块

    <code>[ https://bch-chain.api.cloverpool.com/v3/block/3]( https://bch-chain.api.cloverpool.com/v3/block/3)</code>

  * 返回最新块
    
    <code>[ https://bch-chain.api.cloverpool.com/v3/block/latest]( https://bch-chain.api.cloverpool.com/v3/block/latest)</code>

  * 返回最新块、高度为 3 的块

    <code>[ https://bch-chain.api.cloverpool.com/v3/block/latest,3]( https://bch-chain.api.cloverpool.com/v3/block/latest,3)</code>


#### 区块列表

根据日期获取交易列表，按照倒序排列。

```
GET /block/date/{ymd}
```

##### 示例

  * 获取2015年12月15日的区块列表

    <code>[ https://bch-chain.api.cloverpool.com/v3/block/date/20151215]( https://bch-chain.api.cloverpool.com/v3/block/date/20151215)</code>

#### 区块交易列表

获取区块交易列表。

注意：该接口不支持批量查询。

```
GET /block/{xxx}/tx
```

参数：

  * `page`，可选，默认为`1`，页码
  * `pagesize`，可选，默认为`50`，可选范围为`1-50`，分页大小

##### 示例

* 返回最新块的交易列表

  <code>[ https://bch-chain.api.cloverpool.com/v3/block/latest/tx]( https://bch-chain.api.cloverpool.com/v3/block/latest/tx)</code>
  
* 返回单个块的交易列表

  <code>[ https://bch-chain.api.cloverpool.com/v3/block/3/tx]( https://bch-chain.api.cloverpool.com/v3/block/3/tx)</code>

### 交易

#### 交易详情

获取交易详情。

```
GET /tx/{txhash}
```

在获取多个交易时，如果对应的交易不存在，则为`null`。
      
##### 示例

* 获取单个交易的全部信息

  <code>[ https://bch-chain.api.cloverpool.com/v3/tx/0eab89a271380b09987bcee5258fca91f28df4dadcedf892658b9bc261050d96?verbose=3]( https://bch-chain.api.cloverpool.com/v3/tx/0eab89a271380b09987bcee5258fca91f28df4dadcedf892658b9bc261050d96?verbose=3)</code>

* 获取多个交易

  <code>[ https://bch-chain.api.cloverpool.com/v3/tx/000000000000000005cb6f6e2f09e84a353ab91756a38aa50fbaf25059f76666,0ba9252660a6a5f291a8983092074f9a1da5f6d1c790518d6550f054e60bbab1]( https://bch-chain.api.cloverpool.com/v3/tx/000000000000000005cb6f6e2f09e84a353ab91756a38aa50fbaf25059f76666,0ba9252660a6a5f291a8983092074f9a1da5f6d1c790518d6550f054e60bbab1)</code>

获取多个交易暂不开放，请联系工作人员说明使用范围。

#### 未确认交易哈希

获取未确认交易的哈希

```
GET /tx/unconfirmed
```

##### 示例

<code>[ https://bch-chain.api.cloverpool.com/v3/tx/unconfirmed]( https://bch-chain.api.cloverpool.com/v3/tx/unconfirmed)</code>
  
#### 未确认交易信息

获取未确认交易的信息，包括体积和数量。

```
GET /tx/unconfirmed/summary
```

##### 示例

<code>[ https://bch-chain.api.cloverpool.com/v3/tx/unconfirmed/summary]( https://bch-chain.api.cloverpool.com/v3/tx/unconfirmed/summary)</code>

### 地址

#### 地址信息

获取地址的信息。

```
GET /address/{address}
```

##### 示例

* 获取单个地址
  
  <code>[ https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew]( https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew)</code>

* 获取多个地址

  <code>[ https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew,1PErRgFdo757pyyMxFiwB326vuymXC3hev]( https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew,1PErRgFdo757pyyMxFiwB326vuymXC3hev)</code>
  
多个地址暂不开放，请联系工作人员说明使用范围。

#### 地址交易列表

获取地址的交易列表，按照倒序排列。

注意：该接口不支持批量查询。

```
GET /address/{address}/tx
```

参数：

  * `page`，可选，默认为`1`，页码
  * `pagesize`，可选，默认为`50`，可选范围为`1-50`，分页大小

##### 示例

<code>[ https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/tx]( https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/tx)</code>

#### 未花费列表

获取地址的未花费交易列表，按照确认数正序排列。

注意：该接口不支持批量查询。

```
GET /address/{address}/unspent
```

##### 示例

<code>[ https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/unspent]( https://bch-chain.api.cloverpool.com/v3/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/unspent)</code>

### 工具

使用下面的工具使用 bitcoind 提供的 API。如果在调用时出现错误，会在 `data` 字段内记录错误信息。请联系工作人员说明使用范围。

#### 解码交易

解码 transaction 信息。

```
POST /tools/tx-decode

{
    "rawhex": "hex string"
}
```

#### 发布交易

向全网广播您的交易。

```
POST /tools/tx-publish

{
    "rawhex": "hex string"
}
```

#### 验证签名

```
POST /tools/verify-message

{
    "address": "address",
    "message": "message",
    "signature": "signature"
}
```

如果在调用时出现错误。请联系工作人员说明使用范围。
