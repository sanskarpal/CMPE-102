Comment !

Description: Write the program that displays stack addresses and 32-bit values which are pushed on the stack when the procedures are called. The contents must be displayed in order from the lowest address to the highest address. 
Student Name: Sanskar Pal
Course Number: CMPE 102
Project Number: 4
Date: 05/14/2023
!

include Irvine32.inc

ExitProcess PROTO dwExitCode:DWORD
Sample PROTO, first:DWORD, second:DWORD, third:DWORD, fourth:DWORD,fifth:DWORD
ShowParameters PROTO, paramCount:DWORD

.data
str1 BYTE "Stack Parameters: ", 0 ;initialising string
str2 BYTE "---------------------", 0 ;initialising string
str3 BYTE "Address: ", 0 ;initialising string
str4 BYTE " = ", 0   ;initialising string
str5 BYTE " => ",0;initialising string

.code

; Macro to display a string
displayText macro text, newLine
    pushad
    invoke WriteString, text
    test newLine, 1
    jz .noNewLine
    invoke CrLf
    .noNewLine
    popad
endm


main PROC ;main procedure
INVOKE Sample ,00000001h,00000002h,00000003h,00000004h,00000005h ;calling Sample
INVOKE ExitProcess, 0 
main ENDP
Sample PROC first:DWORD, second:DWORD, third:DWORD, fourth:DWORD, fifth:DWORD
parameterCount = 5 ; parameters counter set to 5
INVOKE ShowParameters, parameterCount										
mov eax, first ; moving first to eax register
mov ebx, second ;moving second to ebx register
mov ecx, third ;moving third to ecx register

ret

Sample ENDP

ShowParameters PROC paramCount:DWORD
mov edx, OFFSET str1												;printing str1
call WriteString
call Crlf
mov edx, OFFSET str2												;printing str2
call WriteString
call Crlf
mov ebp, esp														;ebp = stack pointer
mov ecx, paramCount														;ecx = parameters
mov ebx, 20															;ebx = address of parameters

l1:                                                                 ;start of loop l1
	mov edx, OFFSET str3											;print str3
	call WriteString
	mov eax, ebp													;print address
	add eax, ebx
	call WriteHex
    mov edx, OFFSET str5
    call WriteString
	mov edx, OFFSET str4											;print str4
	call WriteString 
	mov eax, [ebp + ebx]											;display parameters
	call WriteHex
	call Crlf
	add ebx, 4
loop l1                                                             ;end of loop l1
ret

ShowParameters ENDP                                                 ;end of ShowParameters procedure

END main