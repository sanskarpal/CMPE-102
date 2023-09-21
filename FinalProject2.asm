COMMENT !
Description:Write a program that reads an integer which is an startIndex of one array and copies elements of that array to another array.
Student Name: Sanskar Pal
Course Number: CMPE 102
Project Number: 2
Date: 04/09/2023
!

include Irvine32.inc ;using Irvine32 file


.data
 array1 DWORD 1,2,3,4,5,0,0,0,0,0 ;initialising array1
 array2 DWORD 0,0,0,0,0 ;initialising array2 with 0
 str1 BYTE "Index(0-4) : ",0 ;initialising string
 str2 BYTE "--- Array Copier ---",0 ;initialising string
 startIndex DWORD ? ;declaring uninitialised startIndex variable
 message BYTE "Continue(y/n) : ",0 ;initialising string
 errorMessage BYTE "Invalid output ",0 ;initialising string
 optionIndex BYTE ? ;created uninitialised varible
 align 4

.code
main PROC ;starting main procedure

call displayTitle ;calling displayTitle procedure

call copyArray ;calling copyArray procedure




INVOKE ExitProcess, 0

main ENDP ;ending main procedure



displayTitle Proc ;starting displayTitle procedure

	mov edx , OFFSET str2 ;moving address of str2 to edx
	call WriteString 

	ret

displayTitle ENDP ;ending displayTitle procedure

showArray PROC ;starting showArray procedure
	


	call crlf
	call Writehex
	
	
ret
showArray ENDP ;ending showArray procedure


copyArray PROC ;starting copyArray procedure
	
	mov edx , OFFSET str1 ;moving address of str1 to edx
	call WriteString
	call ReadInt
	mov startIndex,eax ;moving value of eax to startIndex
	
	cmp startIndex ,5 ;comparing value startIndex with 5
	JB copying ; using jump if below instruction to jump to copying section
	mov edx , OFFSET errorMessage ;moving address of errorMessage to edx
	call WriteString
	call copyArray
	
	copying: 
	
	mov esi , OFFSET array1  ;moving address of array1 to esi
	mov edi , OFFSET array2  ;moving address of array2 to edi
	mov ecx , 5              ;move value of 5 to ecx
	xchg ebx , eax           ;exchanging contents of ebx and eax
L2: ;starting loop L2
	mov eax , 0 ;initialising value of eax to 0
	
	mov eax , [esi + ebx*4] ; assign the value of given expression to eax
	add esi , dword ; add value of dword to esi
	mov [edi] , eax ; move the value of eax to the address of edi
	add edi , dword ; adding dword to edi
	call showArray
	call dumpregs
	
	loop L2 ;end of loop L2
	call endProgram
ret	
copyArray ENDP ;end of copyArray procedure

endProgram PROC ;starting endProgram procedure
	mov edx , OFFSET message ;moving address of message variable to edx
	call WriteString
	call ReadChar 
	mov optionIndex , al ;moving value of al to optionIndex
    cmp optionIndex, 'y' ;comparing value of optionIndex with 'y'
    JE main
    cmp optionIndex, 'n' ;comparing value of optionIndex with 'n'
	exit

	ret
endProgram ENDP ;end of endProgram procedure
END main ;end of program
