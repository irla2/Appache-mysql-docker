# Appache-mysql-docker

### To Run docker container Appache
```
docker run -d -p 80:80 --name <containername> <dockerimage>
```
###
Open your browser and go to address localhost:80/ you should see something like this

"Error!: SQLSTATE[HY000] [2002] php_network_getaddresses: getaddrinfo failed: Name or service not known"

### mysql docker container
```
docker build -t <imagename> ./
docker image ls 
docker run -d -p 3306:3306 --name <containername> <dockeriamge>
docker container ls
```

## If we check again http://localhost:80 address error will be yet exist. It’s fine because for make connection between containers ( Ex. cntr-apache and mysql containers) we need use Docker network. Run below commands in terminal and remove your containers.

```
docker container rm -f <apache-container name>
docker container rm -f <mysql-container name>

```
## Now let’s create doocker-go-bridge network. For do it run this command
```
docker network create -d bridge <docker-bridge name>
```
## Now we run containers with bit changes that they can communicate to each other.
```
docker run -d -p 80:80 --name <containername> --network <network-driver name> <docker image name>
docker run -d -p 3306:3306 --name <containername> --network <network-driver name> <docker image name>
```
    --networkConnect a container to a network
    
### Now wait a little and refresh your http://localhost:80 address page. You should see Connected! message.
### 