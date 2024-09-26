# Real-time Hashrate data

## User's real-time Hashrate and 24-hour data

`GET /realtime/hashrate`

### Parameters


### return value

```

{
   "shares_1d": "3.12", --- 24-Hour Force
   "shares_1d_unit": "T", --- 24-hour force unit
   "shares_15m": "5.12", --- Real-time (15m window value) power
   "shares_15m_unit": "T", --- Real-time units
}
```