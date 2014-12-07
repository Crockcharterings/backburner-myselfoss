FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/conf.d/example_ssl.conf
VOLUME ../site /usr/share/nginx/html/
ADD nginx.conf /etc/nginx/
# VOLUME /usr/nginx/share/html
# VOLUME /etc/nginx
# VOLUME /var/log/nginx
EXPOSE 80
EXPOSE 443
# get IP of php-fpm container
RUN sed -i "s/%fpm-ip%/$FPM_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf
CMD nginx
