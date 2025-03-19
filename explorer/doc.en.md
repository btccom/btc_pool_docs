# CloverPool API V3

Your applications can access the data of Bitcoin Cash and Litecoin network via the API provided by CloverPool.

+ Telegram: https://t.me/btccomchinese
+ Twitter: https://twitter.com/btccom_official
+ Discord: https://discord.com/invite/R8HzUvg2eR
+ Mail: support@connectbtc.com

## support coin
+ BCH
   https://bch-chain.api.cloverpool.com
+ LTC
   https://ltc-chain.api.cloverpool.com

## General

Some API calls can handle multiple parameters. For instance, if you request information about a couple of blocks, you can send one API call for all of them. Parameter delimiter is a comman(,).

So instead of doing there separate API calls:

```
GET /block/1
GET /block/2
GET /block/3
```

## Response

All the response types are `application/json`, as follows:

```
{
    "data": ...,
    "err_no": 0,
    "err_msg": null 
}
```
  * `data`，API Response data
  * `error_no` Error Number
      * 0 OK
      * 1 Resource Not Found
      * 2 Parameter Error
  * `error_msg` Error Message
  
## Response Types

### Block

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

### Transaction

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

Since the size of some transactions is large, the API related to the transactions supports the rating output of transaction info, such as `${ENDPOINT}/block/latest/tx?verbose=2`.

The `verbose` is optional and its 2 defaultly. The different output level has its own meaning:

* Level 1: including transaction info

* Level 2: including level 1, input, output and balance

* Level 3: including level 2, input, output script and etc.

### Address

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

### Unspent

```
{
    tx_hash: string
    tx_output_n: int
    tx_output_n2: int
    value: int
    confirmations: int
}
```

## API

### Block

#### Block Info

```
GET /block/{xxx}
```

`xxx` can be：

  * Block height
  * Block hash
  * String `latest`
  
##### Examples

  * Get the 3rd block

    <code>[${ENDPOINT}/block/3](${ENDPOINT}/block/3)</code>

  * Get the latest block
    
    <code>[${ENDPOINT}/block/latest](${ENDPOINT}/block/latest)</code>

  * Get the latest and 3rd Block

    <code>[${ENDPOINT}/block/latest,3](${ENDPOINT}/block/latest,3)</code>


#### Block List

Get block list by date.

```
GET /block/date/{ymd}
```

##### Examples

  * Get block list on 12/15/2015

    <code>[${ENDPOINT}/block/date/20151215](${ENDPOINT}/block/date/20151215)</code>

#### Block Transactions

Batch request is not supported now.

```
GET /block/{xxx}/tx
```

Parameters：

  * `page`, optional, default to `1`
  * `pagesize`，optional, default to `50`, min `1`, max `50`

##### Examples

* Get transactions of Latest block

  <code>[${ENDPOINT}/block/latest/tx](${ENDPOINT}/block/latest/tx)</code>
  
* Get transaction of single block

  <code>[${ENDPOINT}/block/3/tx](${ENDPOINT}/block/3/tx)</code>

### Transaction

#### Transaction Info

```
GET /tx/{txhash}
```
      
##### Examples

* Get Single Transaction

  <code>[${ENDPOINT}/tx/0eab89a271380b09987bcee5258fca91f28df4dadcedf892658b9bc261050d96?verbose=3](${ENDPOINT}/tx/0eab89a271380b09987bcee5258fca91f28df4dadcedf892658b9bc261050d96?verbose=3)</code>

#### Unconfirmed Tranasction Hash

```
GET /tx/unconfirmed
```

##### Examples

<code>[${ENDPOINT}/tx/unconfirmed](${ENDPOINT}/tx/unconfirmed)</code>
  
#### Unconfirmed Tranasctions Summary

```
GET /tx/unconfirmed/summary
```

##### Examples

<code>[${ENDPOINT}/tx/unconfirmed/summary](${ENDPOINT}/tx/unconfirmed/summary)</code>

### Address

#### Address Info

```
GET /address/{address}
```

##### Examples

* Get single address
  
  <code>[${ENDPOINT}/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew](${ENDPOINT}/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew)</code>

#### Address Transactions

Batch request is not supported now.

```
GET /address/{address}/tx
```

Parameters:

  * `page`, optional, default to `1`
  * `pagesize`，optional, default to `50`, min `1`, max `50`

##### Examples

  <code>[${ENDPOINT}/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/tx](${ENDPOINT}/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/tx)</code>

#### Unspent

Batch request is not supported now.

```
GET /address/{address}/unspent
```

##### Examples

  <code>[${ENDPOINT}/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/unspent](${ENDPOINT}/address/15urYnyeJe3gwbGJ74wcX89Tz7ZtsFDVew/unspent)</code>

