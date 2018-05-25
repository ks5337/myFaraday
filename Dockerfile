FROM ubuntu:16.04
MAINTAINER Mark Zhang

RUN apt-get update && apt-get install -q -y --fix-missing \
	make \
	automake \
	autoconf \
	gcc g++ \
	openjdk-8-jdk \
	ruby \
	wget \
	curl \
	xmlstarlet \
	unzip \
	git \
	openbox \
	xterm \
	net-tools \
	ruby-dev \
	python-pip \
	firefox \
	xvfb \
	x11vnc && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN git clone https://github.com/ks5337/faraday.git faraday-dev
RUN cd faraday-dev

# RUN chown root:root -R /root/faraday-dev/ && \
# 	chmod a+x /root/faraday-dev/

EXPOSE 5984
EXPOSE 5985	
	
RUN ./install.sh
RUN ./faraday-server.py
RUN ./faraday.py




