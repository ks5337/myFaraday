FROM centos:centos7
MAINTAINER Mark Zhang

RUN yum install -y epel-release && \
    yum clean all
RUN yum install -y redhat-rpm-config \
    make automake autoconf gcc gcc-c++ \
    libstdc++ libstdc++-devel \
    java-1.8.0-openjdk wget curl \
    xmlstarlet git x11vnc gettext tar \
    xorg-x11-server-Xvfb openbox xterm \
    net-tools python-pip \
    firefox nss_wrapper java-1.8.0-openjdk-headless \
    java-1.8.0-openjdk-devel nss_wrapper git which xauth && \
    yum clean all

RUN pip install --upgrade pip

RUN git clone https://github.com/ks5337/faraday.git /root/faraday-dev
RUN /root/faraday-dev/install.sh

EXPOSE 5984
EXPOSE 5985

RUN /root/faraday-dev/faraday-server.py
RUN /root/faraday-dev/faraday.py




