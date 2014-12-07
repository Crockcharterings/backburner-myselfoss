FROM centos:centos6

MAINTAINER Manuel Vacelet <manuel.vacelet@enalean.com>

ADD CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum -y update && yum clean all
RUN yum -y install scl-utils && yum clean all

# Get the SCL repositories definition (.repo)
RUN yum install -y centos-release-SCL && yum clean all

# Install php54
RUN yum -y install php54-php-fpm && yum clean all

# Configure FPM
RUN sed -i '/^listen = /clisten = 127.0.0.1:9000' /opt/rh/php54/root/etc/php-fpm.d/www.conf
RUN sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /opt/rh/php54/root/etc/php-fpm.d/www.conf
RUN sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /opt/rh/php54/root/etc/php-fpm.d/www.conf

VOLUME ../site /var/www/

EXPOSE 9000

# Move to the directory were the php files stands
WORKDIR /var/www
CMD ["/opt/rh/php54/root/usr/sbin/php-fpm"]