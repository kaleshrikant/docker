FROM openjdk:21-slim

EXPOSE 8080

ADD target/spring-soot-docker-maven-plugin.jar spring-soot-docker-maven-plugin-app.jar

ENTRYPOINT ["java", "-jar","spring-soot-docker-maven-plugin-app.jar"]