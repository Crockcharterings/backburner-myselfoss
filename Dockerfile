FROM centos:centos7
MAINTAINER Trevor Alexander talex@privatdemail.net
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install epel-release -y
RUN yum update -y && yum install nginx php-fpm php-mysql -y
RUN mkdir /var/wwwlogs
# Copy the original settings. Note that the files must be inside the build directory.
COPY nginx.conf /etc/nginx/nginx.conf
# ADD site /usr/share/nginx/html
# VOLUME /usr/share/nginx/html
# COPY site /etc/nginx/sites-enabled/default/
# COPY site /etc/nginx/sites-available/default/ 
# Replace apache user with our own user
RUN sed -ie 's/apache/myselfoss/g' /etc/php-fpm.d/www.conf
# Match user id with running system for php-fpm.
RUN groupadd -g 501 myselfoss && useradd -M -u 501 -g 501 myselfoss -s /sbin/nologin
EXPOSE 80
ENTRYPOINT /usr/sbin/php-fpm -D && /usr/sbin/nginx

# run with:
# docker run -p 8080:80 -v site:/usr/share/nginx/html --name myselfoss1 myselfoss