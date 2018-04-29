FROM centos:7
LABEL description="Nginx static backend"
MAINTAINER Moise Kameni <moise.kameni@adaware.com>
COPY ./nginx/repos.d/nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum update -y \
    && yum install -y nginx
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.old
RUN mkdir -p /var/www/public_html
EXPOSE 80 443
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
