FROM openjdk:21-slim

EXPOSE 8080

ADD build/libs/spring-boot-docker.jar spring-boot-docker-app.jar

ENTRYPOINT ["java", "-jar","spring-boot-docker-app.jar"]