# docker build -t test-apache  .           
# docker rm -f test-apache
# docker run --name test-apache -d -p 4000:80 test-apache
# docker logs -f test-apache

FROM php:apache
# VOLUME ["/var/www/html", “/etc/apache2”]


# # changes the shell command for the subsequent RUN commands to be /bin/bash -c instead of /bin/sh -c. I do this to get brace expansion
SHELL ["/bin/bash", "-c"]

# command enables the Apache HTTP Server modules. I could've used RUN a2enmod instead, but since I know what I'm doing, ln is simpler and faster for me than a2enmod. There's a caveat: If the way how Debian handles Apache HTTP Server modules changes, my Dockerfile might fail. If I would use a2enmod, my Dockerfile would still work. Refer to [man:a2enmod] for more information about a2enmod.
RUN ln -s ../mods-available/{expires,headers,rewrite}.load /etc/apache2/mods-enabled/

# # replaces AllowOverride None with AllowOverride All for the directory /var/www/. I have a lot of configuration in my .htaccess file which needs this
# RUN sed -e '/<Directory \/var\/www\/>/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' -i /etc/apache2/apache2.conf
ENV TZ=America/New_York

EXPOSE 80
EXPOSE 443

# run node scripts to generate new local.xml file from local.xml.template
# after done, start apache and serve the web
# ENTRYPOINT ["/bin/sh", "-c" , "node /tmp/generateLocalXMLFromEnv.js && apachectl -D FOREGROUND"]
# ENTRYPOINT ["/bin/sh", "-c" , "node /tmp/generateLocalXMLFromEnv.js && apachectl start && tail -f /dev/null"]
# ENTRYPOINT ["/bin/sh", "-c" , "apachectl start && /tmp/scripts/init-magento.sh && tail -f /dev/null"]

ENTRYPOINT ["tail", "-f", "/dev/null"]

