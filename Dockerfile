# Imagen base
FROM debian

# Instalamos los paquetes que vamos a utilizar
RUN apt-get update && apt-get install -y \
apache2 \
systemctl \
net-tools \
openssh-server

RUN apt clean

## SSH
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Creamos un nuevo usuario
RUN useradd -ms /bin/bash art-usr

# Cambiamos la contraseña del usuario
RUN echo "art-usr:1234" | chpasswd


## Apache
# Copiamos el contenido del sitio web
COPY ./pagweb/index.html /var/www/html/index.html

# Copiamos el script que se encargará de levantar los servicios
COPY apache-ssh-script /usr/local/bin/

#RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

# Le damos permisos de ejecución al script que levantará los servicios
RUN chmod +x /usr/local/bin/apache-ssh-script

# Exponemos los puertos que usará el servidor
EXPOSE 80 22

# Ejecutamos el script que correrá los servicios
CMD ["apache-ssh-script"]