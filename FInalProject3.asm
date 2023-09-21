COMMENT !
Description:Write a program that controls the laser system at a medical devices company.
The program includes a main procedure which gets user inputs and uses the input values for 
the OK button press, CANCEL button press, the SET button press, the CLEAR button press, and 
other functionalities on the touch screen.
Student Name: Sanskar Pal
Course Number: CMPE 102
Project Number: 3
Date: 04/22/2023
!


include Irvine32.inc

;-----------------------------------

.data
control BYTE 0
str1 BYTE "Medical Laser System", 0 ;Initialising str1 
message BYTE "Start? y/n: ",0   ; Initialising messsage
str2 BYTE "System Standby", 0   ;Initialising str2
str3 BYTE "Standby Bit(1/0): ",0    ;Initialising str3
str4 BYTE "Ready?, y/n: ",0      ;Initialising str4
str5 BYTE "System Ready", 0      ;Initialising str5
str6 BYTE "Ready Bit (1/0): ", 0  ;Initialising str6
str7 BYTE "Fire? y/n",0      ;Initialising str7
str8 BYTE "Unable to Fire",0     ;Initialising str8
str9 BYTE "System Fired", 0  ;Initialising str9
str10 BYTE "System Shutdown", 0  ;Initialising str10
optionIndex BYTE ?      ;creating uninitialised variable 
ans BYTE ?  ;creating uninitialised variable 
ans1 BYTE ? ;creating uninitialised variable 
ans2 BYTE ? ;creating uninitialised variable 
ans3 BYTE ? ;creating uninitialised variable 
ans4 BYTE ? ;creating uninitialised variable 
ans5 BYTE ? ;creating uninitialised variable 
ans6 BYTE ? ;creating uninitialised variable 
ans7 BYTE ? ;creating uninitialised variable 

;------------------------------------

.code
main PROC

call displayTitle   ;calling displayTitle procedure
call displayStart   ;calling displayStart procedure
call processing         ;calling processing procedure
call N_endBit       ;calling N_endBit procedure

INVOKE ExitProcess, 0

main ENDP
;-----------------------

displayTitle Proc ;starting displayTitle procedure

mov edx, offset str1 ; moving address of str1 to edx
call WriteString ;printing value
ret

displayTitle ENDP   ;end of displayTitle procedure

;-----------------------------

displayStart Proc  ;start of displayStart procedure

call crlf
mov edx, offset message ;moving address of message to edx
call WriteString    ;printing value
call ReadChar   ;reading in char
call crlf

mov optionIndex,al
cmp optionIndex,'y' ;comparing value with y
JE standBy      ; jump to standBy if equal
cmp optionIndex,'n'
exit

ret
displayStart ENDP ;end of displayStart procedure

;---------------------------------

standBy PROC ;start of standBy procedure

call crlf
mov edx, offset str2 ;moving address of str2 to edx
call WriteString ;printing value
call crlf

mov edx, offset str3 ;moving address of str2 to edx
call WriteString ;printing value
call crlf

call ReadInt ;reading in int
mov ans, al 
cmp ans, 1 ;comparing value with 1
JE ReadyBit ;jump to ReadyBit if equal

mov edx, offset str4 ;moving address of str4 to edx
call WriteString ;printing value
call ReadChar ;reading in char
mov ans2,al
cmp ans2,'y'
JE standBy ;jump to standBy if equal

ret

standBy ENDP ;end of standBy procedure

;-------------------------

ReadyBit PROC ;start of ReadyBit procedure

mov edx, offset str4 ;moving address of str4 to edx
call WriteString ;printing value
call ReadChar ;reading in char

mov ans1, al
cmp ans1,'y'
JE FireChar ;jump to FireChar if equal

mov edx, offset str10 ;moving address of str10 to edx
call writestring ;printing value
exit

ReadyBit ENDP ;end of ReadyBit procedure

;---------------------------

FireChar PROC ;start of FireChar procedure

call crlf
mov edx, offset str5 ;moving address of str5 to edx
call WriteString ;printing value
call crlf

mov edx, offset str6 ;moving address of str6 to edx
call WriteString    ;printing value
call crlf

call ReadInt   ;reading in int
mov ans3,al
cmp ans3, 1
JE FireBit ;jump to FireBit if equal

cmp ans3,0
JE processing ;jump to processing if equal
call crlf
mov edx,offset str7 ;moving address of str7 to edx
call WriteString
call crlf

call ReadChar   ;reading in char
mov ans4,al
cmp ans4,'y'

mov edx,offset str8 ;moving address of str8 to edx
call WriteString ;printing value
call crlf
JE FireChar ;Jump to FireChar if equal

ret

FireChar ENDP ;end of FireChar procedure

;-------------------------

FireBit PROC ;start of FireBit proceduree

mov edx,offset str7 ;moving address of str7 to edx
call WriteString ;printing value
call crlf
call ReadChar
mov ans5,al

cmp ans5,'y'
JE EndBit ;jump to EndBit if equal

cmp ans5,'n'
JE N_endBit ; jump to N_endBit if equal

FireBit ENDP ;end of FireBit procedure

;--------------------------

EndBit PROC ;start of EndBit procedure

mov edx,offset str9 ;moving address of str9 to edx
call WriteString
call crlf

jmp FireBit ;jump to FireBit

EndBit ENDP ;end of EndBit procedure

;----------------------------

N_endBit PROC ;start of N_endBit procedure

exit

ret

N_endBit ENDP ;end of N_endBit procedure

;------------------------------

processing PROC ;start of processing procedure

call crlf
mov edx,offset str7 ;moving address of str7 to edx
call WriteString ;printing value
call crlf
call ReadChar ;reading character

mov ans6,al
cmp ans6,'y'

mov edx,offset str8 ;moving address of str8 to edx
call WriteString ;printing value
call crlf

mov edx,offset str5 ;moving address of str5 to edx
call WriteString ;printing value
call crlf

mov edx, offset str6 ;moving address of str6 to edx
call WriteString ;printing value
call crlf

call ReadInt ;reading in values

mov ans7,al
cmp ans7, 1
JE FireBit ;jump to FireBit if equal

cmp ans7,0
JE processing ; jump to processing if equal


ret

processing ENDP ;end of processing procedure

END main ;end of main program