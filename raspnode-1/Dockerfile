FROM java:7

ADD * /app/

WORKDIR /app/

EXPOSE 8765

CMD ["java", "-jar", "RaspNodeSim.jar", "-config", "config.json"]