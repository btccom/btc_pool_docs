# 算力数据

## 获取分组列表

`GET /worker/groups`

### 参数

page

page_size

### 返回值

```

{
  "page": 1,
  "page_size": 10,
  "page_count": 1,
  "total_count": 1,
  "list": [
    -1: {
      "gid": -1,
      "sort_id": "-1",            --- Web排序使用 
      "name": "DEFAULT",          --- 分组名称，默认分组为 DEFAULT
      "created_at": 1468225322,
      "updated_at": 1468225322,
      "workers_active": 10,
      "workers_inactive": 11,
      "workers_dead": 3,
      "workers_total": 24,
      "shares_1m": "1.466",   --- 1分钟算力
      "shares_5m": "2.140",   --- 5分钟算力
      "shares_15m": "2.345",  --- 15分钟算力
      "shares_unit": "G",     --- 算力单位
      "shares_1d": "23.32"    --- 24小时算力
      "shares_1d_unit": "T"   --- 24小时算力单位
	  }
	]
}

```

## 获取实时算力

`GET /worker/stats`

获取实时算力数据。如果您在考虑编写一个算力监控系统，可以考虑使用该 API。
获取用户当前信息，包括 1 分钟、5 分钟、15 分钟算力、矿工总数、活跃数，非活跃数

### 参数

无

### 返回值

```
{
    "shares_1m": "111",      --- 最近 1 分钟算力
    "shares_5m": "222",      --- 最近 5 分钟算力
    "shares_15m": "333",     --- 最近 15 分钟算力
	"shares_unit": "G",     --- 算力单位
	"workers_active": 1,
	"workers_inactive": 2,
	"workers_dead" : 0,
	"workers_total": 3
}
```

## 获取用户算力历史数据

`GET /worker/share-history/`

获取用户算力的历史数据。目前可用时间维度为 1 小时 1 天。

### 参数

|名称|类型|说明|
|---|----|----|
|dimension|str|必须，指定算力数据的时间维度，可选值为`(1h, 1d)`|
|start_ts|int|必须，指定算力数据开始的时间戳|
|count|int|必须，指定最多返回多少个时间点的数据，如果返回值在指定时间点没有数据，则为 null|
|real_point|bool|可选(默认无,建议传入),传入则tickers最后一个点数据是实时数据,不传入则老规则(前5分钟不显示,其余时间是统计数据,会比平均值低)|

### 返回值

    {
        "shares_unit" : "T",        --- 算力单位
        "tickers": [
            ["{timestamp}", "{accept}", "{reject_percent}"],
            ["{timestamp}", "{accept}", "{reject_percent}"],
            ["{timestamp}", "{accept}", "{reject_percent}"],
        ]
    }


## 获取矿机列表

`GET /worker/`

获取某个用户所属的矿机列表。

### 参数

|名称|类型|说明|
|---|----|----|
|status|str|可选，指定矿机分类，默认为`all`，可选值为`active/inactive/dead/all`|
|group|int|可选，分组编号，默认为全部分组|
|page|int|可选，页码，默认为 1|
|page_size|int|可选，页码尺寸，默认为 10|
|filter|str|可选，按名称过滤，默认为空|
|order_by|str|可选，排序字段，默认为`worker_id`。可选值为<br>`worker_id,worker_name,shares_1m,shares_5m,shares_15m,accept_count,reject_percent,last_share_time`|
|asc|int|可选，指定排序方式；在指定排序字段时必须指定排序方式；默认为`0`，可选值为`0/1`|


### 返回值

    {
        "page": 1,
        "page_size": 10,
        "page_count": 1,
        "total_count": 1,
        "data": [
            {
                "gid": "-1",
                "group_name": "DEFAULT",
                "worker_id": "40",
                "worker_name": "km",
                "shares_1m": "439.8",
                "shares_5m": "674.3",
                "shares_15m": "733.0",
                "shares_unit": "G",     --- 算力单位
                "accept_count": "36395008",
                "last_share_time": "1468393691",
                "last_share_ip": "192.168.1.254",
                "reject_percent": "3.05",
                "shares_1d": "23.32"    --- 24小时算力
                "shares_1d_unit": "T"   --- 24小时算力单位
                "status": "DEAD"
            },
            {
                "gid": "-1",
                "group_name": "DEFAULT",
                "worker_id": "40",
                "worker_name": "km",
                "shares_1m": "439.8",
                "shares_5m": "674.3",
                "shares_15m": "733.0",
                "shares_unit": "G",     --- 算力单位
                "total_accept": "36395008",
                "last_share_time": "2015-02-09 06:46:17",
                "last_ip": "192.168.1.254",
                "reject_percent": "3.05",
                "shares_1d": "23.32"    --- 24小时算力
                "shares_1d_unit": "T"   --- 24小时算力单位
                "status": "ACTIVE"
            }
        ]
    }





## 单个矿机的详细信息

`GET /worker/{worker_id}/`

  * worker_id

    矿机 id，可以从矿工列表 API 获取。

### 参数

无

### 返回值

    {
    	"worker_id": 10,
    	"worker_name": "woca",
        "shares_1m": "1111",
        "shares_5m": "3333",
        "shares_15m": "4444",
        "shares_unit": "G",     --- 算力单位
        "shares_1d": "123.2"    --- 1日算力
        "shares_1d_unit": "G"   --- 1日算力单位
    	"accept_count": "1111",
    	"accept_percent": 0.985,
    	"reject_percent" : "0.01",
    	"last_share_ip": "1.2.3.4",
        "ip2location" : "中国 河南 阿姆斯特丹",
    	"last_share_time": 1468226849,
    	"worker_status": "DEAD"
    }





## 单个矿机的算力数据

`GET /worker/{worker_id}/share-history/`

  * worker_id

    矿机 id，可以从矿工列表 API 获取。

### 参数

|名称|类型|说明|
|---|----|----|
|dimension|str|必须，指定算力数据的时间维度，可选值为`(1h/1d)`|
|start_ts|int|必须，指定算力数据开始的时间戳；若为负数，则从调用时间减去该值做为返回数据的起始时间|
|count|int|必须，指定最多返回多少个时间点的数据，如果返回值在指定时间点没有数据，则为 null|
|real_point|bool|可选(默认无,建议传入),传入则tickers最后一个点数据是实时数据,不传入则老规则(前5分钟不显示,其余时间是统计数据,会比平均值低)|

### 返回值

    {
            "shares_unit" : "T",        --- 算力单位
            "tickers": [
                ["{timestamp}", "{accept}", "{reject_percent}"],
                ["{timestamp}", "{accept}", "{reject_percent}"],
                ["{timestamp}", "{accept}", "{reject_percent}"],
            ]
    }



## 矿机信息更新

`POST /worker/update`

目前只提供更改组的功能， group_id 为-1时代表默认分组， 为0时表示删除 

### 参数

|名称|类型|说明|
|---|----|----|
|worker_id|str|必须，指定需要更新的矿机 如 1,2,3|
|group_id|int| |

### 返回值

    
    "data": {
        "status": false
    } 
    


### 全局错误代码

|错误码|说明|备注|
|---|----|----|
|1|参数错误| |
|20001|没有相关权限| |