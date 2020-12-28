FROM adoptopenjdk/openjdk11:latest
ADD build/libs/Actuator-0.0.1-SNAPSHOT.jar actuator-0.0.1.jar
EXPOSE 3002
ENTRYPOINT ["java", "-jar", "actuator-0.0.1.jar"]
