FROM java:7

ADD * /app/

WORKDIR /app/

# CMD ["java", "-jar", "SensorGateway.jar", "-config", "config.json"]
CMD ["./start_after_wait.sh"]