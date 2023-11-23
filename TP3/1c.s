;c) * Escribir un programa que permite encender y apagar las luces mediante las llaves. El programa no
;deberá terminar nunca, y continuamente revisar el estado de las llaves, y actualizar de forma
;consecuente el estado de las luces. La actualización se realiza simplemente prendiendo la luz i si la llave
;i correspondiente está encendida (valor 1), y apagándola en caso contrario. Por ejemplo, si solo la
;primera llave está encendida, entonces solo la primera luz se debe quedar encendida.
PA EQU 30H
CA EQU 32H
PB EQU 31H
CB EQU 33H

ORG 2000H

MOV AL, 11111111b
OUT CA, AL 
MOV AL, 00000000b
OUT CB, AL 
LOOP: 
IN AL, PA
OUT PB, AL
JMP LOOP
INT 0
END
