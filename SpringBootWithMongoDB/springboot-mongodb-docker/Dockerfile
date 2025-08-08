FROM openjdk:21-slim

EXPOSE 8080

ADD build/libs/springboot-mongodb-docker-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar","app.jar"]