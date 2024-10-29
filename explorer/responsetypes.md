# Response Types

## Block

```
Block {
    height: int
    version: int
    mrkl_root: string
    curr_max_timestamp: int
    timestamp: int
    bits: int
    nonce: int
    hash: string
    prev_block_hash: string, null if not exists
    next_block_hash: string, null if not exists
    size: int
    pool_difficulty: int
    difficulty: int
    tx_count: int
    reward_block: int
    reward_fees: int
    created_at: int
    confirmations: int
    extras: {
        relayed_by: string
    }
}
```

Due to the `timestamp` recorded in blocks is not increasing strictly with height, we added `curr_max_timestamp` field for the max timestamp of blocks, which ensures that the timestamp is not less than the previous block timestamp when the blocks are generated. Some API will use the field to record the date, such as the API accessing block lists by date.

## Transaction

```
Transaction {
    block_height: int
    block_time: int
    created_at: int
    fee: int
    hash: string
    inputs: [
        {
            "prev_addresses": Array<String>
            "prev_position": int
            "prev_tx_hash": string
            "prev_value": int
            "script_asm": string
            "script_hex": string
            "sequence": int
        },
    ],
    inputs_count: int
    inputs_value: int
    is_coinbase: boolean
    lock_time: int
    outputs: [
        {
            addresses: Array<String>
            value: int
        }
    ],
    outputs_count: int
    outputs_value: int
    size: int
    version: int
}
```

Since the size of some transactions is large, the API related to the transactions supports the rating output of transaction info, such as ` https://bch-chain.api.cloverpool.com/v3/block/latest/tx?verbose=2`.

The `verbose` is optional and its 2 defaultly. The different output level has its own meaning:

* Level 1: including transaction info

* Level 2: including level 1, input, output and balance

* Level 3: including level 2, input, output script and etc.

## Address

```
{
    address: string
    received: int
    sent: int
    balance: int
    tx_count: int
    unconfirmed_tx_count: int
    unconfirmed_received: int
    unconfirmed_sent: int
    unspent_tx_count: int
}
```

## Unspent

```
{
    tx_hash: string
    tx_output_n: int
    tx_output_n2: int
    value: int
    confirmations: int
}
```