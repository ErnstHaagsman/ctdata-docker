FROM java:7

RUN apt-get update && apt-get install -y mysql-client

ADD * /app/

WORKDIR /app/

CMD ["./start_after_wait.sh"]