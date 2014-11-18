FROM phusion/baseimage:latest
MAINTAINER needo <c0rnflake@cereal.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
#CMD ["/sbin/my_init"]
CMD ["/sbin/bash"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

#Path to a directory that only contains the glftpd install
VOLUME /glftpd

EXPOSE 12387

RUN apt-get update -qq
RUN apt-get upgrade -qy
RUN apt-get install -qy wget xinetd zip unzip tcl tcl-dev ftp

RUN wget http://glftpd.eu/files/glftpd-LNX-2.05.RC2_1.0.1e-2+deb7u12_x64.tgz
RUN tar -zxvf glftpd-LNX-2.05.RC2_1.0.1e-2+deb7u12_x64.tgz
