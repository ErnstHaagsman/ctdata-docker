FROM java:7

ADD * /app/

WORKDIR /app/

EXPOSE 8765

# CMD ["java", "-jar", "SensorGateway.jar", "-config", "config.json"]
CMD ["./start_after_wait.sh"]