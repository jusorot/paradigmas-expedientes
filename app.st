|bol ofi otro opcion n ti tr hor hs ms fe d m a ex nex fe1 a1 m1 d1 fe2 a2 m2 d2 hor1 min1 h1 hor2 min2 h2 e i exp colex num cant aux colaux entro x y z|

ofi:= Oficinal crear.
bol:= File exists:'F:\archi'.
(bol) ifTrue: [ colex:= ObjectFiler loadAllFromPathName: 'F:\archi'.
				ofi iniciarCon: colex]   
	ifFalse: [ 
	x:=(PrompterPro prompt:'+++++ Precarga de Expedientes +++++
	
	
Estimado: 
ingrese la cantidad de años diferentes de los cuales quiere tener expedientes.


Nota: las fechas fuera del intervalo de años [2001-2050] no son validas.

Ingrese un numero de 1 a 50.


' default:'3')asInteger.

((x>=1) & (x<=50)) ifTrue:[ y:=(PrompterPro prompt:'+++++ Precarga de Expedientes +++++


Ahora la cantidad de meses diferentes de los cuales quiere tener expedientes.

Ingrese un numero de 1 a 12. ' default:'2')asInteger.

	((y>=1) & (y<=12)) ifTrue:[ z:=(PrompterPro prompt:'+++++ Precarga de Expedientes +++++

 
Por ultimo la cantidad de dias diferentes de los cuales quiere tener expedientes.
 
Ingrese un numero de 1 a 28.


Nota: Si desea cargar expedientes con fechas de dias mayores a 28, agreguelo manualmente desde el Menu Principal - opcion 1.' default:'2')asInteger.
		((z>=1)&(z<=28)) ifTrue:[ 
			n:=0.
			a:=2000.
			x timesRepeat: [a:=a+(50//x).
				m:=0.
				y timesRepeat: [m:=m+(12//y).
					d:=0.
					z timesRepeat: [
						d:=d+(28//z).
						n:=n+1.
						ti:=('Titular',n asString).
						tr:=('Tramite',n asString).
						fe:= Fecha crear:d con:m con:a.
						hor:= Hora crear:8 con:20.
						ex:= Expediente crear:n con:ti con:tr con:fe con:hor.
						ofi agregar:ex
									]
								]
							].
			colex:= ofi verTodos.
			ObjectFiler dumpAll:colex newFile:'F:\archi'.
			MessageBox message: 'Se han cargado sus expedientes. Gracias por utilizar nuestros servicios.'
								]
						ifFalse:[ 
						MessageBox message: 'El valor ingresado no es correcto. No se va a precargar ningun expediente.'] "z"
							]
					ifFalse:[ 
					MessageBox message: 'El valor ingresado no es correcto. No se va a precargar ningun expediente.']"y"
						]
				ifFalse:[ 
				MessageBox message: 'El valor ingresado no es correcto. No se va a precargar ningun expediente.']	"x"	
].
																																													
colex:= ofi verTodos.
opcion:=1.
[(opcion>=1) & (opcion <8)] whileTrue: [opcion:= (PrompterPro prompt:' ***MENU PRINCIPAL***

1 Agregar expediente
2 Modificar expediente por numero
3 Eliminar expediente por numero
4 Listado de expedientes
5 Modificar la hora de los expedientes presentados entre dos fechas dadas
6 Generar una lista de expedientes que se encuentren entre dos fechas
7 Eliminar expedientes por mes
8 Salir' default:'8' alinear:2)asInteger.  
                 

"///OPCION 1///   
------------------------------AGREGAR EXPEDIENTE--------------------------"   

(opcion=1) ifTrue:[   
	otro:='s'.
	[otro='s'] whileTrue:[
		
		entro:=true.
		[entro = true] whileTrue: [
			n:=(Prompter prompt:'ingrese el numero del expediente' default:'')asInteger.
			colex detect:[:ex|ex verNum=n] ifNone: [entro:=false].
			(entro = true) ifTrue: [MessageBox message: 'El numero de expediente ingresado ya existe. Por favor, ingrese otro.']
							  ].
		ti:=Prompter prompt:'ingrese el titular del expediente' default:''.
		
		tr:=Prompter prompt:'ingrese el tramite del expediente' default:''.
		
		fe:= Fecha crear:0 con:0 con:0.
		[fe validarFecha] whileFalse: [  
			d:= (Prompter prompt:'Fecha de presentacion del expediente: Ingrese el dia' default:'')asInteger.
			m:= (Prompter prompt:'Fecha de presentacion del expediente: Ingrese el mes' default:'')asInteger.
			a:= (Prompter prompt:'Fecha de presentacion del expediente: Ingrese el año' default:'')asInteger.
			fe iniciar:d con:m con:a.
			(fe validarFecha) ifFalse:[MessageBox message:'Fecha invalida. Vuelva a intentarlo']
								  ].
		hor:= Hora crear:24 con:60.
		[hor validarHora] whileFalse:[
			hs:= (Prompter prompt:'Horario de recepcion del expediente: Ingrese las horas' default:'')asInteger.
			ms:=(Prompter prompt:'Horario de recepcion del expediente: Ingrese los minutos' default:'')asInteger.
			hor iniciar:hs con:ms.
			(hor validarHora) ifFalse:[MessageBox message:'Hora invalida. Vuelva a intentarlo']
								 ].
		ex:= Expediente crear:n con:ti  con:tr con:fe con:hor. 
		ofi agregar: ex.
		MessageBox message:'Enhorabuena. Expediente agregado exitosamente'.
		otro:= Prompter prompt:'Desea agregar otro expediente? (s/n)' default:'n'] 
				  ]. 

"///OPCION 2///
--------------------MODIFICAR EXPEDIENTE------------------"  

(opcion=2) ifTrue:[
	otro:='s'.
	[otro='s'] whileTrue: [
		n:=(Prompter prompt: 'Ingrese el numero del expediente que desea modificar' default:'') asInteger.
		colex:= ofi verTodos.
		ex:= colex detect:[:el|el verNum=n] ifNone: [nil].
		(ex isNil) ifTrue: [
			MessageBox message: 'El expediente no existe']
				ifFalse:[
			
			ti:=Prompter prompt: 'Ingrese el nuevo titular del expediente' default: ex verTit.
			ex modTit:ti.	
			
			tr:=Prompter prompt: 'Ingrese el nuevo tramite del expediente' default: ex verTra.
			ex modTra:tr.	
			
			fe:= Fecha crear:0 con:0 con:0.
			[fe validarFecha] whileFalse: [ 
				d1:= ((ex verFec) verDia) asString.
				d:=(Prompter prompt: 'Nueva fecha del expediente: Ingrese el dia' default: d1) asInteger.
				m1:= ((ex verFec) verMes) asString.
				m:=(Prompter prompt: 'Nueva fecha del expediente: Ingrese el mes' default: m1) asInteger.
				a1:= ((ex verFec) verAno) asString.
				a:=(Prompter prompt: 'Nueva fecha del expediente: Ingrese el año' default: a1) asInteger.
				fe iniciar:d con:m con:a.
				(fe validarFecha) ifFalse:[MessageBox message: 'La fecha ingresada no es valida, intente de nuevo']].    
			ex modFec:fe.
			
			hor:= Hora crear:24 con:60.
			[hor validarHora] whileFalse: [
				h1:= ((ex verHor) verHs) asString.
				hs:=(Prompter prompt: 'Nuevo horario del expediente: Ingrese las horas' default: h1) asInteger.
				m1:= ((ex verHor) verMs) asString.
				ms:=(Prompter prompt: 'Nuevo horario del expediente: Ingrese los minutos' default: m1) asInteger.
				hor iniciar:hs con:ms.
				(hor validarHora) ifFalse: [MessageBox message: 'El horario ingresado no es valido, intente de nuevo']].
			ex modHor:hor.
			
			MessageBox message:'expediente modificado exitosamente'].
		otro:=Prompter prompt: 'Desea modificar otro expediente? (s/n)' default:'n']
				  ].    


"///OPCION 3///
-------ELIMINAR EXPEDIENTE POR NUMERO-------" 
   
(opcion=3) ifTrue: [
	colex:= ofi verTodos.
	(colex notEmpty) ifTrue: [
		otro:='s'.
		[otro='s'] whileTrue: [n:= (Prompter prompt:'Ingrese el numero del expediente que desea eliminar' default:'')asInteger.
			ex:=(colex detect:[:ele|ele verNum=n] ifNone:[nil]).
			(ex isNil) ifTrue:[
				MessageBox message: 'El expediente no existe']
					   ifFalse: [
				ofi eliminar:ex.
				MessageBox message: 'El expediente fue eliminado'].		 
			otro:= Prompter prompt:'Desea eliminar otro expediente? (s/n)' default:'n']
							]  
					]. 
     
"///OPCION 4///	 
-------------LISTADO DE EXPEDIENTES------------------" 
										 					 
(opcion=4) ifTrue:[ 
	colex:= ofi verTodos. 
	(colex notEmpty) ifTrue: [
		2 timesRepeat: [Transcript cr].
		Transcript show:'***LISTADO DE EXPEDIENTES***'. 
		2 timesRepeat: [Transcript cr].
		Transcript show: 'Numero'.
		4 timesRepeat:[Transcript tab].
		Transcript show: 'Titular'.
		5 timesRepeat:[Transcript tab].
		Transcript show: 'Tramite'.
		5 timesRepeat:[Transcript tab].
		Transcript show: 'Fecha' .
		5 timesRepeat:[Transcript tab].
		Transcript show:'Hora'.
		2 timesRepeat: [Transcript cr].
		colex do:[:ex | 
			2 timesRepeat:[Transcript tab]. 
			ex verNum printOn: Transcript.
			5 timesRepeat:[Transcript tab].
			Transcript show: ex verTit.
			4 timesRepeat:[Transcript tab].
			Transcript show: ex verTra.
			3 timesRepeat:[Transcript tab].
			((ex verFec) verDia) printOn: Transcript.
			Transcript show: '/'.
			((ex verFec) verMes) printOn: Transcript.
			Transcript show:'/'.
			((ex verFec) verAno) printOn: Transcript.
			4 timesRepeat:[Transcript tab].
			Transcript show:((ex verHor) verHsString ).
			Transcript show:':'.
			Transcript show:((ex verHor) verMsString ).
			4 timesRepeat:[Transcript tab].
			Transcript cr].
		MessageBox message: 'El listado de expedientes se muestra en la ventana Transcript']
					ifFalse: [MessageBox message: 'No hay expedientes para mostrar']
				].		
				 					 							 
"///OPCION 5/// 
-------------MODIFICAR HORA SEGUN RANGO DE FECHAS--------------"     
 
(opcion=5) ifTrue:[
	colex:= ofi verTodos.
	fe1:= Fecha crear:0 con:0 con:1.
	fe2:= Fecha crear:0 con:0 con:0.
	(colex notEmpty) ifTrue: [
		[fe1 <= fe2] whileFalse: 
			[
			fe1 iniciar:0 con:0 con:0.
			[fe1 validarFecha] whileFalse: 
				[  
				d1:= (PrompterPro prompt:'Fecha a partir de la cual desea modificar el horario: Ingrese el dia' default:'')asInteger.
				m1:= (PrompterPro prompt:'Fecha a partir de la cual desea modificar el horario: Ingrese el mes' default:'')asInteger.
				a1:= (PrompterPro prompt:'Fecha a partir de la cual desea modificar el horario: Ingrese el ano' default:'')asInteger.
				fe1 iniciar:d1 con:m1 con:a1.
				(fe1 validarFecha) ifFalse:[MessageBox message:'Fecha invalida. Vuelva a intentarlo']
				].
			fe2 iniciar:0 con:0 con:0.
			[fe2 validarFecha] whileFalse: 
				[  
				d2:= (PrompterPro prompt:'Fecha hasta la cual desea modificar el horario: Ingrese el dia' default:'')asInteger.
				m2:= (PrompterPro prompt:'Fecha hasta la cual desea modificar el horario: Ingrese el mes' default:'')asInteger.
				a2:= (PrompterPro prompt:'Fecha hasta la cual desea modificar el horario: Ingrese el ano' default:'')asInteger.
				fe2 iniciar:d2 con:m2 con:a2.
				(fe2 validarFecha) ifFalse:[MessageBox message:'Fecha invalida. Vuelva a intentarlo'.]
				].
			(fe1 <= fe2) ifFalse: 
				[MessageBox message:'la primera fecha debe ser menor a la segunda, vuelva a introducir las fechas']
			]. "este corchete ingresa las dos fechas, las valida y verifica que la primera sea menor a la segunda"
		hor:= Hora crear:24 con:60.				
		[hor validarHora] whileFalse: 
			[
			hs:=(Prompter prompt: 'Nuevo horario para los expedientes: Ingrese las horas ' default:'') asInteger.
			ms:=(Prompter prompt: 'Nuevo horario para los expedientes: Ingrese los minutos ' default:'') asInteger.
			hor iniciar:hs con:ms.
			(hor validarHora) ifFalse: [MessageBox message: 'El horario ingresado no es valido, intente de nuevo']
			].
		entro:=false.
		colex do:[:ex|
			fe:= ex verFec.
			((fe >= fe1) & (fe <=  fe2)) ifTrue: 
				[ex modHor:hor.
				entro:=true]
				].													
			(entro) ifTrue: [
				MessageBox message:'Se ha modificado el horario de los expedientes entre las fechas ingresadas'.
				2 timesRepeat: [Transcript cr].
				Transcript show:'Has asignado el horario de '.
				Transcript show:(hor verHsString).
				Transcript show:':'.
				Transcript show:(hor verMsString).
				Transcript show:' hs a los expedientes con fecha de presentacion entre '.
				Transcript cr.
				d1 printOn: Transcript.
				Transcript show: '/'.
				m1 printOn: Transcript.
				Transcript show:'/'.
				a1  printOn: Transcript.
				Transcript show:' y '.				 
				d2 printOn: Transcript.
				Transcript show: '/'.
				m2 printOn: Transcript.
				Transcript show:'/'.
				a2 printOn: Transcript.
				Transcript show:'.'.
				Transcript cr]							
					ifFalse:[MessageBox message:'No existen expedientes entre las fechas ingresadas']						
							]
				ifFalse:[MessageBox message:'No hay expedientes cargados']
				].
							  
"///OPCION 6///
---LISTAR LOS EXPEDIENTES EN UN RANGO DE FECHAS (inclusive) ----"

(opcion=6) ifTrue:[
	colex:= ofi verTodos.
	fe1:= Fecha crear:0 con:0 con:1.
	fe2:= Fecha crear:0 con:0 con:0.
	(colex notEmpty) ifTrue: [
		[fe1 <= fe2] whileFalse: [
		fe1 iniciar:0 con:0 con:0.
		[fe1 validarFecha] whileFalse: [  
			d1:= (PrompterPro prompt:'Fecha a partir de la cual desea generar el listado: Ingrese el dia' default:'')asInteger.
			m1:= (PrompterPro prompt:'Fecha a partir de la cual desea generar el listado: Ingrese el mes' default:'')asInteger.
			a1:= (PrompterPro prompt:'Fecha a partir de la cual desea generar el listado: Ingrese el ano' default:'')asInteger.
			fe1 iniciar:d1 con:m1 con:a1.
			(fe1 validarFecha) ifFalse:[MessageBox message:'Fecha invalida. Vuelva a intentarlo']
									].					
			fe2 iniciar:0 con:0 con:0.
			[fe2 validarFecha] whileFalse: [  
				d2:= (PrompterPro prompt:'Fecha hasta la cual desea generar el listado: Ingrese el dia' default:'')asInteger.
				m2:= (PrompterPro prompt:'Fecha hasta la cual desea generar el listado: Ingrese el mes' default:'')asInteger.
				a2:= (PrompterPro prompt:'Fecha hasta la cual desea generar el listado: Ingrese el ano' default:'')asInteger.
				fe2 iniciar:d2 con:m2 con:a2.
				(fe2 validarFecha) ifFalse:[MessageBox message:'Fecha invalida. Vuelva a intentarlo']
										].
			(fe1 <= fe2) ifFalse: [MessageBox message:'la primera fecha debe ser menor a la segunda, vuelva a introducir las fechas']
								].
	colaux:= colex select:[:ex| (((ex verFec) >= fe1) & ((ex verFec) <=  fe2))=true]. "colaux es una coleccion que tiene los expedientes entre fe1 y fe2"
	(colaux notEmpty) ifTrue: [
		2 timesRepeat: [Transcript cr].
		Transcript show:'***LISTADO DE EXPEDIENTES ENTRE '.
		d1 printOn: Transcript.
		Transcript show: '/'.
		m1 printOn: Transcript.
		Transcript show:'/'.
		a1  printOn: Transcript.
		Transcript show:' Y '.				 
		d2 printOn: Transcript.
		Transcript show: '/'.
		m2 printOn: Transcript.
		Transcript show:'/'.
		a2 printOn: Transcript.
		Transcript show:' ***'.
		2 timesRepeat: [Transcript cr].
		Transcript show: 'Numero'.
		4 timesRepeat:[Transcript tab].
		Transcript show: 'Titular'.
		5 timesRepeat:[Transcript tab].
		Transcript show: 'Tramite'.
		5 timesRepeat:[Transcript tab].
		Transcript show: 'Fecha' .
		5 timesRepeat:[Transcript tab].
		Transcript show:'Hora'. 
		2 timesRepeat: [Transcript cr].
		colaux do:[:ex | 
			2 timesRepeat:[Transcript tab]. 
			ex verNum printOn: Transcript.
			5 timesRepeat:[Transcript tab].
			Transcript show: ex verTit.
			4 timesRepeat:[Transcript tab].
			Transcript show: ex verTra.
			3 timesRepeat:[Transcript tab].
			((ex verFec) verDia) printOn: Transcript.
			Transcript show: '/'.
			((ex verFec) verMes) printOn: Transcript.
			Transcript show:'/'.
			((ex verFec) verAno) printOn: Transcript.
			4 timesRepeat:[Transcript tab].
			Transcript show:((ex verHor) verHsString).
			Transcript show:':'.
			Transcript show:((ex verHor) verMsString).
			4 timesRepeat:[Transcript tab].
			Transcript cr ].
		MessageBox message: 'El listado de expedientes se muestra en la ventana Transcript'] "colaux not Empty"
					ifFalse: [
		MessageBox message: 'No hay expedientes para mostrar entre las fechas dadas']
						  ] "colex not Empty"
					ifFalse: 
		[MessageBox message: 'No hay expedientes cargados en la oficina']
					 ].
					
"OPCION 7///
-----ELIMINAR EXPEDIENTES POR MES-----" 
(opcion=7) ifTrue: [
	colex:= ofi verTodos.
	otro:='s'.
	[otro='s'] whileTrue:[
		(colex notEmpty) ifTrue: [m:= (Prompter prompt:'Ingrese el mes del cual desee eliminar los expedientes' default:'') asInteger.
			a:= (Prompter prompt:'Ingrese el ano' default:'') asInteger.						  
			colaux:= colex reject:[:ex|(((ex verFec) verMes = m) & ((ex verFec) verAno = a))].
			(colaux size = colex size) ifTrue: [otro:= (Prompter prompt:'No existen expedientes de ese mes y ano. Reintentar? (s/n)' default:'n')]
									   ifFalse:[colex:=colaux.
				ofi iniciarCon:colex.
				MessageBox message:'Se han eliminado los expedientes de ese mes'.
				2 timesRepeat: [Transcript cr].
				Transcript show:'Has eliminado los expedientes del mes '.
				m printOn: Transcript.
				Transcript show: '/'.
				a printOn: Transcript.					
				Transcript show:'.'.
				Transcript cr.
				otro:= (Prompter prompt:'Desea eliminar los expedientes de otro mes? (s/n)' default:'n')
											] 
								] "colex notEmpty" 
						ifFalse: [MessageBox message:'No hay ningun expediente cargado'.
		otro:='n']  
						] "otro"
				   ]. 


"///OPCION INVALIDA///
----------------------------------------------------------------------------------------"

((opcion>=0) & (opcion<=8)) ifFalse:[MessageBox message:'La opcion ingresada no es valida. Ingrese un numero del 1 al 8'].			
										 
"///OPCION 8///
-----------------------------------------------SALIR---------------------------------"
										 
]."whileTrue del Menu Principal"






