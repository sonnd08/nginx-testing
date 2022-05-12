## Add this to `/etc/hosts`
```
127.0.0.1   local.aha.is
::1         local.aha.is
```


```
docker build -t test-nginx  .

docker rm -f test-nginx

docker run -it \
  --mount type=bind,src="$(pwd)/etc/nginx/conf.d",target="/etc/nginx/conf.d" \
  --mount type=bind,src="$(pwd)/etc/cert",target="/etc/cert" \
  --name test-nginx -p 4000:443 test-nginx

docker exec -it test-nginx  /bin/bash
```

## Testing at `https://local.aha.is:4000`