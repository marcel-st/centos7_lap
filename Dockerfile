# Download base image Centos 6 latest
FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

# Commands
RUN yum -y update
RUN yum -y install httpd php php-mysql php-xml php-gd php-bcmath php-mbstring zlib ImageMagick
RUN yum clean all
RUN chkconfig httpd off

# Exportables
VOLUME ["/var/www/html"]
EXPOSE 80

# Service
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]
