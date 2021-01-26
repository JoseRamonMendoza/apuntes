""" Directorios base de Linux

/bin/: comandos básicos para todos los usuarios del sistema.
/boot/: archivos estáticos necesarios para el arranque del sistema.
/dev/: dispositivos del sistema.
/etc/: archivos de configuración del sistema y de las aplicaciones instaladas
  en el mismo.
/home/: directorio para poner las carpetas home de los usuarios.
/lib/: librerías esenciales para el núcleo del sistema y módulos del mismo.
/mnt/: punto de montaje temporal para dispositivos.
/proc/: procesos y variables del núcleo del sistema.
/sbin/: comandos especiales para el root del sistema.
/tmp/: archivos temporales. Según la distribución utilizada (o la configuración
  que utilicemos) se borran al arrancar el sistema o cada cierto período de
  tiempo.
/usr/: segunda estructura jerárquica, utilizanda para almacenar todo el
  software instalado en el sistema.
/var/: directorio para los spoolers de impresión, ficheros de log, etc.

""" Direcotrios importantes de para la configuración de los usuarios y los grupos
en Linux

/etc/passwd: información (nombre,directorio home, ...) del usuario.
/etc/group: información sobre los grupos de usuarios.
/etc/shadow: contraseñas cifradas de los usuarios y configuración para su
  validez, cambio, etc.
