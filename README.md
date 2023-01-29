# Docker-debian-ssh-apache
Construcción del contenedor Apache y SSH sobre una distribución Debian

## Construyendo la imagen del contenedor

```bash
docker build -t <usuario-de-docker-hub>/<nombre-de-repositorio-de-imagen>:<etiqueta> .
```

## Implementación de la imagen en un contenedor
~~~bash
docker run --name <nombre-contenedor> -p 8080:80 -p 2222:22 <image-id | nombre-de-repositorio-de-imagen>

docker run -p 8080:80 -p 2222:22 <imagen>

# Uso de volumenes
docker run -v /home/user/Downloads/folder/:/var/www/html/ -p 8080:80 -p 2222:22 <imagen>
~~~

## Funcionamiento
El sitio web se puede corroborar con "curl" devolviendo el HTML de la página web.
Por su parte para verificar SSH accedemos con las credenciales configuradas.
Donde: 
+ usuario: art-usr
+ contraseña: 1234

~~~bash
# Sitio Web
curl localhost:8080

# Acceso a servidor SSH
ssh art-usr@localhost -p 2222
~~~

## Archivos
+ apache-ssh-script
    + Script utilizado para iniciar los servicios SSH y Apache del contenedor
+ Dockerfile
    + Archivo para la construcción del contenedor
+ README.md 
    + Documentación 
+ pagweb/index.html
    + Código de la página web de ejemplo

