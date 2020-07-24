# paradigmas-expedientes
Proyecto en Smalltalk

El trabajo consiste en desarrollar una aplicacion en smalltalk, para la gestion de expedientes, que resuelva las siguientes funcionalidades:

- Agregar expediente
- Modificar expediente
- Eliminar expediente por numero
- Listar expedientes
- Modificar hora de los expedientes que se encuentren entre dos fechas dadas
- Generar una coleccion de expedientes que se encuentren entre dos fechas dadas
- Eliminar expedientes de un mes determinado

Los datos del expediente son: numero, titular, tramite, fecha de presentacion y hora de recepcion.

Para abordarlo, se crearon las clases:

* Oficinal.cls (contiene la coleccion de expedientes);
* Expediente.cls (representa a la entidad del expediente con sus datos);
* Fecha.cls (atributo del expediente con a su vez año, dia y mes como atributos);
* Hora.cls (atributo del expediente con a su vez horas y minutos como atributos).

(ver diagrama de clases)

Nota: La primera seccion del codigo #precarga de expedientes" se hizo para cargar la cantidad deseada de expedientes solo a los fines de probar el codigo.
