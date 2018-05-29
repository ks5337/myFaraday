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

WORKDIR /root

RUN mkdir -p /usr/local/var/lib/couchdb && \
    chown -R couchdb /usr/local/var/lib/couchdb && \
    mkdir -p /usr/local/var/log/couchdb && \
    chown -R couchdb /usr/local/var/log/couchdb && \
    mkdir -p /usr/local/var/run && \
    chown -R couchdb /usr/local/var/run && \
    update-rc.d couchdb defaults && \
    cp /usr/local/etc/init.d/couchdb /etc/init.d/ && \
    /etc/init.d/couchdb start && \
	curl localhost:5984
	

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




