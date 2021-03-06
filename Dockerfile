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
	pkg-config \
	libssl-dev \
	libffi-dev \
	libxml2-dev \
	libxslt1-dev \
	libfreetype6-dev \
	libpng12-dev && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
	
RUN pip install --upgrade pip 
	
WORKDIR /root

RUN git clone https://github.com/ks5337/faraday.git faraday

RUN mkdir /root/.faraday && \
	mkdir /root/.faraday/config && \
	chown root:root -R /root/.faraday/ && \
    chown root:root -R /root/faraday/ && \
    chmod a+x /root/faraday/ && \
    chmod 755 /root/faraday/startup.sh

WORKDIR /root/faraday

RUN ./install.sh

RUN pip2 install -r requirements_server.txt

#RUN pip install psycopg2-binary

EXPOSE 5984
EXPOSE 5985

ENTRYPOINT ["./startup.sh"]





