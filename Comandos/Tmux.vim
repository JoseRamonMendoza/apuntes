" Comandos básicos estadar de Tmux
C-b   (Ctrl + b) Es un prefijo para cualquier comando de tmux, -gracias al archivo de
configuraciones también se puede pasar C-a como prefijo para hacer una acción-.
c     Crea otra ventana nueva.
"     Parte el panel en dos, arriba y abajo.
%     Parte el panel en dos, izquierda y derecha.
$     Renombra la sesión actual.
,     Renombra la ventana actual.
&     Mata la ventana actual.
exit  Mata la ventana actual.
x     Mata la ventana actual.
0 - 9 Selecciona una ventana del 0 al 9.
n     Cambia a la siguiente ventana.
p     Cambia a la ventana anterior.
m     Marca la ventana actual.
M     Limpia la marca de la ventana.
l     Muevete a la ventana marcada o a la anterior de esta.


"Configuración inicial de Tmux
"Comandos de Tmux
set-option -g prefix C-a
set-option -g prefix2 C-b

"Indicar que el indice de las ventanas inicie en 1
set -g base-index 1

 
