FROM infobyte/faraday
MAINTAINER Mark Zhang

CMD ["pip install --upgrade pip","run"]

EXPOSE 5984
EXPOSE 5985

ENTRYPOINT ["/root/run.sh"]
