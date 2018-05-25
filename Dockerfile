FROM infobyte/faraday
MAINTAINER Mark Zhang

EXPOSE 5984
EXPOSE 5985

ENTRYPOINT ["/root/run.sh"]
