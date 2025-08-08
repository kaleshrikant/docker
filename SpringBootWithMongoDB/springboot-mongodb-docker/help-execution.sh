docker pull mongo:latest

docker images
REPOSITORY                    TAG       IMAGE ID       CREATED        SIZE
mongo                         latest    a6bda40d00e5   2 weeks ago    1.22GB

docker run -d -p 27017:27017 --name mongocontainer mongo:latest
b9fc417923c6405f08523dce0bc35e43e55d9208250bc3b7fdf09cd5c9aab66f

docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                                             NAMES
b9fc417923c6   mongo:latest   "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongocontainer

Created APIs

Created Dockerfile

Building Dockerfile
 docker build -t spring-boot-mongodb:1.0 .

docker images
REPOSITORY                    TAG       IMAGE ID       CREATED              SIZE
spring-boot-mongodb           1.0       6a3087530649   About a minute ago   742MB


docker run -p 8080:8080 --name spring-boot-mongodb --link mongocontainer:mongo -d spring-boot-mongodb:1.0
b5359b886540bf3f7115762311cfe0de33e5379cc356386ae6c9379ca295c625

Explanation :
Starts a Spring Boot container named `spring-boot-mongodb`, mapping port 8080, linking it to a running MongoDB container (`mongocontainer`) so the app can connect to it via hostname `mongo`, using image `spring-boot-mongodb:1.0` in detached mode.

-- link <container_name.image_name> -d <image_name>
Reason : so basically our mongo image running in container.

verify :
docker ps
CONTAINER ID   IMAGE                     COMMAND                  CREATED         STATUS         PORTS                                             NAMES
b5359b886540   spring-boot-mongodb:1.0   "java -jar app.jar"      6 minutes ago   Up 6 minutes   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp       spring-boot-mongodb
b9fc417923c6   mongo:latest              "docker-entrypoint.s…"   2 hours ago     Up 2 hours     0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongocontainer

docker logs spring-boot-mongodb
      ▘    ▌     ▗               ▌▌    ▌    ▌
▛▘▛▌▛▘▌▛▌▛▌▛▌▛▌▛▌▜▘▄▖▛▛▌▛▌▛▌▛▌▛▌▛▌▛▌▄▖▛▌▛▌▛▘▙▘█▌▛▘
▄▌▙▌▌ ▌▌▌▙▌▙▌▙▌▙▌▐▖  ▌▌▌▙▌▌▌▙▌▙▌▙▌▙▌  ▙▌▙▌▙▖▛▖▙▖▌
  ▌      ▄▌                 ▄▌
:: Spring Boot :::: SHRIKANT KALE :::: (v3.5.4) ::
2025-08-08T15:24:36.622Z  INFO 1 --- [springboot-mongodb-docker] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'


Postman :
POST : http://localhost:8080/book
{
    "id" : "103",
	"name" : "Spring-Boot",
	"author" : "X"
}
GET : http://localhost:8080/book

docker ps
CONTAINER ID   IMAGE                     COMMAND                  CREATED         STATUS         PORTS                                             NAMES
f79e9055de4a   spring-boot-mongodb:1.0   "java -jar app.jar"      3 minutes ago   Up 3 minutes   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp       spring-boot-mongodb
b9fc417923c6   mongo:latest              "docker-entrypoint.s…"   2 hours ago     Up 2 hours     0.0.0.0:27017->27017/tcp, [::]:27017->27017/tcp   mongocontainer

docker exec -it mongocontainer bash
root@b9fc417923c6:/# mongosh

test> show dbs;
Book     72.00 KiB
admin    40.00 KiB
config  108.00 KiB
local    40.00 KiB
test> use Book;
switched to db Book
Book> show collections;
book
Book> db.book.find().pretty();
[
  {
    _id: 101,
    name: 'Core-Java',
    author: 'James Gosling',
    _class: 'com.kaleshrikant.model.Book'
  },
  {
    _id: 102,
    name: 'Spring',
    author: 'Ray',
    _class: 'com.kaleshrikant.model.Book'
  },
  {
    _id: 103,
    name: 'Spring-Boot',
    author: 'X',
    _class: 'com.kaleshrikant.model.Book'
  }
]
Book> exit;

** USING DOCKER-COMPOSE **
 docker rm -f f79e9055de4a b9fc417923c6
f79e9055de4a
b9fc417923c6

docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES


Create : resources/docker-compose.yaml
docker-compose up

Postman :
POST : http://localhost:8080/book
{
    "id" : "105",
	"name" : "Python",
	"author" : "Shrikant"
}
Validate in MongoDb as done earier.

IMP Note :
❌ Problem:
The 'links' is not supported in Docker Compose version 3. The links feature was removed in Docker Compose version 3.
🧩 Key Changes:
No links: The links option has been removed. Instead, the services are placed on the same network (app-network), allowing them to communicate by service name.
Network configuration: The networks section ensures that both svc-mongodb and svc-springboot-mongodb are connected to the same custom network (app-network).
MongoDB URI: Inside svc-springboot-mongodb, I used mongocontainer:27017 as the MongoDB URI to connect to the MongoDB container using the container's name (mongocontainer) as the hostname.
depends_on: This ensures that Docker starts the MongoDB container (svc-mongodb) before the Spring Boot application (svc-springboot-mongodb), though it doesn't guarantee that MongoDB will be fully ready before the Spring Boot app starts (you may want to add a wait mechanism in Spring Boot for readiness).
