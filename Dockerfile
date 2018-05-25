FROM infobyte/faraday
MAINTAINER Mark Zhang

pip install --upgrade pip

EXPOSE 5984
EXPOSE 5985

ENTRYPOINT ["/root/run.sh"]
