;b) * Escribir un programa para imprimir el mensaje “ORGANIZACION Y ARQUITECTURA DE
;COMPUTADORAS” utilizando la impresora a través de la PIO.
PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
MSJ DB "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
FIN DB ?

ORG 2000H
; Configuro PA y PB a partir de CA y CB
MOV AL, 11111101b ; Str = salida, Busy = entrada
OUT CA, AL ;
MOV AL, 0 ; Todos 0 = Todo de salida!
OUT CB, AL ;
; Recorro el mensaje y envío caracter a caracter hacia la impresora
MOV BX, OFFSET MSJ; Para recorrer el mensaje
POLL: IN AL, PA ; Tomo el estado actual
	AND AL, 1 ; Chequeo el primer bit
	JNZ POLL ; Mientras sea 1 sigo en el loop
  
	MOV AL, [BX] ; Tomo el caracter
	OUT PB, AL ; Lo envio al registro de datos
  
  IN AL, PA ; Tomo el estado actual
	OR AL, 00000010b ; Fuerzo Strobe a 1
	OUT PA, AL ; Mando el nuevo Strobe a la impresora
	
  AND AL, 11111101b ; Fuerzo Strobe a 0 
	OUT PA, AL ; Mando el nuevo Strobe a la impresora
  
	INC BX ; Avanzo a la siguiente posicion
	CMP BX, OFFSET FIN ; Chequeo si llegue al final
	JNZ POLL  


  
INT 0
END