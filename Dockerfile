FROM centos:6.8
MAINTAINER guoxiaowei.com
RUN yum install -y pcre-devel wget net-tools gcc zlib zlib-devel make openssl-devel 
#RUN wget http://nginx.org/download/nginx-1.8.0.tar.gz
ADD http://nginx.org/download/nginx-1.8.0.tar.gz  /home/
#RUN mv nginx-1.8.0.tar.gz /home/
RUN cd /home/ && tar xzf nginx-1.8.0.tar.gz
RUN mkdir -p /usr/local/nginx 
RUN cd /home/nginx-1.8.0 &&  ./configure --prefix=/usr/local/nginx && make && make install
RUN echo "99999" > /usr/local/nginx/html/index.html
EXPOSE  80
ENTRYPOINT /usr/local/nginx/sbin/nginx && tail -f /usr/local/nginx/logs/access.log
