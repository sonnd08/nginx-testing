```
docker build -t test-apache  .           

docker rm -f test-apache

docker run -it \
  --mount type=bind,src="$(pwd)/var/www/html",target="/var/www/html" \
  --mount type=bind,src="$(pwd)/etc/apache2/apache2.conf",target="/etc/apache2/apache2.conf" \
  --name test-apache -p 4000:80 test-apache

docker exec -it test-apache  /bin/bash
apachectl start
apachectl restart
```