FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/conf.d/example_ssl.conf
COPY site /usr/nginx/share/html
ADD nginx.conf /etc/nginx/
VOLUME /usr/nginx/share/html
VOLUME /etc/nginx
EXPOSE 80:32768
