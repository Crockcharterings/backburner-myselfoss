FROM nginx
RUN apt-get update && apt-get install -y php5-fpm supervisor
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php.ini && \
sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php-fpm.conf && \
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php.ini && \
sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php.ini && \
sed -i '/^listen = /clisten = 0.0.0.0:9000' /etc/php-fpm.d/www.conf && \
sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php-fpm.d/www.conf && \
sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php-fpm.d/www.conf && \
sed -i "s/php_admin_flag\[log_errors\] = .*/;php_admin_flag[log_errors] =/" /etc/php-fpm.d/www.conf && \
sed -i "s/php_admin_value\[error_log\] =.*/;php_admin_value[error_log] =/" /etc/php-fpm.d/www.conf && \
sed -i "s/php_admin_value\[error_log\] =.*/;php_admin_value[error_log] =/" /etc/php-fpm.d/www.conf && \
echo "php_admin_value[display_errors] = 'stderr'" >> /etc/php-fpm.d/www.conf
RUN mkdir -p /var/log/supervisor
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/conf.d/example_ssl.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY site /usr/nginx/share/html
ADD nginx.conf /etc/nginx/
VOLUME /usr/nginx/share/html
VOLUME /etc/nginx
EXPOSE 80:32768
CMD /usr/bin/supervisord