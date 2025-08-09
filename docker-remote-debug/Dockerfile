FROM openjdk:21-slim

# Port 8000 added for Remote Debugging
EXPOSE 8080 8000

ADD build/libs/docker-remote-debug.jar docker-remote-debug-app.jar
ADD entrypoint.sh entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]