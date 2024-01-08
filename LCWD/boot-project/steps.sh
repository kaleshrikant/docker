docker build -t bootimage .

docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
bootimage       latest    7eb57b73a51e   8 minutes ago    490MB

docker run --name bootContainer bootimage
bootimage

docker run --name bootContainer -it -p 9595:9595 -d bootimage
c98c30efa408198ee45b0646f69a523d63ea820fbec659ca09f5e83fb7d82bb8

docker ps -a
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS                   PORTS                    NAMES
c98c30efa408   bootimage       "java -jar DokerTest…"   29 seconds ago   Up 28 seconds            0.0.0.0:9595->9595/tcp   bootContainer


http://localhost:9595/

{"code":2345,"languages":["Java","Python","JavaScript"],"message":"Java api is working fine"}