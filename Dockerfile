# Download base image Centos 7 latest
FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

# Commands
RUN yum -y update
RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
RUN yum -y install httpd mod_php72w.x86_64 php72w-bcmath.x86_64 php72w-gd.x86_64 php72w-mysql.x86_64 php72w-xml.x86_64 zlib ImageMagick
RUN yum -y install libexif exiv2 jhead metadata-extractor2 ffmpeg ffmpeg-devel
RUN yum clean all
RUN chkconfig httpd off

# Exportables
VOLUME ["/var/www/html"]
EXPOSE 80

# Service
ADD php.ini /etc/php7/php.ini
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]
