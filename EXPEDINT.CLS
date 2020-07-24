
Object subclass: #Expediente
  instanceVariableNames: 
    'numero titular tramite fecha hora '
  classVariableNames: ''
  poolDictionaries: ''   !


!Expediente class methods !
  
crear:unNum con:unTit con:unTra  con:unaFec con:unaHor
"crea un nuevo expediente (objeto receptor) cargando sus variables de instancia: numero, titular, tramite, fecha y hora
con: unNum, unTit, unTra, unaFec y unaHor respectivamente"
^super new iniciar: unNum con:unTit con:unTra con:unaFec con:unaHor.! !



!Expediente methods !
   
iniciar:unNum con:unTit con:unTra con:unaFec con:unaHor
"carga las variables de instancia: numero, titular, tramite, fecha y hora del expediente (objeto receptor)
con: unNum, unTit, unTra, unaFec y unaHor respectivamente"
numero:=unNum.
titular:=unTit.
tramite:=unTra.
fecha:=unaFec.
hora:=unaHor.!
   
modFec: otraFec
"modifica la variable fecha del expediente (objeto receptor) por el valor: otraFec"
fecha:= otraFec.!
 
modHor: otraHor
"modifica la variable hora del expediente (objeto receptor) por el valor: otraHor"
hora:= otraHor.!
   
modNum:otroNum
"modifica la variable numero del expediente (objeto receptor) por el valor: otroNum"
numero:=otroNum.!
 
modTit:otroTit
"modifica la variable titular del expediente (objeto receptor) por el valor: otroTit"
titular:=otroTit.!
   
modTra:otroTra
"modifica la variable tramite del expediente (objeto receptor) por el valor: otroTra"
tramite:=otroTra.!
   
verFec
"Retorna la fecha del expediente (objeto receptor)"
^fecha.!
   
verHor
"Retorna la hora del expediente (objeto receptor)"
^hora.!
 
verNum
"Retorna el numero del expediente (objeto receptor)"
^numero.!
 
verTit
"Retorna el titular del expediente (objeto receptor)"
^titular.!
   
verTra
"Retorna el tramite del expediente (objeto receptor)"
^tramite.! !
