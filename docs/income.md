# User data

## Obtain user’s overview earnings 

`GET /account/earn-stats`

### Parameters

no

### return value

```
{
    "total_paid": "81687163", --- Total paid
    "pending_payouts": "209698", --- Late Released
    "earnings_yesterday": "81687163", --- Payments Yesterday
    "last_payment_time": 1492482988, --- Last payment time
    "earnings_today": 0, --- Today's Earnings (Unsettled - Estimated)
    "unpaid": 209698, --- Balance All unpaid (including today's earnings)
    "relative_pps_rate": 106.0938, --- Relative pps ratio
    "amount_100t": 5122425, --- Revenue per 100T
    "hashrate_yesterday": { --- Yesterday
        "size": "1.59",
        "unit": "P"
    },
    "shares_1d": { --- 24H
        "size": 0,
        "unit": "T"
    }
}

```

## Obtain History Data of users’ earnings

`GET /account/earn-history`

### Parameters

| Name | Type | Description |
|---|----|----|
|page|int| |
|page_size|int| |

### return value

```
    {
        "page": "1",
        "page_size": "10",
        "page_count": 2,
        "total_count": 12,
        "list": [
            {
                "date": "20160724",
                'diff': 22222,
                'diff_rate': 0 --- percentage, difficulty rate of change, if the key does not exist, it means that the difficulty has not changed
                "earnings": 43957232146804320,
                "earnings_rate": 123.321 --- Percentage, rate of change of return. If the key does not exist, it means that the previous return is empty and cannot be calculated.
                "payment_time": "0",
                "payment_tx": "",
                "address": "",
                "paid_amount": 0
            },
            {
                "date": "20160725",
                'diff': 22222,
                "earnings": 1829543482510,
                "payment_time": "0",
                "payment_tx": "",
                "address": "",
                "paid_amount": 0
            },
            ...
        ]
    }

```