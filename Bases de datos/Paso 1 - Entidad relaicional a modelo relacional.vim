" Los pasos para pasar de un modelo de entidad relacion a un modelo entidad
relacional

""" Relación 1:1

caso 1: si ambas entidades tienen cardinalidad 1:1 las entidades se fusionan,
la clave primaria puede ser cualquiera de las dos.

caso 2: el segundo caso es que una de las entidades tenga cardinalidad 0:1 y la
otra 1:1, en este caso tenemos que propagar la clave primaria de la entidad con
cardinalidad 1:1 a la tabla con cardinalidad 0:1, pasando a ser solo foranea.

caso 3: si ambas tienen cardinalidad 0:1, la relación también se transforma en
una tabala, teniendo como clave primaria la concatenación de las clabes
primarias de las entidades asociadas que ademas también seran foraneas.

""" Relacion 1:N

Cuando la relación es del tipo 1:N hay que mirar cual es el mínimo de esa
cardinalidad que tienen como máximo el 1, hay dos casos.

caso 1: si la cardinalidad es 1:1, entonces la relación no se tranforma en una
tabla, sino que se probaga la clave primaria de la entidad con cardinalidad
máxima 1 a la entidad con cardinalidad máxima N, pasando a ser solo foranea,
y los atributos de la relación pasarán a ser atributos de la entidad con
cardinalidad máxima N.

caso 2: si la cardinalidad es 0:1, entonces la relación si se tranforma en una
tabla, su calve primaria, que también será foranea será la misma que la de la
entidad con cardinalidad máxima N, los atributos que tuviera la relación
también pasan a la tabla y la clave primaria de la entidad cuya cardinalidad
máxima es 1, pasa a ser solamente clave foranea en la nueva tabla.

""" Relación N:M

Cuando la relación sea N:M la relación se tranforma en una nueva tabala, esta
tabla tendrá como atributos los que tuviera la relación y como clave primaria
la concatenación de las claves primarias de las entidades asociadas, y ademas
las claves primarias también serán foraneas en la nueva tabla.
