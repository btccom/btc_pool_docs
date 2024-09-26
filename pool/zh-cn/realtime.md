# 实时算力数据

## 用户的实时算力和24小时数据

`GET /realtime/hashrate`

### 参数


### 返回值

```

{
  "shares_1d": "3.12",      --- 24小时算力
  "shares_1d_unit": "T",    --- 24小时算力单位
  "shares_15m": "5.12",     --- 实时(15m窗口值)算力
  "shares_15m_unit": "T",   --- 实时 单位
}
```
a