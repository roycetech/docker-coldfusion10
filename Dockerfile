FROM phusion/baseimage:0.9.9
MAINTAINER roycetech royce.com@gmail.com
EXPOSE 8500 8500
VOLUME ["/var/www", "/tmp/config"]

ENV DEBIAN_FRONTEND noninteractive
ENV REFRESHED_AT 2018_11_30_1

RUN apt-get update
RUN apt-get install -y wget unzip xsltproc apache2 default-jre && apt-get clean

ADD ./build/install/ /tmp/
ADD ./build/service/ /etc/service/
ADD ./build/my_init.d/ /etc/my_init.d/

RUN chmod -R 755 /etc/service/coldfusion10
RUN chmod 755 /tmp/install-cf10.sh
RUN sudo /tmp/install-cf10.sh
RUN rm /tmp/*.bin
RUN rm /tmp/*.sh
RUN rm /tmp/*.jar

ADD https://github.com/downloads/mxunit/mxunit/mxunit-2.1.3.zip /tmp/mxunit.zip

RUN unzip -qq /tmp/mxunit.zip -d /opt/coldfusion10/cfusion/wwwroot
RUN rm /tmp/mxunit.zip

ADD https://s3-ap-southeast-2.amazonaws.com/royce-sydney/public/coldfusion/testbox-2.6.0%2B156.zip /tmp/testbox.zip
RUN unzip -qq /tmp/testbox.zip -d /opt/coldfusion10/cfusion/wwwroot/testbox
RUN rm /tmp/testbox.zip
