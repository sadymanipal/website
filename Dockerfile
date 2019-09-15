FROM ubuntu

# Apache ENVs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost
 
# Installing  services, packages and do cleanup
RUN apt-get update \
 && apt-get install -y \
    apache2 \
 && rm -rf /var/lib/apt/lists/*
 
# Copying files
COPY . /var/www/html/

# Exposing port for Apache
EXPOSE 80
 
# Launching  Apache service
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
