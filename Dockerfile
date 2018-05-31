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
	libpng12-dev \
	libpq-dev \
	gir1.2-gtk-3.0 \
	gir1.2-vte-2.91 \
	python-gobject \
	zsh &&\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
	
RUN pip install --upgrade pip

WORKDIR /root

RUN git clone https://github.com/ks5337/faraday.git faraday-dev1

RUN mkdir /var/run/couchdb && \
    chown -R couchdb /var/run/couchdb && \
	mkdir /root/.faraday && \
	mkdir /root/.faraday/config && \
	chown root:root -R /root/.faraday/ && \
    chown root:root -R /root/faraday-dev1/ && \
    chmod a+x /root/faraday-dev1/ && \
    chmod 755 /root/faraday-dev1/startup.sh

WORKDIR /root/faraday-dev1

RUN ./install.sh

RUN pip2 install -r requirements_server.txt
RUN pip2 install -r requirements.txt
RUN pip2 install -r requirements_extras.txt
RUN pip2 install vext
RUN pip2 install vext.pygtk

EXPOSE 5984
EXPOSE 5985

ENTRYPOINT ["./startup.sh"]





