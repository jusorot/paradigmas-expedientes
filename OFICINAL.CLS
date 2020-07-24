
Object subclass: #Oficinal
  instanceVariableNames: 
    'conjExpedientes '
  classVariableNames: ''
  poolDictionaries: ''   !


!Oficinal class methods !

crear
"crea una nueva oficinal (objeto receptor) con su conjExpedientes vacio"
^super new iniciar.! !



!Oficinal methods !
  
agregar: unEx
"Agrega el expediente unEx a la oficinal objeto receptor"
conjExpedientes add:unEx.!

eliminar:unEx
"Elimina el expediente unEx de la oficinal objeto receptor"
conjExpedientes remove:unEx ifAbsent: [^nil].!
  
esVacia
"Retorna true si la oficinal objeto receptor no tiene expedientes cargados en su conjExpedientes, false en el caso contrario"
^conjExpedientes isEmpty.!
  
iniciar
"Inicia una oficinal (objeto receptor) con un conjExpedientes vacio"
conjExpedientes:= OrderedCollection new.!

iniciarCon: unaColeccion
"Inicia una oficinal (objeto receptor) con el conjExpedientes: unaColeccion"
conjExpedientes:= unaColeccion.!

tamano
"Retorna la cantidad de expedientes que tiene la oficinal (objeto receptor) en su conjExpedientes"
^conjExpedientes size.!
 
verTodos
"Retorna una coleccion con todos los expedientes cargados en la oficinal (objeto receptor)"
^conjExpedientes.! !
