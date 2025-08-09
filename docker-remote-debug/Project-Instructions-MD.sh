
docker-remote-debug

1. Create APIs
	i. DockerRemoteDebugApplication
	ii.Employee
	iii. EmployeeRepository
2. Create Dockerfile
FROM openjdk:21-slim
# Port 8000 added for Remote Debugging
EXPOSE 8080 8000
ADD build/libs/docker-remote-debug.jar docker-remote-debug-app.jar
ADD entrypoint.sh entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

3. Entrypoint entrypoint.sh
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000 -jar docker-remote-debug-app.jar

4. modify build.gradle
group = 'com.kaleshrikant'
version = '1.0.0'

bootJar {
    archiveFileName = 'docker-remote-debug.jar'
    mainClass = 'com.kaleshrikant.DockerRemoteDebugApplication'
}

5. Build docker image
docker build -t spring-boot-docker-debugging:1.0 .

docker images                                                       ✔
REPOSITORY                     TAG       IMAGE ID       CREATED          SIZE
spring-boot-docker-debugging   1.0       f73263b30e89   23 minutes ago   729MB

6. Run docker image
docker run -p 8080:8080 -p 8000:8000 spring-boot-docker-debugging:1.0

Note : -p 8000:8000 is the remote port we have exposed

7. Verify is container created
docker ps -a                                                                                                                 ✔
CONTAINER ID   IMAGE                                 COMMAND                  CREATED              STATUS                        PORTS                                                                                                                                  NAMES
0bc67a2b731c   spring-boot-docker-debugging:1.0      "sh /entrypoint.sh"      About a minute ago   Up About a minute             0.0.0.0:8000->8000/tcp, [::]:8000->8000/tcp, 0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp                                               happy_mclean


7. Verify
Browser : http://localhost:8080/employees/Developer
Result :
[
  {
    "id": 102,
    "name": "Ashok",
    "dept": "Developer",
    "email": "Ashok@company.com"
  },
  {
    "id": 104,
    "name": "Santosh",
    "dept": "Developer",
    "email": "Santosh@company.com"
  },
  {
    "id": 105,
    "name": "Basant",
    "dept": "Developer",
    "email": "Basant@company.com"
  }
]

8. Settings in IntelliJ
i. Edit configuration
ii. Specify and Apply
	Name : docker-remote-debugging
	Host : localhost
	Port : 8000
	Use Module classpath : docker-remote-debug
iii. Run application in Debug mode.

See :
1. https://github.com/kaleshrikant/docker/blob/main/docker-remote-debug/src/main/resources/static/debug-sendAnnouncement.png
2. https://github.com/kaleshrikant/docker/blob/main/docker-remote-debug/src/main/resources/static/debug.png
3. https://github.com/kaleshrikant/docker/blob/main/docker-remote-debug/src/main/resources/static/intellij-adding-remote.png
