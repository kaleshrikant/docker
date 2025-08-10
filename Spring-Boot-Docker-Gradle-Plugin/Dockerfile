FROM eclipse-temurin:24-jdk-jammy
ARG JAR_FILE=build/libs/spring-boot-docker-gradle-plugin.jar
COPY ${JAR_FILE} spring-boot-docker-gradle-plugin-app.jar
ENTRYPOINT ["java","-jar","/spring-boot-docker-gradle-plugin-app.jar"]