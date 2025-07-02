`docker --version` permite ver la versión de docker

`docker images` permite ver las imagenes

`docker run` permite crear un contenedor
ejemplo de creación de contenedor básico:

---
```docker
docker run --name mysqlv1 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:latest
```
`docker container ps` permite visualizar los contenedores qe están en ejecución

`docker ps -a` permite visualizar todos los contenedores en ejecución o no

`docker stop id o nombre del contenedor` 
detiene un contenedor

`docker start id o nombre del contenedor`
