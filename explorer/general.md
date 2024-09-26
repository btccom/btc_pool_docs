# General

Some API calls can handle multiple parameters. For instance, if you request information about a couple of blocks, you can send one API call for all of them. Parameter delimiter is a comman(,).

So instead of doing there separate API calls:

```
GET /block/1
GET /block/2
GET /block/3
```