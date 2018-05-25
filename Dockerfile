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
	apt-utils \
	x11vnc \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

WORKDIR /root
RUN git clone https://github.com/ks5337/faraday.git faraday-dev

RUN chown root:root -R /root/faraday-dev/ && \
 	chmod a+x /root/faraday-dev/

EXPOSE 5984
EXPOSE 5985	

WORKDIR /root/faraday-dev
RUN ls	
RUN echo $PWD
RUN ./install.sh
RUN ./faraday-server.py
RUN ./faraday.py




