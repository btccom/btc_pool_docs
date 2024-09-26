# Response

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