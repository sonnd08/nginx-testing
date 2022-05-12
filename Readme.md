```
docker build -t test-nginx  .           

docker rm -f test-nginx

docker run -it \
  --mount type=bind,src="$(pwd)/etc/nginx/sites-enabled",target="/etc/nginx/sites-enabled" \
  --name test-nginx -p 4000:80 test-nginx

docker exec -it test-nginx  /bin/bash
apachectl start
apachectl restart
```