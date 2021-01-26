""Comandos b�sicos de Vim que se pueden encontrar en el tutorial con el comando vimtutor

Para ejecutar Vim desde Bash: vim 'Nombre Archivo'

Para moverse por la pantalla: 'k arriva' 'l derecha' 'j abajo' 'h izquierda'
			      '0' para moverte al principio de la linea
			      '$' para moverte al final de la linea
			      'w' para moverte al principio de la palabra siguiente
			      'e' para moverte al final de la palabra actual o la siguiente



Para salir de Vim: [Esc] :q! [Enter] Salir sin guardar
		   [Esc] :wq [Enter] Guardar y salir



" Para incertar texto: 'i' para incertar en la posici�n del cursor
		     'a' para incertar despu�s de la posici�n del cursor
		     'A' para incertar al final de la linea 
		     'o' para incertar una linea abajo de la posici�n del cursor
		     'O' para incertar una linea arriba de la posicion del cursor
		     'y' copiar
		     'd' cortar
         'p' pegar
         "*  con "* se puede utilizar el portapapeles del sistema, por ejemplo
             en modo viual 'v' se puede seleccionar un texto y copiarlo con: "*y


Nota: i para modo incertar
      v para modo visual
      Esc para modo normal
      R para modo remplazar


" Repetir un movimiento un movimiento o n�mero de veces, ejemplo: 2w , d2e
" El formato para hacerlo es: Operador [N�mero] Movimiento
	Operador: Es la acci�n como 'd' para eliminar
	N�mero: Es un n�mero natural, para repetir el comando ese n�mero de veces
	Movimiento: Es la acci�n de identificaci�n como 'w' para el inicio de una palabra
	            o $ para indicar que la acci�n tomar� del cursor al final de la linea



" Eliminar texto y reemplazar texto: 'x' eliminar el caracter que se encuentra encima del cursor 
				   'd' es el comando para eliminar texto se puede usar con un 'Movimiento'
				   'dw' que eliminar� la palabra
				   'de' que eliminar� de donde est� el cursor al final de esa misma palabra
				   'd$' elimina de donde est� el cursor al final de la linea
				   'dd' elimina toda la linea
				   'r' para reemplazar una letra
				   'R' para entrar en modo reemplazar
				   'c' es el comando para cambiar texto se puede usar con un 'Movimiento'
				   'ce' eliminar� de donde est� el cursor al final de esa misma palabra y pasar� al modo incertar
				   'c$' eliminar� donde est� el curson hasta al final de la linea y pasar� al modo incertar



Deshacer acciones: 'u' para deshacer la �ltima acci�n
		   'U' para deshacer todas las acciones en una linea
		   'Ctrl-R' para deshacer los cambios deshechos



Localizaci�n del cursor: 'Ctrl-G' muestra la locaclizaci�n del cursos
			 'G' mover al final del archivo
			 '[num] G' mover al número de fila
			 'gg' mover al principio del archivo



Busqueda de texto: '/ [frase]' busqueda hacia adelante en el texto
		   '? [frase]' busqueda hacia atras en el texto
		   'n' siguiente ocurrencia en busqueda en la misma direcci�n
		   'N' siguiente ocurrencia en busqueda en la direcci�n contraria
		   'Ctrl-O' regresas a la posici�n anterior
		   'Ctrl-I' tomas la posici�n siguiente


"Paneles y ventanas
      sp divide el panel de manera horizontal
      vsp divide el panel de manera vertical
      <c-w>w mover etre paneles
      <c-w>j ir al panel de abajo
      <c-w>k ir al panel de arriba
      <c-w>h ir al panel de la izquierda
      <c-w>l ir al panel de la derecha
      <c-w>c cerrar el panel, tambi�n funciona :cl
      <c-w>o mantener el panel activo y cerrar todos los demas, tambi�n
             funciona :on


Dentro de "(), [], {}" se pude presionar '%' para ir a su signo conector, es �til para debug



:s/old/new        Sustituye la primera coincidencia de 'old' con 'new' en la linea del cursor
:s/old/new/g      Sustituye todas las coincidencias de 'old' con 'new' en la linea del cursor
:#,#s/onld/new/g  Sustituye la frase entre dos # con new
:%s/old/new/g     Sustituye todas las ocurrencias de 'old' en el archivo por 'new'
:%s/old/new/gc    Sustituye todas las occurencias de 'old' en el archivo por 'new' y pregunta antes de hacer el cambio



:![Comando]       Ejecutar un comando externo 
:w [Nombre Archivo] Escribe el archivo Vim actual con el nombre
:r 		  Escribe debajo de la posici�n del cursor el contenido siguiente, ejemplo: ':r [Nombre Archivo]' ':r !ls -al'



:set xxx Habilitar opci�n xxx
:set 'ic/noic'  ignorar capitalizaci�n en b�squedas
:set 'is/nois'  mostrar coincidencias parciales en b�squedas
:set 'hls/nohls' resaltar todas las coincidencias en b�squedas



:help  Mostrar ayuda
Ctrl-P Ctrl-P Para saltar entre ventanas de ayuda y de edici�n
:q  Para salir de la ventana de ayuda o de edici�n
Ctrl-D  Para ver posibles coincidencias en menos





