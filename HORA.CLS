
Object subclass: #Hora
  instanceVariableNames: 
    'hs ms '
  classVariableNames: ''
  poolDictionaries: '' !


!Hora class methods !

crear: unasHs con:unosMs
 "Crea una nueva hora (objeto receptor) cargando sus variables de instancia: hs y ms
con: unasHs y unosMs respectivamente"
  ^super new iniciar:unasHs con:unosMs.! !



!Hora methods !

iniciar: unasHs con:unosMs
"carga las variables de instancia: hs y ms de la hora (objeto receptor) con unasHs y unosMs respectivamente"
hs:=unasHs.
ms:=unosMs.!
 
modHs: unasHs
"modifica la variable hs de la hora (objeto receptor) por el valor: unasHs"
hs:=unasHs.!

modMs: unosMs
"modifica la variable ms de la hora (objeto receptor) por el valor: unosMs"
ms:=unosMs.!

validarHora
"retorna true si la hora objeto receptor es valida, false en caso contrario"
((hs<24) & (hs>=0) & (ms<60) & (ms>=0)) ifTrue: [^true] ifFalse: [^false].!
  
verHs
"Retorna las horas de la hora (objeto receptor)"
^hs.!
  
verHsString
"retorna las horas del horario en formato de dos digitos como String"
|hori|
(hs<9) ifTrue:[ hori:='0',(hs asString)]
           ifFalse:[ hori:= hs asString].
^hori.!

verMs
"Retorna los minutos de la hora (objeto receptor)"
^ms.!

verMsString
"retorna los minutos del horario en formato de dos digitos como String"
|minuti|
(ms<9) ifTrue:[ minuti:='0',(ms asString)]
              ifFalse:[ minuti:= ms asString].
^minuti.! !
