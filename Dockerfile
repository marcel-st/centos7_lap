# Download base image Centos 7 latest
FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

# Commands
RUN yum -y update
RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install httpd mod_php72w.x86_64 php72w-bcmath.x86_64 php72w-gd.x86_64 php72w-mysql.x86_64 php72w-xml.x86_64 zlib ImageMagick
RUN yum clean all
RUN chkconfig httpd off

# Exportables
VOLUME ["/var/www/html"]
EXPOSE 80

# Service
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]
