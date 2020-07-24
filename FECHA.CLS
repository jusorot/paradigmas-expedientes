
Object subclass: #Fecha
  instanceVariableNames: 
    'dia mes ano '
  classVariableNames: ''
  poolDictionaries: ''  !


!Fecha class methods !
   
crear:unDia con:unMes con:unAno
"Crea una nueva fecha (objeto receptor) cargando sus variables de instancia: dia, mes y ano
con: unDia, unMes y unAno respectivamente"
^self new iniciar:unDia con:unMes con:unAno.! !



!Fecha methods !
   
< f
"Retorna true si el objeto receptor es menor que la fecha f"
| d m a|
d:= f verDia.
m:=f verMes.
a:= f verAno.
 ((ano < a)|((ano = a) & (mes<m)) | ((ano=a) & (mes=m) & (dia<d))) ifTrue: [^true]
ifFalse: [^false].!

<= f
"Retorna true si el objeto receptor es menor o igual que la fecha f"
| d m a|
d:= f verDia.
m:=f verMes.
a:= f verAno.
((ano < a)|((ano = a) & (mes<m)) | ((ano=a) & (mes=m) & (dia<d)) | ((ano = a) & (mes=m) & (dia=d))) ifTrue: [^true]
ifFalse: [^false].!
  
> f
"Retorna true si el objeto receptor es mayor que la fecha f"
| d m a|
d:= f verDia.
m:=f verMes.
a:= f verAno.
 ((ano > a)|((ano = a) & (mes>m)) | ((ano=a) & (mes=m) & (dia>d))) ifTrue: [^true]
ifFalse: [^false].!

>= f
"Retorna true si el objeto receptor es mayor o igual que la fecha f"
| d m a|
d:= f verDia.
m:=f verMes.
a:= f verAno.
((ano > a)|((ano = a) & (mes>m)) | ((ano=a) & (mes=m) & (dia>d)) | ((ano = a) & (mes=m) & (dia=d))) ifTrue: [^true]
ifFalse: [^false].!
  
iniciar:unDia con:unMes con:unAno
"carga las variables de instancia dia, mes y ano de la fecha (objeto receptor) con unDia, unMes y unAno respectivamente"
dia:=unDia.
mes:=unMes.
ano:=unAno.!
 
modAno:unAno
"modifica la variable ano de la fecha (objeto receptor) por el valor: unAno"
ano:=unAno.!

modDia:unDia
"modifica la variable dia de la fecha (objeto receptor) por el valor: unDia"
dia:=unDia.!

modMes:unMes
"modifica la variable mes de la fecha (objeto receptor) por el valor: unMes"
mes:=unMes.!

validarFecha
"Retorna true si la fecha (objeto receptor) es valida; false en caso contrario"
((ano<2001) | (ano>2050) | (mes<1) | (mes>12) | (dia<1) | (dia>31)) ifTrue:[^false]
																	ifFalse:[	
																(((mes=4) | (mes=6) | (mes=9) | (mes=11)) & (dia>30)) ifTrue:[^false]
																													  ifFalse: [
																													((mes=2) & ((ano\\4)=0) & (dia>29)) ifTrue:[^false]
																																						ifFalse:[((mes=2) & ((ano\\4)~=0) & (dia>28)) ifTrue:[^false]
																																																	  ifFalse:[^true]]]].!
   
verAno
"Retorna el ano de la fecha (objeto receptor)"
^ano.!
  
verDia
"Retorna el dia de la fecha (objeto receptor)"
^dia.!
  
verMes
"Retorna el mes de la fecha (objeto receptor)"
^mes.! !
