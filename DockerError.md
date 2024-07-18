How to fix docker error executable file not found in $PATH?
---------------------------------------------------------------
step 1 : `$ chmod 755 /usr/libexec/docker/docker-init`
step 2 : Go to the path and `docker run -d --name alibou-postgres-sql -e  POSTGRES_PASSWORD=password -v ${pwd}/data:/var/llib/postgres/data  postgres`
