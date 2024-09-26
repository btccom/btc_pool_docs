# API 响应类型

下面是各种响应类型的定义。各接口的返回数据是各种类型的组合。

## Block

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

## 交易数据

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

由于部分交易体积很大，为提高传输效率，所有涉及到交易的接口，均支持交易信息的分级输出，如`https://chain.api.cloverpool.com/block/latest/tx?verbose=2`。

`verbose`，可选，默认为2，选择输出内容等级，含义分别如下：

  * 等级 1，包含交易信息；
  * 等级 2，包含等级 1、交易的输入、输出地址与金额；
  * 等级 3，包含等级 2、交易的输入、输入 script 等信息。

## 地址数据

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

## 未花费数据

```
{
    tx_hash: string 未花费的交易哈希
    tx_output_n: int 未花费在交易输出中的纵向排序*
    tx_output_n2: int 未花费在交易输出中的横向排序*
    value: int 未花费金额
    confirmations: int 确认数
}
```