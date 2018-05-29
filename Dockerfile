FROM ubuntu:16.04
MAINTAINER Mark Zhang

RUN apt-get update && apt-get install -q -y --fix-missing \
	git \
	curl \
	build-essential \
	ipython \
	python-setuptools \
	python-pip \
	python-dev \
	libssl-dev \
	libffi-dev \
	couchdb \
	pkg-config \
	libssl-dev \
	libffi-dev \
	libxml2-dev \
	libxslt1-dev \
	libfreetype6-dev \
	libpng12-dev &&\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
	
RUN pip install --upgrade pip

#	make \
#	automake \
#	autoconf \
#	gcc g++ \
#	openjdk-8-jdk \
#	ruby \
#	wget \
#	curl \
#	xmlstarlet \
#	unzip \
#	openbox \
#	xterm \
#	net-tools \
#	ruby-dev \
#	firefox \
#	xvfb \
#	x11vnc 

RUN curl localhost:5984

WORKDIR /root
RUN git clone https://github.com/ks5337/faraday.git faraday-dev

RUN chown root:root -R /root/faraday-dev/ && \
 	chmod a+x /root/faraday-dev/

WORKDIR /root/faraday-dev

RUN ./install.sh

RUN pip2 install -r requirements_server.txt

EXPOSE 5984
EXPOSE 5985	

RUN ./faraday-server.py
#ENTRYPOINT ["./faraday-server.py"]
#RUN ./faraday.py




