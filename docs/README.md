# BTC.com Mining pool API Documentation

Use the API provided by the BTC Mining Pool to obtain the mining pool operation status and user account information in real time.

## API Structure

The call path is as follows:

`https://${Endpoint}/${Version}/${Path}`

among them:

* Endpoint:
`pool.api.btc.com`

* Version: `v1`
* Path: Specific API path, see definition below.

## Authentication
* Calling the user-related interface requires that the querystring provide `access_key` and `puid` authentication.
* ***AccessKey*** is the user identity credentials, corresponding to an account. ___Please keep your own AccessKey___.
* ***puid*** is the mine pool sub-account id used to distinguish multiple sub-accounts under an account.
* ***AccessKey*** and ***puid*** can be logged in to pool.btc.com and accessed from the subaccount management page.

### Example authentication:
* It depensds on the API call, see detailed docs. Some calls need only the access_key and others also pubid 
* `https://${Endpoint}/${Version}/${Path}?access_key={access_key}`
* `https://${Endpoint}/${Version}/${Path}?access_key={access_key}&puid={pubid}` (fixed pubid)
* `https://${Endpoint}/${Version}/${Path}?access_key={access_key}&puid={pubid,pubid}` (multiple pubid's)


## response

All response types are `application/json`, as follows:

``` json
{
    "data": ...,
    "err_no": 0,
    "err_msg": null
}
```

The `data`, `err_no`, and ʻerr_msg` fields in the response body are fixed fields and have the following meanings:
* `data`, the specific API response data.
* `error_no`, error code, `0` is normal, non`0` is wrong, check the `error_msg` field specifically.
* `error_msg`, error message for debugging use. If there are no errors, this field does not appear.
