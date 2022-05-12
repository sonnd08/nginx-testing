# docker build -t test-apache  .           
# docker rm -f test-apache
# docker run --name test-apache -d -p 4000:80 test-apache
# docker logs -f test-apache

FROM nginx:1.21.6


# # changes the shell command for the subsequent RUN commands to be /bin/bash -c instead of /bin/sh -c. I do this to get brace expansion

EXPOSE 80
EXPOSE 443

